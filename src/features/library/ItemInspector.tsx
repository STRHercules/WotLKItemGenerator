import { useState } from 'react';
import type { ItemDetail } from '../../types/storage';
import { qualityMeta } from './VirtualItemList';

function statRows(raw: Record<string, unknown>): Array<{ name: string; value: number }> {
  const stats = Array.isArray(raw.stats) ? raw.stats : [];
  return stats.flatMap((stat) => {
    if (!stat || typeof stat !== 'object') return [];
    const value = stat as Record<string, unknown>;
    const amount = Number(value.value ?? 0);
    return [{ name: String(value.name ?? `Stat ${String(value.id ?? '')}`), value: amount }];
  });
}

export function ItemInspector({ item, onClose, onOpenRun, onReports }: { item: ItemDetail; onClose: () => void; onOpenRun: (runId: string) => void; onReports: (runId: string) => void }) {
  const [tab, setTab] = useState<'item' | 'raw'>('item');
  const quality = qualityMeta(item.quality);
  const stats = statRows(item.raw);
  return (
    <aside className="item-inspector" aria-label={`Item details: ${item.name}`}>
      <div className="inspector-top"><div><span className="inspector-kicker">ENTRY {item.entry}</span><h2 className={quality.className}>{item.name}</h2><p>{quality.label} {item.kind || 'Item'} • Item Level {item.itemLevel ?? '—'}</p></div><button className="icon-button" type="button" aria-label="Close item details" onClick={onClose}>×</button></div>
      <div className="inspector-tabs"><button className={tab==='item'?'active':''} type="button" onClick={() => setTab('item')}>Item</button><button className={tab==='raw'?'active':''} type="button" onClick={() => setTab('raw')}>Raw Data</button></div>
      {tab === 'raw' ? <pre className="raw-json">{JSON.stringify(item.raw, null, 2)}</pre> : <div className="inspector-content">
        <section className="wow-tooltip"><div className="tooltip-level"><span>Requires Level {item.requiredLevel ?? '—'}</span><span>ilvl {item.itemLevel ?? '—'}</span></div>{stats.map((stat) => <div className="tooltip-stat" key={`${stat.name}-${stat.value}`}>+{stat.value} {stat.name}</div>)}
          {item.sockets.length ? <div className="tooltip-sockets">{item.sockets.map((socket,index) => <span key={`${socket}-${index}`}>◉ Socket {index + 1} • color {socket}</span>)}</div> : null}
          {typeof item.raw.description === 'string' && item.raw.description ? <em>{item.raw.description}</em> : null}
        </section>
        {item.effects.length ? <InspectorSection title="Effects">{item.effects.map((effect) => <div className="metadata-row" key={effect.slot}><span>{item.specialEffectFeature || 'Effect'} #{effect.slot + 1}</span><strong>Spell {effect.spellId ?? '—'}</strong><small>Trigger {effect.trigger ?? '—'} • PPM {effect.ppmRate ?? '—'} • Cooldown {effect.cooldown ?? '—'}</small></div>)}</InspectorSection> : null}
        {item.itemset ? <InspectorSection title="Set"><div className="metadata-row"><span>{item.setName || `Set ${item.itemset}`}</span><strong>ID {item.itemset}</strong></div></InspectorSection> : null}
        <InspectorSection title="Placement">{item.placements.length ? item.placements.map((placement,index) => <div className="metadata-row" key={`${placement.destination}-${index}`}><span>{placement.destination.toUpperCase()}</span><strong>{placement.instance || placement.profileId || 'World loot'}</strong><small>{placement.encounter || ''}{placement.chance != null ? ` • ${placement.chance}%` : ''}</small></div>) : <div className="muted-copy">No indexed placement rows for this item.</div>}</InspectorSection>
        <InspectorSection title="Technical"><div className="tech-grid"><span>Run<strong>{item.run.id.slice(0,8)}</strong></span><span>Seed<strong>{item.seed}</strong></span><span>Entry<strong>{item.entry}</strong></span><span>Class<strong>{item.className || 'Any'}</strong></span></div></InspectorSection>
      </div>}
      <div className="inspector-actions"><button className="forge-button" type="button" onClick={() => void navigator.clipboard.writeText(String(item.entry))}>Copy ID</button><button className="forge-button" type="button" onClick={() => onOpenRun(item.runId)}>Open Run</button><button className="forge-button" type="button" onClick={() => onReports(item.runId)}>Reports</button></div>
    </aside>
  );
}

function InspectorSection({ title, children }: { title: string; children: React.ReactNode }) {
  return <section className="inspector-section"><h3>{title}</h3>{children}</section>;
}
