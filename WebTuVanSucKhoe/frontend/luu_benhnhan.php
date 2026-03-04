<?php
$conn = new mysqli("localhost", "root", "", "tuvansuckhoe");
if ($conn->connect_error) {
    die("❌ Lỗi kết nối: " . $conn->connect_error);
}

// Nhận dữ liệu từ form
$hoten = $_POST['name'] ?? '';
$tuoi = $_POST['tuoi'] ?? '';
$gioitinh = $_POST['gioitinh'] ?? '';
$sdt = $_POST['sodienthoai'] ?? '';
$email = $_POST['email'] ?? '';
$thanhpho = $_POST['city'] ?? '';
$quanhuyen = $_POST['quanhuyen'] ?? '';
$phuongxa = $_POST['phuongxa'] ?? '';
$sonha = $_POST['sonha'] ?? '';
$trieuchung = $_POST['trieuchung'] ?? '';
$mucdo = $_POST['mucdo'] ?? '';
$thoigian = $_POST['thoigian'] ?? '';

// Xử lý hình ảnh nếu có
$hinhanh_name = '';
if (isset($_FILES['hinhanh']) && $_FILES['hinhanh']['error'] === 0) {
    $hinhanh_name = time() . '_' . basename($_FILES['hinhanh']['name']);
    $target = "uploads/" . $hinhanh_name;
    move_uploaded_file($_FILES['hinhanh']['tmp_name'], $target);
}

// ✅ Phân tích triệu chứng → tên khoa
$khoa_map = [
    "khó thở" => "TIM MACH",
    "ho" => "TAI MŨI HỌNG",
    "sổ mũi" => "TAI MŨI HỌNG",
    "mũi" => "TAI MŨI HỌNG",
    "viêm họng" => "TAI MŨI HỌNG",
    "gút" => "NỘI TIẾT",
    "nội tiết" => "NỘI TIẾT",
    "tim" => "TIM MACH",
    "tim mạch" => "TIM MACH",
    "nhi" => "NHI KHOA",
    "trẻ em" => "NHI KHOA",
    "phụ khoa" => "SẢN PHỤ KHOA",
    "sản" => "SẢN PHỤ KHOA",
    "da" => "DA LIỄU",
    "mụn" => "DA LIỄU",
    "ung thư" => "UNG BƯỚU",
    "ung bướu" => "UNG BƯỚU"
];

// Ưu tiên từ khóa dài trước
uksort($khoa_map, function($a, $b) {
    return strlen($b) - strlen($a);
});

// Tìm IDKHOA tương ứng
$idkhoa = null;
foreach ($khoa_map as $keyword => $tenkhoa) {
    if (stripos($trieuchung, $keyword) !== false) {
        $stmt = $conn->prepare("SELECT IDKHOA FROM khoa WHERE TENKHOA = ?");
        $stmt->bind_param("s", $tenkhoa);
        $stmt->execute();
        $res = $stmt->get_result();
        if ($row = $res->fetch_assoc()) {
            $idkhoa = $row['IDKHOA'];
        }
        $stmt->close();
        break;
    }
}

// Tìm ID bác sĩ ngẫu nhiên theo IDKHOA
$idbacsi = null;
if ($idkhoa !== null) {
    $stmt = $conn->prepare("SELECT ID FROM bacsi WHERE IDKHOA = ? ORDER BY RAND() LIMIT 1");
    $stmt->bind_param("i", $idkhoa);
    $stmt->execute();
    $res = $stmt->get_result();
    if ($row = $res->fetch_assoc()) {
        $idbacsi = $row['ID'];
    }
    $stmt->close();
}

// ✅ Thêm vào bảng benhnhan
$sql = "INSERT INTO benhnhan (hoten, tuoi, gioitinh, sodienthoai, email, thanhpho, quanhuyen, phuongxa, sonha, trieuchung, mucdonghiemtrong, thoigianxuathien, hinhanh, idkhoa, idbacsi) 
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

$stmt = $conn->prepare($sql);
$stmt->bind_param(
    "ssssssssssssssi",
    $hoten, $tuoi, $gioitinh, $sdt, $email,
    $thanhpho, $quanhuyen, $phuongxa, $sonha,
    $trieuchung, $mucdo, $thoigian, $hinhanh_name,
    $idkhoa, $idbacsi
);
$stmt->execute();

if ($stmt->affected_rows > 0) {
    echo "<script>alert('✅ Gửi thông tin thành công!'); window.location.href='webTuVan.html';</script>";
} else {
    echo "<script>alert('❌ Gửi thất bại!'); history.back();</script>";
}

$stmt->close();
$conn->close();
?>
