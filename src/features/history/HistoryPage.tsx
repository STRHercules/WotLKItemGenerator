import { useCallback, useEffect, useMemo, useState } from 'react';
import { compareSourceDrift, fingerprintSources, getRun, listRuns } from '../../lib/tauriStorage';
import type { RunDetail, RunRecord, SourceDriftReport } from '../../types/storage';
import { defaultForgeConfig, type ForgeConfig } from '../forge/forgeConfig';
import { historicalForgeConfig, formatDuration, runStatusLabel, runStatusTone } from './historyModel';
import { RunDetail as RunDetailPanel } from './RunDetail';
import './history.css';

type Props = {
  initialRunId?: string | null;
  onOpenLibrary: (runId: string) => void;
  onOpenReports: (runId: string) => void;
  onRegenerate: (config: ForgeConfig) => void;
};

export function HistoryPage({ initialRunId = null, onOpenLibrary, onOpenReports, onRegenerate }: Props) {
  const [search, setSearch] = useState('');
  const [status, setStatus] = useState('');
  const [expansion, setExpansion] = useState('');
  const [runs, setRuns] = useState<RunRecord[]>([]);
  const [selected, setSelected] = useState<RunDetail | null>(null);
  const [drift, setDrift] = useState<SourceDriftReport | null>(null);
  const [driftLoading, setDriftLoading] = useState(false);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const loadRuns = useCallback(async () => {
    setLoading(true); setError(null);
    try { setRuns(await listRuns({ search: search || null, status: status || null, expansion: expansion || null, limit: 250 })); }
    catch (cause) { setError(String(cause)); }
    finally { setLoading(false); }
  }, [expansion, search, status]);

  useEffect(() => { const timer = window.setTimeout(() => void loadRuns(), 180); return () => window.clearTimeout(timer); }, [loadRuns]);

  const inspectById = useCallback(async (runId: string) => {
    setError(null); setDrift(null); setDriftLoading(true);
    try {
      const detail = await getRun(runId);
      setSelected(detail);
      if (detail.sources.length) {
        const settled = await Promise.allSettled(detail.sources.map((source) => fingerprintSources([{ logicalName: source.logicalName, path: source.path }])));
        const current = settled.flatMap((result) => result.status === 'fulfilled' ? result.value : []);
        setDrift(await compareSourceDrift(detail.id, current));
      }
    } catch (cause) { setError(String(cause)); }
    finally { setDriftLoading(false); }
  }, []);

  useEffect(() => { if (initialRunId) void inspectById(initialRunId); }, [initialRunId, inspectById]);


  const restoredConfig = useMemo(() => selected ? historicalForgeConfig(selected.configuration, defaultForgeConfig()) : null, [selected]);

  return (
    <section className="forge-page history-page">
      <header className="page-header-row"><div><p className="page-kicker">Workshop / Run Archive</p><h1 className="page-heading">Generation History</h1><p className="page-subtitle">Revisit exact configurations, inspect source drift, and preload an old run into Forge without accidentally starting it.</p></div><div className="history-total"><small>RECORDED RUNS</small><strong>{runs.length.toLocaleString()}</strong></div></header>
      <section className="panel history-filter-panel"><div className="panel-body history-filters">
        <label><span>Search</span><input value={search} onChange={(event) => setSearch(event.target.value)} placeholder="Seed, class, output path…" /></label>
        <label><span>Status</span><select value={status} onChange={(event) => setStatus(event.target.value)}><option value="">All statuses</option><option value="complete">Complete</option><option value="failed">Failed</option><option value="cancelled">Cancelled</option><option value="configuring">In progress</option></select></label>
        <label><span>Expansion</span><select value={expansion} onChange={(event) => setExpansion(event.target.value)}><option value="">All expansions</option><option>Classic</option><option>TBC</option><option>Wrath</option><option>All</option></select></label>
        <button className="button button--secondary" type="button" onClick={() => void loadRuns()}>Refresh</button>
      </div></section>
      {error ? <div className="alert alert--failure">⚠ {error}</div> : null}
      <div className="history-layout">
        <section className="history-list" aria-label="Run history">
          {loading ? <div className="empty-state">Loading run history…</div> : null}
          {!loading && !runs.length ? <div className="empty-state">No runs match these filters yet.</div> : null}
          {runs.map((run) => <article className={`run-card panel${selected?.id === run.id ? ' run-card--selected' : ''}`} key={run.id}>
            <div className="run-card__status"><span className={`run-status run-status--${runStatusTone(run.status)}`}>{runStatusLabel(run.status)}</span><time>{new Date(run.startedAt).toLocaleString()}</time></div>
            <div className="run-card__main"><div><p className="micro-kicker">SEED</p><h2>{run.seed}</h2></div><div className="run-card__metrics"><span>{run.expansion}</span><span>{run.itemCount.toLocaleString()} items</span><span>{formatDuration(run.elapsedMs)}</span></div></div>
            <p className="run-card__classes">{run.classes.join(', ') || 'No classes recorded'}</p>
            <div className="run-card__footer"><span className={run.validationErrorCount ? 'status-failure' : 'status-success'}>{run.validationErrorCount ? `${run.validationErrorCount} validation errors` : 'Validation passed'}</span><div><button className="button button--secondary" type="button" aria-label={`Open run ${run.seed}`} onClick={() => void inspectById(run.id)}>Open</button></div></div>
          </article>)}
        </section>
        {selected && restoredConfig ? <RunDetailPanel detail={selected} drift={drift} driftLoading={driftLoading} restoredConfig={restoredConfig} onClose={() => { setSelected(null); setDrift(null); }} onLibrary={() => onOpenLibrary(selected.id)} onReports={() => onOpenReports(selected.id)} onRegenerate={onRegenerate} /> : null}
      </div>
    </section>
  );
}
