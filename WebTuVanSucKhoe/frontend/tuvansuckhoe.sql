-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 26, 2025 at 03:37 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tuvansuckhoe`
--
CREATE DATABASE IF NOT EXISTS `tuvansuckhoe` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `tuvansuckhoe`;

-- --------------------------------------------------------

--
-- Table structure for table `bacsi`
--

DROP TABLE IF EXISTS `bacsi`;
CREATE TABLE IF NOT EXISTS `bacsi` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENBACSI` varchar(100) DEFAULT NULL,
  `IDKHOA` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDKHOA` (`IDKHOA`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bacsi`
--

INSERT INTO `bacsi` (`ID`, `TENBACSI`, `IDKHOA`) VALUES
(1, 'Lê Hoàng Duy', 1),
(2, 'Lê Hoàng Duy', 1),
(3, 'Trần Thị Lan Anh', 2),
(4, 'Nguyễn Minh Tuấn', 5),
(5, 'Phan Quang Hoa', 6),
(6, 'Nguyễn Văn Anh', 2),
(7, 'Phạm Thị Bồng', 7),
(8, 'Lê Quang Cơ', 9),
(9, 'Nguyễn Thị Dâng', 10),
(10, 'Trần Văn E', 11),
(11, 'Phạm Văn Phùng', 12),
(12, 'Hoàng Thị Giang', 5),
(13, 'Đặng Văn Hiếu', 13);

-- --------------------------------------------------------

--
-- Table structure for table `benhnhan`
--

DROP TABLE IF EXISTS `benhnhan`;
CREATE TABLE IF NOT EXISTS `benhnhan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hoten` varchar(100) DEFAULT NULL,
  `tuoi` date DEFAULT NULL,
  `gioitinh` varchar(10) DEFAULT NULL,
  `sodienthoai` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `thanhpho` varchar(50) DEFAULT NULL,
  `quanhuyen` varchar(50) DEFAULT NULL,
  `phuongxa` varchar(50) DEFAULT NULL,
  `sonha` varchar(100) DEFAULT NULL,
  `trieuchung` text,
  `mucdonghiemtrong` varchar(20) DEFAULT NULL,
  `thoigianxuathien` time DEFAULT NULL,
  `hinhanh` varchar(255) DEFAULT NULL,
  `IDBACSI` int DEFAULT NULL,
  `IDKHOA` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `benhnhan`
--

INSERT INTO `benhnhan` (`id`, `hoten`, `tuoi`, `gioitinh`, `sodienthoai`, `email`, `thanhpho`, `quanhuyen`, `phuongxa`, `sonha`, `trieuchung`, `mucdonghiemtrong`, `thoigianxuathien`, `hinhanh`, `IDBACSI`, `IDKHOA`) VALUES
(1, 'Nguyễn Văn A', '2015-04-14', 'Nam', '0123456789', 'vananguyen@gmail.com', 'Hồ Chí Minh', 'Quận Bình Thạnh', 'Phường 8', '456 Gầm Cầu ', 'Ho', 'Nhẹ', '17:48:27', NULL, NULL, NULL),
(3, 'Trần Xuân B', '2022-02-14', 'nam', '0124654121', 'xuanb1234@gmail.com', 'Hồ Chí Minh', 'Quận Tân Phú', 'Phường 11', '546 Nguyễn Thị Thập', 'ho', 'nhẹ', '13:04:00', '', NULL, NULL),
(4, 'Hứa Văn H', '2001-01-30', 'nam', '012345679', 'hvanhua@gmail.com', 'Hồ Chí Minh', 'Quận 4', 'Phường 7', '546 Trần Xuân Soạn', 'ho, sổ mũi', 'trung bình', '20:50:00', '', 10, 11),
(5, 'Trần Xuân A', '2021-05-05', 'nữ', '0156789945', 'atran@gmail.com', 'Hồ Chí Minh', 'Quận 4', 'Phường 6', 'fhdsfhsd', 'Ho, sổ mũi ', 'trung bình', '03:40:00', '', 10, 11);

-- --------------------------------------------------------

--
-- Table structure for table `khoa`
--

DROP TABLE IF EXISTS `khoa`;
CREATE TABLE IF NOT EXISTS `khoa` (
  `IDKHOA` int NOT NULL AUTO_INCREMENT,
  `TENKHOA` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDKHOA`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `khoa`
--

INSERT INTO `khoa` (`IDKHOA`, `TENKHOA`) VALUES
(1, 'TIM MẠCH'),
(2, 'NỘI TIẾT'),
(3, 'TIM MẠCH'),
(4, 'NỘI TIẾT'),
(5, 'NHI KHOA'),
(6, 'NGOẠI KHOA'),
(7, 'SẢN PHỤ KHOA'),
(8, 'NỘI TIẾT'),
(9, 'THẦN KINH'),
(10, 'DA LIỄU'),
(11, 'TAI MŨI HỌNG'),
(12, 'CHẤN THƯƠNG CHỈNH HÌNH'),
(13, 'UNG BƯỚU');

-- --------------------------------------------------------

--
-- Table structure for table `lienhe`
--

DROP TABLE IF EXISTS `lienhe`;
CREATE TABLE IF NOT EXISTS `lienhe` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `HOTEN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `SDT` varchar(12) DEFAULT NULL,
  `NOIDUNGTN` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lienhe`
--

INSERT INTO `lienhe` (`ID`, `HOTEN`, `EMAIL`, `SDT`, `NOIDUNGTN`) VALUES
(1, 'Nguyễn Van A', 'vananguyen@gmail.com', '0135668555', 'Ahihi'),
(2, 'Trần Văn B ', 'vanbtran@gmail.com', '0737563625', 'Hihihihi'),
(3, 'Nguyễn Trung Hiếu', 'hieuidol1234@gmail.com', '01226656', 'nghiện game');

-- --------------------------------------------------------

--
-- Table structure for table `tuvan`
--

DROP TABLE IF EXISTS `tuvan`;
CREATE TABLE IF NOT EXISTS `tuvan` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `HOTEN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(200) DEFAULT NULL,
  `SDT` varchar(200) DEFAULT NULL,
  `MOTA` mediumtext,
  `IDBACSI` int DEFAULT NULL,
  `IDKHOA` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tuvan`
--

INSERT INTO `tuvan` (`ID`, `HOTEN`, `EMAIL`, `SDT`, `MOTA`, `IDBACSI`, `IDKHOA`) VALUES
(1, 'Nguyen Van A', 'vananguyen@gmail.com', '0123456789', 'ho, sốt, sổ mũi', NULL, NULL),
(2, 'dsa', 'dasd@fdsf.com', 'fdsf', 'sdfdsf', NULL, NULL),
(4, 'Nguyen Van B', 'vanbnguyen@gmail.com', '12357594057', 'Hihihihihihi', NULL, NULL),
(5, 'Nguyễn Trung Hiếu', 'hieuidol1234@gmail.com', '0374083403', 'Nghiện game, gút', NULL, NULL),
(8, 'Trần Thị D', 'dtran@gmail.com', '9543576843597', 'ho, sổ mũi', 10, NULL),
(9, 'Hứa Van E', 'vane.123@gmail.com', '0536345668458', 'ho, sổ mũi ', 10, 11);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
