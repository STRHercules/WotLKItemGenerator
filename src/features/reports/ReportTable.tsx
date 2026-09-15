import { useMemo, useState } from 'react';
import type { ReportTablePage } from '../../types/storage';

export function ReportTable({ page, loading, onPrevious, onNext }: {
  page: ReportTablePage | null;
  loading: boolean;
  onPrevious: () => void;
  onNext: () => void;
}) {
  const [query, setQuery] = useState('');
  const [hidden, setHidden] = useState<Set<number>>(new Set());
  const filtered = useMemo(() => {
    const text = query.trim().toLowerCase();
    if (!page || !text) return page?.rows ?? [];
    return page.rows.filter((row) => row.some((cell) => cell.toLowerCase().includes(text)));
  }, [page, query]);

  if (!page) return <div className="empty-state">{loading ? 'Loading report…' : 'No report data loaded.'}</div>;
  return (
    <div className="report-table-wrap">
      <div className="report-table-tools">
        <label>Filter current page<input value={query} onChange={(event) => setQuery(event.target.value)} placeholder="Find in visible rows…" /></label>
        <details><summary>Columns</summary><div className="report-columns">
          {page.headers.map((header, index) => <label key={`${header}-${index}`}><input type="checkbox" checked={!hidden.has(index)} onChange={() => setHidden((current) => { const next = new Set(current); next.has(index) ? next.delete(index) : next.add(index); return next; })} />{header}</label>)}
        </div></details>
      </div>
      <div className="report-table-scroll">
        <table className="report-table">
          <thead><tr>{page.headers.map((header, index) => hidden.has(index) ? null : <th key={`${header}-${index}`}>{header}</th>)}</tr></thead>
          <tbody>{filtered.map((row, rowIndex) => <tr key={`${page.offset}-${rowIndex}`}>{row.map((cell, index) => hidden.has(index) ? null : <td key={index}>{cell}</td>)}</tr>)}</tbody>
        </table>
      </div>
      <footer className="report-pagination">
        <button className="button button--secondary" disabled={loading || page.offset === 0} onClick={onPrevious}>Previous</button>
        <span>Rows {page.offset + 1}–{page.offset + page.rows.length}</span>
        <button className="button button--secondary" disabled={loading || !page.hasMore} onClick={onNext}>Next</button>
      </footer>
    </div>
  );
}
