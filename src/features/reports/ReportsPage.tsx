import { useCallback, useEffect, useMemo, useState } from 'react';
import { listReports, openReportFile, readReportTable } from '../../lib/tauriStorage';
import type { ReportRecord, ReportTablePage } from '../../types/storage';
import { ReportSummary } from './ReportSummary';
import { ReportTable } from './ReportTable';
import { availableReportTabs, type ReportTabId } from './reportModel';
import './reports.css';

const PAGE_SIZE = 100;

export function ReportsPage({ runId }: { runId: string | null }) {
  const [reports, setReports] = useState<ReportRecord[]>([]);
  const [active, setActive] = useState<ReportTabId>('summary');
  const [page, setPage] = useState<ReportTablePage | null>(null);
  const [validation, setValidation] = useState<ReportTablePage | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const tabs = useMemo(() => availableReportTabs(reports), [reports]);

  const activeTab = tabs.find((tab) => tab.id === active) ?? tabs[0];
  const activeReport = reports.find((report) => report.reportType === activeTab?.reportType) ?? null;

  const loadReports = useCallback(async () => {
    if (!runId) return;
    setError(null);
    try {
      const found = await listReports(runId);
      setReports(found);
      const validationReport = found.find((report) => report.reportType === 'validation');
      setValidation(validationReport ? await readReportTable(runId, 'validation', { offset: 0, limit: PAGE_SIZE }) : null);
    } catch (candidate) {
      setError(String(candidate));
    }
  }, [runId]);

  useEffect(() => { void loadReports(); }, [loadReports]);
  useEffect(() => {
    if (!tabs.some((tab) => tab.id === active)) setActive('summary');
  }, [active, tabs]);

  const loadPage = useCallback(async (offset: number) => {
    if (!runId || !activeTab?.reportType) return;
    setLoading(true); setError(null);
    try { setPage(await readReportTable(runId, activeTab.reportType, { offset, limit: PAGE_SIZE })); }
    catch (candidate) { setError(String(candidate)); setPage(null); }
    finally { setLoading(false); }
  }, [activeTab?.reportType, runId]);

  useEffect(() => {
    if (active === 'summary') { setPage(null); return; }
    void loadPage(0);
  }, [active, loadPage]);

  if (!runId) return <section className="forge-page"><header><p className="page-kicker">Workshop / Reports</p><h1 className="page-heading">Reports</h1><p className="page-subtitle">Choose a completed run from History or Library to inspect its reports.</p></header><div className="panel"><div className="panel-body empty-state">No run selected.</div></div></section>;

  return (
    <section className="forge-page reports-page">
      <header><p className="page-kicker">Workshop / Reports</p><h1 className="page-heading">Reports</h1><p className="page-subtitle">Validation, loot placement, encounter coverage, sets, and source audits for this run.</p></header>
      {error && <div className="alert alert--failure">{error}</div>}
      <div className="report-tabs" role="tablist" aria-label="Run reports">
        {tabs.map((tab) => <button key={tab.id} type="button" role="tab" aria-selected={active === tab.id} className={active === tab.id ? 'report-tab report-tab--active' : 'report-tab'} onClick={() => setActive(tab.id)}>{tab.label}</button>)}
      </div>
      <section className="panel report-content">
        <div className="panel-header report-content__header">
          <div><span className="eyebrow">Run</span><strong>{runId}</strong></div>
          {activeReport && <button className="button button--secondary" onClick={() => void openReportFile(activeReport.id)}>Open Raw File</button>}
        </div>
        <div className="panel-body">
          {active === 'summary' ? (
            validation?.rawJson ? <ReportSummary rawJson={validation.rawJson} /> : <div className="empty-state">Validation summary is not available for this run.</div>
          ) : (
            <ReportTable page={page} loading={loading} onPrevious={() => page && void loadPage(Math.max(0, page.offset - page.limit))} onNext={() => page && void loadPage(page.offset + page.limit)} />
          )}
        </div>
      </section>
    </section>
  );
}
