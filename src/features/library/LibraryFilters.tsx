import type { LibraryQuery } from '../../types/storage';

const CLASSES = ['Warrior','Paladin','Hunter','Rogue','Priest','Death Knight','Shaman','Mage','Warlock','Druid'];
const QUALITIES = [['','All qualities'],['2','Uncommon'],['3','Rare'],['4','Epic'],['5','Legendary']] as const;

export function LibraryFilters({ query, onChange, onReset }: { query: LibraryQuery; onChange: (next: LibraryQuery) => void; onReset: () => void }) {
  const patch = (value: Partial<LibraryQuery>) => onChange({ ...query, ...value, offset: 0 });
  return (
    <div className="library-filter-stack">
      <div className="library-search-row">
        <div className="search-box"><span aria-hidden="true">⌕</span><input aria-label="Search items" placeholder="Search generated items..." value={query.text ?? ''} onChange={(event) => patch({ text: event.target.value || null })} /></div>
        <button className="forge-button" type="button" onClick={onReset}>Reset</button>
      </div>
      <div className="library-filter-row">
        <label><span>Quality</span><select aria-label="Quality" value={query.quality ?? ''} onChange={(event) => patch({ quality: event.target.value ? Number(event.target.value) : null })}>{QUALITIES.map(([value,label]) => <option key={value} value={value}>{label}</option>)}</select></label>
        <label><span>Class</span><select aria-label="Class" value={query.className ?? ''} onChange={(event) => patch({ className: event.target.value || null })}><option value="">All classes</option>{CLASSES.map((name) => <option key={name}>{name}</option>)}</select></label>
        <label><span>Role</span><select aria-label="Role" value={query.role ?? ''} onChange={(event) => patch({ role: event.target.value || null })}><option value="">All roles</option><option value="tank">Tank</option><option value="healer">Healer</option><option value="melee_dps">Melee DPS</option><option value="ranged_dps">Ranged DPS</option><option value="caster">Caster</option></select></label>
        <label><span>Kind</span><input aria-label="Kind" placeholder="head, sword..." value={query.kind ?? ''} onChange={(event) => patch({ kind: event.target.value || null })} /></label>
        <label><span>Effect</span><select aria-label="Effect" value={query.effectType ?? ''} onChange={(event) => patch({ effectType: event.target.value || null })}><option value="">All effects</option><option value="spell-effects">On Equip</option><option value="chance-on-hit">On Hit</option><option value="on-use">On Use</option></select></label>
        <label><span>Placement</span><select aria-label="Placement" value={query.placementType ?? ''} onChange={(event) => patch({ placementType: event.target.value || null })}><option value="">Anywhere</option><option value="world">World</option><option value="dungeon">Dungeon</option><option value="raid">Raid</option></select></label>
      </div>
      <div className="library-range-row">
        <span className="filter-caption">LEVELS</span>
        <input aria-label="Required level minimum" type="number" min={1} max={80} placeholder="Req min" value={query.requiredLevelMin ?? ''} onChange={(e) => patch({ requiredLevelMin: e.target.value ? Number(e.target.value) : null })} />
        <input aria-label="Required level maximum" type="number" min={1} max={80} placeholder="Req max" value={query.requiredLevelMax ?? ''} onChange={(e) => patch({ requiredLevelMax: e.target.value ? Number(e.target.value) : null })} />
        <input aria-label="Item level minimum" type="number" min={1} placeholder="ilvl min" value={query.itemLevelMin ?? ''} onChange={(e) => patch({ itemLevelMin: e.target.value ? Number(e.target.value) : null })} />
        <input aria-label="Item level maximum" type="number" min={1} placeholder="ilvl max" value={query.itemLevelMax ?? ''} onChange={(e) => patch({ itemLevelMax: e.target.value ? Number(e.target.value) : null })} />
        <input aria-label="Set ID" type="number" placeholder="Set ID" value={query.itemset ?? ''} onChange={(e) => patch({ itemset: e.target.value ? Number(e.target.value) : null })} />
        <input aria-label="Minimum sockets" type="number" min={0} max={3} placeholder="Sockets" value={query.minimumSocketCount ?? ''} onChange={(e) => patch({ minimumSocketCount: e.target.value ? Number(e.target.value) : null })} />
        <input aria-label="Entry ID" type="number" placeholder="Entry ID" value={query.entry ?? ''} onChange={(e) => patch({ entry: e.target.value ? Number(e.target.value) : null })} />
      </div>
    </div>
  );
}
