import type {
  CompleteEvent,
  DiscoveryEvent,
  EngineEvent,
  ErrorEvent,
  ValidationEvent,
} from '../../types/engine';

export type RunLifecycle =
  | 'idle'
  | 'checking_sources'
  | 'configuring'
  | 'generating_skeletons'
  | 'finalizing_items'
  | 'validating'
  | 'writing_output'
  | 'indexing_library'
  | 'complete'
  | 'failed'
  | 'cancelled';


export type ForgeView = 'configure' | 'live' | 'completion';

export function runViewForLifecycle(lifecycle: RunLifecycle): ForgeView {
  if (lifecycle === 'idle') return 'configure';
  if (lifecycle === 'complete' || lifecycle === 'failed' || lifecycle === 'cancelled') return 'completion';
  return 'live';
}

export type ProgressSnapshot = {
  completed: number;
  total: number;
  current: string;
};

export type ClassProgress = {
  completed: number;
  total: number;
};

export type RunState = {
  lifecycle: RunLifecycle;
  phaseName: string;
  phaseDetail: string;
  progress: ProgressSnapshot;
  classProgress: Record<string, ClassProgress>;
  discoveries: DiscoveryEvent[];
  validation: ValidationEvent | null;
  completion: CompleteEvent | null;
  error: ErrorEvent | null;
  configuredSeed: string | null;
  outputDir: string | null;
};

export type LocalRunAction =
  | { type: 'cancelled' }
  | { type: 'indexing_started' }
  | { type: 'indexing_complete' }
  | { type: 'reset' };

export type RunAction = EngineEvent | LocalRunAction;

export function initialRunState(): RunState {
  return {
    lifecycle: 'idle',
    phaseName: '',
    phaseDetail: '',
    progress: { completed: 0, total: 0, current: '' },
    classProgress: {},
    discoveries: [],
    validation: null,
    completion: null,
    error: null,
    configuredSeed: null,
    outputDir: null,
  };
}

function lifecycleForPhase(name: string): RunLifecycle {
  const normalized = name.toLowerCase();
  if (normalized.includes('inspect') || normalized.includes('starting')) {
    return 'checking_sources';
  }
  if (normalized.includes('skeleton')) return 'generating_skeletons';
  if (normalized.includes('finaliz')) return 'finalizing_items';
  if (normalized.includes('validat')) return 'validating';
  if (normalized.includes('writing')) return 'writing_output';
  return 'configuring';
}

export function reduceRunState(state: RunState, action: RunAction): RunState {
  switch (action.type) {
    case 'reset':
      return initialRunState();
    case 'cancelled':
      return { ...state, lifecycle: 'cancelled' };
    case 'indexing_started':
      return { ...state, lifecycle: 'indexing_library' };
    case 'indexing_complete':
      return { ...state, lifecycle: 'complete' };
    case 'configured':
      return {
        ...state,
        lifecycle: 'configuring',
        configuredSeed: action.seed,
        outputDir: typeof action.output_dir === 'string' ? action.output_dir : state.outputDir,
        classProgress: Object.fromEntries(
          Object.entries(action.class_counts ?? {}).map(([name, total]) => [
            name,
            { completed: 0, total },
          ]),
        ),
      };
    case 'phase': {
      const lifecycle = lifecycleForPhase(action.name);
      const classProgress =
        lifecycle === 'generating_skeletons' || lifecycle === 'finalizing_items'
          ? Object.fromEntries(
              Object.entries(state.classProgress).map(([name, progress]) => [
                name,
                { completed: 0, total: progress.total },
              ]),
            )
          : state.classProgress;
      return {
        ...state,
        lifecycle,
        phaseName: action.name,
        phaseDetail: action.detail ?? '',
        progress: {
          completed: 0,
          total: action.total ?? 0,
          current: '',
        },
        classProgress,
      };
    }
    case 'progress': {
      const classProgress = { ...state.classProgress };
      if (action.class_name && action.class_total != null) {
        classProgress[action.class_name] = {
          completed: action.class_completed ?? 0,
          total: action.class_total,
        };
      }
      return {
        ...state,
        progress: {
          completed: action.completed,
          total: action.total,
          current: action.current ?? '',
        },
        classProgress,
      };
    }
    case 'status':
      return {
        ...state,
        progress: { ...state.progress, current: action.message },
      };
    case 'source_check':
      return state;
    case 'discovery':
      return {
        ...state,
        discoveries: [...state.discoveries, action].slice(-50),
      };
    case 'validation':
      return {
        ...state,
        validation: action,
        lifecycle: action.error_count > 0 ? 'failed' : state.lifecycle,
      };
    case 'complete':
      return {
        ...state,
        completion: action,
        outputDir: action.output_dir,
        lifecycle: 'complete',
      };
    case 'error':
      return { ...state, error: action, lifecycle: 'failed' };
    default:
      return state;
  }
}
