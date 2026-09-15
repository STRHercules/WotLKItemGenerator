import { fireEvent, render, screen } from '@testing-library/react';
import { describe, expect, it, vi } from 'vitest';

import { AppShell } from './AppShell';

describe('AppShell', () => {
  it('renders six accessible navigation buttons and current source health', () => {
    render(
      <AppShell activePage="forge" onNavigate={() => undefined} sourceHealth="healthy">
        <h1>Forge content</h1>
      </AppShell>,
    );

    for (const name of ['Forge', 'Sources', 'Library', 'Reports', 'History', 'Settings']) {
      expect(screen.getByRole('button', { name })).toBeInTheDocument();
    }
    expect(screen.getByRole('button', { name: 'Forge' })).toHaveAttribute('aria-current', 'page');
    expect(screen.getByRole('main')).toContainElement(screen.getByRole('heading', { name: 'Forge content' }));
    expect(screen.getByText('Sources healthy')).toBeInTheDocument();
  });

  it('navigates without a page reload', () => {
    const onNavigate = vi.fn();
    render(
      <AppShell activePage="forge" onNavigate={onNavigate} sourceHealth="warning">
        <div>Content</div>
      </AppShell>,
    );
    fireEvent.click(screen.getByRole('button', { name: 'Library' }));
    expect(onNavigate).toHaveBeenCalledWith('library');
  });
});
