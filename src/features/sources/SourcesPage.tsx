import { useEffect, useMemo, useState } from 'react';

import { pickDirectory } from '../../lib/dialogs';
import { clearSourceCache, rebuildSourceCache, scanSources } from '../../lib/tauriSources';
import { getSettings, saveSettings } from '../../lib/tauriStorage';
import type { SourceHealthReport } from '../../types/sources';
import { SourceRow } from './SourceRow';
import './sources.css';

type SourcesPageProps = {
  report: SourceHealthReport | null;
  loading: boolean;
  onRefresh: () => Promise<void> | void;
  onReportChange: (report: SourceHealthReport) => void;
};

export function SourcesPage({ report, loading, onRefresh, onReportChange }: SourcesPageProps) {
  const [action, setAction] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const required = useMemo(() => report?.sources.filter((source) => source.required) ?? [], [report]);
  const optional = useMemo(() => report?.sources.filter((source) => !source.required) ?? [], [report]);

  useEffect(() => {
    if (!report && !loading) void onRefresh();
  }, [loading, onRefresh, report]);

  async function rescanWithCurrentSettings() {
    const settings = await getSettings();
    const next = await scanSources({
      dataDir: settings.defaultDataDirectory || null,
      azerothcoreSourceRoot: settings.azerothcoreSourceRoot || null,
      outputDir: settings.defaultOutputDirectory || null,
      calculateFingerprints: false,
    });
    onReportChange(next);
  }

  async function choosePath(kind: 'data' | 'core') {
    try {
      setError(null);
      const selected = await pickDirectory(kind === 'data' ? 'Choose generator Data directory' : 'Choose AzerothCore source directory');
      if (!selected) return;
      const settings = await getSettings();
      if (kind === 'data') settings.defaultDataDirectory = selected;
      else settings.azerothcoreSourceRoot = selected;
      await saveSettings(settings);
      await rescanWithCurrentSettings();
    } catch (cause) { setError(String(cause)); }
  }

  async function cacheAction(kind: 'clear' | 'rebuild') {
    try {
      setAction(kind);
      setError(null);
      if (kind === 'clear') await clearSourceCache();
      else await rebuildSourceCache();
      await rescanWithCurrentSettings();
    } catch (cause) { setError(String(cause)); }
    finally { setAction(null); }
  }

  const healthy = report?.health === 'healthy';
  return (
    <section className="forge-page">
      <header className="page-header-row"><div><p className="page-kicker">Workshop / Source Health</p><h1 className="page-heading">Know exactly what the forge can see.</h1><p className="page-subtitle">Required DBC and SQL inputs are blocking. Optional gameobject sources stay optional and never show as an error just because you do not use them.</p></div><button className="forge-button" type="button" disabled={loading} onClick={() => void onRefresh()}>{loading ? 'Scanning…' : 'Rescan Sources'}</button></header>
      {error ? <div className="bridge-warning" role="alert">⚠ {error}</div> : null}

      <div className="source-overview-grid">
        <article className="panel source-health-card"><div className={`source-health-emblem ${healthy ? 'healthy' : 'blocked'}`}>{healthy ? '✓' : '!'}</div><div><p className="micro-kicker">SOURCE STATE</p><h2>{healthy ? 'All required data found' : 'Required data needs attention'}</h2><p>{report ? `${report.requiredFound} of ${report.requiredTotal} required inputs are available.` : 'Waiting for source scan.'}</p></div></article>
        <article className="panel source-stat-card"><small>REQUIRED</small><strong>{report ? `${report.requiredFound}/${report.requiredTotal}` : '—'}</strong><span>DBC + SQL inputs</span></article>
        <article className="panel source-stat-card"><small>AZEROTHCORE</small><strong className={report?.azerothcoreReady ? 'status-success' : 'status-warning'}>{report?.azerothcoreReady ? 'READY' : 'MISSING'}</strong><span>Script discovery root</span></article>
        <article className="panel source-stat-card"><small>CACHE</small><strong>{report?.cache.exists ? 'VALID' : 'EMPTY'}</strong><span>{report?.cache.exists && report.cache.modifiedAt ? new Date(report.cache.modifiedAt).toLocaleDateString() : 'Builds on forge'}</span></article>
      </div>

      <section className="panel source-paths-panel"><div className="panel-header"><h2 className="panel-title">Configured Locations</h2></div><div className="panel-body source-path-grid">
        <div><span className="field-label">AzerothCore source</span><div className="path-display"><code>{report?.azerothcorePath || 'Not configured'}</code><button className="forge-button" type="button" onClick={() => void choosePath('core')}>Browse</button></div></div>
        <div><span className="field-label">Data directory</span><div className="path-display"><code>{report?.dataDirectory || 'Bundled Data/'}</code><button className="forge-button" type="button" onClick={() => void choosePath('data')}>Browse</button></div><p className="field-help">Origin: {report?.dataOrigin || 'bundled'}</p></div>
      </div></section>

      <section className="panel source-list-panel"><div className="panel-header"><div><p className="micro-kicker">BLOCKING INPUTS</p><h2 className="panel-heading">Required Data</h2></div><span className="source-count">{required.filter((source) => source.exists).length}/{required.length}</span></div><div className="source-table-header"><span /><span>File</span><span>Size</span><span>Status</span><span /></div>{required.map((source) => <SourceRow key={source.logicalName} source={source} />)}</section>
      <section className="panel source-list-panel"><div className="panel-header"><div><p className="micro-kicker">ENRICHMENT</p><h2 className="panel-heading">Optional Data</h2></div><span className="source-count neutral">{optional.filter((source) => source.exists).length}/{optional.length}</span></div><div className="source-table-header"><span /><span>File</span><span>Size</span><span>Status</span><span /></div>{optional.map((source) => <SourceRow key={source.logicalName} source={source} />)}</section>

      <section className="panel cache-panel"><div><p className="micro-kicker">SOURCE CACHE</p><h2 className="panel-heading">Parsed source mappings</h2><p>{report?.cache.path || 'App-local cache'}</p></div><div className="cache-actions"><button className="forge-button" type="button" disabled={action !== null} onClick={() => void cacheAction('clear')}>{action === 'clear' ? 'Clearing…' : 'Clear Cache'}</button><button className="forge-button" type="button" disabled={action !== null} onClick={() => void cacheAction('rebuild')}>{action === 'rebuild' ? 'Scheduling…' : 'Rebuild Cache'}</button></div></section>
    </section>
  );
}
