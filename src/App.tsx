import { useState } from 'react'

const tabs = ['Sources', 'Generation', 'Advanced', 'Library'] as const

function RunSummary() {
  return (
    <aside className="run-summary" aria-label="Run summary">
      <h2>Run Summary</h2>
      <p>No forge run yet.</p>
    </aside>
  )
}

export default function App() {
  const [activeTab, setActiveTab] = useState<(typeof tabs)[number]>('Sources')

  return (
    <main className="app-shell">
      <header>
        <p className="eyebrow">Desktop workspace</p>
        <h1>WotLK Item Forge</h1>
      </header>

      <nav aria-label="Forge sections" className="tabs" role="tablist">
        {tabs.map((tab) => (
          <button
            key={tab}
            type="button"
            role="tab"
            id={`tab-${tab.toLowerCase()}`}
            aria-controls={`panel-${tab.toLowerCase()}`}
            aria-selected={activeTab === tab}
            onClick={() => setActiveTab(tab)}
          >
            {tab}
          </button>
        ))}
      </nav>

      <section
        id={`panel-${activeTab.toLowerCase()}`}
        role="tabpanel"
        aria-labelledby={`tab-${activeTab.toLowerCase()}`}
        aria-label={`${activeTab} page`}
        className="placeholder-page"
      >
        <h2>{activeTab}</h2>
        <p>This placeholder page is ready for the next task.</p>
      </section>

      <RunSummary />

      <button type="button" disabled className="forge-button">
        Forge Items
      </button>
    </main>
  )
}
