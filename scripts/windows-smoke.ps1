[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$AppPath,
    [ValidateRange(2, 60)]
    [int]$WaitSeconds = 10,
    [switch]$KeepOpen
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$AppPath = [System.IO.Path]::GetFullPath($AppPath)
if (-not (Test-Path -LiteralPath $AppPath -PathType Leaf)) {
    throw "Installed app executable not found: $AppPath"
}

Write-Host '=== WotLK Item Forge packaged smoke ==='
Write-Host "App: $AppPath"

$Python = Get-Command python -ErrorAction SilentlyContinue
if ($Python) {
    Write-Host "Python detected at $($Python.Source). Python is not required by the installed app; this smoke does not invoke it."
} else {
    Write-Host 'Python is not installed/detected. Good: Python is not required by the installed app.'
}

$BeforeConhost = @(Get-Process -Name conhost -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Id)
$Started = Start-Process -FilePath $AppPath -PassThru
Write-Host "Started process $($Started.Id)."

$Deadline = (Get-Date).AddSeconds($WaitSeconds)
$ObservedWindow = $false
while ((Get-Date) -lt $Deadline) {
    Start-Sleep -Milliseconds 250
    $Current = Get-Process -Id $Started.Id -ErrorAction SilentlyContinue
    if (-not $Current) {
        throw 'Application exited before the smoke window elapsed.'
    }
    if ($Current.MainWindowHandle -ne 0) {
        $ObservedWindow = $true
        break
    }
}

$Current = Get-Process -Id $Started.Id -ErrorAction SilentlyContinue
if (-not $Current) {
    throw 'Application is no longer running.'
}
if ($ObservedWindow) {
    Write-Host "GUI window detected: $($Current.MainWindowTitle)"
} else {
    Write-Warning 'Process remained alive but a main window handle was not observed in the smoke interval. Verify the UI manually.'
}

$AfterConhost = @(Get-Process -Name conhost -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Id)
$NewConhost = @($AfterConhost | Where-Object { $_ -notin $BeforeConhost })
if ($NewConhost.Count -gt 0) {
    Write-Warning "New conhost process(es) appeared during launch: $($NewConhost -join ', '). Confirm they are unrelated or transient. The product is not designed to require a console window."
} else {
    Write-Host 'No new console-host process was observed during launch.'
}

Write-Host 'Basic packaged-process smoke passed.'
Write-Host 'The manual acceptance checklist in docs\release\windows.md is still required before a release-ready claim.'

if (-not $KeepOpen) {
    Stop-Process -Id $Started.Id -Force -ErrorAction SilentlyContinue
    Write-Host 'Stopped smoke-test app process.'
}
