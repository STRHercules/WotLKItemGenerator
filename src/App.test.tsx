import { cleanup, fireEvent, render, screen } from '@testing-library/react'
import { afterEach, describe, expect, it } from 'vitest'
import App from './App'

afterEach(cleanup)

describe('WotLK Item Forge shell', () => {
  it('shows the four tabs and keeps Forge Items disabled', () => {
    render(<App />)

    expect(screen.getAllByRole('tab').map((tab) => tab.textContent)).toEqual([
      'Sources',
      'Generation',
      'Advanced',
      'Library',
    ])
    expect(screen.getByRole('button', { name: 'Forge Items' })).toBeDisabled()
  })

  it('switches the selected tab and controlled panel', () => {
    render(<App />)

    const generation = screen.getByRole('tab', { name: 'Generation' })
    fireEvent.click(generation)

    expect(generation).toHaveAttribute('aria-selected', 'true')
    expect(generation).toHaveAttribute('aria-controls', 'panel-generation')
    expect(screen.getByRole('tabpanel')).toHaveAttribute('id', 'panel-generation')
    expect(screen.getByRole('heading', { name: 'Generation' })).toBeInTheDocument()
  })
})
