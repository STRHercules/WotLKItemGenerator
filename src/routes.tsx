export type PageId = 'forge' | 'sources' | 'library' | 'reports' | 'history' | 'settings';

export type PageDefinition = {
  id: PageId;
  label: string;
  glyph: string;
  description: string;
};

export const PAGE_DEFINITIONS: readonly PageDefinition[] = [
  { id: 'forge', label: 'Forge', glyph: '⚒', description: 'Generate validated item packs' },
  { id: 'sources', label: 'Sources', glyph: '⌬', description: 'Inspect AzerothCore and data health' },
  { id: 'library', label: 'Library', glyph: '▦', description: 'Browse generated items' },
  { id: 'reports', label: 'Reports', glyph: '≣', description: 'Review validation and placement reports' },
  { id: 'history', label: 'History', glyph: '↺', description: 'Reopen and reproduce past runs' },
  { id: 'settings', label: 'Settings', glyph: '⚙', description: 'Configure defaults and storage' },
] as const;

export function pageDefinition(page: PageId): PageDefinition {
  return PAGE_DEFINITIONS.find((entry) => entry.id === page) ?? PAGE_DEFINITIONS[0];
}
