import { fireEvent, render, screen } from '@testing-library/react';
import { describe, expect, it, vi } from 'vitest';
import App from './App';

vi.mock('./lib/tauriStorage', () => ({
  getSettings: vi.fn().mockResolvedValue({
    defaultOutputDirectory:'C:/Packs', defaultDataDirectory:'C:/Data', azerothcoreSourceRoot:'C:/AzerothCore', defaultExpansion:'All', defaultItemCount:100000,
    rememberLastForgeConfiguration:true, animations:true, density:'comfortable', showDiscoveryFeed:true, reduceMotion:false,
    defaultLootChance:2, defaultSetRate:.2, defaultSetMinLevel:20, defaultSetSize:5,
  }),
  openRunOutput: vi.fn(),
}));
vi.mock('./lib/tauriSources', () => ({
  scanSources: vi.fn().mockResolvedValue({ health:'healthy', requiredFound:16, requiredTotal:16, optionalFound:0, optionalTotal:4, azerothcoreReady:true, azerothcorePath:'C:/AzerothCore', dbcReady:true, outputWritable:true, dataDirectory:'C:/Data', dataOrigin:'override', sources:[], cache:{ path:'cache', exists:false, size:null, modifiedAt:null, state:'current' } }),
}));

describe('App', () => {
  it('renders the application identity and six-page navigation', async () => {
    render(<App />);
    expect(await screen.findByText('WotLK ITEM FORGE')).toBeInTheDocument();
    for (const label of ['Forge','Sources','Library','Reports','History','Settings']) expect(screen.getByRole('button', { name:label })).toBeInTheDocument();
  });

  it('navigates to Sources through the persistent shell', async () => {
    render(<App />);
    fireEvent.click(await screen.findByRole('button', { name:'Sources' }));
    expect(await screen.findByRole('heading', { name:/know exactly what the forge can see/i })).toBeInTheDocument();
  });
});
