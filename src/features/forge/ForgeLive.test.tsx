import { fireEvent, render, screen } from '@testing-library/react';
import { describe, expect, it, vi } from 'vitest';
import { ForgeLive } from './ForgeLive';
import { initialRunState, type SourceCacheStatus } from './runState';

const state = {
  ...initialRunState(),
  lifecycle: 'finalizing_items' as const,
  phaseName: 'Finalizing generated items',
  phaseDetail: 'Stats, appearances, effects, sockets, disenchant data, and names',
  progress: { completed: 72134, total: 100000, current: 'Hunter • Level 80' },
  classProgress: {
    Warrior: { completed: 10000, total: 10000 },
    Hunter: { completed: 7214, total: 10000 },
  },
  discoveries: [{ protocol_version: 1 as const, type: 'discovery' as const, kind: 'legendary', title: 'Crown of Test', detail: 'Paladin • Level 80' }],
};

describe('ForgeLive', () => {
  it('renders phase, progress, class progress and discoveries', () => {
    render(<ForgeLive state={state} elapsedSeconds={42.18} cancelling={false} onCancel={() => undefined} />);
    expect(screen.getByTestId('live-forge')).toHaveAttribute('data-phase', 'finalizing_items');
    expect(screen.getByText('Finalizing generated items')).toBeInTheDocument();
    expect(screen.getByText(/72,134/)).toBeInTheDocument();
    expect(screen.getByText('Crown of Test')).toHaveClass('rarity-legendary');
    expect(screen.getByText(/00:42/)).toBeInTheDocument();
  });

  it('requests cancellation once', () => {
    const onCancel = vi.fn();
    render(<ForgeLive state={state} elapsedSeconds={1} cancelling={false} onCancel={onCancel} />);
    fireEvent.click(screen.getByRole('button', { name: 'Cancel generation' }));
    expect(onCancel).toHaveBeenCalledTimes(1);
  });

  it.each([
    [{ status: 'hit', elapsedMs: 842, rebuilt: false }, /SOURCE CACHE.*HIT.*842/],
    [{ status: 'miss', elapsedMs: 182431, rebuilt: false }, /SOURCE CACHE.*MISS.*182,431/],
    [{ status: 'partial', elapsedMs: 182431, rebuilt: false }, /SOURCE CACHE.*PARTIAL.*182,431/],
    [{ status: 'miss', elapsedMs: 182431, rebuilt: true }, /SOURCE CACHE.*MISS.*REBUILT.*182,431/],
    [{ status: 'partial', elapsedMs: 182431, rebuilt: true }, /SOURCE CACHE.*PARTIAL.*REBUILT.*182,431/],
  ] satisfies Array<[SourceCacheStatus, RegExp]>)('renders cache status %s', (sourceCache, expected) => {
    render(<ForgeLive state={{ ...state, sourceCache }} elapsedSeconds={1} cancelling={false} onCancel={() => undefined} />);
    expect(screen.getByText(expected)).toBeInTheDocument();
  });
});
