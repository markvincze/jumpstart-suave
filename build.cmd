@echo off
if not exist .paket (
  @echo "Installing Paket"
  mkdir .paket
  curl https://github.com/fsprojects/Paket/releases/download/1.4.0/paket.bootstrapper.exe -L --insecure -o .paket\paket.bootstrapper.exe
)

.paket\paket.bootstrapper.exe
if errorlevel 1 (
  exit /b %errorlevel%
)

if not exist paket.lock (
  .paket\paket.exe install
) else (
  .paket\paket.exe restore
)

if errorlevel 1 (
  exit /b %errorlevel%
)

packages\FAKE\tools\FAKE.exe %* --fsiargs build.fsx