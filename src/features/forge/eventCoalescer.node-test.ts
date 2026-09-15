import { shouldDispatchImmediately } from './eventCoalescer.ts';

if (shouldDispatchImmediately({ type: 'progress', protocol_version: 1, completed: 1, total: 10 })) throw new Error('progress should coalesce');
if (!shouldDispatchImmediately({ type: 'complete', protocol_version: 1, elapsed: 1, output_dir: 'x', report: {} })) throw new Error('complete must dispatch immediately');
if (!shouldDispatchImmediately({ type: 'error', protocol_version: 1, message: 'x' })) throw new Error('error must dispatch immediately');
