import { useCallback, useEffect, useMemo, useState } from 'react';
import { AppShell, type SourceHealth } from './components/AppShell/AppShell';
import { ForgePage } from './features/forge/ForgePage';
import { defaultForgeConfig, type ForgeConfig, type ReadinessState } from './features/forge/forgeConfig';
import { HistoryPage } from './features/history/HistoryPage';
import { LibraryPage } from './features/library/LibraryPage';
import { ReportsPage } from './features/reports/ReportsPage';
import { SettingsPage } from './features/settings/SettingsPage';
import { forgeDefaultsFromSettings } from './features/settings/settingsModel';
import { SourcesPage } from './features/sources/SourcesPage';
import { scanSources } from './lib/tauriSources';
import { getSettings, openRunOutput } from './lib/tauriStorage';
import type { PageId } from './routes';
import type { SourceHealthReport } from './types/sources';
import type { AppSettings, SourcePathRequest } from './types/storage';

const FALLBACK_SETTINGS: AppSettings = {
  defaultOutputDirectory: '', defaultDataDirectory: '', azerothcoreSourceRoot: '', defaultExpansion: 'All', defaultItemCount: 100_000,
  rememberLastForgeConfiguration: true, animations: true, density: 'comfortable', showDiscoveryFeed: true, reduceMotion: false,
  defaultLootChance: 2, defaultSetRate: .2, defaultSetMinLevel: 20, defaultSetSize: 5,
};

function sourceReadiness(report: SourceHealthReport | null): ReadinessState {
  if (!report) return { requiredSourcesFound:0, requiredSourcesTotal:1, azerothcoreReady:false, dbcReady:false, outputWritable:false, blockingMessages:['Source health has not been checked.'] };
  const missing = report.sources.filter((source) => source.required && !source.exists).map((source) => `${source.logicalName} is missing.`);
  if (!report.azerothcoreReady) missing.push('AzerothCore source root is not ready.');
  if (!report.dbcReady) missing.push('Required DBC files are incomplete.');
  if (!report.outputWritable) missing.push('Choose a writable output directory.');
  return { requiredSourcesFound:report.requiredFound, requiredSourcesTotal:report.requiredTotal, azerothcoreReady:report.azerothcoreReady, dbcReady:report.dbcReady, outputWritable:report.outputWritable, blockingMessages:missing };
}

function applyAppearance(settings: AppSettings) {
  const root = document.documentElement;
  root.dataset.density = settings.density;
  root.dataset.reduceMotion = String(settings.reduceMotion);
  root.dataset.animations = String(settings.animations);
}

export default function App() {
  const [activePage, setActivePage] = useState<PageId>('forge');
  const [settings, setSettings] = useState<AppSettings>(FALLBACK_SETTINGS);
  const [booting, setBooting] = useState(true);
  const [sourceReport, setSourceReport] = useState<SourceHealthReport | null>(null);
  const [sourceLoading, setSourceLoading] = useState(true);
  const [appError, setAppError] = useState<string | null>(null);
  const [libraryRunId, setLibraryRunId] = useState<string | null>(null);
  const [reportRunId, setReportRunId] = useState<string | null>(null);
  const [historyRunId, setHistoryRunId] = useState<string | null>(null);
  const [pendingForgeConfig, setPendingForgeConfig] = useState<ForgeConfig | null>(null);

  const refreshSources = useCallback(async (currentSettings = settings) => {
    setSourceLoading(true); setAppError(null);
    try {
      const report = await scanSources({ dataDir:currentSettings.defaultDataDirectory || null, azerothcoreSourceRoot:currentSettings.azerothcoreSourceRoot || null, outputDir:currentSettings.defaultOutputDirectory || null, calculateFingerprints:false });
      setSourceReport(report);
    } catch (cause) { setSourceReport(null); setAppError(`Source scan failed: ${String(cause)}`); }
    finally { setSourceLoading(false); }
  }, [settings]);

  useEffect(() => {
    let alive = true;
    void (async () => {
      try {
        const saved = await getSettings();
        if (!alive) return;
        setSettings(saved); applyAppearance(saved);
        await refreshSources(saved);
      } catch (cause) {
        if (alive) { applyAppearance(FALLBACK_SETTINGS); setAppError(`App settings could not be loaded: ${String(cause)}`); setSourceLoading(false); }
      } finally { if (alive) setBooting(false); }
    })();
    return () => { alive = false; };
  }, []); // startup only; refreshSources is intentionally invoked with the freshly loaded settings

  const shellHealth = useMemo<SourceHealth>(() => sourceLoading ? 'checking' : sourceReport?.health === 'healthy' ? 'healthy' : sourceReport ? 'error' : 'error', [sourceLoading, sourceReport]);
  const readiness = useMemo(() => sourceReadiness(sourceReport), [sourceReport]);
  const forgeDefaults = useMemo(() => forgeDefaultsFromSettings(settings, defaultForgeConfig()), [settings]);
  const sourcePaths = useMemo<SourcePathRequest[]>(() => sourceReport?.sources.filter((source) => source.exists).map((source) => ({ logicalName:source.logicalName, path:source.path })) ?? [], [sourceReport]);

  const updateSettings = useCallback((next: AppSettings) => { setSettings(next); applyAppearance(next); void refreshSources(next); }, [refreshSources]);
  const openLibrary = (runId: string) => { setLibraryRunId(runId); setActivePage('library'); };
  const openReports = (runId: string) => { setReportRunId(runId); setActivePage('reports'); };
  const openHistory = (runId: string) => { setHistoryRunId(runId); setActivePage('history'); };
  const regenerate = (config: ForgeConfig) => { setPendingForgeConfig(config); setActivePage('forge'); };
  const openOutput = async (runId: string) => { try { await openRunOutput(runId); } catch (cause) { setAppError(`Could not open output folder: ${String(cause)}`); } };

  let page: React.ReactNode;
  if (booting) page = <section className="forge-page"><header><p className="page-kicker">Workshop / Startup</p><h1 className="page-heading">Preparing the forge…</h1></header><div className="panel"><div className="panel-body empty-state">Loading settings and checking sources.</div></div></section>;
  else if (activePage === 'forge') page = <ForgePage readiness={readiness} initialConfig={pendingForgeConfig} defaultConfig={forgeDefaults} sourcePaths={sourcePaths} onInitialConfigConsumed={() => setPendingForgeConfig(null)} onOpenSources={() => setActivePage('sources')} onBrowseItems={openLibrary} onViewReports={openReports} onOpenOutput={(runId) => void openOutput(runId)} />;
  else if (activePage === 'sources') page = <SourcesPage report={sourceReport} loading={sourceLoading} onRefresh={() => refreshSources(settings)} onReportChange={setSourceReport} />;
  else if (activePage === 'library') page = <LibraryPage scopedRunId={libraryRunId} onOpenRun={openHistory} onReports={openReports} />;
  else if (activePage === 'reports') page = <ReportsPage runId={reportRunId} />;
  else if (activePage === 'history') page = <HistoryPage initialRunId={historyRunId} onOpenLibrary={openLibrary} onOpenReports={openReports} onRegenerate={regenerate} />;
  else page = <SettingsPage settings={settings} onSettingsChange={updateSettings} />;

  return <AppShell activePage={activePage} onNavigate={(next) => { setActivePage(next); if (next !== 'history') setHistoryRunId(null); }} sourceHealth={shellHealth}>
    {appError ? <div className="alert alert--failure app-level-alert">⚠ {appError}</div> : null}
    {page}
  </AppShell>;
}
