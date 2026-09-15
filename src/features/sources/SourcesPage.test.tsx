import { render, screen } from '@testing-library/react';
import { describe, expect, it, vi } from 'vitest';
import { SourcesPage } from './SourcesPage';
import type { SourceHealthReport } from '../../types/sources';

const report: SourceHealthReport = {
  health: 'healthy', requiredFound: 16, requiredTotal: 16, optionalFound: 1, optionalTotal: 4,
  azerothcoreReady: true, azerothcorePath: 'C:/AzerothCore', dbcReady: true, outputWritable: true,
  dataDirectory: 'C:/Data', dataOrigin: 'override',
  cache: { path: 'C:/Local/cache/source-cache.json.gz', exists: true, size: 123, modifiedAt: '2026-09-15T20:00:00Z', state: 'current' },
  sources: [
    { logicalName: 'Item.dbc', kind: 'DBC', required: true, path: 'C:/Data/Item.dbc', exists: true, size: 42, modifiedAt: null, origin: 'override', sha256: null },
    { logicalName: 'gameobject.sql', kind: 'SQL', required: false, path: 'C:/Data/gameobject.sql', exists: false, size: null, modifiedAt: null, origin: 'override', sha256: null },
  ],
};

describe('SourcesPage', () => {
  it('treats optional missing sources as neutral while showing healthy required data', () => {
    render(<SourcesPage report={report} loading={false} onRefresh={vi.fn()} onReportChange={vi.fn()} />);
    expect(screen.getByText('16/16')).toBeInTheDocument();
    expect(screen.getByText('Item.dbc')).toBeInTheDocument();
    expect(screen.getByText('gameobject.sql')).toBeInTheDocument();
    expect(screen.getByText('Optional, not configured')).toBeInTheDocument();
  });
});
