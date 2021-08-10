$infile="infile"

$exe="KeePass-2.48.1-Setup.exe"

if (Test-Path $env:TEMP\$infile -PathType Leaf)
{
exit
}
else
{
Start-Process -FilePath $env:TEMP\$exe -ArgumentList "/VERYSILENT"
New-Item -Path $env:TEMP -Name $infile -ItemType "file"
}