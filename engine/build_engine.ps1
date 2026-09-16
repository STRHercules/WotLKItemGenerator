[CmdletBinding()]
param(
    [ValidateSet('Standalone', 'OneFile')]
    [string]$Mode = 'Standalone',
    [string]$OutputRoot = '',
    [switch]$Clean
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjectRoot = Split-Path -Parent $ScriptRoot
$EngineSource = Join-Path $ScriptRoot 'generate_pack.py'
$VersionSource = Join-Path $ScriptRoot 'version.py'

if (-not $OutputRoot) {
    $OutputRoot = Join-Path $ProjectRoot 'dist\engine'
}
$OutputRoot = [System.IO.Path]::GetFullPath($OutputRoot)

if (-not (Test-Path -LiteralPath $EngineSource -PathType Leaf)) {
    throw "Engine source not found: $EngineSource"
}
if (-not (Test-Path -LiteralPath $VersionSource -PathType Leaf)) {
    throw "Engine version module not found: $VersionSource"
}

$Python = Get-Command python -ErrorAction SilentlyContinue
if (-not $Python) {
    throw 'Python is required to build the engine sidecar. Install a supported CPython and retry.'
}

# Contract equivalent: python -m nuitka --version
& $Python.Source -m nuitka --version *> $null
if ($LASTEXITCODE -ne 0) {
    throw 'Nuitka is not installed. Run: python -m pip install -r engine\requirements-build.txt'
}

$VersionText = Get-Content -LiteralPath $VersionSource -Raw
$VersionMatch = [regex]::Match($VersionText, 'GENERATOR_VERSION\s*=\s*["''](?<version>\d+\.\d+\.\d+)["'']')
if (-not $VersionMatch.Success) {
    throw "Could not read GENERATOR_VERSION from $VersionSource"
}
$Version = $VersionMatch.Groups['version'].Value
$WindowsVersion = "$Version.0"

if ($Clean -and (Test-Path -LiteralPath $OutputRoot)) {
    Remove-Item -LiteralPath $OutputRoot -Recurse -Force
}
New-Item -ItemType Directory -Force -Path $OutputRoot | Out-Null

# Keep stdout/stderr usable for Tauri's JSON-lines pipe. `disable` behaves like
# pythonw.exe and may remove sys.stdout entirely; `attach` avoids a new console
# while still allowing inherited redirected handles from the parent process.
$CommonArgs = @(
    '-m', 'nuitka',
    '--assume-yes-for-downloads',
    "--output-dir=$OutputRoot",
    '--output-filename=wotlk-item-forge-engine.exe',
    '--windows-console-mode=attach',
    '--company-name=Modern Mods',
    '--product-name=WotLK Item Forge Engine',
    '--file-description=WotLK Item Forge generator sidecar',
    "--product-version=$WindowsVersion",
    "--file-version=$WindowsVersion",
    '--nofollow-import-to=rich',
    $EngineSource
)

# Keep the literal mode switches visible for build-contract validation:
# --mode=standalone
# --mode=onefile
$ModeArg = if ($Mode -eq 'OneFile') { '--mode=onefile' } else { '--mode=standalone' }
$NuitkaArgs = @($CommonArgs[0], $CommonArgs[1], $ModeArg) + $CommonArgs[2..($CommonArgs.Count - 1)]

Write-Host "Building WotLK Item Forge engine ($Mode) with Python: $($Python.Source)"
& $Python.Source @NuitkaArgs
if ($LASTEXITCODE -ne 0) {
    throw "Nuitka build failed with exit code $LASTEXITCODE"
}

$Candidates = Get-ChildItem -LiteralPath $OutputRoot -Recurse -File -Filter 'wotlk-item-forge-engine.exe'
if (-not $Candidates) {
    throw "Nuitka completed but wotlk-item-forge-engine.exe was not found under $OutputRoot"
}

if ($Mode -eq 'Standalone') {
    $Standalone = $Candidates | Where-Object { $_.DirectoryName -like '*.dist' } | Select-Object -First 1
    if ($Standalone) { $BuiltExecutable = $Standalone } else { $BuiltExecutable = $Candidates | Select-Object -First 1 }
} else {
    $BuiltExecutable = $Candidates | Sort-Object { $_.FullName.Length } | Select-Object -First 1
}

Write-Host "Engine build complete: $($BuiltExecutable.FullName)"
Write-Output $BuiltExecutable.FullName
