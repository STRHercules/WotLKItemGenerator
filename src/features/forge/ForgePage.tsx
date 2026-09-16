import { useCallback, useEffect, useReducer, useRef, useState } from 'react';

import { cancelGeneration, startGeneration, subscribeEngineEvents, subscribeEngineStderr } from '../../lib/tauriEngine';
import {
  createRunWithId,
  fingerprintSources,
  indexCompletedRun,
  saveRunSources,
  updateRunRuntimeMetadata,
  updateRunStatus,
} from '../../lib/tauriStorage';
import { ENGINE_EVENT_PROTOCOL_VERSION, type EngineEvent } from '../../types/engine';
import type { RunConfiguration, SourcePathRequest } from '../../types/storage';
import { createAnimationFrameCoalescer } from './eventCoalescer';
import { ForgeComplete } from './ForgeComplete';
import { ForgeConfigure } from './ForgeConfigure';
import { ForgeLive } from './ForgeLive';
import { defaultForgeConfig, type ForgeConfig, type ReadinessState } from './forgeConfig';
import { initialRunState, reduceRunState, runViewForLifecycle } from './runState';

const ENGINE_VERSION = '0.1.1';

type ForgePageProps = {
  readiness: ReadinessState;
  initialConfig?: ForgeConfig | null;
  defaultConfig?: ForgeConfig;
  sourcePaths?: SourcePathRequest[];
  onInitialConfigConsumed?: () => void;
  onOpenSources: () => void;
  onBrowseItems: (runId: string) => void;
  onViewReports: (runId: string) => void;
  onOpenOutput: (runId: string) => void;
};

function phaseStatus(name: string): string {
  const normalized = name.toLowerCase();
  if (normalized.includes('skeleton')) return 'generating_skeletons';
  if (normalized.includes('finaliz')) return 'finalizing_items';
  if (normalized.includes('validat')) return 'validating';
  if (normalized.includes('writing')) return 'writing_output';
  if (normalized.includes('inspect') || normalized.includes('starting') || normalized.includes('harvest')) return 'checking_sources';
  return 'configuring';
}

export function ForgePage({ readiness, initialConfig, defaultConfig, sourcePaths = [], onInitialConfigConsumed, onOpenSources, onBrowseItems, onViewReports, onOpenOutput }: ForgePageProps) {
  const [config, setConfig] = useState<ForgeConfig>(() => initialConfig ?? defaultConfig ?? defaultForgeConfig());
  const [state, dispatch] = useReducer(reduceRunState, undefined, initialRunState);
  const [runId, setRunId] = useState<string | null>(null);
  const [startedAt, setStartedAt] = useState<number | null>(null);
  const [elapsedSeconds, setElapsedSeconds] = useState(0);
  const [cancelling, setCancelling] = useState(false);
  const [indexingError, setIndexingError] = useState<string | null>(null);
  const [bridgeError, setBridgeError] = useState<string | null>(null);
  const unlisteners = useRef<Array<() => void>>([]);
  const coalescer = useRef<ReturnType<typeof createAnimationFrameCoalescer> | null>(null);

  useEffect(() => {
    coalescer.current = createAnimationFrameCoalescer(dispatch);
    return () => coalescer.current?.dispose();
  }, []);

  useEffect(() => {
    if (initialConfig) {
      setConfig(initialConfig);
      onInitialConfigConsumed?.();
    }
  }, [initialConfig, onInitialConfigConsumed]);

  useEffect(() => {
    if (startedAt === null || ['complete', 'failed', 'cancelled'].includes(state.lifecycle)) return;
    const timer = window.setInterval(() => setElapsedSeconds((Date.now() - startedAt) / 1000), 250);
    return () => window.clearInterval(timer);
  }, [startedAt, state.lifecycle]);

  useEffect(() => () => {
    for (const unlisten of unlisteners.current) unlisten();
    unlisteners.current = [];
  }, []);

  const recordStatus = useCallback(async (currentRunId: string, event: EngineEvent) => {
    if (event.type === 'configured') {
      if (event.output_dir) await updateRunRuntimeMetadata(currentRunId, event.seed, event.output_dir);
      return;
    }
    if (event.type === 'phase') {
      await updateRunStatus(currentRunId, { status: phaseStatus(event.name) });
      return;
    }
    if (event.type === 'error') {
      await updateRunStatus(currentRunId, {
        status: 'failed',
        finishedAt: new Date().toISOString(),
        elapsedMs: startedAt ? Date.now() - startedAt : null,
        summary: { stage: event.stage ?? null, message: event.message, details: event.details ?? null },
      });
    }
  }, [startedAt]);

  const indexSuccessfulRun = useCallback(async (currentRunId: string, event: Extract<EngineEvent, { type: 'complete' }>) => {
    dispatch({ type: 'indexing_started' });
    setIndexingError(null);
    try {
      await updateRunStatus(currentRunId, {
        status: 'complete',
        finishedAt: new Date().toISOString(),
        elapsedMs: Math.round(event.elapsed * 1000),
        validationErrorCount: state.validation?.error_count ?? 0,
        summary: event.report,
        indexStatus: 'indexing',
        indexError: null,
      });
      await indexCompletedRun(currentRunId, event.output_dir);
      await updateRunStatus(currentRunId, { status: 'complete', indexStatus: 'indexed', indexError: null });
    } catch (error) {
      const message = String(error);
      setIndexingError(message);
      await updateRunStatus(currentRunId, { status: 'complete', indexStatus: 'failed', indexError: message }).catch(() => undefined);
    } finally {
      dispatch({ type: 'indexing_complete' });
    }
  }, [state.validation?.error_count]);

  const handleEvent = useCallback((currentRunId: string, event: EngineEvent) => {
    coalescer.current?.push(event);
    void recordStatus(currentRunId, event).catch((error) => setBridgeError(String(error)));
    if (event.type === 'complete') void indexSuccessfulRun(currentRunId, event);
  }, [indexSuccessfulRun, recordStatus]);

  const begin = useCallback(async () => {
    setBridgeError(null);
    setIndexingError(null);
    setCancelling(false);
    dispatch({ type: 'reset' });
    const currentRunId = crypto.randomUUID();
    setRunId(currentRunId);
    const now = Date.now();
    setStartedAt(now);
    setElapsedSeconds(0);
    const provisional: RunConfiguration = {
      seed: config.seed || 'auto',
      outputDir: config.output_root,
      engineVersion: ENGINE_VERSION,
      protocolVersion: ENGINE_EVENT_PROTOCOL_VERSION,
      expansion: config.expansion,
      itemCount: config.number,
      classes: [...config.classes],
      config: { ...config },
    };
    try {
      await createRunWithId(currentRunId, provisional);
      if (sourcePaths.length) {
        const settled = await Promise.allSettled(sourcePaths.map((source) => fingerprintSources([source])));
        const fingerprints = settled.flatMap((result) => result.status === 'fulfilled' ? result.value : []);
        if (fingerprints.length) await saveRunSources(currentRunId, fingerprints);
        const failed = settled.length - fingerprints.length;
        if (failed > 0) setBridgeError(`Source fingerprint snapshot is incomplete (${failed} files changed or disappeared before launch).`);
      }
      const unlistenEvents = await subscribeEngineEvents(currentRunId, (event) => handleEvent(currentRunId, event));
      const unlistenStderr = await subscribeEngineStderr(currentRunId, (line) => setBridgeError(line));
      unlisteners.current.push(unlistenEvents, unlistenStderr);
      await startGeneration(config, currentRunId);
    } catch (error) {
      const message = String(error);
      setBridgeError(message);
      dispatch({ type: 'error', protocol_version: 1, stage: 'launch', message });
      await updateRunStatus(currentRunId, { status: 'failed', finishedAt: new Date().toISOString(), elapsedMs: Date.now() - now, summary: { message } }).catch(() => undefined);
    }
  }, [config, handleEvent, sourcePaths]);

  const cancel = useCallback(async () => {
    if (!runId || cancelling) return;
    if (!window.confirm('Cancel this generation run? Partial diagnostic output will be preserved when available.')) return;
    setCancelling(true);
    try {
      await cancelGeneration(runId);
      dispatch({ type: 'cancelled' });
      await updateRunStatus(runId, { status: 'cancelled', finishedAt: new Date().toISOString(), elapsedMs: startedAt ? Date.now() - startedAt : null });
    } catch (error) {
      setBridgeError(String(error));
      setCancelling(false);
    }
  }, [cancelling, runId, startedAt]);

  const retryIndexing = useCallback(async () => {
    if (!runId || !state.completion) return;
    await indexSuccessfulRun(runId, state.completion);
  }, [indexSuccessfulRun, runId, state.completion]);

  const forgeAnother = () => {
    dispatch({ type: 'reset' });
    setRunId(null);
    setStartedAt(null);
    setElapsedSeconds(0);
    setIndexingError(null);
    setBridgeError(null);
    setCancelling(false);
  };

  const view = runViewForLifecycle(state.lifecycle);
  const showConfigure = view === 'configure';
  const showCompletion = view === 'completion';

  return (
    <section className="forge-page">
      <header><p className="page-kicker">Workshop / Item Generation</p><h1 className="page-heading">Craft every item tier end-to-end.</h1><p className="page-subtitle">Generate class-aware WotLK gear, validate the full pack, place loot, merge DBC output, and keep every run reproducible.</p></header>
      {bridgeError && !showCompletion ? <div className="bridge-warning" role="status">⚠ {bridgeError}</div> : null}
      {showConfigure ? <ForgeConfigure config={config} readiness={readiness} onChange={setConfig} onBegin={() => void begin()} onOpenSources={onOpenSources} /> : null}
      {!showConfigure && !showCompletion ? <ForgeLive state={state} elapsedSeconds={elapsedSeconds} cancelling={cancelling} onCancel={() => void cancel()} /> : null}
      {showCompletion ? <ForgeComplete state={state} indexingError={indexingError} onRetryIndexing={() => void retryIndexing()} onBrowseItems={() => runId && onBrowseItems(runId)} onViewReports={() => runId && onViewReports(runId)} onOpenOutput={() => runId && onOpenOutput(runId)} onForgeAnother={forgeAnother} /> : null}
    </section>
  );
}
