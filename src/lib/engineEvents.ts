import {
  ENGINE_EVENT_PROTOCOL_VERSION,
  type EngineEvent,
} from '../types/engine.ts';

const KNOWN_EVENT_TYPES = new Set<EngineEvent['type']>([
  'configured',
  'phase',
  'progress',
  'status',
  'discovery',
  'source_check',
  'validation',
  'complete',
  'error',
]);

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === 'object' && value !== null && !Array.isArray(value);
}

function requireString(value: Record<string, unknown>, field: string): void {
  if (typeof value[field] !== 'string') {
    throw new Error(`Engine event field "${field}" must be a string`);
  }
}

function requireNumber(value: Record<string, unknown>, field: string): void {
  if (typeof value[field] !== 'number' || !Number.isFinite(value[field])) {
    throw new Error(`Engine event field "${field}" must be a finite number`);
  }
}

function requireBoolean(value: Record<string, unknown>, field: string): void {
  if (typeof value[field] !== 'boolean') {
    throw new Error(`Engine event field "${field}" must be a boolean`);
  }
}

function validateKnownEvent(value: Record<string, unknown>): void {
  switch (value.type) {
    case 'configured':
      requireString(value, 'seed');
      requireNumber(value, 'number');
      break;
    case 'phase':
      requireString(value, 'name');
      break;
    case 'progress':
      requireNumber(value, 'completed');
      requireNumber(value, 'total');
      break;
    case 'status':
      requireString(value, 'message');
      break;
    case 'discovery':
      requireString(value, 'kind');
      requireString(value, 'title');
      break;
    case 'source_check':
      requireString(value, 'label');
      requireString(value, 'path');
      requireBoolean(value, 'ok');
      break;
    case 'validation':
      requireNumber(value, 'error_count');
      requireNumber(value, 'name_repair_count');
      if (!Array.isArray(value.errors) || !Array.isArray(value.name_repairs)) {
        throw new Error('Validation event errors and name_repairs must be arrays');
      }
      break;
    case 'complete':
      requireNumber(value, 'elapsed');
      requireString(value, 'output_dir');
      if (!isRecord(value.report)) {
        throw new Error('Complete event report must be an object');
      }
      break;
    case 'error':
      requireString(value, 'message');
      break;
  }
}

export function parseEngineEvent(line: string): EngineEvent {
  let parsed: unknown;
  try {
    parsed = JSON.parse(line);
  } catch (error) {
    throw new Error(`Invalid engine event JSON: ${String(error)}`);
  }

  if (!isRecord(parsed)) {
    throw new Error('Engine event must be a JSON object');
  }

  if (parsed.protocol_version !== ENGINE_EVENT_PROTOCOL_VERSION) {
    throw new Error(
      `Unsupported engine event protocol ${String(parsed.protocol_version)}; expected ${ENGINE_EVENT_PROTOCOL_VERSION}`,
    );
  }

  if (typeof parsed.type !== 'string' || !KNOWN_EVENT_TYPES.has(parsed.type as EngineEvent['type'])) {
    throw new Error(`Unknown engine event type: ${String(parsed.type)}`);
  }

  validateKnownEvent(parsed);
  return parsed as EngineEvent;
}
