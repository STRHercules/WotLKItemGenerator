import type { RunState } from './runState';

export function ForgeComplete({ state, indexingError, onRetryIndexing, onBrowseItems, onViewReports, onOpenOutput, onForgeAnother }: {
  state: RunState;
  indexingError: string | null;
  onRetryIndexing: () => void;
  onBrowseItems: () => void;
  onViewReports: () => void;
  onOpenOutput: () => void;
  onForgeAnother: () => void;
}) {
  const report = state.completion?.report ?? {};
  const itemCount = Number(report.item_count ?? report.total_items ?? 0);
  const validationErrors = state.validation?.error_count ?? Number(report.validation_errors ?? 0);
  const cancelled = state.lifecycle === 'cancelled';
  const failed = state.lifecycle === 'failed' || validationErrors > 0;
  const quality = (report.quality_distribution ?? report.quality_counts ?? {}) as Record<string, number>;
  const features = (report.feature_counts ?? {}) as Record<string, number>;

  if (cancelled) {
    return <section className="panel completion-card cancelled-completion"><div className="completion-emblem">■</div><p className="micro-kicker">FORGE CANCELLED</p><h2>Generation stopped</h2><p>The run was cancelled. Any partial diagnostic output remains on disk when the engine created it, and History keeps the cancelled run record.</p><div className="completion-actions"><button className="forge-button" type="button" onClick={onOpenOutput}>Open Partial Output</button><button className="forge-button ghost" type="button" onClick={onForgeAnother}>Back to Configuration</button></div></section>;
  }

  if (failed) {
    return <section className="panel completion-card failed-completion"><div className="completion-emblem">!</div><p className="micro-kicker">FORGE HALTED</p><h2>Validation failed</h2><p>{state.error?.message || `${validationErrors} validation error${validationErrors === 1 ? '' : 's'} prevented final completion.`}</p><div className="completion-actions"><button className="forge-button" type="button" onClick={onViewReports}>View Reports</button><button className="forge-button" type="button" onClick={onOpenOutput}>Open Partial Output</button><button className="forge-button ghost" type="button" onClick={onForgeAnother}>Edit Configuration</button></div></section>;
  }

  return <section className="panel completion-card"><div className="completion-emblem success">✓</div><p className="micro-kicker">FORGE COMPLETE</p><h2>{itemCount.toLocaleString()} items forged</h2><p>The generated pack passed the engine validation stage. Browse the indexed items or inspect the original output reports.</p>
    <div className="completion-stats"><span><small>LEGENDARY</small><strong className="rarity-legendary">{Number(quality.Legendary ?? 0).toLocaleString()}</strong></span><span><small>EPIC</small><strong className="rarity-epic">{Number(quality.Epic ?? 0).toLocaleString()}</strong></span><span><small>SETS</small><strong>{Number(features.sets ?? 0).toLocaleString()}</strong></span><span><small>EFFECTS</small><strong>{Number(features['spell-effects'] ?? 0).toLocaleString()}</strong></span><span><small>VALIDATION</small><strong className="status-success">PASSED</strong></span></div>
    {indexingError ? <div className="index-warning"><strong>⚠ Library indexing failed</strong><span>{indexingError}</span><button type="button" className="forge-button" onClick={onRetryIndexing}>Retry Indexing</button></div> : null}
    <div className="completion-actions"><button className="forge-button primary" type="button" onClick={onBrowseItems}>Browse Items</button><button className="forge-button" type="button" onClick={onViewReports}>View Reports</button><button className="forge-button" type="button" onClick={onOpenOutput}>Open Output Folder</button><button className="forge-button ghost" type="button" onClick={onForgeAnother}>Forge Another Pack</button></div>
  </section>;
}
