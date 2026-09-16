import type { RunState } from './runState';

function pct(completed: number, total: number): number {
  return total > 0 ? Math.max(0, Math.min(100, (completed / total) * 100)) : 0;
}

function formatElapsed(seconds: number): string {
  const whole = Math.max(0, Math.floor(seconds));
  const hours = Math.floor(whole / 3600);
  const minutes = Math.floor((whole % 3600) / 60);
  const secs = whole % 60;
  return hours > 0
    ? `${String(hours).padStart(2, '0')}:${String(minutes).padStart(2, '0')}:${String(secs).padStart(2, '0')}`
    : `${String(minutes).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;
}

function discoveryClass(kind: string): string {
  if (kind === 'legendary') return 'rarity-legendary';
  if (kind === 'epic') return 'rarity-epic';
  if (kind === 'set') return 'rarity-set';
  if (kind === 'proc') return 'rarity-proc';
  if (kind === 'on-use') return 'rarity-on-use';
  return 'rarity-effect';
}

function heatBand(progressPercent: number): 'cool' | 'warming' | 'hot' | 'white-hot' {
  if (progressPercent >= 70) return 'white-hot';
  if (progressPercent >= 45) return 'hot';
  if (progressPercent >= 20) return 'warming';
  return 'cool';
}

function forgeStageLabel(lifecycle: RunState['lifecycle']): string {
  if (lifecycle === 'generating_skeletons') return 'SHAPING SKELETONS';
  if (lifecycle === 'finalizing_items') return 'TEMPERING FULL ITEMS';
  if (lifecycle === 'validating') return 'CHECKING THE FINISH';
  if (lifecycle === 'writing_output') return 'PACKING THE FORGE';
  return 'PREPARING THE BILLET';
}

export function ForgeLive({ state, elapsedSeconds, cancelling, onCancel }: {
  state: RunState;
  elapsedSeconds: number;
  cancelling: boolean;
  onCancel: () => void;
}) {
  const progressPercent = pct(state.progress.completed, state.progress.total);
  const discoveries = [...state.discoveries].reverse().slice(0, 7);
  const heat = heatBand(progressPercent);
  const sourceCacheLabel = state.sourceCache
    ? `${state.sourceCache.status.toUpperCase()}${state.sourceCache.rebuilt && state.sourceCache.status !== 'hit' ? ' • REBUILT' : ''}`
    : null;
  return (
    <div className="live-forge-grid" data-testid="live-forge" data-phase={state.lifecycle}>
      <section className="panel live-main-panel">
        <div className="panel-header live-title-row">
          <div><p className="micro-kicker">FORGE ACTIVE</p><h2 className="panel-heading">{state.phaseName || 'Preparing item forge'}</h2><p className="live-detail">{state.phaseDetail || state.progress.current || 'Resolving generation inputs'}</p>{state.sourceCache ? <p className="source-cache-status">SOURCE CACHE • {sourceCacheLabel} • {Math.round(state.sourceCache.elapsedMs).toLocaleString()} ms</p> : null}</div>
          <div className="live-pulse"><span className="status-dot" /> FORGING</div>
        </div>
        <div className="panel-body">
          <div className="forge-scene" data-testid="forge-scene" data-phase={state.lifecycle} data-heat={heat} aria-hidden="true">
            <div className="forge-scene-title">HAMMER &amp; ANVIL</div>
            <div className="forge-scene-phase">{forgeStageLabel(state.lifecycle)}</div>
            <div className="forge-machine">
              <div className="forge-hammer"><span className="forge-hammer-handle" /><span className="forge-hammer-head" /></div>
              <div className="forge-impact">✦</div>
              <div className="forge-anvil"><span className="forge-anvil-face" /><span className="forge-anvil-body" /></div>
              <span className="forge-spark forge-spark-1" data-testid="forge-spark">✦</span>
              <span className="forge-spark forge-spark-2" data-testid="forge-spark">+</span>
              <span className="forge-spark forge-spark-3" data-testid="forge-spark">·</span>
              <span className="forge-spark forge-spark-4" data-testid="forge-spark">✦</span>
              <span className="forge-spark forge-spark-5" data-testid="forge-spark">+</span>
              <span className="forge-spark forge-spark-6" data-testid="forge-spark">·</span>
              <span className="forge-ember forge-ember-1">·</span>
              <span className="forge-ember forge-ember-2">·</span>
              <span className="forge-ember forge-ember-3">·</span>
              <span className="forge-ember forge-ember-4">·</span>
            </div>
          </div>
          <div className="overall-progress-heading"><span>{state.progress.current || 'Current work'}</span><strong>{Math.round(progressPercent)}%</strong></div>
          <div className="progress-track large active-progress"><span style={{ width: `${progressPercent}%` }} /><span className="progress-sheen" aria-hidden="true" /></div>
          <div className="progress-meta"><span>{state.progress.completed.toLocaleString()} / {state.progress.total.toLocaleString()}</span><span>ELAPSED {formatElapsed(elapsedSeconds)}</span></div>

          {Object.keys(state.classProgress).length ? <div className="class-progress-section"><div className="section-rule-title"><span>CLASS PROGRESS</span></div><div className="class-progress-grid">
            {Object.entries(state.classProgress).map(([name, value]) => <div className="class-progress-row" key={name}><span>{name}</span><div className="progress-track"><span style={{ width: `${pct(value.completed, value.total)}%` }} /></div><strong>{value.completed.toLocaleString()} / {value.total.toLocaleString()}</strong></div>)}
          </div></div> : null}
        </div>
      </section>

      <aside className="panel discovery-panel">
        <div className="panel-header"><div><p className="micro-kicker">LIVE FEED</p><h2 className="panel-heading">Recent discoveries</h2></div><span className="feed-count">{state.discoveries.length}</span></div>
        <div className="discovery-list">
          {discoveries.length ? discoveries.map((event, index) => <div className="discovery-card" style={{ animationDelay: `${index * 70}ms` }} key={`${event.kind}-${event.title}-${index}`}><span className="discovery-symbol">{event.kind === 'legendary' ? '★' : event.kind === 'set' ? '◈' : event.kind === 'proc' ? '⚡' : '✦'}</span><div><strong className={discoveryClass(event.kind)}>{event.title}</strong><small>{event.detail || event.kind}</small></div></div>) : <div className="empty-feed">Interesting items will appear here as they are forged.</div>}
        </div>
        <div className="cancel-zone"><button className="forge-button danger" type="button" disabled={cancelling} aria-label="Cancel generation" onClick={onCancel}>{cancelling ? 'Cancelling…' : 'Cancel generation'}</button></div>
      </aside>
    </div>
  );
}
