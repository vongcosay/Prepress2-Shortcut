🛠️ Cách: Tạo một "Nút bấm thần kỳ" trên Desktop
Thay vì mỗi lần lại phải sửa Registry hay tạo shortcut mới, bạn hãy làm một cái script nhỏ này. Nó sẽ tự lấy bất kỳ đường dẫn nào bạn vừa Ctrl + C để mở thư mục.
\\F\DoNguyen\MAC\2. OFFSET 2009 (JKMLNOPQR)\Google \53.975 x 192.863 CHU Y HUONG SO GIAY\G#1023951\2-463458-XXX-00\G#1023951_2-463458-XXX-00_RK22_MS.pdf
Chuột phải ngoài Desktop -> New -> Shortcut.
Dán đoạn mã này vào ô địa chỉ:
powershell.exe -windowstyle hidden -command "$path = Get-Clipboard; if (Test-Path $path) { explorer.exe /select,$path } else { msg * 'Duong dan khong hop le!' }"
