import { fireEvent, render, screen, waitFor } from '@testing-library/react';
import { describe, expect, it, vi } from 'vitest';

import { ReportsPage } from './ReportsPage';

const reports = [
  { id: 1, runId: 'run-1', reportType: 'validation', path: 'C:/pack/validation_report.json', importState: 'available', size: 100, modifiedAt: null },
  { id: 2, runId: 'run-1', reportType: 'world_loot', path: 'C:/pack/world_item_placements.csv', importState: 'available', size: 200, modifiedAt: null },
];

vi.mock('../../lib/tauriStorage', () => ({
  listReports: vi.fn().mockResolvedValue(reports),
  readReportTable: vi.fn().mockImplementation(async (_runId: string, reportType: string) => {
    if (reportType === 'validation') {
      return {
        reportType,
        headers: ['Field', 'Value'],
        rows: [['validation_errors', '0'], ['item_count', '100000']],
        offset: 0,
        limit: 100,
        hasMore: false,
        rawJson: {
          validation_errors: 0,
          item_count: 100000,
          name_repair_count: 14,
          quality_distribution: { Legendary: 18 },
          feature_counts: { sets: 412 },
        },
      };
    }
    return {
      reportType,
      headers: ['entry', 'name'],
      rows: [['900001', 'Test Blade']],
      offset: 0,
      limit: 100,
      hasMore: false,
      rawJson: null,
    };
  }),
  openReportFile: vi.fn().mockResolvedValue(undefined),
}));

describe('ReportsPage', () => {
  it('renders report tabs and validation summary from stored report data', async () => {
    render(<ReportsPage runId="run-1" />);
    expect(await screen.findByRole('tab', { name: 'Summary' })).toBeInTheDocument();
    expect(screen.getByRole('tab', { name: 'Validation' })).toBeInTheDocument();
    expect(screen.getByRole('tab', { name: 'World Loot' })).toBeInTheDocument();
    expect(screen.queryByRole('tab', { name: 'Dungeons / Raids' })).not.toBeInTheDocument();
    expect(await screen.findByText('100,000')).toBeInTheDocument();
    expect(screen.getByText('18')).toBeInTheDocument();
  });

  it('loads paged report table rows and opens only the indexed report', async () => {
    const storage = await import('../../lib/tauriStorage');
    render(<ReportsPage runId="run-1" />);
    fireEvent.click(await screen.findByRole('tab', { name: 'World Loot' }));
    expect(await screen.findByText('Test Blade')).toBeInTheDocument();
    fireEvent.click(screen.getByRole('button', { name: /open raw file/i }));
    await waitFor(() => expect(storage.openReportFile).toHaveBeenCalledWith(2));
  });
});
