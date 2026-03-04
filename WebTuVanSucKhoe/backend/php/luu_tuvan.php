<?php
require_once '../models/TuVanModel.php';

echo "<h2>Đang xử lý...</h2>";

// Validate input
$hoten = trim($_POST['hoten'] ?? '');
$email = trim($_POST['email'] ?? '');
$sdt = trim($_POST['sdt'] ?? '');
$mota = trim($_POST['mota'] ?? '');

if (empty($hoten) || empty($email) || empty($sdt) || empty($mota)) {
    die("⚠️ Thiếu dữ liệu đầu vào! Vui lòng kiểm tra lại.");
}

// Validate email
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    die("⚠️ Email không hợp lệ!");
}

echo "🔍 Dữ liệu nhận được: <br>";
echo "Họ tên: " . htmlspecialchars($hoten) . "<br>";
echo "Email: " . htmlspecialchars($email) . "<br>";
echo "SĐT: " . htmlspecialchars($sdt) . "<br>";
echo "Mô tả: " . htmlspecialchars($mota) . "<br>";

// Handle file upload
$anhPath = null;
if (isset($_FILES['anh']) && $_FILES['anh']['error'] == 0) {
    $allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];
    $maxSize = 5 * 1024 * 1024; // 5MB

    $fileType = $_FILES['anh']['type'];
    $fileSize = $_FILES['anh']['size'];
    $fileName = basename($_FILES['anh']['name']);
    $targetDir = '../uploads/';
    $targetFile = $targetDir . time() . '_' . $fileName; // Add timestamp to avoid conflicts

    if (!in_array($fileType, $allowedTypes)) {
        die("⚠️ Chỉ chấp nhận file ảnh (JPEG, PNG, GIF, WEBP)!");
    }

    if ($fileSize > $maxSize) {
        die("⚠️ File quá lớn! Tối đa 5MB.");
    }

    if (move_uploaded_file($_FILES['anh']['tmp_name'], $targetFile)) {
        $anhPath = $targetFile;
        echo "Ảnh đã upload: " . htmlspecialchars($anhPath) . "<br>";
    } else {
        die("⚠️ Lỗi upload ảnh!");
    }
}

// Save to DB
$model = new TuVanModel();
if ($model->saveTuVan($hoten, $email, $sdt, $mota, $anhPath)) {
    echo "✅ Lưu dữ liệu thành công!";
} else {
    echo "❌ Lỗi khi lưu dữ liệu!";
}
?>
