import { useEffect, useMemo, useState } from 'react';
import { ConfirmAction } from '../../components/ui/ConfirmAction';
import { pickDirectory } from '../../lib/dialogs';
import { deleteRunIndex, indexCompletedRun, listRuns, saveSettings } from '../../lib/tauriStorage';
import type { AppSettings } from '../../types/storage';
import { validateSettings } from './settingsModel';
import './settings.css';

type Props = { settings: AppSettings; onSettingsChange: (settings: AppSettings) => void };

export function SettingsPage({ settings, onSettingsChange }: Props) {
  const [draft, setDraft] = useState<AppSettings>(settings);
  const [status, setStatus] = useState<string>('');
  const [maintenance, setMaintenance] = useState<'clear'|'rebuild'|null>(null);
  const errors = useMemo(() => validateSettings(draft), [draft]);
  useEffect(() => setDraft(settings), [settings]);

  function patch<K extends keyof AppSettings>(key: K, value: AppSettings[K]) { setDraft((current) => ({ ...current, [key]: value })); setStatus(''); }
  async function save() {
    if (errors.length) { setStatus(errors[0]); return; }
    try { await saveSettings(draft); onSettingsChange(draft); setStatus('Saved'); }
    catch (cause) { setStatus(`Save failed: ${String(cause)}`); }
  }
  async function browse(key: 'defaultOutputDirectory'|'defaultDataDirectory'|'azerothcoreSourceRoot', title: string) {
    const selected = await pickDirectory(title); if (selected) patch(key, selected);
  }
  async function clearLibrary() {
    setMaintenance('clear'); setStatus('');
    try {
      const runs = await listRuns({ limit:500 });
      let deleted = 0;
      for (const run of runs) deleted += await deleteRunIndex(run.id);
      setStatus(`Cleared ${deleted.toLocaleString()} indexed items. Generated pack files were not changed.`);
    } catch (cause) { setStatus(`Clear failed: ${String(cause)}`); }
    finally { setMaintenance(null); }
  }
  async function rebuildLibrary() {
    setMaintenance('rebuild'); setStatus('');
    try {
      const runs = await listRuns({ status:'complete', limit:500 });
      let rebuilt = 0; let failures = 0;
      for (const run of runs) {
        if (!run.outputDir) continue;
        try { const result = await indexCompletedRun(run.id, run.outputDir); rebuilt += result.library.itemCount; }
        catch { failures += 1; }
      }
      setStatus(`Rebuilt ${rebuilt.toLocaleString()} indexed items across ${runs.length - failures} runs${failures ? `; ${failures} runs could not be rebuilt.` : '.'}`);
    } catch (cause) { setStatus(`Rebuild failed: ${String(cause)}`); }
    finally { setMaintenance(null); }
  }

  return <section className="forge-page settings-page">
    <header className="page-header-row"><div><p className="page-kicker">Workshop / Preferences</p><h1 className="page-heading">Settings</h1><p className="page-subtitle">Defaults live here. Generated packs stay separate from the app database so maintenance actions cannot silently destroy your output.</p></div><button className="forge-button primary" type="button" disabled={maintenance !== null || errors.length > 0} onClick={() => void save()}>Save Settings</button></header>
    {status ? <div className={status === 'Saved' || status.startsWith('Cleared') || status.startsWith('Rebuilt') ? 'alert alert--success' : 'alert alert--warning'}>{status}</div> : null}
    {errors.length ? <div className="alert alert--failure">{errors.map((error) => <span key={error}>{error}</span>)}</div> : null}
    <div className="settings-grid">
      <SettingsGroup title="General" eyebrow="FORGE STARTUP">
        <Field label="Default expansion"><select aria-label="Default expansion" className="field-select" value={draft.defaultExpansion} onChange={(event) => patch('defaultExpansion', event.target.value as AppSettings['defaultExpansion'])}><option>Classic</option><option>TBC</option><option>Wrath</option><option>All</option></select></Field>
        <Field label="Default item count"><input className="field-input" type="number" min={1} max={200000} value={draft.defaultItemCount} onChange={(event) => patch('defaultItemCount', Number(event.target.value))} /></Field>
        <Toggle label="Remember last Forge configuration" checked={draft.rememberLastForgeConfiguration} onChange={(value) => patch('rememberLastForgeConfiguration', value)} />
      </SettingsGroup>
      <SettingsGroup title="Generator" eyebrow="POWER DEFAULTS">
        <Field label="Default loot chance (%)"><input className="field-input" type="number" min={0} max={100} step="0.1" value={draft.defaultLootChance} onChange={(event) => patch('defaultLootChance', Number(event.target.value))} /></Field>
        <Field label="Default set rate"><input className="field-input" type="number" min={0} max={1} step="0.01" value={draft.defaultSetRate} onChange={(event) => patch('defaultSetRate', Number(event.target.value))} /></Field>
        <Field label="Set minimum level"><input className="field-input" type="number" min={1} max={80} value={draft.defaultSetMinLevel} onChange={(event) => patch('defaultSetMinLevel', Number(event.target.value))} /></Field>
        <Field label="Set size"><input className="field-input" type="number" min={2} max={10} value={draft.defaultSetSize} onChange={(event) => patch('defaultSetSize', Number(event.target.value))} /></Field>
      </SettingsGroup>
      <SettingsGroup title="Appearance" eyebrow="DESKTOP UI">
        <Field label="Density"><select className="field-select" value={draft.density} onChange={(event) => patch('density', event.target.value)}><option value="comfortable">Comfortable</option><option value="compact">Compact</option></select></Field>
        <Toggle label="Animations" checked={draft.animations} onChange={(value) => patch('animations', value)} />
        <Toggle label="Show discovery feed" checked={draft.showDiscoveryFeed} onChange={(value) => patch('showDiscoveryFeed', value)} />
        <Toggle label="Reduce motion" checked={draft.reduceMotion} onChange={(value) => patch('reduceMotion', value)} />
      </SettingsGroup>
      <SettingsGroup title="Paths" eyebrow="SOURCE + OUTPUT">
        <PathField label="Default output directory" value={draft.defaultOutputDirectory} onBrowse={() => void browse('defaultOutputDirectory','Choose default pack output directory')} />
        <PathField label="Default Data directory" value={draft.defaultDataDirectory} onBrowse={() => void browse('defaultDataDirectory','Choose generator Data directory')} />
        <PathField label="AzerothCore source root" value={draft.azerothcoreSourceRoot} onBrowse={() => void browse('azerothcoreSourceRoot','Choose AzerothCore source directory')} />
      </SettingsGroup>
      <SettingsGroup title="Storage" eyebrow="LOCAL INDEX">
        <div className="storage-action"><div><strong>Clear Library Index</strong><p>Remove searchable item rows from app.db. Generated pack files remain untouched.</p></div><ConfirmAction buttonLabel="Clear Library Index" title="Clear local Library index?" confirmLabel="Clear Index" danger busy={maintenance==='clear'} onConfirm={clearLibrary}><p>Only the local SQLite item index will be cleared. <strong>Generated pack files remain untouched.</strong> You can rebuild the index later.</p></ConfirmAction></div>
        <div className="storage-action"><div><strong>Rebuild Library Index</strong><p>Re-import items and reports from completed run output folders.</p></div><ConfirmAction buttonLabel="Rebuild Library Index" title="Rebuild local Library index?" confirmLabel="Rebuild" busy={maintenance==='rebuild'} onConfirm={rebuildLibrary}><p>The app will read existing completed pack outputs and rebuild searchable metadata. It will not modify pack contents.</p></ConfirmAction></div>
      </SettingsGroup>
      <SettingsGroup title="About" eyebrow="BUILD IDENTITY">
        <dl className="about-list"><div><dt>WotLK Item Forge</dt><dd>0.1.0</dd></div><div><dt>Generator engine</dt><dd>0.1.0</dd></div><div><dt>Event protocol</dt><dd>v1</dd></div><div><dt>Database schema</dt><dd>v1</dd></div></dl>
      </SettingsGroup>
    </div>
  </section>;
}

function SettingsGroup({ title, eyebrow, children }: { title:string; eyebrow:string; children:React.ReactNode }) { return <section className="panel settings-group"><div className="panel-header"><div><p className="micro-kicker">{eyebrow}</p><h2 className="panel-title">{title}</h2></div></div><div className="panel-body settings-fields">{children}</div></section>; }
function Field({ label, children }: { label:string; children:React.ReactNode }) { return <label className="settings-field"><span className="field-label">{label}</span>{children}</label>; }
function Toggle({ label, checked, onChange }: { label:string; checked:boolean; onChange:(value:boolean)=>void }) { return <label className="settings-toggle"><input type="checkbox" checked={checked} onChange={(event)=>onChange(event.target.checked)} /><span><strong>{label}</strong></span></label>; }
function PathField({ label, value, onBrowse }: { label:string; value:string; onBrowse:()=>void }) { return <div className="settings-field"><span className="field-label">{label}</span><div className="settings-path"><code>{value || 'Not configured'}</code><button className="forge-button" type="button" onClick={onBrowse}>Browse</button></div></div>; }
