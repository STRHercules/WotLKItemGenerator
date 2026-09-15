[CmdletBinding()]
param(
    [switch]$SkipVerification,
    [switch]$SkipStandaloneSmoke
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjectRoot = Split-Path -Parent $ScriptRoot
Set-Location -LiteralPath $ProjectRoot

function Require-Command([string]$Name) {
    $command = Get-Command $Name -ErrorAction SilentlyContinue
    if (-not $command) {
        throw "Required command '$Name' was not found on PATH. See docs\release\windows.md."
    }
    return $command
}

function Assert-LastExitCode([string]$Label) {
    if ($LASTEXITCODE -ne 0) {
        throw "$Label failed with exit code $LASTEXITCODE"
    }
}

Require-Command python | Out-Null
Require-Command npm | Out-Null
Require-Command cargo | Out-Null

Write-Host '=== WotLK Item Forge Windows release build ==='
Write-Host "Repository: $ProjectRoot"

if (-not $SkipVerification) {
    Write-Host '--- Python engine tests ---'
    $env:PYTHONPATH = 'engine'
    python -m pytest engine/tests -v
    Assert-LastExitCode 'python -m pytest engine/tests'

    Write-Host '--- Frontend tests ---'
    npm test
    Assert-LastExitCode 'npm test'

    Write-Host '--- Frontend production build ---'
    npm run build
    Assert-LastExitCode 'npm run build'

    Write-Host '--- Tauri configuration contract ---'
    npm run check:tauri-config
    Assert-LastExitCode 'npm run check:tauri-config'

    Write-Host '--- Rust formatting ---'
    cargo fmt --manifest-path src-tauri/Cargo.toml -- --check
    Assert-LastExitCode 'cargo fmt'

    Write-Host '--- Rust clippy ---'
    cargo clippy --manifest-path src-tauri/Cargo.toml -- -D warnings
    Assert-LastExitCode 'cargo clippy'

    Write-Host '--- Rust tests ---'
    cargo test --manifest-path src-tauri/Cargo.toml
    Assert-LastExitCode 'cargo test'
}

if (-not $SkipStandaloneSmoke) {
    Write-Host '--- Nuitka standalone engine smoke ---'
    $StandaloneOutput = & .\engine\build_engine.ps1 -Mode Standalone -Clean
    $StandaloneExe = $StandaloneOutput | Select-Object -Last 1
    if (-not $StandaloneExe -or -not (Test-Path -LiteralPath $StandaloneExe -PathType Leaf)) {
        throw "Standalone engine build did not return a valid executable: $StandaloneExe"
    }
    & $StandaloneExe --help | Out-Null
    Assert-LastExitCode 'standalone engine --help'
}

Write-Host '--- Build and stage one-file sidecar ---'
$StagedOutput = & .\scripts\stage-sidecar.ps1 -BuildOneFile
$StagedExe = $StagedOutput | Select-Object -Last 1
if (-not $StagedExe -or -not (Test-Path -LiteralPath $StagedExe -PathType Leaf)) {
    throw "Sidecar staging did not return a valid executable: $StagedExe"
}

Write-Host '--- Build Tauri NSIS installer ---'
npm run tauri build
Assert-LastExitCode 'npm run tauri build'

$NsisDir = Join-Path $ProjectRoot 'src-tauri\target\release\bundle\nsis'
$Installer = Get-ChildItem -LiteralPath $NsisDir -File -Filter '*.exe' -ErrorAction SilentlyContinue |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First 1
if (-not $Installer) {
    throw "Tauri completed but no NSIS installer was found under $NsisDir"
}

Write-Host '--- Write release evidence ---'
$ManifestOutput = & .\scripts\write-release-manifest.ps1 -InstallerPath $Installer.FullName
$ManifestPath = $ManifestOutput | Select-Object -Last 1
if (-not $ManifestPath -or -not (Test-Path -LiteralPath $ManifestPath -PathType Leaf)) {
    throw "Release manifest was not created: $ManifestPath"
}

Write-Host "Windows release build complete: $($Installer.FullName)"
Write-Host "Release evidence: $ManifestPath"
Write-Output $Installer.FullName
