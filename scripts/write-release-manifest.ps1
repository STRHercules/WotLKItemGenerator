[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$InstallerPath,
    [string]$OutputDirectory = ''
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjectRoot = Split-Path -Parent $ScriptRoot
$InstallerPath = [System.IO.Path]::GetFullPath($InstallerPath)
if (-not (Test-Path -LiteralPath $InstallerPath -PathType Leaf)) {
    throw "Installer not found: $InstallerPath"
}
if (-not $OutputDirectory) {
    $OutputDirectory = Join-Path $ProjectRoot 'dist\release-evidence'
}
$OutputDirectory = [System.IO.Path]::GetFullPath($OutputDirectory)
New-Item -ItemType Directory -Force -Path $OutputDirectory | Out-Null

function Read-RegexValue([string]$Path, [string]$Pattern, [string]$Label) {
    $text = Get-Content -LiteralPath $Path -Raw
    $match = [regex]::Match($text, $Pattern)
    if (-not $match.Success) {
        throw "Could not read $Label from $Path"
    }
    return $match.Groups['value'].Value
}

function Get-Sha256([string]$Path) {
    $fileHash = Get-Command Get-FileHash -ErrorAction SilentlyContinue
    if ($fileHash) {
        return (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant()
    }
    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    $stream = [System.IO.File]::OpenRead($Path)
    try {
        return ([System.BitConverter]::ToString($sha256.ComputeHash($stream))).Replace('-', '').ToLowerInvariant()
    } finally {
        $stream.Dispose()
        $sha256.Dispose()
    }
}


function Optional-FileEvidence([string]$RelativePath) {
    $fullPath = Join-Path $ProjectRoot $RelativePath
    if (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) {
        return $null
    }
    return [ordered]@{
        path = $RelativePath
        sha256 = Get-Sha256 $fullPath
        sizeBytes = (Get-Item -LiteralPath $fullPath).Length
    }
}

$Package = Get-Content -LiteralPath (Join-Path $ProjectRoot 'package.json') -Raw | ConvertFrom-Json
$VersionFile = Join-Path $ProjectRoot 'engine\version.py'
$DatabaseFile = Join-Path $ProjectRoot 'src-tauri\src\storage\db.rs'

$GeneratorVersion = Read-RegexValue $VersionFile 'GENERATOR_VERSION\s*=\s*["''](?<value>[^"'']+)["'']' 'GENERATOR_VERSION'
$EventProtocolVersion = [int](Read-RegexValue $VersionFile 'EVENT_PROTOCOL_VERSION\s*=\s*(?<value>\d+)' 'EVENT_PROTOCOL_VERSION')
$CacheSchemaVersion = [int](Read-RegexValue $VersionFile 'CACHE_SCHEMA_VERSION\s*=\s*(?<value>\d+)' 'CACHE_SCHEMA_VERSION')
$DatabaseSchemaVersion = [int](Read-RegexValue $DatabaseFile 'SCHEMA_VERSION:\s*i64\s*=\s*(?<value>\d+)' 'SCHEMA_VERSION')

$GitCommit = (git rev-parse HEAD).Trim()
if ($LASTEXITCODE -ne 0 -or -not $GitCommit) { throw 'git rev-parse HEAD failed.' }

$PythonVersion = (python --version 2>&1 | Out-String).Trim()
$NodeVersion = (node --version | Out-String).Trim()
$NpmVersion = (npm --version | Out-String).Trim()
$RustVersion = (rustc --version | Out-String).Trim()
$CargoVersion = (cargo --version | Out-String).Trim()

$Hash = Get-Sha256 $InstallerPath
$PackageLockEvidence = Optional-FileEvidence 'package-lock.json'
$CargoLockEvidence = Optional-FileEvidence 'src-tauri\Cargo.lock'
$Manifest = [ordered]@{
    createdAtUtc = [DateTime]::UtcNow.ToString('o')
    appVersion = [string]$Package.version
    generatorVersion = $GeneratorVersion
    eventProtocolVersion = $EventProtocolVersion
    cacheSchemaVersion = $CacheSchemaVersion
    databaseSchemaVersion = $DatabaseSchemaVersion
    targetTriple = 'x86_64-pc-windows-msvc'
    gitCommit = $GitCommit
    toolchain = [ordered]@{
        python = $PythonVersion
        node = $NodeVersion
        npm = $NpmVersion
        rustc = $RustVersion
        cargo = $CargoVersion
    }
    dependencyLocks = [ordered]@{
        npm = $PackageLockEvidence
        cargo = $CargoLockEvidence
    }
    installer = [ordered]@{
        path = $InstallerPath
        fileName = [System.IO.Path]::GetFileName($InstallerPath)
        sha256 = $Hash
        sizeBytes = (Get-Item -LiteralPath $InstallerPath).Length
    }
}

$ManifestPath = Join-Path $OutputDirectory 'release-manifest.json'
$Manifest | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $ManifestPath -Encoding UTF8
Write-Host "Release manifest: $ManifestPath"
Write-Output $ManifestPath
