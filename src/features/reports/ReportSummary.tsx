import { summarizeValidationReport } from './reportModel';

function Metric({ label, value }: { label: string; value: number | string }) {
  return <div className="report-metric"><span>{label}</span><strong>{typeof value === 'number' ? value.toLocaleString() : value}</strong></div>;
}

export function ReportSummary({ rawJson }: { rawJson: unknown }) {
  const summary = summarizeValidationReport(rawJson);
  const validationPassed = summary.validationErrors === 0;
  return (
    <div className="report-summary">
      <section className="report-summary__hero panel">
        <div className="panel-body">
          <span className={`status-pill ${validationPassed ? 'status-pill--success' : 'status-pill--failure'}`}>
            {validationPassed ? '✓ Validation passed' : `✕ ${summary.validationErrors.toLocaleString()} validation errors`}
          </span>
          <div className="report-metrics">
            <Metric label="Items" value={summary.itemCount} />
            <Metric label="Name repairs" value={summary.nameRepairs} />
            <Metric label="Validation errors" value={summary.validationErrors} />
          </div>
        </div>
      </section>
      <div className="report-summary__grid">
        <section className="panel"><div className="panel-header"><h2>Quality Distribution</h2></div><div className="panel-body report-breakdown">
          {['Uncommon', 'Rare', 'Epic', 'Legendary'].map((quality) => (
            <Metric key={quality} label={quality} value={summary.qualities[quality] ?? 0} />
          ))}
        </div></section>
        <section className="panel"><div className="panel-header"><h2>Feature Counts</h2></div><div className="panel-body report-breakdown">
          <Metric label="Sets" value={summary.features.sets ?? 0} />
          <Metric label="Effects" value={summary.features['spell-effects'] ?? 0} />
          <Metric label="Procs" value={summary.features['chance-on-hit'] ?? 0} />
          <Metric label="On Use" value={summary.features['on-use'] ?? 0} />
        </div></section>
      </div>
    </div>
  );
}
