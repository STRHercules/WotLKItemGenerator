import { initialRunState, reduceRunState, runViewForLifecycle } from './runState.ts';

let state = initialRunState();
state = reduceRunState(state, {
  protocol_version: 1,
  type: 'phase',
  name: 'Generating item skeletons',
  detail: 'Levels and roles',
  total: 100,
});
if (state.lifecycle !== 'generating_skeletons') {
  throw new Error(`expected generating_skeletons, got ${state.lifecycle}`);
}

state = reduceRunState(state, {
  protocol_version: 1,
  type: 'progress',
  completed: 12,
  total: 100,
  current: 'Mage',
  class_name: 'Mage',
  class_completed: 7,
  class_total: 10,
});
if (state.progress.completed !== 12 || state.classProgress.Mage?.completed !== 7) {
  throw new Error('progress event did not update overall and class progress');
}

state = reduceRunState(
  {
    ...initialRunState(),
    classProgress: {
      Mage: { completed: 10, total: 10 },
      Druid: { completed: 10, total: 10 },
    },
  },
  {
    protocol_version: 1,
    type: 'phase',
    name: 'Finalizing generated items',
    total: 100,
  },
);
if (JSON.stringify(state.progress) !== JSON.stringify({ completed: 0, total: 100, current: '' })) {
  throw new Error('phase event did not reset overall progress');
}
if (JSON.stringify(state.classProgress) !== JSON.stringify({
  Mage: { completed: 0, total: 10 },
  Druid: { completed: 0, total: 10 },
})) {
  throw new Error('phase event did not reset completed class progress');
}

state = reduceRunState(state, {
  protocol_version: 1,
  type: 'error',
  stage: 'validation',
  message: 'bad pack',
});
if (state.lifecycle !== 'failed' || state.error?.message !== 'bad pack') {
  throw new Error('error event did not fail the run');
}

state = reduceRunState(initialRunState(), { type: 'cancelled' });
if (state.lifecycle !== 'cancelled') {
  throw new Error('cancel action did not cancel the run');
}

if (runViewForLifecycle('cancelled') !== 'completion') {
  throw new Error('cancelled runs must leave the live forge and show a terminal completion view');
}
