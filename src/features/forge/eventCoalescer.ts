import type { EngineEvent } from '../../types/engine';

export function shouldDispatchImmediately(event: EngineEvent): boolean {
  return event.type !== 'progress';
}

export type EngineEventDispatcher = (event: EngineEvent) => void;

export function createAnimationFrameCoalescer(
  dispatch: EngineEventDispatcher,
  requestFrame: (callback: FrameRequestCallback) => number = requestAnimationFrame,
  cancelFrame: (handle: number) => void = cancelAnimationFrame,
) {
  let latestProgress: EngineEvent | null = null;
  let frame: number | null = null;

  const flush = () => {
    frame = null;
    if (latestProgress) {
      const event = latestProgress;
      latestProgress = null;
      dispatch(event);
    }
  };

  return {
    push(event: EngineEvent) {
      if (shouldDispatchImmediately(event)) {
        dispatch(event);
        return;
      }
      latestProgress = event;
      if (frame === null) frame = requestFrame(flush);
    },
    dispose() {
      if (frame !== null) cancelFrame(frame);
      frame = null;
      latestProgress = null;
    },
  };
}
