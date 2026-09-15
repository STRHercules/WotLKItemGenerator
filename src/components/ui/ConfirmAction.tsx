import { useState, type ReactNode } from 'react';

type Props = {
  buttonLabel: string;
  title: string;
  children: ReactNode;
  confirmLabel: string;
  busy?: boolean;
  danger?: boolean;
  onConfirm: () => Promise<void> | void;
};

export function ConfirmAction({ buttonLabel, title, children, confirmLabel, busy = false, danger = false, onConfirm }: Props) {
  const [open, setOpen] = useState(false);
  return <div className="confirm-action">
    <button type="button" className={`forge-button${danger ? ' danger' : ''}`} disabled={busy} onClick={() => setOpen(true)}>{buttonLabel}</button>
    {open ? <div className="confirm-action__popover" role="dialog" aria-label={title}><strong>{title}</strong><div>{children}</div><div className="confirm-action__buttons"><button type="button" className="forge-button ghost" disabled={busy} onClick={() => setOpen(false)}>Cancel</button><button type="button" className={`forge-button${danger ? ' danger' : ' primary'}`} disabled={busy} onClick={() => void Promise.resolve(onConfirm()).then(() => setOpen(false))}>{busy ? 'Working…' : confirmLabel}</button></div></div> : null}
  </div>;
}
