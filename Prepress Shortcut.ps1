powershell.exe -windowstyle hidden -command "$path = Get-Clipboard; if (Test-Path $path) { explorer.exe /select,$path } else { msg * 'Duong dan khong hop le!' }"
