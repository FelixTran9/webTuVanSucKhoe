<?php
require_once 'models/TuVanModel.php';

echo "✅ Kết nối DB thành công!<br>";

$model = new TuVanModel();
$tuVanList = $model->getAllTuVan();

echo "<h2>Danh sách tư vấn:</h2>";
if (empty($tuVanList)) {
    echo "Chưa có dữ liệu.";
} else {
    foreach ($tuVanList as $item) {
        echo "ID: " . $item['id'] . " - Họ tên: " . htmlspecialchars($item['HOTEN']) . "<br>";
        if ($item['anh']) {
            echo "Ảnh: <img src='" . htmlspecialchars($item['anh']) . "' style='max-width: 200px;'><br>";
        }
    }
}

// Process file example
$fileData = $model->readFromFile('uploads/sample.txt');
if ($fileData) {
    $processed = $model->processFileData($fileData);
    echo "<h2>Dữ liệu từ file:</h2><pre>" . implode("\n", $processed) . "</pre>";
} else {
    echo "<p>Không tìm thấy file uploads/sample.txt</p>";
}
?>