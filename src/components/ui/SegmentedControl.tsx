type SegmentedControlProps<T extends string> = {
  label: string;
  value: T;
  options: readonly T[];
  onChange: (value: T) => void;
};

export function SegmentedControl<T extends string>({ label, value, options, onChange }: SegmentedControlProps<T>) {
  return (
    <div className="segmented-field">
      <span className="field-label">{label}</span>
      <div className="segmented-control" role="group" aria-label={label}>
        {options.map((option) => (
          <button
            type="button"
            key={option}
            className={`segment${option === value ? ' segment-active' : ''}`}
            aria-pressed={option === value}
            onClick={() => onChange(option)}
          >{option}</button>
        ))}
      </div>
    </div>
  );
}
