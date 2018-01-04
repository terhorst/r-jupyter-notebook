$source = "https://repo.continuum.io/miniconda/Miniconda3-latest-Windows-x86_64.exe"
$destination = "Miniconda3-latest-Windows-x86_64.exe"
Invoke-WebRequest $source -OutFile $destination
$conda = "C:\temp\miniconda3"
$args = "/InstallationType=JustMe /RegisterPython=0 /S /D=$conda"
Start-Process -FilePath $destination -ArgumentList $args -Wait -Passthru
Start-Process $conda\Scripts\conda -ArgumentList "install -y constructor=1.5" -Wait -Passthru
cd c:\projects\r-jupyter-notebook
$ver = git describe --tags
Add-Content .\construct.yaml "version: $ver"
Start-Process $conda\Scripts\constructor -ArgumentList "." -Wait
