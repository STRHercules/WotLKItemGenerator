import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { resolve } from 'node:path';

const root = resolve(import.meta.dirname, '..');
const pkg = JSON.parse(readFileSync(resolve(root, 'package.json'), 'utf8'));
const config = JSON.parse(readFileSync(resolve(root, 'src-tauri/tauri.conf.json'), 'utf8'));
const capability = JSON.parse(readFileSync(resolve(root, 'src-tauri/capabilities/default.json'), 'utf8'));

assert.equal(config.productName, 'WotLK Item Forge');
assert.equal(config.identifier, 'com.modernmods.wotlkitemforge');
assert.equal(config.version, pkg.version, 'Tauri and package versions must match');
assert.deepEqual(config.bundle.externalBin, ['binaries/wotlk-item-forge-engine']);
assert.ok(config.bundle.targets.includes('nsis'));
assert.equal(config.bundle.windows.nsis.installMode, 'currentUser');

const permissions = capability.permissions ?? [];
for (const required of ['core:default', 'dialog:allow-open', 'dialog:allow-save', 'dialog:allow-message']) {
  assert.ok(permissions.includes(required), `missing capability permission: ${required}`);
}

// The renderer never launches processes directly. Sidecar spawning is kept behind the
// typed Rust command so a compromised webview cannot invoke arbitrary sidecar arguments.
const shellPermissions = permissions.filter((permission) =>
  typeof permission === 'string'
    ? permission.startsWith('shell:')
    : String(permission?.identifier ?? '').startsWith('shell:'),
);
assert.deepEqual(shellPermissions, [], 'frontend shell process permissions must remain disabled');

console.log('Tauri packaging config is valid.');
