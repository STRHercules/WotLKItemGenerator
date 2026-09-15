import { describe, expect, it } from 'vitest';
import { parseEngineEvent } from '../engineEvents';

describe('parseEngineEvent', () => {
  it('accepts protocol v1 progress events', () => {
    const event = parseEngineEvent('{"protocol_version":1,"type":"progress","completed":1,"total":2}');
    expect(event.type).toBe('progress');
  });

  it('rejects incompatible protocols', () => {
    expect(() => parseEngineEvent('{"protocol_version":2,"type":"status","message":"x"}')).toThrow(/protocol/i);
  });

  it('rejects unknown event types', () => {
    expect(() => parseEngineEvent('{"protocol_version":1,"type":"surprise"}')).toThrow(/event type/i);
  });
});
