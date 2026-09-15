type ToggleProps = {
  label: string;
  checked: boolean;
  onChange: (checked: boolean) => void;
  description?: string;
  disabled?: boolean;
};

export function Toggle({ label, checked, onChange, description, disabled }: ToggleProps) {
  return (
    <label className={`toggle-row${disabled ? ' toggle-disabled' : ''}`}>
      <input type="checkbox" checked={checked} disabled={disabled} onChange={(event) => onChange(event.target.checked)} />
      <span className="toggle-track" aria-hidden="true"><span className="toggle-thumb" /></span>
      <span className="toggle-copy"><strong>{label}</strong>{description ? <small>{description}</small> : null}</span>
    </label>
  );
}
