$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $root

if (-not (Test-Path "node_modules")) {
    & npm ci
    if ($LASTEXITCODE -ne 0) {
        throw "npm ci failed."
    }
}

& npm run build
if ($LASTEXITCODE -ne 0) {
    throw "Frontend build failed."
}

& python -m pip install -r requirements-build.txt
if ($LASTEXITCODE -ne 0) {
    throw "Build dependency installation failed."
}

& python -m PyInstaller `
    --noconfirm `
    --clean `
    --distpath release `
    --workpath build/pyinstaller `
    PetCanvasStudio.spec
if ($LASTEXITCODE -ne 0) {
    throw "Portable executable build failed."
}

$portableDir = Join-Path $root "release\PetCanvasStudio"
$portableZip = Join-Path $root "release\PetCanvasStudio-Windows.zip"
if (-not (Test-Path $portableDir)) {
    throw "Portable directory was not created: $portableDir"
}
if (Test-Path $portableZip) {
    Remove-Item -LiteralPath $portableZip -Force
}
Compress-Archive -Path $portableDir -DestinationPath $portableZip -CompressionLevel Optimal

Write-Host ""
Write-Host "Portable build: $portableZip"
