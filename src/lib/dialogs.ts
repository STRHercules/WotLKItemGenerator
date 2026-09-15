import { open } from '@tauri-apps/plugin-dialog';

export async function pickDirectory(title: string): Promise<string | null> {
  const selection = await open({ directory: true, multiple: false, title });
  return typeof selection === 'string' ? selection : null;
}

export async function pickFile(title: string, extensions?: string[]): Promise<string | null> {
  const selection = await open({
    directory: false,
    multiple: false,
    title,
    filters: extensions?.length ? [{ name: 'Supported files', extensions }] : undefined,
  });
  return typeof selection === 'string' ? selection : null;
}
