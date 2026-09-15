import { useRef } from 'react';
import { useVirtualizer } from '@tanstack/react-virtual';
import type { ItemSummary } from '../../types/storage';

const QUALITY: Record<number, { label: string; className: string }> = {
  1: { label: 'Common', className: 'rarity-common' },
  2: { label: 'Uncommon', className: 'rarity-uncommon' },
  3: { label: 'Rare', className: 'rarity-rare' },
  4: { label: 'Epic', className: 'rarity-epic' },
  5: { label: 'Legendary', className: 'rarity-legendary' },
};

export function qualityMeta(quality: number | null) {
  return QUALITY[quality ?? 0] ?? { label: 'Unknown', className: 'rarity-common' };
}

export function VirtualItemList({ items, selectedEntry, onSelect }: { items: ItemSummary[]; selectedEntry: number | null; onSelect: (item: ItemSummary) => void }) {
  const parentRef = useRef<HTMLDivElement>(null);
  const virtualizer = useVirtualizer({ count: items.length, getScrollElement: () => parentRef.current, estimateSize: () => 58, overscan: 8 });
  return (
    <div className="item-list-scroll" ref={parentRef} role="list" aria-label="Generated items">
      <div className="virtual-spacer" style={{ height: `${virtualizer.getTotalSize()}px` }}>
        {virtualizer.getVirtualItems().map((row) => {
          const item = items[row.index];
          const quality = qualityMeta(item.quality);
          return <button type="button" role="listitem" key={`${item.runId}-${item.entry}`} className={`item-row${selectedEntry === item.entry ? ' item-row-selected' : ''}`} style={{ transform: `translateY(${row.start}px)` }} onClick={() => onSelect(item)}>
            <span className={`quality-pip ${quality.className}`} aria-label={quality.label}>◆</span>
            <span className="item-row-main"><strong className={quality.className}>{item.name}</strong><small>{item.className || 'Any class'} • {item.role?.replaceAll('_',' ') || 'general'} • Entry {item.entry}</small></span>
            <span className="item-kind">{item.kind || 'item'}</span>
            <span className="item-ilvl"><small>ILVL</small><strong>{item.itemLevel ?? '—'}</strong></span>
          </button>;
        })}
      </div>
    </div>
  );
}
