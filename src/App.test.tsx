import { render, screen } from '@testing-library/react'
import { describe, expect, it } from 'vitest'
import App from './App'

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
})
