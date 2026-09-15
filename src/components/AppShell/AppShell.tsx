import type { ReactNode } from 'react';

import { PAGE_DEFINITIONS, pageDefinition, type PageId } from '../../routes';
import './AppShell.css';

export type SourceHealth = 'healthy' | 'warning' | 'error' | 'checking';

type AppShellProps = {
  activePage: PageId;
  onNavigate: (page: PageId) => void;
  sourceHealth: SourceHealth;
  children: ReactNode;
};

const HEALTH_COPY: Record<SourceHealth, string> = {
  healthy: 'Sources healthy',
  warning: 'Sources need attention',
  error: 'Sources blocked',
  checking: 'Checking sources',
};

export function AppShell({ activePage, onNavigate, sourceHealth, children }: AppShellProps) {
  const active = pageDefinition(activePage);
  return (
    <div className="app-shell">
      <header className="topbar">
        <div className="brand-lockup" aria-label="WotLK Item Forge">
          <div className="brand-mark" aria-hidden="true">⚒</div>
          <div>
            <div className="brand-name">WotLK ITEM FORGE</div>
            <div className="brand-meta">AZEROTHCORE • 3.3.5A</div>
          </div>
        </div>
        <div className="topbar-center" aria-label="Current location">
          <span>WORKSHOP</span><span className="topbar-chevron">›</span><strong>{active.label.toUpperCase()}</strong>
        </div>
        <div className={`source-health source-health-${sourceHealth}`} role="status">
          <span className="status-dot" aria-hidden="true" />
          <span>{HEALTH_COPY[sourceHealth]}</span>
        </div>
      </header>

      <div className="shell-body">
        <aside className="sidebar">
          <nav aria-label="Primary navigation" className="primary-nav">
            {PAGE_DEFINITIONS.map((page, index) => {
              const selected = page.id === activePage;
              return (
                <button
                  key={page.id}
                  type="button"
                  className={`nav-button${selected ? ' nav-button-active' : ''}`}
                  aria-current={selected ? 'page' : undefined}
                  aria-label={page.label}
                  onClick={() => onNavigate(page.id)}
                >
                  <span className="nav-index">{String(index + 1).padStart(2, '0')}</span>
                  <span className="nav-glyph" aria-hidden="true">{page.glyph}</span>
                  <span className="nav-copy">
                    <strong>{page.label}</strong>
                    <small>{page.description}</small>
                  </span>
                </button>
              );
            })}
          </nav>
          <div className="sidebar-footer">
            <span className="sidebar-rune">⌬</span>
            <div><strong>Forge Engine</strong><small>JSON bridge • protocol v1</small></div>
          </div>
        </aside>
        <main className="app-main" tabIndex={-1}>{children}</main>
      </div>
    </div>
  );
}
