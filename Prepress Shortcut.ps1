powershell.exe -windowstyle hidden -command "$path = Get-Clipboard; if (Test-Path $path) { explorer.exe /select,$path } else { msg * 'Duong dan khong hop le!' }"


powershell.exe -windowstyle hidden -command "$path = (Get-Clipboard).Trim('\" '); if (Test-Path $path) { explorer.exe /select,$path } else { msg * 'Duong dan khong hop le!' }"


C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%USERPROFILE%\Desktop\Do Nguyen\Data\OpenFolderWithLog.ps1"
-------------------------------------------

OpenFolderWithLog.ps1

# 1. Khai báo thư viện để dùng MessageBox
Add-Type -AssemblyName System.Windows.Forms

# 2. Thiết lập đường dẫn và Username
$baseDir = "\\Fspdvn18\prepress2\MAC\14. Xuat film\2024\THANG 12\31-12\Do\Do Nguyen\Data"
$username = Split-Path $env:USERPROFILE -Leaf

# 3. Định nghĩa file log
$openLog = Join-Path $baseDir "Clipboard-OpenFolderLog.txt"
$missingLog = Join-Path $baseDir "Clipboard-MissingFolderLog.txt"

# 4. Lấy dữ liệu từ Clipboard và làm sạch
$rawPath = Get-Clipboard
if ($null -ne $rawPath) {
    $rawPath = $rawPath.Trim().Trim('"')
}

$time = Get-Date -Format "dd/MM/yyyy HH:mm:ss"

# 5. Xử lý logic tìm đường dẫn thư mục
if (Test-Path $rawPath -PathType Leaf) {
    $folderPath = Split-Path $rawPath -Parent
}
elseif (Test-Path $rawPath -PathType Container) {
    $folderPath = $rawPath
}
else {
    $folderPath = $rawPath
}

# 6. Kiểm tra sự tồn tại và thực thi
if (Test-Path $folderPath) {
    # Ghi log thành công
    $line = "$username|$time - Opened: $folderPath"
    Add-Content -Path $openLog -Value $line -Encoding UTF8
    
    # Mở thư mục
    Start-Process explorer.exe -ArgumentList "/e,`"$folderPath`""
}
else {
    # Ghi log thất bại
    $line = "$username|$time - Missing: $folderPath"
    Add-Content -Path $missingLog -Value $line -Encoding UTF8
    
    # Hiển thị thông báo lỗi lên màn hình
    [System.Windows.Forms.MessageBox]::Show("Không tìm thấy đường dẫn hoặc thư mục:`n$folderPath", "Lỗi", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
}

