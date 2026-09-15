import { invoke } from '@tauri-apps/api/core';
import { listen, type UnlistenFn } from '@tauri-apps/api/event';
import type {
  EngineEvent,
  EngineEventEnvelope,
  EngineStderrEnvelope,
  GenerationRequest,
  RunHandle,
} from '../types/engine';

export async function startGeneration(request: GenerationRequest, runId?: string): Promise<RunHandle> {
  return invoke<RunHandle>('start_generation', { request, runId: runId ?? null });
}

export async function cancelGeneration(runId: string): Promise<void> {
  await invoke('cancel_generation', { runId });
}

export async function generationActive(runId: string): Promise<boolean> {
  return invoke<boolean>('generation_active', { runId });
}

export async function subscribeEngineEvents(
  runId: string,
  onEvent: (event: EngineEvent) => void,
): Promise<UnlistenFn> {
  return listen<EngineEventEnvelope>('engine://event', ({ payload }) => {
    if (payload.run_id === runId) {
      onEvent(payload.event);
    }
  });
}

export async function subscribeEngineStderr(
  runId: string,
  onLine: (line: string) => void,
): Promise<UnlistenFn> {
  return listen<EngineStderrEnvelope>('engine://stderr', ({ payload }) => {
    if (payload.run_id === runId) {
      onLine(payload.line);
    }
  });
}
