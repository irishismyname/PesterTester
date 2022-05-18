docker run -it `
  --user ContainerAdministrator `
  -v "${pwd}:C:\source" `
  mcr.microsoft.com/powershell:nanoserver-20h2 `
  pwsh -Command "
  Install-Module Pester -Force -Scope AllUsers -SkipPublisherCheck; `
  Import-Module Pester -PassThru; `
  Set-Location ./source;
  Invoke-Pester;
  Write-Warning '-------- Running with the -OutputFile set will fail --------';
  `$Result = Invoke-Pester -OutputFile testResults.xml;
  $Result;
  "