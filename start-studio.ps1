$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $root

if (-not (Test-Path "node_modules")) {
    & npm install
    if ($LASTEXITCODE -ne 0) {
        throw "npm install failed."
    }
}

& python -c "import fastapi, uvicorn, numpy, PIL" 2>$null
if ($LASTEXITCODE -ne 0) {
    & python -m pip install -r requirements.txt
    if ($LASTEXITCODE -ne 0) {
        throw "Python dependency installation failed."
    }
}

if (-not (Test-Path "dist\index.html")) {
    & npm run build
    if ($LASTEXITCODE -ne 0) {
        throw "Frontend build failed."
    }
}

& python "studio\server.py" --host 127.0.0.1 --port 8787 --open
