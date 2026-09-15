import { useState } from 'react';
import type { SourceStatus } from '../../types/sources';

function sizeLabel(size: number | null): string {
  if (size == null) return '—';
  if (size < 1024) return `${size} B`;
  if (size < 1024 ** 2) return `${(size / 1024).toFixed(1)} KB`;
  return `${(size / 1024 ** 2).toFixed(1)} MB`;
}

export function SourceRow({ source }: { source: SourceStatus }) {
  const [open, setOpen] = useState(false);
  const status = source.exists ? 'Found' : source.required ? 'Required, missing' : 'Optional, not configured';
  return (
    <div className={`source-row ${source.exists ? 'source-found' : source.required ? 'source-missing' : 'source-optional'}`}>
      <button type="button" className="source-row-main" aria-expanded={open} onClick={() => setOpen((value) => !value)}>
        <span className="source-status-icon">{source.exists ? '✓' : source.required ? '!' : '○'}</span>
        <span className="source-name"><strong>{source.logicalName}</strong><small>{source.kind} • {source.required ? 'Required' : 'Optional'}</small></span>
        <span className="source-size">{sizeLabel(source.size)}</span>
        <span className="source-state">{status}</span>
        <span className="source-chevron">{open ? '▾' : '▸'}</span>
      </button>
      {open ? <div className="source-detail">
        <dl><div><dt>Resolved path</dt><dd>{source.path}</dd></div><div><dt>Origin</dt><dd>{source.origin}</dd></div><div><dt>Modified</dt><dd>{source.modifiedAt ? new Date(source.modifiedAt).toLocaleString() : 'Unknown'}</dd></div><div><dt>SHA-256</dt><dd>{source.sha256 || 'Calculated only for drift checks'}</dd></div></dl>
      </div> : null}
    </div>
  );
}
