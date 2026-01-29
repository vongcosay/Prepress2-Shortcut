🛠️ Cách: Tạo một "Nút bấm thần kỳ" trên Desktop
Thay vì mỗi lần lại phải sửa Registry hay tạo shortcut mới, bạn hãy làm một cái script nhỏ này. Nó sẽ tự lấy bất kỳ đường dẫn nào bạn vừa Ctrl + C để mở thư mục.

Chuột phải ngoài Desktop -> New -> Shortcut.

Dán đoạn mã này vào ô địa chỉ:

powershell.exe -windowstyle hidden -command "$path = Get-Clipboard; if (Test-Path $path) { explorer.exe /select,$path } else { msg * 'Duong dan khong hop le!' }"
