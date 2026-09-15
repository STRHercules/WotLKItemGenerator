import { render, screen } from '@testing-library/react';
import { describe, expect, it, vi } from 'vitest';
import { LibraryPage } from './LibraryPage';

vi.mock('../../lib/tauriStorage', () => ({
  searchItems: vi.fn().mockResolvedValue({ items: [], total: 0, limit: 100, offset: 0 }),
  getItem: vi.fn(),
}));

describe('LibraryPage', () => {
  it('renders search and the approved filter surface', async () => {
    render(<LibraryPage scopedRunId={null} onOpenRun={vi.fn()} onReports={vi.fn()} />);
    expect(screen.getByPlaceholderText(/search generated items/i)).toBeInTheDocument();
    expect(screen.getByLabelText('Quality')).toBeInTheDocument();
    expect(screen.getByLabelText('Class')).toBeInTheDocument();
    expect(screen.getByLabelText('Effect')).toBeInTheDocument();
    expect(await screen.findByText('0 items')).toBeInTheDocument();
  });
});
