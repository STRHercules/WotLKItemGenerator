import { useEffect, useMemo, useState } from 'react';
import { getItem, searchItems } from '../../lib/tauriStorage';
import type { ItemDetail, ItemSummary, LibraryQuery, PagedItems } from '../../types/storage';
import { ItemInspector } from './ItemInspector';
import { LibraryFilters } from './LibraryFilters';
import { VirtualItemList } from './VirtualItemList';
import './library.css';

export function LibraryPage({ scopedRunId, onOpenRun, onReports }: { scopedRunId: string | null; onOpenRun: (runId: string) => void; onReports: (runId: string) => void }) {
  const baseQuery = useMemo<LibraryQuery>(() => ({ runId: scopedRunId, limit: 200, offset: 0 }), [scopedRunId]);
  const [query, setQuery] = useState<LibraryQuery>(baseQuery);
  const [debouncedText, setDebouncedText] = useState<string | null>(null);
  const [page, setPage] = useState<PagedItems>({ items: [], total: 0, limit: 200, offset: 0 });
  const [selected, setSelected] = useState<ItemDetail | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => { setQuery(baseQuery); setSelected(null); }, [baseQuery]);
  useEffect(() => { const timer=window.setTimeout(() => setDebouncedText(query.text ?? null), 200); return () => window.clearTimeout(timer); }, [query.text]);
  useEffect(() => {
    let alive = true;
    setLoading(true); setError(null);
    void searchItems({ ...query, text: debouncedText }).then((result) => { if (alive) setPage(result); }).catch((cause) => { if (alive) setError(String(cause)); }).finally(() => { if (alive) setLoading(false); });
    return () => { alive = false; };
  }, [debouncedText, query.runId, query.seed, query.className, query.role, query.quality, query.kind, query.requiredLevelMin, query.requiredLevelMax, query.itemLevelMin, query.itemLevelMax, query.itemset, query.effectType, query.minimumSocketCount, query.placementType, query.entry, query.sort, query.limit, query.offset]);

  async function selectItem(item: ItemSummary) {
    try { setSelected(await getItem(item.runId, item.entry)); }
    catch (cause) { setError(String(cause)); }
  }
  const reset = () => setQuery({ ...baseQuery, text: null });
  const start = page.total === 0 ? 0 : page.offset + 1;
  const end = Math.min(page.total, page.offset + page.items.length);

  return <section className="forge-page library-page">
    <header className="page-header-row"><div><p className="page-kicker">Workshop / Generated Items</p><h1 className="page-heading">Item Library</h1><p className="page-subtitle">A read-only index of validated generated items. Search metadata instantly, then inspect the exact stored JSON when you need to debug.</p></div><div className="library-total"><small>INDEXED RESULTS</small><strong>{page.total.toLocaleString()}</strong></div></header>
    <section className="panel library-browser"><div className="panel-body filter-area"><LibraryFilters query={query} onChange={setQuery} onReset={reset} /></div>
      {error ? <div className="library-message error">{error}</div> : null}
      <div className="library-column-header"><span /><span>Item</span><span>Kind</span><span>Item Level</span></div>
      {loading ? <div className="library-message">Scanning index…</div> : page.items.length ? <VirtualItemList items={page.items} selectedEntry={selected?.entry ?? null} onSelect={(item) => void selectItem(item)} /> : <div className="library-message"><strong>0 items</strong><span>No indexed item matches these filters.</span></div>}
      <footer className="library-pager"><span>{page.total ? `${start.toLocaleString()}–${end.toLocaleString()} of ${page.total.toLocaleString()} items` : '0 items'}</span><div><button className="forge-button" type="button" disabled={page.offset <= 0} onClick={() => setQuery((current) => ({ ...current, offset: Math.max(0,(current.offset ?? 0)-(current.limit ?? 200)) }))}>Previous</button><button className="forge-button" type="button" disabled={end >= page.total} onClick={() => setQuery((current) => ({ ...current, offset:(current.offset ?? 0)+(current.limit ?? 200) }))}>Next</button></div></footer>
    </section>
    {selected ? <ItemInspector item={selected} onClose={() => setSelected(null)} onOpenRun={onOpenRun} onReports={onReports} /> : null}
  </section>;
}
