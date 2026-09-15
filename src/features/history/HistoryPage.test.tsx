import { fireEvent, render, screen, waitFor } from '@testing-library/react';
import { describe, expect, it, vi } from 'vitest';
import { HistoryPage } from './HistoryPage';

const runs = [
  { id:'run-1', seed:'123', status:'complete', startedAt:'2026-09-15T20:00:00Z', finishedAt:'2026-09-15T20:01:00Z', elapsedMs:60000, outputDir:'C:/packs/123', engineVersion:'0.1.0', protocolVersion:1, validationErrorCount:0, summary:{ item_count:1000 }, indexStatus:'indexed', indexError:null, expansion:'Wrath', itemCount:1000, classes:['Mage'] },
  { id:'run-2', seed:'456', status:'failed', startedAt:'2026-09-14T20:00:00Z', finishedAt:'2026-09-14T20:00:05Z', elapsedMs:5000, outputDir:'C:/packs/456', engineVersion:'0.1.0', protocolVersion:1, validationErrorCount:1, summary:{}, indexStatus:'pending', indexError:null, expansion:'All', itemCount:500, classes:['Priest'] },
  { id:'run-3', seed:'789', status:'cancelled', startedAt:'2026-09-13T20:00:00Z', finishedAt:'2026-09-13T20:00:02Z', elapsedMs:2000, outputDir:'C:/packs/789', engineVersion:'0.1.0', protocolVersion:1, validationErrorCount:0, summary:{}, indexStatus:'pending', indexError:null, expansion:'TBC', itemCount:500, classes:['Rogue'] },
];

vi.mock('../../lib/tauriStorage', () => ({
  listRuns: vi.fn().mockResolvedValue(runs),
  getRun: vi.fn().mockResolvedValue({ ...runs[0], configuration:{ number:1000, classes:['Mage'], expansion:'Wrath', output_root:'C:/packs' }, sources:[{ logicalName:'Item.dbc', path:'C:/Data/Item.dbc', sha256:'old', size:1, modifiedAt:null }] }),
  fingerprintSources: vi.fn().mockResolvedValue([{ logicalName:'Item.dbc', path:'C:/Data/Item.dbc', sha256:'new', size:1, modifiedAt:null }]),
  compareSourceDrift: vi.fn().mockResolvedValue({ changed:true, entries:[{ logicalName:'Item.dbc', path:'C:/Data/Item.dbc', status:'modified', previous:null, current:null }] }),
}));

describe('HistoryPage', () => {
  it('renders complete, failed, and cancelled run semantics', async () => {
    render(<HistoryPage onOpenLibrary={vi.fn()} onOpenReports={vi.fn()} onRegenerate={vi.fn()} />);
    expect(await screen.findByText('Complete')).toBeInTheDocument();
    expect(screen.getByText('Failed')).toBeInTheDocument();
    expect(screen.getByText('Cancelled')).toBeInTheDocument();
    expect(screen.getByText('123')).toBeInTheDocument();
  });

  it('opens details, reports source drift, and preloads Forge without starting a run', async () => {
    const onRegenerate = vi.fn();
    render(<HistoryPage onOpenLibrary={vi.fn()} onOpenReports={vi.fn()} onRegenerate={onRegenerate} />);
    fireEvent.click(await screen.findByRole('button', { name:/open run 123/i }));
    expect(await screen.findByText(/sources changed since this run/i)).toBeInTheDocument();
    fireEvent.click(screen.getByRole('button', { name:/regenerate/i }));
    await waitFor(() => expect(onRegenerate).toHaveBeenCalledTimes(1));
    expect(onRegenerate.mock.calls[0][0].number).toBe(1000);
  });
});
