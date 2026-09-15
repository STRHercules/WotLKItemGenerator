import { fireEvent, render, screen } from '@testing-library/react';
import { describe, expect, it, vi } from 'vitest';
import { defaultForgeConfig } from './forgeConfig';
import { ForgeConfigure } from './ForgeConfigure';

const readiness = {
  requiredSourcesFound: 16,
  requiredSourcesTotal: 16,
  azerothcoreReady: true,
  dbcReady: true,
  outputWritable: true,
  blockingMessages: [],
};

describe('ForgeConfigure', () => {
  it('shows common controls and keeps advanced controls collapsed', () => {
    render(<ForgeConfigure config={{ ...defaultForgeConfig(), output_root: 'C:/Packs' }} readiness={readiness} onChange={() => undefined} onBegin={() => undefined} onOpenSources={() => undefined} />);
    expect(screen.getByRole('button', { name: 'Wrath' })).toBeInTheDocument();
    expect(screen.getByRole('checkbox', { name: 'Paladin' })).toBeChecked();
    expect(screen.getByRole('button', { name: /advanced options/i })).toHaveAttribute('aria-expanded', 'false');
    expect(screen.queryByLabelText('Set rate')).not.toBeInTheDocument();
  });

  it('blocks generation when readiness is not healthy', () => {
    render(<ForgeConfigure config={{ ...defaultForgeConfig(), output_root: 'C:/Packs' }} readiness={{ ...readiness, outputWritable: false }} onChange={() => undefined} onBegin={() => undefined} onOpenSources={() => undefined} />);
    expect(screen.getByRole('button', { name: /begin forging/i })).toBeDisabled();
  });

  it('opens advanced options', () => {
    render(<ForgeConfigure config={{ ...defaultForgeConfig(), output_root: 'C:/Packs' }} readiness={readiness} onChange={vi.fn()} onBegin={vi.fn()} onOpenSources={vi.fn()} />);
    fireEvent.click(screen.getByRole('button', { name: /advanced options/i }));
    expect(screen.getByLabelText('Set rate')).toBeInTheDocument();
  });
});
