import { parseEngineEvent } from '../engineEvents.ts';

const progress = parseEngineEvent('{"protocol_version":1,"type":"progress","completed":1,"total":2}');
if (progress.type !== 'progress') {
  throw new Error(`expected progress event, got ${progress.type}`);
}

let rejected = false;
try {
  parseEngineEvent('{"protocol_version":2,"type":"status","message":"x"}');
} catch (error) {
  rejected = /protocol/i.test(String(error));
}
if (!rejected) {
  throw new Error('expected incompatible protocol to be rejected');
}

let unknownRejected = false;
try {
  parseEngineEvent('{"protocol_version":1,"type":"surprise"}');
} catch (error) {
  unknownRejected = /event type/i.test(String(error));
}
if (!unknownRejected) {
  throw new Error('expected unknown event type to be rejected');
}
