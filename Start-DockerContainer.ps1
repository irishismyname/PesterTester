$CurrentPath = (Resolve-Path .).Path

docker run -it `
  --user ContainerAdministrator `
  -v "${CurrentPath}:C:\source" `
  mcr.microsoft.com/powershell:nanoserver-20h2 `
  pwsh -Command "
  Install-Module Pester -Force -Scope AllUsers -SkipPublisherCheck; `
  Import-Module Pester -PassThru; `
  Set-Location ./source;
  Invoke-Pester;
  Write-Warning '-------- Running with the -CI flag will fail --------';
  Invoke-Pester -CI;
  "