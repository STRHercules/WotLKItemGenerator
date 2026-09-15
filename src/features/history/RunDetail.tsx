import type { ForgeConfig } from '../forge/forgeConfig';
import type { RunDetail as RunDetailRecord, SourceDriftReport } from '../../types/storage';
import { formatDuration, runStatusLabel, runStatusTone } from './historyModel';

type Props = {
  detail: RunDetailRecord;
  drift: SourceDriftReport | null;
  driftLoading: boolean;
  onClose: () => void;
  onLibrary: () => void;
  onReports: () => void;
  onRegenerate: (config: ForgeConfig) => void;
  restoredConfig: ForgeConfig;
};

export function RunDetail({ detail, drift, driftLoading, onClose, onLibrary, onReports, onRegenerate, restoredConfig }: Props) {
  const changedEntries = drift?.entries.filter((entry) => entry.status !== 'unchanged') ?? [];
  return (
    <aside className="run-detail panel" aria-label={`Run ${detail.seed} details`}>
      <div className="panel-header run-detail__header">
        <div><p className="micro-kicker">RUN DETAIL</p><h2>Seed {detail.seed}</h2></div>
        <button className="icon-button" type="button" aria-label="Close run detail" onClick={onClose}>×</button>
      </div>
      <div className="panel-body run-detail__body">
        <div className="run-detail__status-row">
          <span className={`run-status run-status--${runStatusTone(detail.status)}`}>{runStatusLabel(detail.status)}</span>
          <span>{formatDuration(detail.elapsedMs)}</span>
        </div>
        <dl className="detail-grid">
          <div><dt>Started</dt><dd>{new Date(detail.startedAt).toLocaleString()}</dd></div>
          <div><dt>Finished</dt><dd>{detail.finishedAt ? new Date(detail.finishedAt).toLocaleString() : '—'}</dd></div>
          <div><dt>Expansion</dt><dd>{detail.expansion}</dd></div>
          <div><dt>Items</dt><dd>{detail.itemCount.toLocaleString()}</dd></div>
          <div><dt>Engine</dt><dd>{detail.engineVersion}</dd></div>
          <div><dt>Protocol</dt><dd>v{detail.protocolVersion}</dd></div>
          <div className="detail-grid__wide"><dt>Classes</dt><dd>{detail.classes.join(', ') || 'None'}</dd></div>
          <div className="detail-grid__wide"><dt>Output</dt><dd><code>{detail.outputDir}</code></dd></div>
        </dl>

        <section className="run-detail__section">
          <div className="run-detail__section-title"><h3>Source Reproducibility</h3>{driftLoading ? <span>Checking…</span> : null}</div>
          {detail.sources.length === 0 ? <p className="muted-copy">This run has no saved source fingerprint snapshot.</p> : null}
          {drift && !drift.changed ? <div className="alert alert--success">✓ Saved source files are unchanged.</div> : null}
          {drift?.changed ? <div className="alert alert--warning"><strong>⚠ Sources changed since this run</strong><span>Review the differences before regenerating if exact reproducibility matters.</span></div> : null}
          {changedEntries.length ? <div className="drift-list">{changedEntries.map((entry) => <div className="drift-row" key={`${entry.logicalName}-${entry.path}`}><span className={`drift-state drift-state--${entry.status}`}>{entry.status}</span><div><strong>{entry.logicalName}</strong><code>{entry.path}</code></div></div>)}</div> : null}
        </section>

        <section className="run-detail__section"><h3>Exact Forge Configuration</h3><pre className="config-json">{JSON.stringify(detail.configuration, null, 2)}</pre></section>
        <div className="run-detail__actions">
          <button className="button button--secondary" type="button" onClick={onLibrary}>Browse Items</button>
          <button className="button button--secondary" type="button" onClick={onReports}>Reports</button>
          <button className="forge-button" type="button" onClick={() => onRegenerate(restoredConfig)}>Regenerate</button>
        </div>
        <p className="field-help">Regenerate only loads these settings into Forge. It never starts generation automatically.</p>
      </div>
    </aside>
  );
}
