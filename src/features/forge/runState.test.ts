import { describe, expect, it } from 'vitest';
import { initialRunState, reduceRunState } from './runState';

describe('reduceRunState', () => {
  it('maps generator phases into desktop lifecycle states', () => {
    const state = reduceRunState(initialRunState(), {
      protocol_version: 1,
      type: 'phase',
      name: 'Finalizing generated items',
      detail: 'Stats and effects',
      total: 100,
    });
    expect(state.lifecycle).toBe('finalizing_items');
  });

  it('updates only the reported class progress', () => {
    const initial = {
      ...initialRunState(),
      classProgress: {
        Mage: { completed: 0, total: 10 },
        Druid: { completed: 0, total: 10 },
      },
    };
    const next = reduceRunState(initial, {
      protocol_version: 1,
      type: 'progress',
      completed: 3,
      total: 20,
      current: 'Mage',
      class_name: 'Mage',
      class_completed: 3,
      class_total: 10,
    });
    expect(next.classProgress.Mage.completed).toBe(3);
    expect(next.classProgress.Druid.completed).toBe(0);
  });

  it('resets completed progress when a new phase starts', () => {
    const initial = {
      ...initialRunState(),
      classProgress: {
        Mage: { completed: 10, total: 10 },
        Druid: { completed: 10, total: 10 },
      },
    };
    const next = reduceRunState(initial, {
      protocol_version: 1,
      type: 'phase',
      name: 'Finalizing generated items',
      total: 100,
    });
    expect(next.progress).toEqual({ completed: 0, total: 100, current: '' });
    expect(next.classProgress).toEqual({
      Mage: { completed: 0, total: 10 },
      Druid: { completed: 0, total: 10 },
    });
  });

  it('caps discoveries at the newest fifty', () => {
    let state = initialRunState();
    for (let index = 0; index < 55; index += 1) {
      state = reduceRunState(state, {
        protocol_version: 1,
        type: 'discovery',
        kind: 'epic',
        title: `Item ${index}`,
        detail: '',
      });
    }
    expect(state.discoveries).toHaveLength(50);
    expect(state.discoveries[0].title).toBe('Item 5');
  });
});
