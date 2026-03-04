# Website Tư Vấn Sức Khỏe

Website đơn giản cho dịch vụ tư vấn sức khỏe, sử dụng frontend HTML/CSS/JS thuần và backend PHP thuần.

## Cấu trúc Dự án
- **frontend/**: Giao diện người dùng (HTML, CSS, JS).
- **backend/**: Xử lý server (PHP, DB).
  - config/: Cấu hình DB.
  - models/: Lớp tương tác DB và đọc file.
  - php/: Entry points.
  - sql/: Schema DB.
  - uploads/: File tải lên.

## Cài đặt và Chạy
1. Đặt thư mục vào WAMP/XAMPP (thư mục www/htdocs).
2. Import `backend/sql/tuvansuckhoe.sql` vào phpMyAdmin để tạo DB.
3. Cập nhật password DB trong `backend/config/db.php` nếu cần.
4. Truy cập frontend qua `http://localhost/WebTuVanSucKhoe/frontend/index.html`.
5. Test backend qua `http://localhost/WebTuVanSucKhoe/backend/test_db.php`.

## Tính năng
- Lưu dữ liệu tư vấn vào DB.
- Đọc và xử lý dữ liệu từ file (sample.txt).
- Frontend thuần HTML/CSS/JS, backend PHP thuần với PDO.

## Bảo mật
- Sử dụng prepared statements để tránh SQL injection.
- Validate input và sanitize output.
