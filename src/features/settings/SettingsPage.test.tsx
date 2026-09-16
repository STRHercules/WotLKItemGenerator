import { fireEvent, render, screen, waitFor } from '@testing-library/react';
import { describe, expect, it, vi } from 'vitest';
import { SettingsPage } from './SettingsPage';

const settings = {
  defaultOutputDirectory:'C:/Packs', defaultDataDirectory:'C:/Data', azerothcoreSourceRoot:'C:/AzerothCore',
  defaultExpansion:'All', defaultItemCount:100000, rememberLastForgeConfiguration:true,
  animations:true, density:'comfortable', showDiscoveryFeed:true, reduceMotion:false,
  defaultLootChance:2, defaultSetRate:.2, defaultSetMinLevel:20, defaultSetSize:5,
};

vi.mock('../../lib/tauriStorage', () => ({
  saveSettings: vi.fn().mockResolvedValue(undefined),
  listRuns: vi.fn().mockResolvedValue([{ id:'run-1', status:'complete', outputDir:'C:/Packs/1', indexStatus:'indexed' }]),
  deleteRunIndex: vi.fn().mockResolvedValue(1000),
  indexCompletedRun: vi.fn().mockResolvedValue({ library:{ runId:'run-1', itemCount:1000, effectCount:0, socketCount:0 }, reports:[] }),
}));
vi.mock('../../lib/dialogs', () => ({ pickDirectory: vi.fn().mockResolvedValue('D:/Chosen') }));

describe('SettingsPage', () => {
  it('renders all settings groups and persists changes', async () => {
    const onSettingsChange = vi.fn();
    render(<SettingsPage settings={settings as any} onSettingsChange={onSettingsChange} />);
    expect(screen.getByText('General')).toBeInTheDocument();
    expect(screen.getByText('Generator')).toBeInTheDocument();
    expect(screen.getByText('Appearance')).toBeInTheDocument();
    expect(screen.getByText('Paths')).toBeInTheDocument();
    expect(screen.getByText('Storage')).toBeInTheDocument();
    expect(screen.getByText('About')).toBeInTheDocument();
    fireEvent.change(screen.getByLabelText('Default expansion'), { target:{ value:'Wrath' } });
    fireEvent.click(screen.getByRole('button', { name:/save settings/i }));
    await waitFor(() => expect(onSettingsChange).toHaveBeenCalledWith(expect.objectContaining({ defaultExpansion:'Wrath' })));
  });

  it('warns that clearing the library leaves generated packs untouched', () => {
    render(<SettingsPage settings={settings as any} onSettingsChange={vi.fn()} />);
    fireEvent.click(screen.getByRole('button', { name:/clear library index/i }));
    expect(screen.getByRole('dialog')).toHaveTextContent(/generated pack files remain untouched/i);
  });
});
