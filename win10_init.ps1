$file_path = "Tencent.wsb"
$relative_dir_identifier = ".\"

$file_content = Get-Content -Path $file_path -Encoding UTF8

$relative_dir = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
$relative_dir = $relative_dir + '\'
Write-Host ("gathered relative dir: " + $relative_dir)

$wsb_content = $file_content -replace [regex]::Escape($relative_dir_identifier), $relative_dir

Copy-Item "Tencent.wsb" "Tencent.wsb.bak" -Force
Write-Host "backup old wsb as Tencent.wsb.bak"

$wsb_content | Out-File -FilePath "Tencent.wsb" -Encoding UTF8
Write-Host "done"