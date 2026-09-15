[CmdletBinding()]
param(
    [string]$SourceExecutable = '',
    [string]$TargetTriple = 'x86_64-pc-windows-msvc',
    [switch]$BuildOneFile
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjectRoot = Split-Path -Parent $ScriptRoot
$BinariesDir = Join-Path $ProjectRoot 'src-tauri\binaries'
# Default staged filename: wotlk-item-forge-engine-x86_64-pc-windows-msvc.exe
$TargetName = "wotlk-item-forge-engine-$TargetTriple.exe"
$TargetPath = Join-Path $BinariesDir $TargetName

if ($BuildOneFile) {
    $BuildScript = Join-Path $ProjectRoot 'engine\build_engine.ps1'
    $BuildOutput = & $BuildScript -Mode OneFile
    if ($LASTEXITCODE -ne 0) {
        throw 'OneFile engine build failed.'
    }
    $SourceExecutable = $BuildOutput | Select-Object -Last 1
}

if (-not $SourceExecutable) {
    $DistRoot = Join-Path $ProjectRoot 'dist\engine'
    $Candidates = @(Get-ChildItem -LiteralPath $DistRoot -Recurse -File -Filter 'wotlk-item-forge-engine.exe' -ErrorAction SilentlyContinue)
    if (-not $Candidates) {
        throw 'No built engine executable found. Run engine\build_engine.ps1 -Mode OneFile or pass -SourceExecutable.'
    }
    # Prefer a one-file executable outside a .dist directory because Tauri externalBin
    # stages one executable. Standalone builds remain useful for debugging/smoke tests.
    $SourceExecutable = ($Candidates | Where-Object { $_.DirectoryName -notlike '*.dist' } | Sort-Object { $_.FullName.Length } | Select-Object -First 1).FullName
    if (-not $SourceExecutable) {
        throw 'Only a Nuitka standalone .dist executable was found. Build -Mode OneFile before staging the Tauri sidecar.'
    }
}

$SourceExecutable = [System.IO.Path]::GetFullPath($SourceExecutable)
if (-not (Test-Path -LiteralPath $SourceExecutable -PathType Leaf)) {
    throw "Sidecar executable not found: $SourceExecutable"
}

New-Item -ItemType Directory -Force -Path $BinariesDir | Out-Null
Copy-Item -LiteralPath $SourceExecutable -Destination $TargetPath -Force
Write-Host "Staged Tauri sidecar: $TargetPath"
Write-Output $TargetPath
