import { useState } from 'react';

import { SegmentedControl } from '../../components/ui/SegmentedControl';
import { Toggle } from '../../components/ui/Toggle';
import { pickDirectory, pickFile } from '../../lib/dialogs';
import { canBeginForging, effectiveItemMaximum, forgeConfigErrors, FORGE_CLASSES, type ForgeConfig, type ReadinessState } from './forgeConfig';
import './forge.css';
import '../../components/ui/controls.css';

type ForgeConfigureProps = {
  config: ForgeConfig;
  readiness: ReadinessState;
  onChange: (config: ForgeConfig) => void;
  onBegin: () => void;
  onOpenSources: () => void;
};

function FieldNumber({ label, value, onChange, min, max, step = 1, help }: { label: string; value: number; onChange: (value: number) => void; min?: number; max?: number; step?: number; help?: string }) {
  return <label><span className="field-label">{label}</span><input className="field-input" type="number" value={value} min={min} max={max} step={step} onChange={(event) => onChange(Number(event.target.value))} />{help ? <p className="field-help">{help}</p> : null}</label>;
}

export function ForgeConfigure({ config, readiness, onChange, onBegin, onOpenSources }: ForgeConfigureProps) {
  const [advancedOpen, setAdvancedOpen] = useState(false);
  const errors = forgeConfigErrors(config);
  const maxItems = effectiveItemMaximum(config.classes);
  const update = <K extends keyof ForgeConfig>(key: K, value: ForgeConfig[K]) => onChange({ ...config, [key]: value });
  const toggleClass = (name: string) => update('classes', config.classes.includes(name) ? config.classes.filter((entry) => entry !== name) : [...config.classes, name]);
  const toggleDestination = (name: 'world' | 'dungeon' | 'raid') => update('loot_destinations', config.loot_destinations.includes(name) ? config.loot_destinations.filter((entry) => entry !== name) : [...config.loot_destinations, name]);
  const ready = canBeginForging(readiness, config);

  return (
    <div className="forge-config-layout">
      <section className="forge-config-main panel">
        <div className="panel-header"><div><p className="micro-kicker">GENERATION PROFILE</p><h2 className="panel-heading">Configure the forge</h2></div><span className="profile-badge">STANDARD PACK</span></div>
        <div className="panel-body forge-form">
          <SegmentedControl label="Expansion" value={config.expansion} options={['Classic', 'TBC', 'Wrath', 'All'] as const} onChange={(value) => update('expansion', value)} />

          <fieldset className="forge-fieldset"><legend>Classes</legend><div className="class-grid">
            {FORGE_CLASSES.map((name) => <label key={name} className={`class-chip${config.classes.includes(name) ? ' class-chip-selected' : ''}`}><input type="checkbox" aria-label={name} checked={config.classes.includes(name)} onChange={() => toggleClass(name)} /><span className="class-gem" aria-hidden="true" /><span>{name}</span></label>)}
          </div></fieldset>

          <div className="forge-grid-two">
            <FieldNumber label="Item count" value={config.number} min={1} max={maxItems} onChange={(value) => update('number', value)} help={`Maximum for ${config.classes.length || 0} selected class${config.classes.length === 1 ? '' : 'es'}: ${maxItems.toLocaleString()}`} />
            <label><span className="field-label">Seed</span><div className="input-with-tag"><input className="field-input" value={config.seed ?? ''} placeholder="Auto-generated" onChange={(event) => update('seed', event.target.value.trim() ? event.target.value : null)} /><span>AUTO</span></div><p className="field-help">Leave blank for a new deterministic seed.</p></label>
          </div>

          <div className="forge-grid-two">
            <SegmentedControl label="Magic effects" value={config.magic_effects} options={['All', 'On Hit', 'On Use', 'On Equip', 'None'] as const} onChange={(value) => update('magic_effects', value)} />
            <fieldset className="forge-fieldset compact"><legend>Loot placement</legend><div className="destination-row">{(['world','dungeon','raid'] as const).map((value) => <label key={value} className={`destination-chip${config.loot_destinations.includes(value) ? ' selected' : ''}`}><input type="checkbox" checked={config.loot_destinations.includes(value)} onChange={() => toggleDestination(value)} /><span>{value}</span></label>)}</div></fieldset>
          </div>

          <fieldset className="forge-fieldset"><legend>Features</legend><div className="feature-grid">
            <Toggle label="Item sets" checked={config.generate_sets} onChange={(value) => update('generate_sets', value)} />
            <Toggle label="Sockets" checked={config.generate_sockets} onChange={(value) => update('generate_sockets', value)} />
            <Toggle label="Socket bonuses" checked={config.generate_socket_bonuses} disabled={!config.generate_sockets} onChange={(value) => update('generate_socket_bonuses', value)} />
            <Toggle label="Legendaries" checked={config.generate_legendaries} onChange={(value) => update('generate_legendaries', value)} />
            <Toggle label="Disenchant data" checked={config.generate_disenchant} onChange={(value) => update('generate_disenchant', value)} />
          </div></fieldset>

          <label><span className="field-label">Output folder</span><div className="path-control"><input className="field-input" value={config.output_root} readOnly placeholder="Choose where generated packs are stored" /><button className="forge-button" type="button" onClick={async () => { const path = await pickDirectory('Choose generated-pack output folder'); if (path) update('output_root', path); }}>Browse</button></div></label>

          <button className="advanced-toggle" type="button" aria-expanded={advancedOpen} onClick={() => setAdvancedOpen((value) => !value)}><span>{advancedOpen ? '▾' : '▸'}</span> Advanced Options <small>rates, source overrides, manifests, strict scoping</small></button>

          {advancedOpen ? <div className="advanced-panel">
            <div className="advanced-grid">
              <FieldNumber label="Loot chance (%)" value={config.loot_chance} min={0} max={100} step={0.1} onChange={(v) => update('loot_chance', v)} />
              <FieldNumber label="Set rate" value={config.set_rate} min={0} max={1} step={0.01} onChange={(v) => update('set_rate', v)} />
              <FieldNumber label="Set minimum level" value={config.set_min_level} min={1} max={80} onChange={(v) => update('set_min_level', v)} />
              <FieldNumber label="Set size" value={config.set_size} min={2} max={10} onChange={(v) => update('set_size', v)} />
              <FieldNumber label="Spell effect multiplier" value={config.spell_effect_rate_multiplier} min={0} max={10} step={0.1} onChange={(v) => update('spell_effect_rate_multiplier', v)} />
              <FieldNumber label="Proc multiplier" value={config.proc_rate_multiplier} min={0} max={10} step={0.1} onChange={(v) => update('proc_rate_multiplier', v)} />
              <FieldNumber label="On-use multiplier" value={config.on_use_rate_multiplier} min={0} max={10} step={0.1} onChange={(v) => update('on_use_rate_multiplier', v)} />
              <FieldNumber label="Effect item-level window" value={config.effect_ilvl_window} min={0} max={284} onChange={(v) => update('effect_ilvl_window', v)} />
              <FieldNumber label="Socket bonus rate (%)" value={config.socket_bonus_rate} min={0} max={100} onChange={(v) => update('socket_bonus_rate', v)} />
              <FieldNumber label="Disenchant rate (%)" value={config.disenchant_rate} min={0} max={100} onChange={(v) => update('disenchant_rate', v)} />
              <FieldNumber label="Maximum special effects" value={config.max_special_effects} min={0} max={5} onChange={(v) => update('max_special_effects', v)} />
            </div>
            <div className="advanced-toggles"><Toggle label="Strict expansion scoping" checked={config.strict_expansion_scoping} onChange={(v) => update('strict_expansion_scoping', v)} /><Toggle label="Verbose reward audit" checked={config.verbose_audit} onChange={(v) => update('verbose_audit', v)} /></div>
            <div className="override-grid">
              <label><span className="field-label">Data directory override</span><div className="path-control"><input className="field-input" value={config.data_dir ?? ''} readOnly placeholder="Bundled Data/" /><button className="forge-button" type="button" onClick={async () => { const path=await pickDirectory('Choose generator data directory'); if(path) update('data_dir',path); }}>Browse</button></div></label>
              <label><span className="field-label">Content manifest</span><div className="path-control"><input className="field-input" value={config.content_manifest ?? ''} readOnly placeholder="Optional JSON manifest" /><button className="forge-button" type="button" onClick={async () => { const path=await pickFile('Choose content manifest',['json']); if(path) update('content_manifest',path); }}>Browse</button></div></label>
            </div>
          </div> : null}

          {errors.length ? <div className="form-errors" role="alert">{errors.slice(0,3).map((error) => <span key={error}>• {error}</span>)}</div> : null}
        </div>
      </section>

      <aside className="forge-readiness panel">
        <div className="readiness-art" aria-hidden="true"><div className="anvil-rune">⚒</div><div className="readiness-orbit" /></div>
        <p className="micro-kicker">FORGE READINESS</p><h2>{ready ? 'Ready to forge' : 'Setup required'}</h2>
        <div className="readiness-list">
          <ReadinessRow ok={readiness.requiredSourcesFound >= readiness.requiredSourcesTotal} label="Required sources" value={`${readiness.requiredSourcesFound}/${readiness.requiredSourcesTotal}`} />
          <ReadinessRow ok={readiness.azerothcoreReady} label="AzerothCore source" value={readiness.azerothcoreReady ? 'Detected' : 'Missing'} />
          <ReadinessRow ok={readiness.dbcReady} label="DBC baselines" value={readiness.dbcReady ? 'Validated' : 'Blocked'} />
          <ReadinessRow ok={readiness.outputWritable} label="Output location" value={readiness.outputWritable ? 'Writable' : 'Choose folder'} />
        </div>
        {!ready ? <button type="button" className="forge-button ghost readiness-link" onClick={onOpenSources}>View Sources →</button> : null}
        <div className="readiness-divider" />
        <div className="forge-summary"><span><small>ITEMS</small><strong>{config.number.toLocaleString()}</strong></span><span><small>CLASSES</small><strong>{config.classes.length}</strong></span><span><small>EXPANSION</small><strong>{config.expansion}</strong></span></div>
        <button className="forge-button primary begin-forge" type="button" disabled={!ready} onClick={onBegin}><span aria-hidden="true">⚒</span> BEGIN FORGING</button>
        <p className="begin-help">Generation validates the pack before any final SQL/DBC output is accepted.</p>
      </aside>
    </div>
  );
}

function ReadinessRow({ ok, label, value }: { ok: boolean; label: string; value: string }) {
  return <div className={`readiness-row ${ok ? 'ok' : 'bad'}`}><span className="readiness-mark">{ok ? '✓' : '!'}</span><span>{label}</span><strong>{value}</strong></div>;
}
