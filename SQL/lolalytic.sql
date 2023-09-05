-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 05, 2023 lúc 05:48 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `lolalytic`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '81dc9bdb52d04dc20036dbd8313ed055', '2017-01-24 16:21:18', '31-08-2023 01:19:42 PM'),
(2, 'thinh2004', 'b8b4b727d6f5d1b61fff7be687f7970f', '2023-08-25 03:39:29', '25-08-2023 04:18:11 PM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `categoryName`, `creationDate`, `updationDate`) VALUES
(1, 'Mô hình', '2023-08-10 09:58:52', NULL),
(2, 'Áo', '2023-08-10 09:59:11', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `combo`
--

CREATE TABLE `combo` (
  `id` int(11) NOT NULL,
  `idhero` int(11) NOT NULL,
  `imgcombo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `combo`
--

INSERT INTO `combo` (`id`, `idhero`, `imgcombo`) VALUES
(1, 1, 'combo-aatrox.jpg'),
(2, 2, ''),
(3, 3, 'combo-arhi.jpg'),
(4, 4, 'combo-akali.jpg'),
(5, 5, 'combo-akshan.jpg'),
(6, 6, 'combo.jpg'),
(7, 7, 'combo-yi.jpg'),
(8, 8, 'combo-xayah.jpg'),
(9, 9, 'combo-darius.jpg'),
(10, 10, 'combo-zed.jpg'),
(11, 11, 'combo-thresh.jpg'),
(12, 12, 'combo-yasua.jpg'),
(13, 13, 'combo-aphelios.jpg'),
(14, 14, 'combo-ez.jpg'),
(15, 15, ''),
(16, 16, 'combo-ryze.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `idorder` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `orderDate` datetime NOT NULL DEFAULT current_timestamp(),
  `orderdelive` datetime DEFAULT NULL,
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`idorder`, `userId`, `orderDate`, `orderdelive`, `paymentMethod`, `orderStatus`) VALUES
(1, 5, '2023-09-01 21:31:17', '2023-09-05 21:51:00', 'COD', 2),
(10, 1, '2023-09-05 21:49:13', '2023-09-06 22:43:00', 'COD', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders_detail`
--

CREATE TABLE `orders_detail` (
  `idod` int(11) NOT NULL,
  `idorder` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders_detail`
--

INSERT INTO `orders_detail` (`idod`, `idorder`, `productId`, `quantity`, `price`) VALUES
(1, 1, 8, 1, 6500000),
(11, 10, 9, 1, 6000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productPrice` int(100) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productPrice`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(1, 1, 1, 'Mô hình Ashe-LMHT', 2500000, 'Mô hình LOL Ashe Unlocked Statue 26cm - Mô hình LMHT chính hãng<div>Kích thức:&nbsp;</div><div>Cao: 26.3cm</div><div>Rộng: 23cm</div><div>Chất liệu: nhựa ABS/PVC</div>', 'mo-hinh-ashe-unlocked-lmht-2-768x768.png', 'mo-hinh-ashe-unlocked-lmht-768x768.png', 'mo-hinh-ashe-unlocked-lmht-1-768x768.png', 'Còn Hàng', '2023-08-10 10:36:34', NULL),
(2, 1, 1, 'Mô hình Ahri-LMHT', 3000000, '<p class=\"text\" style=\"box-sizing: border-box; line-height: 20px; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Mô hình LOL Ahri Unlocked Statue 26cm - Mô hình LMHT chính hãng</p><div style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Kích thức:&nbsp;</div><div style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Cao: 26.3cm</div><div style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Rộng: 23cm</div><div style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Chất liệu: nhựa ABS/PVC</div>', 'mo-hinh-lol-ahri-new-dawn-statue-lmht-3-768x768.png', 'mo-hinh-lol-ahri-new-dawn-statue-lmht--768x768.png', 'mo-hinh-lol-ahri-new-dawn-statue-lmht-1-768x768.png', 'Còn Hàng', '2023-08-10 10:47:28', NULL),
(3, 2, 2, 'Áo LMHT Yone ', 250000, 'Chất liệu áo thun trơn in hình cao cấp , vải mềm mịn, mặc thoáng mát<div>Hình in to , rõ nét , giặt không hư hình nhờ công nghệ Printer mới nhất</div><div>Nhiều size lựa chọn từ 25kg đến 94kg phù hợp cho mọi lứa tuổi</div>', 'áo Yone2.jpg', 'áo Yone2.jpg', 'size.png', 'Còn Hàng', '2023-08-10 12:43:32', NULL),
(4, 2, 2, 'Áo Thun LMHT Lucian', 250000, 'Chất liệu áo thun trơn in hình cao cấp , vải mềm mịn, mặc thoáng mát<div>Hình in to , rõ nét , giặt không hư hình nhờ công nghệ Printer mới nhất</div><div>Nhiều size lựa chọn từ 25kg đến 94kg phù hợp cho mọi lứa tuổi</div>', 'Áo LMHT Lucian1 Đen, Áo Thun Liên Minh Huyền Thoại Shen Unisex Nam Nữ Tay Ngắn Forn Rộng Vải Mềm Mại Mặc Thoáng Mát.jpg', 'Áo LMHT Lucian Đen, Áo Thun Liên Minh Huyền Thoại Shen Unisex Nam Nữ Tay Ngắn Forn Rộng Vải Mềm Mại Mặc Thoáng Mát.jpg', 'size.png', 'Còn Hàng', '2023-08-10 12:45:31', NULL),
(5, 1, 1, 'Mô hình Evelynn-LMHT', 3500000, '<p class=\"text\" style=\"box-sizing: border-box; line-height: 20px; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Mô hình LOL Evelynn Unlocked Statue 26cm - Mô hình LMHT chính hãng</p><div style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Kích thức:&nbsp;</div><div style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Cao: 26.3cm</div><div style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Rộng: 23cm</div><div style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Chất liệu: nhựa ABS/PVC</div>', 'mo-hinh-evelynn-unlocked-lmht-4-768x768.png', 'mo-hinh-evelynn-unlocked-lmht-768x768.png', 'mo-hinh-evelynn-unlocked-lmht-1-768x768.png', 'Còn Hàng', '2023-08-10 12:58:42', NULL),
(7, 2, 2, 'Áo LMHT Yasua', 550000, 'Chất liệu áo thun trơn in hình cao cấp , vải mềm mịn, mặc thoáng mát<div>Hình in to , rõ nét , giặt không hư hình nhờ công nghệ Printer mới nhất</div><div>Nhiều size lựa chọn từ 25kg đến 94kg phù hợp cho mọi lứa tuổi</div>', 'Áo LMHT Yasua Đen, Áo Thun Liên Minh Huyền Thoại Yasua Unisex Nam Nữ Tay Ngắn Forn Rộng Vải Mềm Mại Mặc Thoáng Mát.jpg', 'Áo LMHT yasua1 Đen, Áo Thun Liên Minh Huyền Thoại Yasua Unisex Nam Nữ Tay Ngắn Forn Rộng Vải Mềm Mại Mặc Thoáng Mát.jpg', 'size.png', 'Còn Hàng', '2023-08-10 13:21:24', NULL),
(8, 1, 1, 'Mô hình Xayah-LMHT', 6500000, '<p class=\"text\" style=\"box-sizing: border-box; line-height: 20px; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Mô hình LOL Xayah Unlocked Statue 26cm - Mô hình LMHT chính hãng</p><div style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Kích thức:&nbsp;</div><div style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Cao: 26.3cm</div><div style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Rộng: 23cm</div><div style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Chất liệu: nhựa ABS/PVC</div>', 'mo-hinh-lol-xayah-hobbymax-lmht-3-768x768.png', 'mo-hinh-lol-xayah-hobbymax-lmht-1-768x768.png', 'mo-hinh-lol-xayah-hobbymax-lmht-768x768.png', 'Còn Hàng', '2023-08-10 13:23:42', NULL),
(9, 1, 1, 'Mô hình  Rakan-LMHT', 6000000, '<p class=\"text\" style=\"box-sizing: border-box; line-height: 20px; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Mô hình LOL Rakan Unlocked Statue 26cm - Mô hình LMHT chính hãng</p><div style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Kích thức:&nbsp;</div><div style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Cao: 26.3cm</div><div style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Rộng: 23cm</div><div style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: Roboto, sans-serif;\">Chất liệu: nhựa ABS/PVC</div>', 'mo-hinh-lol-rakan-hobbymax-lmht-4-768x768.png', 'mo-hinh-lol-xayah-hobbymax-lmht-1-768x768.png', 'mo-hinh-lol-rakan-hobbymax-lmht-768x768.png', 'Còn Hàng', '2023-08-10 13:25:22', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(1, 1, 'Mô hình', '2023-08-10 09:59:56', NULL),
(2, 2, 'Áo', '2023-08-10 10:30:18', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbban`
--

CREATE TABLE `tbban` (
  `idban` int(11) NOT NULL,
  `idhero` int(11) NOT NULL,
  `winrate` varchar(11) NOT NULL,
  `pickrate` varchar(11) NOT NULL,
  `banrate` varchar(11) NOT NULL,
  `matchs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbban`
--

INSERT INTO `tbban` (`idban`, `idhero`, `winrate`, `pickrate`, `banrate`, `matchs`) VALUES
(1, 1, '57%', '14%', '21%', 200),
(2, 3, '50.08%', '9.8%', '4.2%', 200),
(3, 4, '48.81%', '7.2%', '14.5%', 200),
(4, 5, '51.45%', '3%', '5.6%', 200),
(5, 6, '46.13%', '12%', '38.8%', 200),
(6, 7, '51.88%', '6.7%', '19.8%', 200),
(7, 8, '59%', '14%', '5.6%', 200),
(8, 9, '46.13%', '9.8%', '14.5%', 200),
(9, 10, '48.81%', '7.2%', '14.5%', 200),
(10, 11, '51.45%', '14%', '21%', 200),
(11, 12, '57%', '9.8%', '5.6%', 200),
(12, 13, '50.6%', '14%', '8%', 200),
(13, 14, '50.86%', '17%', '3.8%', 200),
(14, 15, '51.21$', '16%', '2.6%', 200),
(15, 16, '48%', '16%', '3.2', 200);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbcounter`
--

CREATE TABLE `tbcounter` (
  `id` int(11) NOT NULL,
  `idhero` int(11) NOT NULL,
  `counter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbcounter`
--

INSERT INTO `tbcounter` (`id`, `idhero`, `counter`) VALUES
(1, 1, 7),
(2, 1, 4),
(3, 1, 5),
(4, 1, 10),
(5, 3, 4),
(6, 3, 5),
(7, 3, 6),
(8, 3, 7),
(9, 4, 5),
(10, 4, 6),
(11, 4, 7),
(12, 4, 1),
(13, 5, 1),
(14, 5, 3),
(15, 5, 4),
(16, 5, 6),
(17, 6, 1),
(18, 6, 3),
(19, 6, 4),
(20, 6, 5),
(21, 7, 1),
(22, 7, 3),
(23, 7, 4),
(24, 7, 5),
(25, 8, 1),
(26, 8, 7),
(27, 8, 5),
(28, 8, 3),
(29, 9, 5),
(30, 9, 8),
(31, 9, 4),
(32, 9, 7),
(33, 10, 9),
(34, 10, 1),
(35, 10, 7),
(36, 10, 8),
(37, 11, 7),
(38, 11, 10),
(39, 11, 9),
(40, 11, 1),
(41, 12, 7),
(42, 12, 10),
(43, 12, 1),
(44, 12, 8),
(45, 13, 10),
(46, 13, 3),
(47, 13, 1),
(48, 13, 12),
(49, 14, 10),
(50, 14, 3),
(51, 14, 12),
(52, 14, 4),
(53, 15, 3),
(54, 15, 5),
(55, 15, 9),
(56, 15, 14),
(57, 16, 13),
(58, 16, 5),
(59, 16, 4),
(60, 16, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbdesckill`
--

CREATE TABLE `tbdesckill` (
  `iddesc` int(11) NOT NULL,
  `idhero` int(11) NOT NULL,
  `descint` varchar(1000) NOT NULL,
  `desc1` varchar(1000) NOT NULL,
  `desc2` varchar(1000) NOT NULL,
  `desc3` varchar(1000) NOT NULL,
  `desc4` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbdesckill`
--

INSERT INTO `tbdesckill` (`iddesc`, `idhero`, `descint`, `desc1`, `desc2`, `desc3`, `desc4`) VALUES
(1, 1, '<p>ĐƯỜNG KIẾM TUYỆT DIỆT</p>\r\n\r\n<p>Theo chu kỳ, đ&ograve;n đ&aacute;nh kế tiếp của Aatrox g&acirc;y th&ecirc;m s&aacute;t thương vật l&yacute; v&agrave; hồi m&aacute;u, dựa theo m&aacute;u tối đa của mục ti&ecirc;u.</p>\r\n', '<p>QUỶ KIẾM DARKIN</p>\r\n\r\n<p>Aatrox đập kiếm xuống đất, g&acirc;y s&aacute;t thương vật l&yacute;. C&oacute; thể ch&eacute;m ba lần, mỗi lần c&oacute; một diện t&aacute;c dụng kh&aacute;c nhau.</p>\r\n', '<p>XIỀNG X&Iacute;CH ĐỊA NGỤC</p>\r\n\r\n<p>Aatrox đập kiếm xuống đất, g&acirc;y s&aacute;t thương l&ecirc;n kẻ địch đầu ti&ecirc;n tr&uacute;ng phải. Tướng v&agrave; qu&aacute;i to phải nhanh rời v&ugrave;ng t&aacute;c động nếu kh&ocirc;ng muốn bị k&eacute;o về t&acirc;m v&agrave; chịu s&aacute;t thương lần nữa.</p>\r\n', '<p>BỘ PH&Aacute;P HẮC &Aacute;M</p>\r\n\r\n<p>Nội tại gi&uacute;p Aatrox hồi m&aacute;u khi g&acirc;y s&aacute;t thương l&ecirc;n tướng. K&iacute;ch hoạt gi&uacute;p Aatrox lướt theo hướng chỉ định.</p>\r\n', '<p>CHIẾN BINH TẬN THẾ</p>\r\n\r\n<p>Aatrox h&oacute;a quỷ, l&agrave;m hoảng sợ l&iacute;nh địch gần đ&oacute; v&agrave; được cộng SMCK, tăng hồi m&aacute;u cũng như Tốc độ Di chuyển. Nếu hắn tham gia hạ gục, hiệu ứng n&agrave;y được k&eacute;o d&agrave;i.</p>\r\n'),
(2, 3, '<p>H&Uacute;T HỒN</p>\r\n\r\n<p>Sau khi hạ 9 l&iacute;nh hoặc qu&aacute;i, Ahri sẽ được hồi m&aacute;u. Khi tham gia hạ gục tướng, Ahri sẽ được hồi m&aacute;u nhiều hơn.</p>\r\n', '<p>QUẢ CẦU MA THUẬT</p>\r\n\r\n<p>Ahri ph&oacute;ng ra v&agrave; thu lại quả cầu ma thuật của m&igrave;nh, g&acirc;y s&aacute;t thương ph&eacute;p tr&ecirc;n đường ph&oacute;ng đi v&agrave; s&aacute;t thương chuẩn tr&ecirc;n đường thu về.</p>\r\n', '<p>LỬA HỒ LY</p>\r\n\r\n<p>Ahri nhận th&ecirc;m Tốc độ Di chuyển v&agrave; triệu hồi ra ba ngọn lửa hồ ly, tự động kh&oacute;a mục ti&ecirc;u v&agrave; tấn c&ocirc;ng những kẻ địch ở gần.</p>\r\n', '<p>H&Ocirc;N GI&Oacute;</p>\r\n\r\n<p>Ahri h&ocirc;n gi&oacute;, g&acirc;y s&aacute;t thương v&agrave; m&ecirc; hoặc kẻ địch đầu ti&ecirc;n tr&uacute;ng chi&ecirc;u, ngay lập tức ngắt qu&atilde;ng kỹ năng di chuyển v&agrave; khiến ch&uacute;ng bước về ph&iacute;a c&ocirc; một c&aacute;ch v&ocirc; hại.</p>\r\n', '<p>PHI HỒ</p>\r\n\r\n<p>Ahri lướt đi v&agrave; bắn ra những tia s&eacute;t linh hồn, g&acirc;y s&aacute;t thương l&ecirc;n kẻ địch xung quanh. Phi Hồ c&oacute; thể được sử dụng tối đa ba lần trước khi hồi chi&ecirc;u, v&agrave; nhận được th&ecirc;m một lần t&aacute;i sử dụng với mỗi mạng tham gia hạ gục tướng địch.</p>\r\n'),
(3, 4, '<p>DẤU ẤN S&Aacute;T THỦ</p>\r\n\r\n<p>D&ugrave;ng kỹ năng s&aacute;t thương tướng địch tạo một v&ograve;ng năng lượng quanh ch&uacute;ng. Rời khỏi v&ograve;ng n&agrave;y cường h&oacute;a đ&ograve;n đ&aacute;nh kế tiếp của Akali, gi&uacute;p tăng tầm v&agrave; s&aacute;t thương.</p>\r\n', '<p>PHI ĐAO NĂM C&Aacute;NH</p>\r\n\r\n<p>Akali n&eacute;m ra năm phi đao, g&acirc;y s&aacute;t thương dựa tr&ecirc;n Sức mạnh C&ocirc;ng k&iacute;ch cộng th&ecirc;m v&agrave; Sức mạnh Ph&eacute;p thuật của c&ocirc;, đồng thời l&agrave;m chậm.</p>\r\n', '<p>BOM KH&Oacute;I</p>\r\n\r\n<p>Akali n&eacute;m bom kh&oacute;i v&agrave; nhận th&ecirc;m Tốc độ Di chuyển trong tho&aacute;ng chốc. Khi đứng trong kh&oacute;i m&ugrave;, Akali được v&ocirc; h&igrave;nh v&agrave; kh&ocirc;ng thể bị chỉ định. Tấn c&ocirc;ng hoặc d&ugrave;ng kỹ năng tho&aacute;ng l&agrave;m c&ocirc; lộ diện.</p>\r\n', '<p>PH&Oacute;NG PHI TI&Ecirc;U</p>\r\n\r\n<p>Akali nhảy l&ugrave;i lại v&agrave; ph&oacute;ng phi ti&ecirc;u ra trước mặt, g&acirc;y s&aacute;t thương ph&eacute;p. Kẻ địch đầu ti&ecirc;n hoặc kh&oacute;i m&ugrave; tr&uacute;ng phải bị đ&aacute;nh dấu. T&aacute;i k&iacute;ch hoạt để lướt tới chỗ mục ti&ecirc;u bị đ&aacute;nh dấu, g&acirc;y th&ecirc;m s&aacute;t thương.</p>\r\n', '<p>S&Aacute;T CHI&Ecirc;U HO&Agrave;N HẢO</p>\r\n\r\n<p>Akali lướt theo hướng chỉ định, g&acirc;y s&aacute;t thương l&ecirc;n kẻ địch tr&uacute;ng chi&ecirc;u. T&aacute;i k&iacute;ch hoạt: Akali lướt theo hướng chỉ định, kết liễu tất cả kẻ địch tr&uacute;ng chi&ecirc;u.</p>\r\n'),
(4, 5, '<p>KH&Ocirc;NG TỪ THỦ ĐOẠN</p>\r\n\r\n<p>Mỗi ba lần g&acirc;y s&aacute;t thương từ Đ&ograve;n Đ&aacute;nh hoặc Kỹ Năng g&acirc;y th&ecirc;m s&aacute;t thương v&agrave; cho một L&aacute; Chắn nếu mục ti&ecirc;u l&agrave; Tướng. Khi Akshan tấn c&ocirc;ng, g&atilde; sẽ bắn ra th&ecirc;m một Đ&ograve;n Đ&aacute;nh phụ g&acirc;y &iacute;t s&aacute;t thương hơn. Nếu hủy đ&ograve;n đ&aacute;nh phụ, g&atilde; được tăng Tốc Độ Di Chuyển.</p>\r\n', '<p>BOOMERANG H&Agrave;NG HIỆU</p>\r\n\r\n<p>Akshan n&eacute;m một boomerang g&acirc;y s&aacute;t thương tr&ecirc;n đường đi v&agrave; đường về, tăng tầm mỗi khi n&oacute; tr&uacute;ng phải một kẻ địch.</p>\r\n', '<p>LEN L&Eacute;N B&Aacute;O TH&Ugrave;</p>\r\n\r\n<p>Akshan tự động đ&aacute;nh dấu tướng địch l&agrave; Kẻ V&ocirc; Lại khi ch&uacute;ng hạ gục đồng minh của g&atilde;. Nếu Akshan hạ gục một Kẻ V&ocirc; Lại, g&atilde; hồi sinh cho đồng minh vừa bị giết, nhận th&ecirc;m v&agrave;ng, v&agrave; x&oacute;a tất cả đ&aacute;nh dấu c&ograve;n lại. Khi k&iacute;ch hoạt, Akshan tiến v&agrave;o trạng th&aacute;i ngụy trang, nhận th&ecirc;m Tốc Độ Di Chuyển v&agrave; Hồi Năng Lượng nếu tiến về ph&iacute;a Kẻ V&ocirc; Lại. Akshan mất đi khả năng ngụy trang sau một chốc l&aacute;t nếu kh&ocirc;ng ở trong bụi hoặc gần tường.</p>\r\n', '<p>ĐU KIỂU ANH H&Ugrave;NG</p>\r\n\r\n<p>Akshan bắn ra một d&acirc;y m&oacute;c c&agrave;i v&agrave;o một địa h&igrave;nh rồi đu v&ograve;ng quanh n&oacute;, li&ecirc;n tục xả đạn v&agrave;o kẻ địch gần nhất trong khi đu d&acirc;y. G&atilde; c&oacute; thể nhảy xuống sớm hoặc bị văng ra nếu va chạm với tướng hoặc địa h&igrave;nh.</p>\r\n', '<p>PH&Aacute;T BẮN NHỚ ĐỜI</p>\r\n\r\n<p>Akshan kh&oacute;a mục ti&ecirc;u v&agrave;o một tướng địch v&agrave; bắt đầu t&iacute;ch trữ đạn. Khi kết th&uacute;c vận sức, g&atilde; khai hỏa tất cả những ph&aacute;t đạn đ&atilde; t&iacute;ch trữ, g&acirc;y s&aacute;t thương dựa tr&ecirc;n m&aacute;u đ&atilde; mất l&ecirc;n tướng, l&iacute;nh, hoặc trụ đầu ti&ecirc;n m&agrave; n&oacute; tr&uacute;ng phải.</p>\r\n'),
(5, 6, '<p>M&Egrave;O ĐỒNG H&Agrave;NH</p>\r\n\r\n<p>Định kỳ, khi Yuumi đ&aacute;nh tr&uacute;ng tướng địch bằng đ&ograve;n đ&aacute;nh hoặc kỹ năng, c&ocirc; sẽ hồi m&aacute;u cho bản th&acirc;n v&agrave; đồng minh tiếp theo m&agrave; c&ocirc; Quấn Qu&yacute;t c&ugrave;ng. Khi đang Quấn Qu&yacute;t, Yuumi tạo một li&ecirc;n kết đặc biệt với đồng minh của c&ocirc;. Đồng minh với li&ecirc;n kết mạnh mẽ nhất sẽ cường h&oacute;a c&aacute;c kỹ năng của Yuumi khi c&ocirc; Quấn Qu&yacute;t c&ugrave;ng họ.</p>\r\n', '<p>MŨI T&Ecirc;N THƠ THẨN</p>\r\n\r\n<p>Yuumi bắn ra một mũi t&ecirc;n, g&acirc;y s&aacute;t thương v&agrave; l&agrave;m chậm mục ti&ecirc;u đầu ti&ecirc;n tr&uacute;ng phải. S&aacute;t thương v&agrave; l&agrave;m chậm sẽ được cường h&oacute;a nếu mất &iacute;t nhất 1,35 gi&acirc;y trước khi tr&uacute;ng v&agrave;o mục ti&ecirc;u. Khi đang b&aacute;m theo Bạn Th&acirc;n, hiệu ứng l&agrave;m chậm sẽ lu&ocirc;n được cường h&oacute;a v&agrave; cho đồng minh của c&ocirc; s&aacute;t thương Tr&ecirc;n Đ&ograve;n Đ&aacute;nh. Khi đang Quấn Qu&yacute;t, mũi t&ecirc;n c&oacute; thể được điều khiển bằng trỏ chuột trong tho&aacute;ng chốc.</p>\r\n', '<p>NHƯ H&Igrave;NH VỚI B&Oacute;NG!</p>\r\n\r\n<p>Yuumi lướt tới một đồng minh mục ti&ecirc;u, trở n&ecirc;n kh&ocirc;ng thể bị chỉ định bởi bất kỳ thứ g&igrave; ngo&agrave;i trụ. Khi đang b&aacute;m theo Bạn Th&acirc;n, c&ocirc; nhận th&ecirc;m Sức Mạnh Hồi M&aacute;u &amp; Tạo L&aacute; Chắn, đồng thời cho Đồng Đội của c&ocirc; hồi m&aacute;u Tr&ecirc;n Đ&ograve;n Đ&aacute;nh.</p>\r\n', '<p>TĂNG ĐỘNG</p>\r\n\r\n<p>Tạo l&aacute; chắn cho Yuumi v&agrave; tăng Tốc Độ Di Chuyển &amp; Tốc Độ Đ&aacute;nh. Nếu đang Quấn Qu&yacute;t, c&ocirc; chuyển hiệu ứng n&agrave;y cho đồng minh.</p>\r\n', '<p>CHƯƠNG CUỐI</p>\r\n\r\n<p>Yuumi bắn ra 5 đợt s&oacute;ng g&acirc;y s&aacute;t thương l&ecirc;n kẻ địch v&agrave; hồi m&aacute;u cho đồng minh. Yuumi c&oacute; thể di chuyển, Quấn Qu&yacute;t v&agrave; d&ugrave;ng Tăng Động khi đang vận. Khi đang b&aacute;m tr&ecirc;n Bạn Th&acirc;n, kỹ năng n&agrave;y đồng thời hướng theo con trỏ chuột của c&ocirc;.</p>\r\n'),
(6, 7, '<p>CH&Eacute;M Đ&Ocirc;I</p>\r\n\r\n<p>Sau v&agrave;i đ&ograve;n đ&aacute;nh li&ecirc;n tiếp, Master Yi ch&eacute;m hai lần li&ecirc;n tiếp.</p>\r\n', '<p>TUYỆT KỸ ALPHA</p>\r\n\r\n<p>Master Yi bay khắp chiến trường với tốc độ l&oacute;a mắt, g&acirc;y s&aacute;t thương vật l&yacute; l&ecirc;n nhiều kẻ địch, đồng thời trở n&ecirc;n kh&ocirc;ng thể bị chỉ định. Tuyệt Kỹ Alpha c&oacute; thể ch&iacute; mạng v&agrave; g&acirc;y th&ecirc;m s&aacute;t thương vật l&yacute; l&ecirc;n qu&aacute;i. Đ&aacute;nh thường giảm hồi chi&ecirc;u Tuyệt Kỹ Alpha</p>\r\n', '<p>THIỀN</p>\r\n\r\n<p>Master Yi nhập thiền, hồi M&aacute;u v&agrave; giảm s&aacute;t thương g&aacute;nh chịu trong chốc l&aacute;t. Ngo&agrave;i ra, Master Yi sẽ nhận cộng dồn Ch&eacute;m Đ&ocirc;i v&agrave; ngưng thời gian t&aacute;c dụng c&ograve;n lại của Kiếm Thuật Wuju v&agrave; Chiến Binh Sơn Cước với mỗi gi&acirc;y thiền định.</p>\r\n', '<p>V&Otilde; THUẬT WUJU</p>\r\n\r\n<p>Tăng th&ecirc;m s&aacute;t thương chuẩn cho đ&ograve;n đ&aacute;nh thường.</p>\r\n', '<p>CHIẾN BINH SƠN CƯỚC</p>\r\n\r\n<p>Master Yi di chuyển với sự linh hoạt v&ocirc; b&igrave;, tạm thời tăng Tốc độ Di chuyển v&agrave; Tốc độ Đ&aacute;nh cũng như được miễn nhiễm l&agrave;m chậm. Khi k&iacute;ch hoạt, hạ gục hoặc hỗ trợ k&eacute;o d&agrave;i thời gian t&aacute;c dụng của Chiến Binh Sơn Cước. Nội tại giảm hồi chi&ecirc;u của c&aacute;c kỹ năng kh&aacute;c khi hạ gục hoặc hỗ trợ.</p>\r\n'),
(7, 8, '<p>NH&Aacute;T CẮT GỌN G&Agrave;NG</p>\r\n\r\n<p>Sau khi d&ugrave;ng kỹ năng, c&aacute;c đ&ograve;n đ&aacute;nh kế tiếp của Xayah sẽ đ&aacute;nh tr&uacute;ng tất cả mục ti&ecirc;u tr&ecirc;n đường bay v&agrave; để lại L&ocirc;ng Vũ.</p>\r\n', '<p>PHI DAO Đ&Ocirc;I</p>\r\n\r\n<p>Xayah phi ra hai dao g&acirc;y s&aacute;t thương v&agrave; để lại L&ocirc;ng Vũ tr&ecirc;n đất.</p>\r\n', '<p>BỘ C&Aacute;NH CHẾT NGƯỜI</p>\r\n\r\n<p>Xayah tạo một cơn b&atilde;o phi dao tăng Tốc Độ Đ&aacute;nh v&agrave; s&aacute;t thương, đồng thời cho c&ocirc; Tốc Độ Di Chuyển nếu tấn c&ocirc;ng một tướng.</p>\r\n', '<p>TRIỆU HỒI L&Ocirc;NG VŨ</p>\r\n\r\n<p>Xayah triệu hồi tất cả L&ocirc;ng Vũ rơi tr&ecirc;n đất, g&acirc;y s&aacute;t thương v&agrave; tr&oacute;i ch&acirc;n kẻ địch&#39;</p>\r\n', '<p>B&Atilde;O TỐ NỔI DẬY</p>\r\n\r\n<p>Xayah nhảy l&ecirc;n kh&ocirc;ng, kh&ocirc;ng thể bị chỉ định v&agrave; quăng ra một loạt phi dao, để lại L&ocirc;ng Vũ tr&ecirc;n mặt đất.</p>\r\n'),
(8, 9, '<p>XUẤT HUYẾT</p>\r\n\r\n<p>Đ&ograve;n đ&aacute;nh v&agrave; kỹ năng s&aacute;t thương của Darius khiến kẻ địch xuất huyết, chịu s&aacute;t thương vật l&yacute; trong v&ograve;ng 5 gi&acirc;y, cộng dồn tối đa 5 lần. Khi tướng địch đạt tối đa cộng dồn, Darius h&oacute;a cuồng v&agrave; nhận lượng lớn Sức mạnh C&ocirc;ng k&iacute;ch.</p>\r\n', '<p>T&Agrave;N S&Aacute;T</p>\r\n\r\n<p>Darius m&uacute;a r&igrave;u xung quanh m&igrave;nh. Những kẻ địch tr&uacute;ng phải lưỡi r&igrave;u sẽ cho nhiều s&aacute;t thương hơn những kẻ bị tr&uacute;ng phải c&aacute;n r&igrave;u. Darius sẽ hồi m&aacute;u lại dựa v&agrave;o số tướng v&agrave; qu&aacute;i to bị lưỡi r&igrave;u ch&eacute;m phải.</p>\r\n', '<p>Đ&Aacute;NH THỌT</p>\r\n\r\n<p>Đ&ograve;n đ&aacute;nh tiếp theo của Darius nhắm v&agrave;o động mạch kẻ địch. Khi bị chảy m&aacute;u trầm trọng, Tốc Độ Di Chuyển của ch&uacute;ng sẽ chậm đi đ&aacute;ng kể.</p>\r\n', '<p>BẮT GIỮ</p>\r\n\r\n<p>Darius cường h&oacute;a chiếc r&igrave;u của m&igrave;nh, khiến s&aacute;t thương vật l&iacute; của hắn bỏ qua một số phần trăm Gi&aacute;p của mục ti&ecirc;u. Khi được k&iacute;ch hoạt, Darius sẽ qu&eacute;t kẻ địch bằng chiếc r&igrave;u của m&igrave;nh v&agrave; k&eacute;o ch&uacute;ng đến cạnh b&ecirc;n hắn.</p>\r\n', '<p>M&Aacute;Y CH&Eacute;M NOXUS</p>\r\n\r\n<p>Darius nhảy xổ v&agrave;o một tướng địch rồi tấn c&ocirc;ng bằng một c&uacute; bổ ch&iacute; tử, g&acirc;y s&aacute;t thương chuẩn. Lượng s&aacute;t thương sẽ gia tăng dựa tr&ecirc;n những điểm cộng dồn Xuất Huyết tr&ecirc;n mục ti&ecirc;u. Nếu M&aacute;y Ch&eacute;m Noxus l&agrave; đ&ograve;n kết liễu, kĩ năng n&agrave;y c&oacute; thể được t&aacute;i sử dụng trong một khoảng thời gian ngắn.</p>\r\n'),
(9, 10, '<p>KHINH THƯỜNG KẺ YẾU</p>\r\n\r\n<p>Đ&ograve;n đ&aacute;nh cơ bản của Zed g&acirc;y th&ecirc;m S&aacute;t thương Ph&eacute;p l&ecirc;n kẻ địch thấp m&aacute;u. Hiệu ứng n&agrave;y chỉ c&oacute; thể xảy ra một lần mỗi v&agrave;i gi&acirc;y l&ecirc;n tướng địch.</p>\r\n', '<p>PHI TI&Ecirc;U SẮC LẺM</p>\r\n\r\n<p>Zed c&ugrave;ng ph&acirc;n th&acirc;n b&oacute;ng tối xo&aacute;y kiếm về ph&iacute;a trước, g&acirc;y s&aacute;t thương l&ecirc;n c&aacute;c đơn vị bị kĩ năng bay xuy&ecirc;n qua.</p>\r\n', '<p>PH&Acirc;N TH&Acirc;N B&Oacute;NG TỐI</p>\r\n\r\n<p>Ph&acirc;n th&acirc;n của Zed lướt tới trước rồi y&ecirc;n vị trong 5 gi&acirc;y, n&oacute; thể bắt chước c&aacute;c kĩ năng hắn tung ra. Zed c&oacute; thể t&aacute;i k&iacute;ch hoạt kĩ năng để đổi chỗ với ph&acirc;n th&acirc;n.</p>\r\n', '<p>ĐƯỜNG KIẾM B&Oacute;NG TỐI</p>\r\n\r\n<p>Zed c&ugrave;ng Ph&acirc;n Th&acirc;n xo&aacute;y lưỡi kiếm, bắn ra một luồng s&oacute;ng năng lượng hắc &aacute;m. S&oacute;ng kiếm xo&aacute;y của ph&acirc;n th&acirc;n g&acirc;y hiệu ứng l&agrave;m chậm. Những nạn nh&acirc;n tr&uacute;ng phải Đường Kiếm B&oacute;ng Tối của ph&acirc;n th&acirc;n sẽ bị l&agrave;m chậm.</p>\r\n', '<p>DẤU ẤN TỬ THẦN</p>\r\n\r\n<p>Zed để lại một c&aacute;i b&oacute;ng sau lưng rồi lướt tới tướng mục ti&ecirc;u, khắc dấu ấn tử thần l&ecirc;n nạn nh&acirc;n. Sau 3 gi&acirc;y, dấu ấn sẽ k&iacute;ch nổ, g&acirc;y một số phần trăm s&aacute;t thương Zed đ&atilde; g&acirc;y ra khi dấu ấn c&ograve;n trong thời gian hiệu lực. Nếu tướng địch chết dưới t&aacute;c dụng của Dấu Ấn Tử Thần, Zed c&oacute; thể đ&aacute;nh cắp một phần Sức mạnh C&ocirc;ng k&iacute;ch của nạn nh&acirc;n.</p>\r\n'),
(10, 11, '<p>ĐỌA ĐẦY</p>\r\n\r\n<p>Thresh c&oacute; thể thu thập linh hồn của những kẻ địch bị hạ gục ở gần, vĩnh viễn tăng Gi&aacute;p v&agrave; Sức mạnh Ph&eacute;p Thuật.</p>\r\n', '<p>&Aacute;N TỬ</p>\r\n\r\n<p>Thresh tr&oacute;i một kẻ địch bằng x&iacute;ch rồi k&eacute;o nạn nh&acirc;n về ph&iacute;a hắn. K&iacute;ch hoạt kĩ năng n&agrave;y lần thứ hai để k&eacute;o Thresh về ph&iacute;a kẻ địch.</p>\r\n', '<p>CON ĐƯỜNG TĂM TỐI</p>\r\n\r\n<p>Thresh quẳng ra một c&aacute;i lồng đ&egrave;n gi&uacute;p bảo vệ Tướng đồng minh cạnh b&ecirc;n khỏi s&aacute;t thương. Đồng minh c&oacute; thể nhấp v&agrave;o lồng đ&egrave;n để lướt đến Thresh.</p>\r\n', '<p>LƯỠI H&Aacute;I XO&Aacute;Y</p>\r\n\r\n<p>C&aacute;c đ&ograve;n đ&aacute;nh của Thresh sẽ g&acirc;y th&ecirc;m s&aacute;t thương dựa tr&ecirc;n thời gian chờ giữa hai đ&ograve;n đ&aacute;nh k&eacute;o d&agrave;i bao l&acirc;u. Khi được k&iacute;ch hoạt, Thresh xo&aacute;y xiềng x&iacute;ch, hất văng tất cả kẻ địch tr&uacute;ng phải theo hướng của chi&ecirc;u.</p>\r\n', '<p>Đ&Oacute;NG HỘP</p>\r\n\r\n<p>Một bức tường ngục t&ugrave; l&agrave;m chậm v&agrave; s&aacute;t thương nếu bị ph&aacute; vỡ.</p>\r\n'),
(11, 12, '<p>ĐẠO CỦA L&Atilde;NG KH&Aacute;CH</p>\r\n\r\n<p>Tỉ lệ Ch&iacute; mạng của Yasuo được gia tăng. Ngo&agrave;i ra, Yasuo t&iacute;ch l&aacute; chắn mỗi khi di chuyển. L&aacute; chắn k&iacute;ch hoạt khi anh chịu s&aacute;t thương từ tướng hoặc qu&aacute;i.</p>\r\n', '<p>B&Atilde;O KIẾM</p>\r\n\r\n<p>Đ&acirc;m tới, s&aacute;t thương tất cả kẻ địch tr&ecirc;n đường thẳng. Khi tr&uacute;ng, cho một cộng dồn Tụ B&atilde;o trong v&agrave;i gi&acirc;y. Ở 2 cộng dồn, B&atilde;o Kiếm bắn ra lốc xo&aacute;y hất kẻ địch L&ecirc;n Kh&ocirc;ng. B&atilde;o Kiếm được coi như đ&ograve;n đ&aacute;nh thường.</p>\r\n', '<p>TƯỜNG GI&Oacute;</p>\r\n\r\n<p>Tạo tường gi&oacute; chặn c&aacute;c luồng đạn của kẻ địch trong 4 gi&acirc;y.</p>\r\n', '<p>QU&Eacute;T KIẾM</p>\r\n\r\n<p>Lướt xuy&ecirc;n qua mục ti&ecirc;u, g&acirc;y s&aacute;t thương ph&eacute;p. Mỗi lần lướt sẽ tăng s&aacute;t thương của lần lướt kế tiếp (c&oacute; giới hạn tối đa). Kh&ocirc;ng thể d&ugrave;ng l&ecirc;n c&ugrave;ng một kẻ địch trong v&agrave;i gi&acirc;y. Nếu d&ugrave;ng B&atilde;o Kiếm khi đang lướt, n&oacute; sẽ tấn c&ocirc;ng theo h&igrave;nh tr&ograve;n.</p>\r\n', '<p>TRĂNG TRỐI</p>\r\n\r\n<p>Dịch chuyển đến chỗ một tướng địch đang bị Hất L&ecirc;n Kh&ocirc;ng, g&acirc;y s&aacute;t thương vật l&yacute; v&agrave; giữ tất cả những kẻ địch c&ugrave;ng bị Hất L&ecirc;n Kh&ocirc;ng ở xung quanh tr&ecirc;n kh&ocirc;ng th&ecirc;m một ch&uacute;t. Hồi đầy thanh Nhịp nhưng x&oacute;a hết cộng dồn của Tụ B&atilde;o. Trong một khoảng thời gian sau đ&oacute;, những đ&ograve;n ch&iacute; mạng của Yasuo sẽ nhận một lượng lớn Xuy&ecirc;n Gi&aacute;p Cộng Th&ecirc;m.</p>\r\n'),
(12, 13, '<p>S&Aacute;T THỦ V&Agrave; TI&Ecirc;N TRI</p>\r\n\r\n<p>Aphelios sử dụng 5 Vũ Kh&iacute; Lunari do người chị Alune tạo ra. Anh c&oacute; thể d&ugrave;ng hai c&aacute;i một l&uacute;c: một ch&iacute;nh v&agrave; một phụ. Mỗi vũ kh&iacute; c&oacute; Đ&ograve;n đ&aacute;nh v&agrave; Kỹ năng ri&ecirc;ng. Đ&ograve;n đ&aacute;nh v&agrave; kỹ năng ti&ecirc;u hao đạn của vũ kh&iacute;. Khi hết đạn, Aphelios bỏ vũ kh&iacute; đ&oacute; v&agrave; Alune triệu hồi vũ kh&iacute; tiếp theo trong số 5 vũ kh&iacute;.</p>\r\n', '<p>KỸ NĂNG VŨ KH&Iacute;</p>\r\n\r\n<p>Aphelios c&oacute; 5 kỹ năng k&iacute;ch hoạt kh&aacute;c nhau, t&ugrave;y theo vũ kh&iacute; ch&iacute;nh: Calibrum (S&uacute;ng Thi&ecirc;n L&yacute;): Bắn tầm xa, đ&aacute;nh dấu mục ti&ecirc;u để c&oacute; thể bắn th&ecirc;m một ph&aacute;t từ bất kỳ đ&acirc;u tr&ecirc;n bản đồ. Severum (S&uacute;ng Huyết Tinh): Chạy thật nhanh v&agrave; tấn c&ocirc;ng c&aacute;c kẻ địch xung quanh bằng cả hai vũ kh&iacute;. Gravitum (Ph&aacute;o Trọng Trường): Tr&oacute;i ch&acirc;n tất cả kẻ địch bị l&agrave;m chậm bởi vũ kh&iacute; n&agrave;y. Infernum (S&uacute;ng Hỏa Ngục): Thổi lửa theo h&igrave;nh n&oacute;n v&agrave; tấn c&ocirc;ng kẻ địch bằng vũ kh&iacute; phụ. Crescendum (Thăng Hoa Lu&acirc;n): Đặt một th&aacute;p cạnh bắn bằng vũ kh&iacute; phụ.</p>\r\n', '<p>ĐỔI</p>\r\n\r\n<p>Aphelios đổi vũ kh&iacute; ch&iacute;nh sang vũ kh&iacute; phụ, c&ugrave;ng với đ&oacute; l&agrave; đ&ograve;n đ&aacute;nh v&agrave; kỹ năng k&iacute;ch hoạt.</p>\r\n', '<p>HỆ THỐNG CHUỖI VŨ KH&Iacute;</p>\r\n\r\n<p>Aphelios kh&ocirc;ng c&oacute; kỹ năng thứ ba. Chỗ n&agrave;y để hiển thị vũ kh&iacute; kế tiếp Alune sẽ triệu hồi cho anh. Thứ tự vũ kh&iacute; ban đầu l&agrave; cố định, nhưng c&oacute; thể thay đổi dần -- khi một vũ kh&iacute; hết đạn, n&oacute; được đặt xuống cuối danh s&aacute;ch</p>\r\n', '<p>&Aacute;NH TRĂNG DẪN LỐI</p>\r\n\r\n<p>Bắn một vi&ecirc;n nguyệt đạn ph&aacute;t nổ tr&ecirc;n tướng địch. Đặt hiệu ứng của vũ kh&iacute; ch&iacute;nh của Aphelios.</p>\r\n'),
(13, 14, '<p>PH&Aacute;P LỰC GIA TĂNG</p>\r\n\r\n<p>Ezreal nhận th&ecirc;m Tốc độ Đ&aacute;nh mỗi khi d&ugrave;ng kỹ năng tr&uacute;ng đ&iacute;ch, cộng dồn tối đa 5 lần.</p>\r\n', '<p>PH&Aacute;T BẮN THẦN B&Iacute;</p>\r\n\r\n<p>Ezreal bắn ra một luồng năng lượng gi&uacute;p l&agrave;m giảm hồi chi&ecirc;u nếu tr&uacute;ng kẻ địch.</p>\r\n', '<p>TINH HOA TU&Ocirc;N CHẢY</p>\r\n\r\n<p>Ezreal bắn ra một quả cầu d&iacute;nh v&agrave;o tướng hoặc mục ti&ecirc;u đầu ti&ecirc;n tr&uacute;ng phải. Nếu Ezreal tấn c&ocirc;ng kẻ địch c&oacute; quả cầu, n&oacute; sẽ ph&aacute;t nổ v&agrave; g&acirc;y s&aacute;t thương.</p>\r\n', '<p>DỊCH CHUYỂN CỔ HỌC</p>\r\n\r\n<p>Ezreal bay đến một chỗ gần đ&oacute; v&agrave; bắn ra một luồng năng lượng v&agrave;o kẻ địch gần nhất. Ưu ti&ecirc;n kẻ địch bị tr&uacute;ng Tinh Hoa Tu&ocirc;n Chảy.</p>\r\n', '<p>CUNG &Aacute;NH S&Aacute;NG</p>\r\n\r\n<p>Ezreal giương cung rồi bắn ra một l&agrave;n s&oacute;ng năng lượng g&acirc;y s&aacute;t thương cực lớn l&ecirc;n mọi kẻ địch n&oacute; đi qua (s&aacute;t thương giảm đi với l&iacute;nh v&agrave; qu&aacute;i thường).</p>\r\n'),
(14, 15, '<p>THUẬN GI&Oacute;</p>\r\n\r\n<p>Janna được tăng T&ocirc;c Độ Di Chuyển về ph&iacute;a tướng đồng minh, đồng thời đồng minh cũng được tăng lượng tốc độ tương đương khi di chuyển về ph&iacute;a c&ocirc;.</p>\r\n', '<p>GI&Oacute; LỐC</p>\r\n\r\n<p>Bằng c&aacute;ch tạo ra một v&ugrave;ng sức &eacute;p nhiệt độ, Janna c&oacute; thể gọi ra một cơn b&atilde;o ng&agrave;y c&agrave;ng lớn theo thời gian. C&ocirc; c&oacute; thể k&iacute;ch hoạt ph&eacute;p lần nữa để ph&oacute;ng th&iacute;ch cơn b&atilde;o. Khi ph&oacute;ng th&iacute;ch cơn b&atilde;o sẽ bay về hướng n&oacute; được tung ra, g&acirc;y s&aacute;t thương v&agrave; hất văng kẻ địch tr&uacute;ng phải.</p>\r\n', '<p>GI&Oacute; T&Acirc;Y</p>\r\n\r\n<p>Janna triệu hồi một tinh linh gi&oacute; c&oacute; nội tại tăng Tốc độ Di chuyển cho c&ocirc; v&agrave; gi&uacute;p c&ocirc; đi xuy&ecirc;n qua c&aacute;c đơn vị. C&ocirc; cũng c&oacute; thể k&iacute;ch hoạt kỹ năng n&agrave;y để g&acirc;y s&aacute;t thương v&agrave; l&agrave;m chậm tốc độ di chuyển của một kẻ địch. Hiệu ứng di chuyển nội tại mất đi khi kỹ năng n&agrave;y đang hồi lại.</p>\r\n', '<p>MẮT B&Atilde;O</p>\r\n\r\n<p>Janna tạo ra một luồng gi&oacute; bao phủ một tướng hoặc trụ đồng minh, gi&uacute;p chặn s&aacute;t thương nhận v&agrave;o v&agrave; tăng s&aacute;t thương vật l&iacute; cho mục ti&ecirc;u.</p>\r\n', '<p>GI&Oacute; M&Ugrave;A</p>\r\n\r\n<p>Janna bao phủ lấy bản th&acirc;n bằng một cơn b&atilde;o ma thuật, hất văng kẻ địch ra xa. Sau khi cơn b&atilde;o xuất hiện, những cơn gi&oacute; nhẹ sẽ hồi m&aacute;u cho đồng minh xung quanh khi kỹ năng c&ograve;n đang trong thời gian hiệu lực.</p>\r\n'),
(15, 16, '<p>BẬC THẦY CỔ THUẬT</p>\r\n\r\n<p>Kỹ năng của Ryze g&acirc;y th&ecirc;m s&aacute;t thương dựa tr&ecirc;n năng lượng cộng th&ecirc;m, v&agrave; năng lượng tối đa được tăng dựa tr&ecirc;n một phần sức mạnh ph&eacute;p thuật.</p>\r\n', '<p>QU&Aacute; TẢI</p>\r\n\r\n<p>Nội tại: C&aacute;c kỹ năng kh&aacute;c của Ryze đặt lại hồi chi&ecirc;u Qu&aacute; Tải v&agrave; t&iacute;ch 1 cổ ngữ. Nếu Ryze d&ugrave;ng Qu&aacute; Tải khi c&oacute; 2 cổ ngữ, &ocirc;ng được tăng T&ocirc;́c đ&ocirc;̣ Di chuy&ecirc;̉n trong tho&aacute;ng chốc. Khi sử dụng, Ryze n&eacute;m ra một luồng năng lượng g&acirc;y s&aacute;t thương cho kẻ địch đầu ti&ecirc;n tr&uacute;ng phải. Nếu mục ti&ecirc;u c&oacute; D&ograve;ng Chảy, Qu&aacute; Tải g&acirc;y th&ecirc;m s&aacute;t thương v&agrave; nảy sang c&aacute;c kẻ địch c&oacute; D&ograve;ng Chảy gần đ&oacute;.</p>\r\n', '<p>NGỤC CỔ NGỮ</p>\r\n\r\n<p>Ryze bẫy mục ti&ecirc;u trong ngục cổ ngữ, g&acirc;y s&aacute;t thương v&agrave; l&agrave;m chậm kẻ đ&oacute;. Nếu mục ti&ecirc;u c&oacute; D&ograve;ng Chảy, ch&uacute;ng bị tr&oacute;i.</p>\r\n', '<p>D&Ograve;NG CHẢY MA PH&Aacute;P</p>\r\n\r\n<p>Ryze bắn ra một quả cầu ma thuật, g&acirc;y s&aacute;t thương một kẻ địch v&agrave; đặt b&ugrave;a hại l&ecirc;n tất cả kẻ địch gần đ&oacute;. Kỹ năng của Ryze c&oacute; th&ecirc;m hiệu ứng l&ecirc;n kẻ địch d&iacute;nh b&ugrave;a hại.</p>\r\n\r\n<p>.</p>\r\n', '<p>V&Ograve;NG XO&Aacute;Y KH&Ocirc;NG GIAN</p>\r\n\r\n<p>Nội tại: Qu&aacute; Tải g&acirc;y th&ecirc;m s&aacute;t thương l&ecirc;n mục ti&ecirc;u c&oacute; D&ograve;ng Chảy. Khi sử dụng, Ryze tạo cổng dịch chuyển tới một địa điểm gần đ&oacute;. Sau v&agrave;i gi&acirc;y, đồng minh đứng tr&ecirc;n cổng dịch chuyển được đưa tới điểm chỉ định.</p>\r\n');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbhero`
--

CREATE TABLE `tbhero` (
  `idhero` int(11) NOT NULL,
  `namehero` varchar(50) NOT NULL,
  `idrole` int(11) NOT NULL,
  `idtier` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `intrinsic` varchar(255) NOT NULL,
  `skill1` varchar(255) NOT NULL,
  `skill2` varchar(255) NOT NULL,
  `skill3` varchar(255) NOT NULL,
  `skill4` varchar(255) NOT NULL,
  `upskill` varchar(255) NOT NULL,
  `hard` varchar(50) NOT NULL,
  `runes` varchar(255) NOT NULL,
  `items` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbhero`
--

INSERT INTO `tbhero` (`idhero`, `namehero`, `idrole`, `idtier`, `img`, `intrinsic`, `skill1`, `skill2`, `skill3`, `skill4`, `upskill`, `hard`, `runes`, `items`) VALUES
(1, 'Aatrox', 1, 1, 'aatrox.jpg', 'Aatrox_P.png', 'Aatrox_Q.png', 'Aatrox_W.png', 'AatroxE.png', 'AatroxR.png', 'Lever.jpg', 'Khó', 'Screenshot 2023-08-29 231534.jpg', 'Screenshot 2023-08-29 232937.jpg'),
(3, 'Ahri', 3, 2, 'ahri.jpg', 'Ahri_P.png', 'AhriQ.png', 'AhriW.png', 'AhriE.png', 'AhriR.png', 'thu-tu-nang-skill-ảhi.png', 'Trung bình', 'bang-ngoc-arhi.png', 'Item-ahri.png'),
(4, 'Akali', 3, 3, 'akali.jpg', 'Akali_P.png', 'AkaliQ.png', 'AkaliW.png', 'AkaliE.png', 'AkaliR.png', 'combo-akali.jpg', 'Trung bình', 'bang-ngoc.png', 'Item-akali.png'),
(5, 'Akshan', 4, 1, 'akshan_v2.jpg', 'akshan_p.png', 'AkshanQ.png', 'AkshanW.png', 'AkshanE.png', 'AkshanR.png', 'thu-tu-nang-skill-akshan.png', 'Dễ', 'bang-ngoc-akshan.png', 'Item-akshan.png'),
(6, 'Yummi', 5, 3, 'RiotX_ChampionList_yuumi.jpg', 'YuumiP.png', 'YuumiQ.png', 'YuumiW.png', 'YuumiE.png', 'YuumiR.png', 'thu-tu-nang-skill-yuumi.png', 'Dễ', 'bang-ngoc-yuumi.png', 'Item-yuumi.png'),
(7, 'Master  Yi', 2, 1, 'masteryi.jpg', 'p.png', 'q.png', 'w.png', 'e.png', 'r.png', 'thu-tu-nang-skill-yi.png', 'Trung bình', 'bang-ngoc-yi.png', 'Item-yi.png'),
(8, 'Xayah', 4, 1, 'RiotX_ChampionList_xayah.jpg', 'XayahPassive.png', 'XayahQ.png', 'XayahW.png', 'XayahE.png', 'XayahR.png', 'nang-chieu.jpg', 'Trung bình', 'bang-ngoc-xayah.jpg', 'build-xayah.jpg'),
(9, 'Darius', 1, 2, 'RiotX_ChampionList_darius.jpg', 'Darius_Icon_Hemorrhage.png', 'DariusCleave.png', 'DariusNoxianTacticsONH.png', 'DariusAxeGrabCone.png', 'DariusExecute.png', 'thu-tu-nang-skill-darius.png', 'Trung bình', 'bang-ngoc-dảius.png', 'Item-darius.png'),
(10, 'Zed', 2, 3, 'RiotX_ChampionList_zed.jpg', 'shadowninja_P.png', 'ZedQ.png', 'ZedW.png', 'ZedE.png', 'ZedR.png', 'bang-ngoc-zed.png', 'Khó', 'bang-ngoc-zed.png', 'Item-zed.png'),
(11, 'Thresh', 5, 3, 'RiotX_ChampionList_thresh.jpg', 'Thresh_P.png', 'ThreshQ.png', 'ThreshW.png', 'ThreshE.png', 'ThreshR.png', 'combo-thresh.jpg', 'Khó', 'bang-ngoc-thresh.png', 'Item-thresh.png'),
(12, 'Yasuo', 3, 1, 'RiotX_ChampionList_yasuo.jpg', 'Yasuo_Passive.png', 'YasuoQ1Wrapper.png', 'YasuoW.png', 'YasuoE.png', 'YasuoR.png', 'thu-tu-nang-skill.png', 'Khó', 'bang-ngoc.png', 'Item.png'),
(13, 'Aphelios', 4, 1, 'Aphelios_0.jpg', 'ApheliosP.png', 'ApheliosQ_ClientTooltipWrapper.png', 'ApheliosW.png', 'ApheliosE_ClientTooltipWrapper.png', 'ApheliosR.png', 'thu-tu-nang-skill-aphe.png', 'Khó', 'bang-ngoc-aphe.png', 'Item-aphe.png'),
(14, 'Ezreal', 4, 2, 'RiotX_ChampionList_ezreal.jpg', 'Ezreal_RisingSpellForce.png', 'EzrealQ.png', 'EzrealW.png', 'EzrealE.png', 'EzrealR.png', 'thu-tu-nang-skill-ez.png', 'Trung bình', 'bang-ngoc-ez.png', 'Item-ez.png'),
(15, 'Janna', 5, 2, 'RiotX_ChampionList_janna.jpg', 'Janna_Tailwind.png', 'HowlingGale.png', 'SowTheWind.png', 'EyeOfTheStorm.png', 'ReapTheWhirlwind.png', 'thu-tu-nang-skill-janna.png', 'Trung bình', 'bang-ngoc-janna.png', 'Item-janna.png'),
(16, 'Ryze', 3, 2, 'RiotX_ChampionList_ryze.jpg', 'Ryze_P.png', 'RyzeQWrapper.png', 'RyzeW.png', 'RyzeE.png', 'RyzeR.png', 'thu-tu-nang-skillryze.png', 'Trung bình', 'bang-ngockarma.png', 'Itemryze.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbpost`
--

CREATE TABLE `tbpost` (
  `idpost` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `anhmota` varchar(255) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `descpost` longtext NOT NULL,
  `time` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbpost`
--

INSERT INTO `tbpost` (`idpost`, `title`, `anhmota`, `slug`, `content`, `descpost`, `time`, `status`) VALUES
(2, 'Hướng Dẫn Cosplay Tinh Võ Sư: Vòng 1', 'soul-fighter-cosplay-part1.png', 'huong-dan-cosplay-tinh-vo-su-vong-1', '<p>Từ khắp nơi tr&ecirc;n thế giới, những người c&oacute; linh hồn thức tỉnh được mời tới để chiến đấu trong Giải Đấu Tinh V&otilde;! Đ&acirc;y l&agrave; tuyệt đỉnh của ng&agrave;nh giải tr&iacute;, một chương tr&igrave;nh truyền h&igrave;nh kh&ocirc;ng g&igrave; s&aacute;nh bằng! C&aacute;c v&otilde; sĩ sẽ đối đầu trong c&aacute;c trận chiến 1v1 tr&ecirc;n v&otilde; đ&agrave;i, cho đến khi chỉ c&ograve;n lại một người, v&agrave; người đ&oacute; sẽ được thỏa m&atilde;n khao kh&aacute;t s&acirc;u thẳm nhất của t&acirc;m hồn của m&igrave;nh!</p>\r\n\r\n<p>Linh hồn của c&aacute;c chiến binh n&agrave;y thức tỉnh qua những thử th&aacute;ch: tr&ecirc;n chiến trường hoặc trong ch&iacute;nh t&acirc;m tr&iacute; của họ. Mỗi người được ban những khả năng độc đ&aacute;o phản &aacute;nh bản chất b&ecirc;n trong v&agrave; sức mạnh để gợi l&ecirc;n tinh hoa tinh v&otilde; của họ. Một số sẽ trau dồi sức mạnh, t&ocirc;i luyện n&oacute; qua việc tập luyện, số kh&aacute;c sẽ chỉ sử dụng n&oacute; như một vũ kh&iacute; hủy diệt. V&agrave; họ ch&iacute;nh l&agrave;... NHỮNG TINH V&Otilde; SƯ!</p>\r\n\r\n<p>Đ&acirc;y l&agrave; phần 1 của t&agrave;i liệu hướng dẫn gồm 2 phần. Đừng qu&ecirc;n đ&oacute;n xem Hướng Dẫn Cosplay Tinh V&otilde; Sư: V&ograve;ng 2 nh&eacute;!</p>\r\n\r\n<h2 dir=\"ltr\">Trang Phục Tinh V&otilde; Sư</h2>\r\n\r\n<p>Vũ trụ Tinh V&otilde; Sư gồm một tập hợp c&aacute;c chiến binh đa dạng, mang những trang phục ri&ecirc;ng biệt để l&agrave;m nổi bật t&iacute;nh c&aacute;ch chiến đấu độc đ&aacute;o của m&igrave;nh. C&aacute;c chiến binh n&agrave;y đa số đều rất rắn rỏi v&agrave; thể hiện cơ bắp của m&igrave;nh ra b&ecirc;n ngo&agrave;i. Trang phục c&oacute; những đường cắt h&igrave;nh khối, sử dụng c&aacute;c loại vải trơn m&agrave;u, t&aacute;o bạo với điểm nhấn l&agrave; c&aacute;c đường viền đơn giản. C&aacute;c chi tiết kim loại xuất hiện xuy&ecirc;n suốt, nhưng chủ yếu l&agrave; tr&ecirc;n kh&oacute;a k&eacute;o hoặc thắt lưng da. Thắt lưng n&agrave;y thường mang một bộ kh&oacute;a qu&aacute; khổ độc đ&aacute;o, được trang tr&iacute; như một biểu tượng đại diện cho t&iacute;nh c&aacute;ch của v&otilde; sĩ đeo n&oacute;. Quan trọng nhất, mỗi chiến binh sẽ thể hiện linh hồn của họ dưới dạng một kỹ năng hoặc vũ kh&iacute; độc nhất. C&aacute;i gọi l&agrave; &quot;sức mạnh linh hồn&quot; n&agrave;y được mi&ecirc;u tả l&agrave; được tạo ra từ ngọn lửa đam m&ecirc;, ch&aacute;y bỏng của tinh thần con người, được tạo h&igrave;nh th&agrave;nh c&aacute;c h&igrave;nh th&aacute;i rực rỡ, nhiều m&agrave;u sắc thể hiện bản sắc s&acirc;u thẳm nhất của một tinh v&otilde; sư. Ngọn lửa linh hồn gồm một m&agrave;u cốt l&otilde;i tươi s&aacute;ng; một m&agrave;u th&acirc;n ch&iacute;nh thứ hai; v&agrave; cuối c&ugrave;ng, một m&agrave;u nhấn sắc tối nhảy m&uacute;a dọc theo bề mặt vũ kh&iacute; hoặc kỹ năng của họ.</p>\r\n\r\n<p>Bạn cảm thấy m&igrave;nh tr&ocirc;ng giống như một nh&acirc;n vật anime rực rỡ mới bước ra khỏi m&agrave;n h&igrave;nh từ một tựa game đối kh&aacute;ng? Vậy th&igrave; ch&uacute;c mừng, bạn đ&atilde; th&agrave;nh c&ocirc;ng rồi đ&oacute;!</p>\r\n\r\n<hr />\r\n<h2 style=\"text-align:center\">Samira</h2>\r\n\r\n<p><img alt=\"League of Legends Soul Fighter Cosplay Guide Samira\" src=\"https://www.riotgames.com/darkroom/1120/84e18b3192b8faaf815eb0abc3e65b87:ac1f2dd5fc250ec91edb1e3e84a3616a/leagueoflegends-soul-fighter-cosplay-guide-samira.png\" style=\"height:450px; width:100%\" /></p>\r\n\r\n<h3 dir=\"ltr\"><br />\r\nTH&Ocirc;NG TIN NH&Acirc;N VẬT&nbsp;&nbsp;</h3>\r\n\r\n<p dir=\"ltr\">Một thợ săn tiền thưởng nổi tiếng kh&ocirc;ng thể ngồi y&ecirc;n v&igrave; c&ocirc; ấy LU&Ocirc;N LU&Ocirc;N t&igrave;m kiếm sự kịch t&iacute;nh v&agrave; k&iacute;ch th&iacute;ch! Bậc thầy vũ kh&iacute; n&agrave;y c&oacute; thể sử dụng mọi c&ocirc;ng cụ nguy hiểm trong (v&agrave; ngo&agrave;i!) kho vũ kh&iacute; của m&igrave;nh để chiến đấu đầy PHONG C&Aacute;CH trong Giải Đấu Tinh V&otilde;! Chủ s&agrave;n &acirc;n cần của ch&uacute;ng ta tốt nhất l&agrave; n&ecirc;n lưu &yacute; trong l&uacute;c ngủ, bởi v&igrave; nghe n&oacute;i rằng nữ ho&agrave;ng đang n&agrave;y muốn thu thập vương miện cho m&igrave;nh! H&atilde;y nhường đường cho... SAMIRA!</p>\r\n\r\n<h3 dir=\"ltr\">TH&Ocirc;NG TIN TRANG PHỤC&nbsp;</h3>\r\n\r\n<p dir=\"ltr\">Samira mang một chiếc &aacute;o kho&aacute;c m&agrave;u đỏ nổi bật, với thiết kế nửa dưới kh&aacute; th&uacute; vị về mặt thị gi&aacute;c. Bạn c&oacute; thể thấy điều n&agrave;y trong phần đu&ocirc;i &aacute;o k&eacute;o d&agrave;i v&agrave; bao s&uacute;ng của c&ocirc; mang k&iacute;ch cỡ lớn với v&ocirc; số thắt lưng v&agrave; kh&oacute;a. Tổng quan thiết kế trang phục của Samira kh&ocirc;ng đối xứng, với đu&ocirc;i &aacute;o k&eacute;o d&agrave;i v&agrave; d&acirc;y đai kh&aacute;c nhau tr&ecirc;n mỗi ch&acirc;n. D&ugrave; &aacute;o kho&aacute;c của Samira Tuyệt Đại S&aacute;t Giới c&oacute; m&agrave;u đỏ tươi, trang phục của c&ocirc; cũng vẫn pha trộn th&ecirc;m một số m&agrave;u sắc kh&aacute;c từ tr&ecirc;n xuống dưới. Đen v&agrave; trắng l&agrave; m&agrave;u chủ đạo b&ecirc;n ngo&agrave;i &aacute;o kho&aacute;c của c&ocirc;, nhưng ngo&agrave;i ra tr&ecirc;n b&iacute;m t&oacute;c của Samira cũng c&oacute; th&ecirc;m một vệt m&agrave;u lam nổi bật. M&agrave;u lam cũng xuất hiện tr&ecirc;n cả những khẩu s&uacute;ng kh&aacute;c của c&ocirc;, h&ograve;a quyện với m&agrave;u đỏ tươi tr&ecirc;n lưỡi kiếm. Ngo&agrave;i ra c&ograve;n c&oacute; c&aacute;c chi tiết đường x&iacute;ch l&agrave;m nổi bật trang phục của c&ocirc; xuy&ecirc;n suốt từ t&oacute;c đến đu&ocirc;i &aacute;o kho&aacute;c.&nbsp;</p>\r\n\r\n<h3 dir=\"ltr\">LƯU &Yacute; VỀ THIẾT KẾ&nbsp;</h3>\r\n\r\n<p dir=\"ltr\">Nếu Viego l&agrave; nh&acirc;n vật phản diện của sự kiện n&agrave;y, th&igrave; Samira l&agrave; nh&acirc;n vật ch&iacute;nh v&agrave; việc tạo ra sự tương phản giữa hai người l&agrave; một mục ti&ecirc;u lớn khi ch&uacute;ng t&ocirc;i thiết kế trang phục của cả hai. Để gi&uacute;p đạt được v&agrave; nhấn mạnh mục ti&ecirc;u n&agrave;y, ch&uacute;ng t&ocirc;i đ&atilde; l&agrave;m cho &aacute;o kho&aacute;c của Samira c&oacute; m&agrave;u đỏ nổi bật. V&igrave; Samira l&agrave; nữ ho&agrave;ng của việc x&acirc;u chuỗi c&aacute;c combo một c&aacute;ch th&agrave;nh thạo trong Đấu Trường, ch&uacute;ng t&ocirc;i biết rằng c&ocirc; cũng c&oacute; khả năng kết hợp m&agrave;u sắc trong trang phục Tinh V&otilde; Sư của m&igrave;nh. C&aacute;c chi tiết d&acirc;y x&iacute;ch xuy&ecirc;n suốt trang phục được sử dụng với h&agrave;m &yacute; rằng sức mạnh của thần nh&atilde;n đang được Samira kiểm so&aacute;t v&agrave; bị khống chế bằng xiềng x&iacute;ch. Đ&oacute; cũng l&agrave; một c&aacute;ch rất hay để ph&oacute;ng đại chuyển động của c&ocirc; v&agrave; bổ sung những hoạt ảnh th&uacute; vị cho những bước di chuyển h&agrave;o nho&aacute;ng của c&ocirc; tr&ecirc;n v&otilde; đ&agrave;i.</p>\r\n\r\n<hr />\r\n<h2 style=\"text-align:center\"><strong>Sett</strong></h2>\r\n\r\n<p><img alt=\"League of Legends Soul Fighter Sett Cosplay Guide\" src=\"https://www.riotgames.com/darkroom/1120/f1a499ca17068ecbc08b803be96cfe0e:37c80ba59933ae11158eeb1f7a13a305/leagueoflegends-soul-fighter-cosplay-guide-sett.png\" style=\"height:576px; width:100%\" /></p>\r\n\r\n<h3 dir=\"ltr\"><br />\r\nTH&Ocirc;NG TIN NH&Acirc;N VẬT</h3>\r\n\r\n<p dir=\"ltr\">Đấu sĩ n&agrave;y tới đ&acirc;y để chứng minh rằng NẮM ĐẤM sẽ l&agrave; c&acirc;u trả lời cho mọi thứ! &Iacute;t nhất nếu như c&acirc;u hỏi được đặt ra l&agrave; &quot;l&agrave;m thế n&agrave;o để một người chiến thắng nhiều giải đấu địa phương nhất trong lịch sử?&quot; V&agrave; anh ấy kh&ocirc;ng chỉ l&agrave;m điều đ&oacute; cho đẹp - mặc d&ugrave; đ&oacute; l&agrave; một điểm cộng lớn - anh ấy đang thăng tiến trong h&agrave;ng ngũ huyền thoại linh hồn để khiến mẹ của m&igrave;nh tự h&agrave;o. H&atilde;y ch&agrave;o đ&oacute;n SSSSSETT!</p>\r\n\r\n<h3 dir=\"ltr\">TH&Ocirc;NG TIN TRANG PHỤC&nbsp;</h3>\r\n\r\n<p dir=\"ltr\">Trang phục của Sett vể tổng thể kh&aacute; th&ugrave;ng th&igrave;nh v&agrave; m&agrave;u sắc ch&iacute;nh l&agrave; xanh hải qu&acirc;n, t&ocirc; điểm một ch&uacute;t xanh m&ograve;ng k&eacute;t tươi s&aacute;ng xuy&ecirc;n suốt. Đ&ocirc;i b&agrave;n ch&acirc;n được quấn bằng vải trắng. Dưới găng tay của anh ta cũng l&agrave; một lớp băng trắng giống vậy. D&ugrave; hầu hết c&aacute;c loại vải anh ta mặc đều nhẹ v&agrave; tho&aacute;ng, Sett c&ograve;n đeo th&ecirc;m thắt lưng da m&agrave;u n&acirc;u ở ch&acirc;n quần, ngực v&agrave; vai. Ngo&agrave;i ra, anh c&ograve;n đeo th&ecirc;m những chiếc vương miện v&agrave;ng nhỏ để t&ocirc; điểm cho trang phục của m&igrave;nh.&nbsp;</p>\r\n\r\n<h3 dir=\"ltr\">LƯU &Yacute; VỀ THIẾT KẾ</h3>\r\n\r\n<p dir=\"ltr\">V&igrave; Sett l&agrave; tr&ugrave;m về sử dụng nắm đấm n&ecirc;n khi thiết kế trang phục Tinh V&otilde; Sư cho anh ta, điều quan trọng l&agrave; phải tạo ra một thiết kế mang lại nhiều sự linh hoạt (gi&uacute;p việc đấm v&agrave;o mặt đối thủ trở n&ecirc;n dễ d&agrave;ng hơn). Ch&uacute;ng t&ocirc;i bổ sung c&aacute;c dải băng quấn b&ecirc;n dưới găng tay v&agrave; b&agrave;n ch&acirc;n cũng để cung cấp th&ecirc;m sự ổn định, đồng thời c&oacute; t&aacute;c dụng l&agrave;m lớp đệm trong qu&aacute; tr&igrave;nh đ&aacute;nh đập những kẻ kh&ocirc;ng may đụng độ anh ta. V&agrave; tất nhi&ecirc;n v&igrave; l&agrave; &ocirc;ng tr&ugrave;m, ch&uacute;ng t&ocirc;i phải th&ecirc;m một số chi tiết vương miện v&agrave;ng nhỏ để thể hiện c&aacute;ch m&agrave; Sett tự nh&igrave;n nhận về bản th&acirc;n.</p>\r\n', 'Từ khắp nơi trên thế giới, những người có linh hồn thức tỉnh được mời tới để chiến đấu trong Giải Đấu Tinh Võ! Đây là tuyệt đỉnh của ngành giải trí, một chương trình truyền hình không gì sánh bằng! Các võ sĩ sẽ đối đầu trong các trận chiến 1v1 trên võ đài, cho đến khi chỉ còn lại một người', '2023-08-25', 0),
(3, 'THIẾT LUẬT ANH HÙNG - LIÊN MINH HUYỀN THOẠI', 'ashe_banner.jpg', 'thiet-luat-anh-hung---lien-minh-huyen-thoai', '<p>Với định hướng tiếp tục mở rộng cộng đồng Li&ecirc;n Minh Huyền Thoại tr&ecirc;n to&agrave;n cầu, ch&uacute;ng t&ocirc;i kỳ vọng c&aacute;c th&agrave;nh vi&ecirc;n trong cộng đồng sẽ t&ocirc;n trọng c&aacute;c nguy&ecirc;n tắc được đặt ra dưới đ&acirc;y. Bộ Quy Tắc Ứng Xử cho Li&ecirc;n Minh Huyền Thoại n&agrave;y bổ sung cho&nbsp;Điều Khoản Dịch Vụ của Riot Games, l&agrave; những điều bạn sẽ phải đồng &yacute; trước khi tham gia v&agrave;o bất kỳ tr&ograve; chơi n&agrave;o của Riot.</p>\r\n\r\n<h1>Gi&aacute; Trị Cộng Đồng</h1>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Tôn trọng tính cạnh tranh\" src=\"https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt1dce75f45cff2da2/5f4d7c67177a662511db2309/commit.jpg\" style=\"height:400px; width:80%\" /></p>\r\n\r\n<ol>\r\n	<li>\r\n	<h4>T&ocirc;n trọng t&iacute;nh cạnh tranh</h4>\r\n\r\n	<p>Li&ecirc;n Minh Huyền Thoại l&agrave; một tr&ograve; chơi c&oacute; t&iacute;nh cạnh tranh cao, nơi m&agrave; tất cả mọi người tham gia để gi&agrave;nh chiến thắng. Để mỗi trận đấu sẽ đều mang &yacute; nghĩa nhất định, điều kiện thi đấu sẽ phải c&ocirc;ng bằng cho tất cả người chơi. Ch&uacute;ng t&ocirc;i tin rằng c&ocirc;ng bằng đồng nghĩa với việc kh&ocirc;ng gian lận, kh&ocirc;ng lạm dụng kẽ hở hệ thống v&agrave; kh&ocirc;ng c&oacute; bất kỳ h&agrave;nh động hoặc h&igrave;nh thức quấy rối n&agrave;o để&nbsp;<strong>tất cả</strong>&nbsp;người chơi đều c&oacute; cơ hội thể hiện m&igrave;nh một c&aacute;ch tốt nhất.</p>\r\n\r\n	<p>Cố gắng để chiến thắng kh&ocirc;ng c&oacute; nghĩa bạn bị &eacute;p buộc phải chơi theo &quot;meta&quot;. Thử nghiệm những điều mới mẻ cũng l&agrave; một c&aacute;ch hay&mdash;miễn l&agrave; bạn vẫn đang hỗ trợ cho to&agrave;n đội v&agrave; nỗ lực để gi&agrave;nh chiến thắng. Lưu &yacute; rằng điều n&agrave;y cũng được &aacute;p dụng cho cả c&aacute;c đồng đội của bạn: Kể cả khi bạn kh&ocirc;ng đồng &yacute; với lối chơi của họ, h&atilde;y cho họ một cơ hội v&agrave; tập trung v&agrave;o việc gi&agrave;nh chiến thắng cho cả đội.</p>\r\n\r\n	<p>Trong trường hợp người chơi n&agrave;o đ&oacute; thường xuy&ecirc;n kh&ocirc;ng t&ocirc;n trọng t&iacute;nh cạnh tranh của tr&ograve; chơi, ch&uacute;ng t&ocirc;i sẽ can thiệp để bảo vệ phần c&ograve;n lại của cộng đồng v&agrave; khuyến kh&iacute;ch người chơi đ&oacute; cải thiện h&agrave;nh vi của m&igrave;nh. V&igrave; thế, c&aacute;c cảnh b&aacute;o v&agrave; h&igrave;nh phạt của ch&uacute;ng t&ocirc;i chủ yếu tập trung cụ thể v&agrave;o c&aacute;c h&agrave;nh vi g&acirc;y rối thay v&igrave; mang t&iacute;nh trừng trị hay g&ograve; &eacute;p.</p>\r\n	</li>\r\n</ol>\r\n\r\n<h1>H&agrave;nh Vi Được Kỳ Vọng</h1>\r\n\r\n<p>Để nu&ocirc;i dưỡng một m&ocirc;i trường chứa đựng c&aacute;c gi&aacute; trị tr&ecirc;n, ch&uacute;ng t&ocirc;i kỳ vọng tất cả mọi th&agrave;nh vi&ecirc;n trong cộng đồng cố gắng tu&acirc;n thủ c&aacute;c h&agrave;nh vi dưới đ&acirc;y:</p>\r\n\r\n<p>CỐ GẮNG ĐỂ GI&Agrave;NH CHIẾN THẮNG</p>\r\n\r\n<p>T&Ocirc;N TRỌNG ĐỒNG ĐỘI CỦA M&Igrave;NH</p>\r\n\r\n<p>BẢO VỆ BẢN TH&Acirc;N V&Agrave; C&Aacute;C ĐỒNG ĐỘI</p>\r\n\r\n<p>H&Atilde;Y L&Agrave; R&Agrave;O CHẮN TỰ VỆ CUỐI C&Ugrave;NG CHO BẢN TH&Acirc;N</p>\r\n\r\n<h1>C&Aacute;C H&Agrave;NH VI M&Agrave; CỘNG ĐỒNG KH&Ocirc;NG CHẤP NHẬN</h1>\r\n\r\n<p><strong>Lạm dụng ng&ocirc;n từ</strong><br />\r\n<em>Ng&ocirc;n từ x&uacute;c phạm, th&ugrave; gh&eacute;t, quấy rối t&igrave;nh dục</em></p>\r\n\r\n<p><strong>Gian lận</strong><br />\r\n<em>D&ugrave;ng c&aacute;c phần mềm gian lận b&ecirc;n ngo&agrave;i, hack, lạm dụng kẽ hở hệ thống, chia sẻ t&agrave;i khoản, cầy thu&ecirc; t&agrave;i khoản</em></p>\r\n\r\n<p><strong>T&ecirc;n mang t&iacute;nh x&uacute;c phạm hoặc kh&ocirc;ng ph&ugrave; hợp</strong><br />\r\n<em>T&ecirc;n người chơi, t&ecirc;n t&agrave;i khoản, t&ecirc;n nh&oacute;m</em></p>\r\n\r\n<p><strong>Cố t&igrave;nh thua - Rời trận/AFK</strong><br />\r\n<em>Mất kết nối, AFK, kh&ocirc;ng hoạt động, từ chối chơi</em></p>\r\n\r\n<p><strong>Cố t&igrave;nh thua - C&aacute;c h&agrave;nh vi trong trận</strong><br />\r\n<em>Cố t&igrave;nh chết, quấy rối, ph&aacute; hoại trận đấu</em></p>\r\n\r\n<p><strong>Đe dọa</strong><br />\r\n<em>Tấn c&ocirc;ng ngo&agrave;i đời thực, thao t&uacute;ng cảm x&uacute;c, đe dọa tống tiền, bắt nạt</em></p>\r\n\r\n<h1>Hậu quả</h1>\r\n\r\n<p>Nếu bạn vi phạm c&aacute;c kỳ vọng được liệt k&ecirc; tại đ&acirc;y, ch&uacute;ng t&ocirc;i c&oacute; thể hạn chế quyền hạn v&agrave; quyền truy cập của bạn v&agrave;o một số t&iacute;nh năng trong tr&ograve; chơi. Việc hạn chế n&agrave;y để bảo vệ cộng đồng khỏi c&aacute;c h&agrave;nh vi g&acirc;y rối trong tương lai v&agrave; cho bạn cơ hội để suy ngẫm về những g&igrave; m&igrave;nh đ&atilde; l&agrave;m. Ch&uacute;ng t&ocirc;i hướng tới việc cải tạo h&agrave;nh vi, nhưng kh&ocirc;ng c&oacute; nghĩa l&agrave; sẽ đ&aacute;nh đổi bằng rủi ro cho to&agrave;n bộ cộng đồng. Ch&uacute;ng t&ocirc;i cũng hướng tới h&igrave;nh phạt dựa tr&ecirc;n c&aacute;c h&agrave;nh vi cụ thể, đồng thời tr&aacute;nh &aacute;p dụng c&aacute;c h&igrave;nh thức phạt qu&aacute; h&agrave; khắc v&agrave; kh&ocirc;ng cần thiết.</p>\r\n\r\n<p>Hậu quả của việc vi phạm Bộ Quy Tắc Ứng Xử c&oacute; thể bao gồm (nhưng kh&ocirc;ng giới hạn trong):</p>\r\n\r\n<ul>\r\n	<li>Mất khả năng sử dụng hệ thống giao tiếp trong tr&ograve; chơi</li>\r\n	<li>Hạn chế hoặc cần y&ecirc;u cầu bổ sung để c&oacute; thể truy cập c&aacute;c trải nghiệm như h&agrave;ng chờ Xếp Hạng</li>\r\n	<li>Hạn chế truy cập v&agrave;o c&aacute;c hệ thống v&agrave; t&iacute;nh năng cộng đồng trong c&aacute;c tr&ograve; chơi của Riot</li>\r\n	<li>X&oacute;a bỏ c&aacute;c phần thưởng hoặc vật phẩm/nội dung được cho l&agrave; kiếm được bằng c&aacute;ch kh&ocirc;ng ph&ugrave; hợp</li>\r\n	<li>Tạm thời hoặc cấm vĩnh viễn khỏi Li&ecirc;n Minh Huyền Thoại hoặc tất cả c&aacute;c tr&ograve; chơi của Riot.</li>\r\n</ul>\r\n', 'Với định hướng tiếp tục mở rộng cộng đồng Liên Minh Huyền Thoại trên toàn cầu, chúng tôi kỳ vọng các thành viên trong cộng đồng sẽ tôn trọng các nguyên tắc được đặt ra dưới đây. Bộ Quy Tắc Ứng Xử cho Liên Minh Huyền Thoại này bổ sung cho Điều Khoản Dịch Vụ của Riot Games.', '2023-08-25', 0),
(5, 'TÓM TẮT: CẬP NHẬT GIỮA NĂM TỪ ĐỘI NGŨ PHÁT TRIỂN', 'Cap_nhat-Jhin.jpg', 'tom-tat-cap-nhat-giua-nam-tu-doi-ngu-phat-trien', '<p>Xin ch&agrave;o, h&ocirc;m nay ch&uacute;ng t&ocirc;i gồm Riot Brightmoon v&agrave; Meddler sẽ mang đến cho c&aacute;c bạn bản t&oacute;m tắt ngắn gọn của&nbsp;Cập Nhật Từ Đội Ngũ Ph&aacute;t Triển.</p>\r\n\r\n<p>Khi mới bắt đầu thực hiện chuỗi b&agrave;i viết Cập Nhật Từ Đội Ngũ Ph&aacute;t Triển, ch&uacute;ng t&ocirc;i đ&atilde; nhận ra rằng m&igrave;nh cần phải mang đến cho người chơi h&agrave;ng loạt c&aacute;c nội dung như sự kiện, cập nhật định kỳ, phim ngắn, chế độ chơi v&agrave; hơn thế nữa. Sự kiện Tinh V&otilde; Sư vừa ra mắt l&agrave; một trong những nỗ lực to lớn của ch&uacute;ng t&ocirc;i nhằm thực hiện điều n&agrave;y. Dĩ nhi&ecirc;n ch&uacute;ng t&ocirc;i kh&ocirc;ng kỳ vọng rằng sự kiện n&agrave;y sẽ giải quyết mọi vấn đề, m&agrave; chỉ hy vọng đ&acirc;y sẽ l&agrave; một bước đi đ&uacute;ng đắn c&oacute; &yacute; nghĩa. Ch&uacute;ng t&ocirc;i rất h&aacute;o hức muốn biết cảm nhận của c&aacute;c bạn về to&agrave;n bộ nội dung của sự kiện m&ugrave;a h&egrave; n&agrave;y, từ những đoạn phim ngắn cho đến trải nghiệm nhập vai trong client v&agrave; cả chế độ chơi 2v2v2v2 - V&otilde; Đ&agrave;i của ch&uacute;ng t&ocirc;i.</p>\r\n\r\n<p>Giờ h&atilde;y c&ugrave;ng đi v&agrave;o nội dung b&agrave;i viết T&oacute;m Tắt nh&eacute;, khởi đầu với một số c&acirc;u hỏi thường gặp về V&otilde; Đ&agrave;i.</p>\r\n\r\n<h2>C&acirc;u Hỏi Thường Gặp Về V&otilde; Đ&agrave;i</h2>\r\n\r\n<p style=\"text-align:center\"><a href=\"https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/bltfa84208f7d716096/64c176dc14368885b1a5a48b/01Arena.jpg\" target=\"_blank\"><img alt=\"01Arena.jpg\" src=\"https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/bltfa84208f7d716096/64c176dc14368885b1a5a48b/01Arena.jpg\" style=\"height:400px; width:80%\" /></a></p>\r\n\r\n<ul>\r\n	<li>\r\n	<ul>\r\n		<li>Trước khi đưa ra bất kỳ quyết định n&agrave;o về việc đưa V&otilde; Đ&agrave;i trở lại, ch&uacute;ng t&ocirc;i sẽ lắng nghe &yacute; kiến phản hồi của người chơi v&agrave; đ&aacute;nh gi&aacute; mức độ được ưa chuộng của chế độ n&agrave;y.</li>\r\n		<li>Nếu V&otilde; Đ&agrave;i thực sự quay trở lại, ch&uacute;ng t&ocirc;i muốn triển khai c&aacute;c t&iacute;nh năng như sảnh chờ t&ugrave;y chọn v&agrave; tham gia h&agrave;ng chờ c&ugrave;ng nhiều bạn b&egrave;.</li>\r\n		<li>Ch&uacute;ng t&ocirc;i cũng sẽ đưa ra c&aacute;c thay đổi c&acirc;n bằng d&agrave;nh ri&ecirc;ng cho V&otilde; Đ&agrave;i, bao gồm việc kết hợp giữa những thay đổi cụ thể đối với tướng v&agrave; điều chỉnh đại tr&agrave; phần trăm chỉ số, nếu như ch&uacute;ng t&ocirc;i cần thực hiện c&ugrave;ng l&uacute;c một số lượng lớn những thay đổi.</li>\r\n		<li>Ch&uacute;ng t&ocirc;i đ&atilde; giải đ&aacute;p th&ecirc;m nhiều thắc mắc của c&aacute;c bạn trong b&agrave;i viết&nbsp;nhật k&yacute; ph&aacute;t triển: C&acirc;u Hỏi Thường Gặp Về V&otilde; Đ&agrave;i&nbsp;vừa được đăng tải ng&agrave;y h&ocirc;m nay.</li>\r\n		<li>Nếu c&aacute;c bạn muốn gặp gỡ đội ngũ đằng sau chế độ V&otilde; Đ&agrave;i,&nbsp;h&atilde;y gh&eacute; xem video ph&iacute;a sau hậu trường của ch&uacute;ng t&ocirc;i&nbsp;để t&igrave;m hiểu về qu&aacute; tr&igrave;nh ph&aacute;t triển chế độ n&agrave;y.</li>\r\n	</ul>\r\n	</li>\r\n	<li>&nbsp;</li>\r\n</ul>\r\n\r\n<h2>Đấu Nhanh, Cửa Hiệu Tinh Hoa C&ugrave;ng Nhiều Nội Dung Kh&aacute;c</h2>\r\n\r\n<p style=\"text-align:center\"><a href=\"https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/bltb5e7b9e4de9a44d7/64c176dc75211bb017f34788/02XayahRakan.jpg\" target=\"_blank\"><img alt=\"02XayahRakan.jpg\" src=\"https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/bltb5e7b9e4de9a44d7/64c176dc75211bb017f34788/02XayahRakan.jpg\" style=\"height:450px; width:800px\" /></a></p>\r\n\r\n<ul>\r\n	<li>\r\n	<ul>\r\n		<li>Ch&uacute;ng t&ocirc;i vẫn đang trong qu&aacute; tr&igrave;nh ph&aacute;t triển&nbsp;Đấu Nhanh&nbsp;(chế độ n&agrave;y đ&atilde; buộc phải tạm dừng để nhường chỗ cho Tinh V&otilde; Sư, V&otilde; Đ&agrave;i v&agrave; những thay đổi về Xếp Hạng). Nhưng ch&uacute;ng t&ocirc;i dự định sẽ cho ra mắt chế độ n&agrave;y v&agrave;o khoảng cuối năm nay.</li>\r\n		<li>Seraphine v&agrave; Orianna Vệ Binh Tinh T&uacute; đang v&ocirc; c&ugrave;ng được ưa chuộng - v&agrave; trở th&agrave;nh hai trong số những trang phục phổ biến nhất năm nay.</li>\r\n		<li>Ch&uacute;ng t&ocirc;i vẫn đang miệt m&agrave;i thiết kế cho m&agrave;n &quot;tr&igrave;nh diễn&quot; của Xayah v&agrave; Rakan v&agrave;o cuối năm nay.</li>\r\n	</ul>\r\n	</li>\r\n	<li>&nbsp;</li>\r\n</ul>\r\n\r\n<p style=\"text-align:center\"><a href=\"https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/bltf5feff74b2f96af1/64c176dbc0f3056689b6aca6/03BlueEssence.jpeg\" target=\"_blank\"><img alt=\"03BlueEssence.jpeg\" src=\"https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/bltf5feff74b2f96af1/64c176dbc0f3056689b6aca6/03BlueEssence.jpeg\" style=\"height:400px; width:80%\" /></a></p>\r\n\r\n<ul>\r\n	<li>Cửa Hiệu Tinh Hoa sẽ &quot;t&aacute;i xuất&quot; trong bản cập nhật 13.17 v&agrave; ch&uacute;ng t&ocirc;i dự định sẽ mang t&iacute;nh năng n&agrave;y trở lại hai lần một năm trong tương lai.</li>\r\n	<li>Ch&uacute;ng t&ocirc;i cũng sẽ giới thiệu t&iacute;nh năng ph&acirc;n t&aacute;ch h&agrave;ng loạt để gi&uacute;p ph&acirc;n t&aacute;ch nhanh ch&oacute;ng những mảnh tướng dư thừa.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Ch&uacute;ng t&ocirc;i dự kiến sẽ triển khai cập nhật biểu tượng kỹ năng cho Graves, Janna, Jarvan, Nami, Orianna v&agrave; Varus v&agrave;o th&aacute;ng 8. Sau đ&oacute;, ch&uacute;ng t&ocirc;i sẽ bắt tay v&agrave;o thực hiện với những vị tướng kh&aacute;c.</li>\r\n	<li>Trong b&agrave;i viết Cập Nhật Từ Đội Ngũ Ph&aacute;t Triển tiếp theo, ch&uacute;ng t&ocirc;i sẽ chia sẻ th&ecirc;m về hiện trạng của chế độ V&otilde; Đ&agrave;i v&agrave; những &yacute; tưởng của ch&uacute;ng t&ocirc;i d&agrave;nh cho tương lai của V&otilde; Đ&agrave;i cũng như c&aacute;c chế độ kh&aacute;c.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Ch&uacute;ng t&ocirc;i cũng sẽ triển khai một số cập nhật cho giai đoạn Tiền M&ugrave;a Giải, cũng như cho hiệu ứng h&igrave;nh ảnh v&agrave; &acirc;m thanh của Jax. Ngo&agrave;i ra, c&aacute;c bạn cũng sẽ c&oacute; cơ hội gặp gỡ vị tướng mới nhất của ch&uacute;ng t&ocirc;i, Briar.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>V&agrave; đ&oacute; l&agrave; tất cả những nội dung c&oacute; trong Cập Nhật Từ Đội Ngũ Ph&aacute;t Triển lần n&agrave;y. H&atilde;y chia sẻ với ch&uacute;ng t&ocirc;i cảm nhận của c&aacute;c bạn v&agrave; hẹn gặp lại tr&ecirc;n V&otilde; Đ&agrave;i nh&eacute;!</p>\r\n', 'Xin chào, hôm nay chúng tôi gồm Riot Brightmoon và Meddler sẽ mang đến cho các bạn bản tóm tắt ngắn gọn của Cập Nhật Từ Đội Ngũ Phát Triển.\r\n\r\nKhi mới bắt đầu thực hiện chuỗi bài viết Cập Nhật Từ Đội Ngũ Phát Triển, chúng tôi đã nhận ra rằng mình cần phải mang đến cho người chơi', '2023-08-17', 0),
(7, 'ĐTCL - QUÁI VẬT TẤN CÔNG! GIỚI THIỆU GIẢI VÔ ĐỊCH', 'TFT-Mac_Primer_Banner.jpg', 'dtcl---quai-vat-tan-cong-gioi-thieu-giai-vo-dich', '<p>Cuộc đấu đỉnh cao của qu&aacute;i vật đ&atilde; đến rất gần! Kỳ trước ch&uacute;ng t&ocirc;i đ&atilde;&nbsp;th&ocirc;ng b&aacute;o&nbsp;về tổng giải thưởng cũng như việc ph&acirc;n chia Hạt Giống khu vực. Giờ đ&acirc;y, ch&uacute;ng t&ocirc;i đ&atilde; sẵn s&agrave;ng chia sẻ đến bạn nhiều th&ocirc;ng tin th&uacute; vị hơn về thể thức thi đấu, Dự Đo&aacute;n Pick&#39;Ems, phần thưởng Drops v&agrave; lịch ph&aacute;t s&oacute;ng.</p>\r\n\r\n<p>Vậy l&agrave; ch&uacute;ng ta đ&atilde; đi gần hết m&ugrave;a giải Qu&aacute;i Vật Tấn C&ocirc;ng của ĐTCL rồi đấy. Ch&uacute;ng ta sẽ sớm được chứng kiến&nbsp;những Chiến Lược Gia &quot;n&atilde;o to&quot; tranh đấu để vươn tới đỉnh cao to&agrave;n cầu v&agrave; gi&agrave;nh lấy phần thưởng tối thượng: 150.000 USD c&ugrave;ng chiếc xẻng v&agrave;ng r&ograve;ng si&ecirc;u to khổng lồ. H&atilde;y c&ugrave;ng xem ai sẽ l&agrave; người nhận được danh hiệu Qu&aacute;n Qu&acirc;n của giải đấu Qu&aacute;i Vật Tấn C&ocirc;ng! nh&eacute;.</p>\r\n\r\n<h2>Thể Thức Thi Đấu</h2>\r\n\r\n<p>Xuy&ecirc;n suốt giải đấu, người chơi sẽ nhận được điểm dựa tr&ecirc;n kết quả từng trận đấu của họ. 8/7/6/5/4/3/2/1 (v&iacute; dụ: đứng nhất sẽ nhận được 8 điểm, tương ứng xếp vị tr&iacute; thứ 8 sẽ nhận được 1 điểm).</p>\r\n\r\n<p><strong>Ng&agrave;y 1</strong></p>\r\n\r\n<ul>\r\n	<li>Người chơi sẽ chia th&agrave;nh nh&oacute;m 8 người v&agrave; mỗi nh&oacute;m thi đấu 6 trận</li>\r\n	<li>Sảnh chờ sẽ được tr&aacute;o lại sau 3 trận</li>\r\n	<li>To&agrave;n bộ 32 người chơi sẽ tiến v&agrave;o Ng&agrave;y 2</li>\r\n</ul>\r\n\r\n<p><strong>Ng&agrave;y 2</strong></p>\r\n\r\n<ul>\r\n	<li>Điểm của người chơi trong Ng&agrave;y 1 sẽ được giữ nguy&ecirc;n.</li>\r\n	<li>Người chơi sẽ chia th&agrave;nh nh&oacute;m 8 người v&agrave; mỗi nh&oacute;m thi đấu 6 trận.</li>\r\n	<li>Sảnh chờ sẽ được tr&aacute;o lại sau 3 trận.</li>\r\n	<li>Top 8 người chơi dẫn đầu Ng&agrave;y 2 sẽ tiến v&agrave;o Ng&agrave;y 3.</li>\r\n</ul>\r\n\r\n<p><strong>Ng&agrave;yt 3</strong></p>\r\n\r\n<ul>\r\n	<li>Top 8 người chơi sẽ thi đấu dưới thể thức checkmate</li>\r\n	<li>Người chơi đầu ti&ecirc;n đạt 18 điểm, sau đ&oacute; gi&agrave;nh lấy vị tr&iacute; đầu bảng trong một trận đấu sẽ trở th&agrave;nh Qu&aacute;n Qu&acirc;n ĐTCL - Qu&aacute;i Vật Tấn C&ocirc;ng! nh&eacute;.</li>\r\n</ul>\r\n\r\n<p>C&aacute;c trận đấu sẽ diễn ra tr&ecirc;n phi&ecirc;n bản 13.10.</p>\r\n\r\n<p>Để t&igrave;m mọi th&ocirc;ng tin chi tiết về thể thức giải đấu, h&atilde;y xem video Giải Th&iacute;ch Thể Thức:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Dự Đo&aacute;n Pick&rsquo;Em + Phần Thưởng</h2>\r\n\r\n<p>Dự Đo&aacute;n Pick&rsquo;Em đ&atilde; quay trở lại với Giải V&ocirc; Địch! H&atilde;y thử th&aacute;ch hiểu biết v&agrave; t&agrave;i năng dự đo&aacute;n của bạn bằng c&aacute;ch tham gia v&agrave;o Dự Đo&aacute;n Pick&#39;Em Qu&aacute;i Vật Tấn C&ocirc;ng! Nếu lựa chọn của bạn c&oacute; thể đưa bạn l&ecirc;n đỉnh cao của bảng xếp hạng, bạn sẽ nhận được c&aacute;c phần thưởng như: Trứng Linh Th&uacute;, biểu tượng Giải V&ocirc; Địch v&agrave; v&ocirc; v&agrave;n biểu cảm kỳ b&iacute;! H&atilde;y truy cập ngay trang&nbsp;Riot.com/TFTWorlds&nbsp;để cho ch&uacute;ng t&ocirc;i biết lựa chọn của bạn.</p>\r\n\r\n<ul>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>PHẦN THƯỞNG DROP</h2>\r\n\r\n<p>H&atilde;y bật k&ecirc;nh ph&aacute;t s&oacute;ng trực tiếp v&agrave;o ng&agrave;y 26 - 28/05 để c&oacute; cơ hội nhận được c&aacute;c phần thưởng Drops độc quyền. C&aacute;c phần thưởng Drops sẽ được ph&aacute;t tr&ecirc;n c&aacute;c trang: Lolesports.com, YouTube v&agrave; Twitch.</p>\r\n\r\n<p style=\"text-align:center\"><a href=\"https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt9637aff22c1d04ab/645dc7b7cae4f1491765c22e/051623_TFT_Mac_Primer_Drops.jpg\" target=\"_blank\"><img alt=\"051623_TFT_Mac_Primer_Drops.jpg\" src=\"https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt9637aff22c1d04ab/645dc7b7cae4f1491765c22e/051623_TFT_Mac_Primer_Drops.jpg\" style=\"height:400px; width:90%\" /></a></p>\r\n\r\n<h2>Lịch Ph&aacute;t S&oacute;ng</h2>\r\n\r\n<p>C&aacute;c trận đấu sẽ bắt đầu v&agrave;o l&uacute;c 18:00 (giờ Việt Nam) của mỗi ng&agrave;y thi đấu.</p>\r\n\r\n<p style=\"text-align:center\"><img src=\"https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/bltf3c9c1478e26dfe4/6465ea7b60b10c0cdfafa7b7/03-schedule_VN_(1).jpg\" style=\"height:400px; width:90%\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>C&aacute;c K&ecirc;nh Mạng X&atilde; Hội Ch&iacute;nh Thức Của ĐTCL</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Theo d&otilde;i c&aacute;c k&ecirc;nh mạng x&atilde; hội sau đ&acirc;y của ch&uacute;ng t&ocirc;i để nhận th&ocirc;ng tin cập nhật v&agrave; th&ocirc;ng b&aacute;o ch&iacute;nh thức mới nhất của ĐTCL:</p>\r\n', 'Cuộc đấu đỉnh cao của quái vật đã đến rất gần! Kỳ trước chúng tôi đã thông báo về tổng giải thưởng cũng như việc phân chia Hạt Giống khu vực. Giờ đây, chúng tôi đã sẵn sàng chia sẻ đến bạn nhiều thông tin thú vị hơn về thể thức thi đấu', '2023-08-26', 0),
(9, 'BIẾN THỂ THẦN THOẠI: JHIN VŨ TRỤ HẮC ÁM TUYỆT DIỆT XUẤT HIỆN', 'Jhin-Post.jpg', 'bien-the-than-thoai-jhin-vu-tru-hac-am-tuyet-diet-xuat-hien', '<p>Ch&agrave;o c&aacute;c bạn, h&ocirc;m nay đội ngũ Thiết Kế Trang Phục v&agrave; Tiền Tệ H&oacute;a ch&uacute;ng t&ocirc;i sẽ chia sẻ về một số nội dung sắp ra mắt tr&ecirc;n m&aacute;y chủ PBE v&agrave; cửa h&agrave;ng. Nếu đ&atilde; bỏ lỡ b&agrave;i viết cập nhật mới nhất của ch&uacute;ng t&ocirc;i, c&aacute;c bạn c&oacute; thể gh&eacute; đọc tại đ&acirc;y. Chủ đề ch&iacute;nh m&agrave; ch&uacute;ng t&ocirc;i muốn đề cập h&ocirc;m nay ch&iacute;nh l&agrave; &ldquo;Biến Thể Thần Thoại&rdquo; - một loại vật phẩm Thần Thoại độc quyền từ b&aacute;u vật mới m&agrave; ch&uacute;ng t&ocirc;i đang kh&aacute;m ph&aacute; v&agrave; thử nghiệm.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Được rồi, vậy Biến Thể Thần Thoại l&agrave; g&igrave;?</h2>\r\n\r\n<p style=\"text-align:center\"><img alt=\"LoL_MythicDarkCosmicJhin_HPO2.jpg\" src=\"https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt8736121d4836c286/64daaa33e1abb71aa84e3bcd/LoL_MythicDarkCosmicJhin_HPO2.jpg\" style=\"height:400px; width:80%\" /></p>\r\n\r\n<p>C&aacute;c trang phục H&agrave;ng Hiệu đ&atilde; cho ch&uacute;ng t&ocirc;i thấy rằng tất cả mọi người đều mong muốn sở hữu những vật phẩm &quot;sang chảnh&quot;, chứ kh&ocirc;ng&nbsp;<strong>chỉ</strong>&nbsp;ri&ecirc;ng những người chơi đam m&ecirc; sự độc quyền. Tuy nhi&ecirc;n, những thay đổi theo thời gian nhằm gi&uacute;p c&aacute;c trang phục H&agrave;ng Hiệu dễ tiếp cận hơn (v&iacute; dụ như t&iacute;nh năng quy đổi Tinh Hoa Thần Thoại trong Cửa H&agrave;ng Sự Kiện, Tinh Hoa Thần Thoại từ c&aacute;c phần thưởng cột mốc v&agrave; những trang phục H&agrave;ng Hiệu Ti&ecirc;u Điểm trong B&aacute;u Vật c&oacute; thể được quy đổi bằng Tinh Hoa Thần Thoại như Sona Tịnh &Acirc;m) đồng nghĩa với việc ch&uacute;ng kh&ocirc;ng c&ograve;n đ&aacute;p ứng được c&aacute;c mục ti&ecirc;u ban đầu d&agrave;nh cho những người chơi mong muốn nội dung/vật phẩm si&ecirc;u hiếm v&agrave; độc quyền. Thay v&igrave; cố gắng hạn chế những người chơi hiện đang h&agrave;i l&ograve;ng với hệ thống H&agrave;ng Hiệu dễ tiếp cận bằng c&aacute;ch khiến cho c&aacute;c trang phục kh&oacute; sở hữu hơn, ch&uacute;ng t&ocirc;i muốn thử nghiệm một phương ph&aacute;p kh&aacute;c.</p>\r\n\r\n<p>Ch&uacute;ng t&ocirc;i muốn t&igrave;m kiếm những phương thức kh&aacute;c để cung cấp c&aacute;c vật phẩm độc quyền khiến người chơi cảm thấy thực sự đặc biệt khi được sở hữu. Ch&uacute;ng t&ocirc;i sẽ bắt đầu thử nghiệm bằng c&aacute;ch cải tiến những trang phục Huyền Thoại sẵn c&oacute; cũng như chủ đề m&agrave; ch&uacute;ng mang đến cho c&aacute;c vị tướng. V&iacute; dụ, giả sử ch&uacute;ng t&ocirc;i dự định sẽ thiết kế một trang phục như vậy d&agrave;nh cho Jhin. Ch&uacute;ng t&ocirc;i sẽ &quot;t&uacute;t lại&quot; một trang phục Huyền Thoại sẵn c&oacute; v&agrave; bổ sung th&ecirc;m c&aacute;c yếu tố đặc biệt v&agrave;o những khoảnh khắc độc nhất của Jhin - chẳng hạn như ph&aacute;t bắn thứ 4 của hắn. Ngạc nhi&ecirc;n chưa, Biến Thể Thần Thoại đầu ti&ecirc;n sẽ l&agrave; Jhin Vũ Trụ Hắc &Aacute;m Tuyệt Diệt!</p>\r\n\r\n<h2>&quot;Tưởng kh&ocirc;ng mới&quot; m&agrave; lại &quot;mới kh&ocirc;ng tưởng&quot;? Vậy c&oacute; nghĩa l&agrave; sao nhỉ?</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Như một phần trong nỗ lực &quot;c&aacute;ch t&acirc;n&quot; lại chủ đề, Jhin Diệt Trừ Vũ Trụ Hắc &Aacute;m sẽ bao gồm nhiều cập nhật dựa tr&ecirc;n Jhin Vũ Trụ Hắc &Aacute;m, đồng thời cũng đi k&egrave;m với h&igrave;nh nền, biểu tượng v&agrave; khung mới. Sau đ&acirc;y l&agrave; hai video giới thiệu về Jhin Vũ Trụ Hắc &Aacute;m (phi&ecirc;n bản gốc) v&agrave; Jhin Vũ Trụ Hắc &Aacute;m Tuyệt Diệt (phi&ecirc;n bản mới) để c&aacute;c bạn c&oacute; thể thấy được phong c&aacute;ch trang phục mới n&agrave;y tr&ocirc;ng ra sao:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>Jhin Vũ Trụ Hắc &Aacute;m (Phi&ecirc;n Bản Gốc)</h3>\r\n\r\n<p style=\"text-align:center\"><img alt=\"LMHT: BXH Top 10 trang phục đẹp nhất trong năm 2019 của Riot Games\" src=\"https://s3.cloud.cmctelecom.vn/2game-vn/pictures/xemgame/2019/11/29/Jhin-Vu-Tru-Hac-Am.jpg\" style=\"height:400px; width:100%\" /></p>\r\n\r\n<h3>Jhin Vũ Trụ Hắc &Aacute;m Tuyệt Diệt (Phi&ecirc;n Bản Mới)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>L&agrave;m sao để nhận được trang phục n&agrave;y?</h2>\r\n\r\n<p>Ch&uacute;ng t&ocirc;i sẽ &aacute;p dụng hệ thống cột mốc m&agrave; người chơi thường thấy d&agrave;nh cho những đợt ra mắt trang phục như Sona Tịnh &Acirc;m. D&agrave;nh cho những ai chưa biết, c&aacute;ch thức hoạt động của hệ thống n&agrave;y l&agrave; sau khi mở 29 Hộp Vũ Trụ 2023, c&aacute;c bạn chắc chắn sẽ nhận được phần thưởng trong hộp thứ 30 d&agrave;nh cho cột mốc đ&oacute;. Hộp Vũ Trụ 2023 sẽ được mở b&aacute;n với gi&aacute; 750 RP trong bản cập nhật 13.17 v&agrave; 13.18.</p>\r\n', 'Chào các bạn, hôm nay đội ngũ Thiết Kế Trang Phục và Tiền Tệ Hóa chúng tôi sẽ chia sẻ về một số nội dung sắp ra mắt trên máy chủ PBE và cửa hàng.', '2023-08-26', 0),
(10, 'THÔNG TIN BẢN CẬP NHẬT 13.17', 'tintuc.jpg', 'thong-tin-ban-cap-nhat-1317', '<blockquote>&nbsp;Tỏa s&aacute;ng rực rỡ như Bel&rsquo;Veth Nữ Ch&uacute;a Vũ Trụ, cập nhật 13.17 đ&atilde; tới đ&acirc;y!<br />\r\n<br />\r\nTrong phi&ecirc;n bản tuần n&agrave;y ch&uacute;ng t&ocirc;i c&oacute; một v&agrave;i mục ti&ecirc;u như sau: Đầu ti&ecirc;n, ch&uacute;ng t&ocirc;i sẽ điều chỉnh c&aacute;c đấu sĩ kh&ocirc;ng tận dụng được nhiều c&aacute;c t&ugrave;y chọn trang bị cho đấu sĩ hiện tại. Những thay đổi n&agrave;y sẽ được &aacute;p dụng cho bộ kỹ năng của Aatrox, Hecarim, Vi v&agrave; Xin Zhao, để c&aacute;c tướng thường xuy&ecirc;n l&ecirc;n đồ ho&agrave;n to&agrave;n s&aacute;t thương n&agrave;y giờ sẽ thoải m&aacute;i hơn trong việc l&ecirc;n hỗn hợp cả s&aacute;t thương v&agrave; chống chịu.<br />\r\n<br />\r\nThứ hai, ch&uacute;ng t&ocirc;i sẽ tăng sức mạnh cho một số trang bị đấu sĩ. Ch&uacute;ng t&ocirc;i sẽ c&oacute; bổ sung khả năng chống chịu v&agrave; cho ph&eacute;p c&aacute;c đấu sĩ tr&ocirc;ng cậy v&agrave;o Ch&ugrave;y Hấp Huyết, Ch&ugrave;y Phản K&iacute;ch hoặc Ngọn Gi&aacute;o Shojin (được thay đổi đ&aacute;ng kể) để mang lại sự cứng c&aacute;p cần thiết trong những giao tranh đẫm m&aacute;u. Thay đổi tăng sức mạnh của Shojin đặc biệt tập trung v&agrave;o việc đưa n&oacute; trở th&agrave;nh một trang bị thứ hai hấp dẫn cho nhưng ai đang muốn lăn cầu tuyết. Nếu bạn chưa biết, ch&uacute;ng t&ocirc;i đ&atilde; c&oacute; những ph&acirc;n t&iacute;ch chuy&ecirc;n s&acirc;u về chủ đề n&agrave;y trong Tổng Quan Về Lối Chơi: 13.16, h&atilde;y tới đọc nếu bạn quan t&acirc;m!<br />\r\n<br />\r\nThứ ba, ch&uacute;ng t&ocirc;i đ&atilde; xem x&eacute;t lại khả năng chống chịu chung của tất cả c&aacute;c tướng v&agrave; sẽ trợ gi&uacute;p cho những tướng đ&atilde; đ&aacute;nh mất nhiều sức chống chịu trong thời gian gần đ&acirc;y. D&ugrave; Yasuo v&agrave; Yone đ&atilde; được điều chỉnh về khả năng chống chịu sau khi mất đi Nỏ Tử Thủ hồi đầu năm, ch&uacute;ng t&ocirc;i cũng sẽ trợ gi&uacute;p tương tự cho Samira. Quinn v&agrave; Akshan cũng đ&atilde; chuyển sang hướng l&ecirc;n đồ mỏng manh trong thời gian gần đ&acirc;y, vậy n&ecirc;n hai tướng n&agrave;y cũng sẽ được thay đổi. Nh&acirc;n tiện n&oacute;i về Nỏ Tử Thủ, ch&uacute;ng t&ocirc;i cũng sẽ tinh chỉnh c&aacute;c trang bị ch&iacute; mạng h&uacute;t m&aacute;u để khiến Nỏ Tử Thủ trở th&agrave;nh một đối thủ cạnh tranh với Huyết Kiếm. Ngo&agrave;i ra, ch&uacute;ng t&ocirc;i cũng sẽ giảm sức mạnh của Gi&aacute;p Vai Nguyệt Thần để c&acirc;n bằng hơn với D&acirc;y Chuyền Iron Solari. Nh&igrave;n chung, những thay đổi n&agrave;y sẽ gi&uacute;p tăng khả năng chống chịu tổng thể của c&aacute;c tướng, thứ đ&atilde; bị sụt giảm đ&aacute;ng kể trong thời gian gần đ&acirc;y.<br />\r\n<br />\r\nB&ecirc;n cạnh đ&oacute;, trở lại trong phi&ecirc;n bản n&agrave;y sau thời gian d&agrave;i chờ đợi đ&oacute; ch&iacute;nh l&agrave; Cửa Hiệu Tinh Hoa! Cửa hiệu sẽ mở trong hai tuần từ 03:00 ng&agrave;y 07/09 (giờ Việt Nam). H&atilde;y nhớ gh&eacute; thăm v&agrave; ti&ecirc;u x&agrave;i Tinh Hoa Lam của m&igrave;nh trước khi cửa h&agrave;ng đ&oacute;ng lại v&agrave;o 03:00 ng&agrave;y 21/09/2023 (giờ Việt Nam). Nếu bạn kh&ocirc;ng c&ograve;n nhiều Tinh Hoa v&agrave; đang c&oacute; một đống mảnh tướng nằm kh&ocirc;ng, h&atilde;y tới thử t&iacute;nh năng ph&acirc;n t&aacute;ch h&agrave;ng loạt mới ra mắt trong phi&ecirc;n bản trước.<br />\r\n<br />\r\n<em>Th&ocirc;ng tin cập nhật cho ĐTCL&nbsp;ở đ&acirc;y!</em>&nbsp;</blockquote>\r\n\r\n<p><img src=\"https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt075f593cd43ae0af/6204a31f214fe9266428cdaa/Author_Lilu.jpg\" style=\"height:200px; width:200px\" />Lilu &quot;RiotRiru&quot; Cabreros</p>\r\n\r\n<h2>Ti&ecirc;u Điểm Cập Nhật</h2>\r\n\r\n<p><a href=\"https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt552760a7f921752f/64ee2ff07ea5c5b179a076c0/LOL_13.17_Patch-Highlights_TW_1920x1080_VN.jpg\" target=\"_blank\"><img src=\"https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt552760a7f921752f/64ee2ff07ea5c5b179a076c0/LOL_13.17_Patch-Highlights_TW_1920x1080_VN.jpg\" style=\"height:500px; width:100%\" /></a></p>\r\n\r\n<p>Bel&#39;Veth Nữ Ch&uacute;a Vũ Trụ, Nautilus Hiệp Sĩ Vũ Trụ, Sion Hiệp Sĩ Vũ Trụ, Nunu &amp; Willump Hiệp Sĩ Vũ Trụ v&agrave; Jhin Vũ Trụ Hắc &Aacute;m Tuyệt Diệt sẽ ra mắt v&agrave;o l&uacute;c 03:00 ng&agrave;y 31/08/2023 (giờ Việt Nam).</p>\r\n\r\n<h2>Tướng</h2>\r\n\r\n<p><a href=\"https://www.leagueoflegends.com/vi-vn/champions/aatrox/\"><img src=\"https://am-a.akamaihd.net/image?f=http://ddragon.leagueoflegends.com/cdn/13.16.1/img/champion/Aatrox.png\" style=\"height:150px; width:150px\" /></a></p>\r\n\r\n<h3>Aatrox</h3>\r\n\r\n<p>Nội tại - Điều chỉnh loại s&aacute;t thương th&agrave;nh s&aacute;t thương ph&eacute;p. W - Điều chỉnh loại s&aacute;t thương th&agrave;nh s&aacute;t thương ph&eacute;p.</p>\r\n\r\n<blockquote>&nbsp;Lối l&ecirc;n đồ th&ocirc;ng dụng nhất của Aatrox hiện tại đ&oacute; l&agrave; Dạ Kiếm rồi Serylda, khiến hắn trở n&ecirc;n cực kỳ mỏng manh trong giao tranh v&agrave; biến Aatrox th&agrave;nh một tướng &quot;được ăn cả ng&atilde; về kh&ocirc;ng&quot;. Chuyển nội tại v&agrave; W của hắn th&agrave;nh s&aacute;t thương ph&eacute;p sẽ khiến s&aacute;t lực v&agrave; xuy&ecirc;n gi&aacute;p kh&ocirc;ng tăng s&aacute;t thương cho ch&uacute;ng, ngo&agrave;i ra lượng hồi m&aacute;u cũng sẽ bị ảnh hưởng v&igrave; s&aacute;t thương được t&iacute;nh sau khi giảm trừ. Giảm bớt chi ph&iacute; cơ hội của c&aacute;c trang bị cứng c&aacute;p như Ch&ugrave;y Hấp Huyết, Ch&ugrave;y Phản K&iacute;ch hoặc R&igrave;u Đen sẽ cho ph&eacute;p hắn giao tranh như một dũng sĩ nhiều hơn l&agrave; một s&aacute;t thủ lao v&agrave;o h&agrave;ng ngũ địch.&nbsp;</blockquote>\r\n\r\n<hr />\r\n<h4><img src=\"https://am-a.akamaihd.net/image?f=http://ddragon.leagueoflegends.com/cdn/13.16.1/img/passive/Aatrox_Passive.png\" style=\"height:70px; width:70px\" />Nội Tại - Đường Kiếm Tuyệt Diệt</h4>\r\n\r\n<ul>\r\n	<li><strong>Loại S&aacute;t Thương</strong>: Vật L&yacute; &rArr; Ph&eacute;p</li>\r\n</ul>\r\n\r\n<hr />\r\n<h4><img src=\"https://am-a.akamaihd.net/image?f=http://ddragon.leagueoflegends.com/cdn/13.16.1/img/spell/AatroxW.png\" style=\"height:70px; width:70px\" />W - Xiềng X&iacute;ch Địa Ngục</h4>\r\n\r\n<ul>\r\n	<li><strong>Loại S&aacute;t Thương</strong>: Vật L&yacute; &rArr; Ph&eacute;p</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.leagueoflegends.com/vi-vn/champions/akshan/\"><img src=\"https://am-a.akamaihd.net/image?f=http://ddragon.leagueoflegends.com/cdn/13.16.1/img/champion/Akshan.png\" style=\"height:150px; width:150px\" /></a></p>\r\n\r\n<h3>Akshan</h3>\r\n\r\n<p>Tăng m&aacute;u v&agrave; gi&aacute;p mỗi cấp, giảm sức mạnh c&ocirc;ng k&iacute;ch mỗi cấp.</p>\r\n\r\n<blockquote>&nbsp;Sức chống chịu chung của tướng, đặc biệt với những tướng mỏng manh, đ&atilde; bị giảm đ&aacute;ng kể trong 1 năm vừa rồi. D&ugrave; vẫn cao hơn phi&ecirc;n bản 12.9 (ngay trước Cập Nhật Chống Chịu hồi năm ngo&aacute;i), lượng tăng th&ecirc;m đ&atilde; bị giảm bớt một nửa, đặc biệt l&agrave; tr&ecirc;n c&aacute;c tướng xạ thủ. Tuy kh&ocirc;ng phải tất cả đều bị ảnh hưởng, nhưng một số tướng sẽ cảm thấy sức chống chịu của họ bị suy giảm nhiều hơn những tướng c&ograve;n lại. Akshan, Quinn v&agrave; Samira sẽ được thay đổi để khắc phục vấn đề n&agrave;y v&igrave; Yasuo v&agrave; Yone đ&atilde; được thay đổi hồi đầu năm rồi.<br />\r\n<br />\r\nLối l&ecirc;n đồ cho Akshan đ&atilde; dần chuyển khỏi hướng l&ecirc;n s&aacute;t thương tr&ecirc;n đ&ograve;n đ&aacute;nh kh&aacute; cứng c&aacute;p, bao gồm Đao T&iacute;m v&agrave; Nỏ Tử Thủ. Hắn đ&atilde; t&igrave;m được một hướng l&ecirc;n trang bị kh&aacute;c, cũng tốt th&ocirc;i nhưng giao tranh của hắn hiện đang kết th&uacute;c rất ch&oacute;ng v&aacute;nh. Ch&uacute;ng t&ocirc;i sẽ giảm bớt tốc độ của giao tranh n&agrave;y, để cả hắn v&agrave; đối thủ sẽ c&oacute; th&ecirc;m kh&ocirc;ng gian để thở.<br />\r\n<br />\r\nThực tế th&igrave; thay đổi cũng kh&aacute; nhỏ th&ocirc;i. Giảm bớt SMCK sẽ khiến hắn ch&iacute; mạng &iacute;t hơn, điều n&agrave;y sẽ tăng gi&aacute; trị tương quan của s&aacute;t thương tr&ecirc;n đ&ograve;n đ&aacute;nh như Gươm Của Vua V&ocirc; Danh v&agrave; Đao T&iacute;m.&nbsp;</blockquote>\r\n\r\n<hr />\r\n<h4>Chỉ Số Cơ Bản</h4>\r\n\r\n<ul>\r\n	<li><strong>M&aacute;u Theo Cấp</strong>: 104 &rArr; 107</li>\r\n	<li><strong>Gi&aacute;p Theo Cấp</strong>: 4,2 &rArr; 4,7</li>\r\n	<li><strong>Sức Mạnh C&ocirc;ng K&iacute;ch Theo Cấp</strong>: 3,5 &rArr; 3</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.leagueoflegends.com/vi-vn/champions/blitzcrank/\"><img src=\"https://am-a.akamaihd.net/image?f=http://ddragon.leagueoflegends.com/cdn/13.16.1/img/champion/Blitzcrank.png\" style=\"height:150px; width:150px\" /></a></p>\r\n\r\n<h3>Blitzcrank</h3>\r\n\r\n<p>Tăng m&aacute;u v&agrave; kh&aacute;ng ph&eacute;p cơ bản, giảm tốc độ đ&aacute;nh v&agrave; tỉ lệ tốc độ đ&aacute;nh cơ bản. Nội tại - Điều chỉnh gi&aacute; trị l&aacute; chắn. W - Giảm năng lượng ti&ecirc;u hao, tăng tốc độ đ&aacute;nh cộng th&ecirc;m. E - Tăng tỉ lệ SMCK, giảm ti&ecirc;u hao năng lượng, s&aacute;t thương cộng th&ecirc;m l&ecirc;n những mục ti&ecirc;u kh&ocirc;ng phải tướng bị loại bỏ. R - Tăng s&aacute;t thương nội tại.</p>\r\n\r\n<blockquote>&nbsp;Trong lịch sử, Blitzcrank lu&ocirc;n l&agrave; một vị tướng tương đối đơn giản, đ&oacute; l&agrave; điều cả ch&uacute;ng t&ocirc;i v&agrave; người chơi đều đ&aacute;nh gi&aacute; cao ch&iacute;nh v&igrave; thế m&agrave; ch&uacute;ng t&ocirc;i muốn tập trung v&agrave;o điều đ&oacute;. Hướng tới điều n&agrave;y, ch&uacute;ng t&ocirc;i đ&atilde; quyết định r&uacute;t lại những thay đổi đ&atilde; thực hiện v&agrave;o năm ngo&aacute;i để gi&uacute;p Blitz đi rừng tốt hơn. Trong suốt năm qua, Blitz đ&atilde; kh&ocirc;ng thể th&agrave;nh c&ocirc;ng trong cả hai vai tr&ograve;, ngay cả khi hắn c&oacute; thể sống s&oacute;t trong rừng, h&oacute;a ra người chơi cũng kh&ocirc;ng quan t&acirc;m đến việc sử dụng hắn trong vai tr&ograve; n&agrave;y. Trong tương lai, ch&uacute;ng t&ocirc;i sẽ tập trung v&agrave;o việc c&acirc;n bằng Blitz ở vai tr&ograve; th&ocirc;ng dụng nhất của hắn &mdash; hỗ trợ.&nbsp;</blockquote>\r\n\r\n<hr />\r\n<h4>Chỉ Số Cơ Bản</h4>\r\n\r\n<ul>\r\n	<li><strong>M&aacute;u Cơ Bản</strong>: 633 &rArr; 650</li>\r\n	<li><strong>Kh&aacute;ng Ph&eacute;p</strong>: 28 &rArr; 32</li>\r\n	<li><strong>Tốc Độ Đ&aacute;nh Cơ Bản</strong>: 0,65 &rArr; 0,625</li>\r\n	<li><strong>Tỉ Lệ Tốc Độ Đ&aacute;nh</strong>: 0,7 &rArr; 0,625</li>\r\n</ul>\r\n\r\n<hr />\r\n<h4><img src=\"https://am-a.akamaihd.net/image?f=http://ddragon.leagueoflegends.com/cdn/13.16.1/img/passive/Blitzcrank_ManaBarrier.png\" style=\"height:70px; width:70px\" />Nội Tại - L&aacute; Chắn Năng Lượng</h4>\r\n\r\n<ul>\r\n	<li><strong>Sức Mạnh L&aacute; Chắn</strong>: 15 - 45% (t&ugrave;y theo cấp) Năng Lượng Tối Đa &rArr; 30% Năng Lượng Tối Đa</li>\r\n</ul>\r\n\r\n<hr />\r\n<h4><img src=\"https://am-a.akamaihd.net/image?f=http://ddragon.leagueoflegends.com/cdn/13.16.1/img/spell/Overdrive.png\" style=\"height:70px; width:70px\" />W - Tăng Tốc</h4>\r\n\r\n<ul>\r\n	<li><strong>Năng Lượng Ti&ecirc;u Hao</strong>: 85 &rArr; 75</li>\r\n	<li><strong>Tốc Độ Đ&aacute;nh Cộng Th&ecirc;m</strong>: 30/40/50/60/70% &rArr; 30/43/56/69/82%</li>\r\n</ul>\r\n\r\n<hr />\r\n<h4><img src=\"https://am-a.akamaihd.net/image?f=http://ddragon.leagueoflegends.com/cdn/13.16.1/img/spell/PowerFist.png\" style=\"height:70px; width:70px\" />E - Đấm M&oacute;c</h4>\r\n\r\n<ul>\r\n	<li><strong>S&aacute;t Thương Vật L&yacute; Cộng Th&ecirc;m</strong>: 75% SMCK (+25% SMPT) &rArr;&nbsp;<strong>100% SMCK</strong>&nbsp;(+25% SMPT)</li>\r\n	<li><strong>Năng Lượng Ti&ecirc;u Hao</strong>: 40 &rArr; 25</li>\r\n	<li>loại bỏ<strong>S&aacute;t Thương Cộng Th&ecirc;m l&ecirc;n Những Mục Ti&ecirc;u Kh&ocirc;ng Phải Tướng</strong>: E kh&ocirc;ng c&ograve;n g&acirc;y th&ecirc;m 150% SMCK (+125% SMPT) l&ecirc;n những mục ti&ecirc;u kh&ocirc;ng phải tướng</li>\r\n</ul>\r\n\r\n<hr />\r\n<h4><img src=\"https://am-a.akamaihd.net/image?f=http://ddragon.leagueoflegends.com/cdn/13.16.1/img/spell/StaticField.png\" style=\"height:70px; width:70px\" />R - Trường Điện Từ</h4>\r\n\r\n<ul>\r\n	<li><strong>S&aacute;t Thương Nội Tại</strong>: 50/100/150 (+50% SMPT) &rArr; 50/100/150 (+50% SMPT)&nbsp;<strong>(+2% Năng Lượng tối đa)</strong></li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.leagueoflegends.com/vi-vn/champions/elise/\"><img src=\"https://am-a.akamaihd.net/image?f=http://ddragon.leagueoflegends.com/cdn/13.16.1/img/champion/Elise.png\" style=\"height:150px; width:150px\" /></a></p>\r\n\r\n<h3>Elise</h3>\r\n\r\n<p>Nội tại - Tăng s&aacute;t thương ph&eacute;p cộng th&ecirc;m v&agrave; hồi m&aacute;u tr&ecirc;n đ&ograve;n đ&aacute;nh cơ bản. E - Tăng thời gian l&agrave;m cho&aacute;ng.</p>\r\n\r\n<blockquote>&nbsp;Elise c&oacute; thể l&agrave; Nữ Ho&agrave;ng Nhền Nhện, nhưng chắc chắn c&ocirc; kh&ocirc;ng phải l&agrave; nữ ho&agrave;ng đi rừng trong thời điểm hiện tại. Khả năng dọn rừng của c&ocirc; hiện đang yếu hơn nhiều tướng đi rừng kh&aacute;c, thường mất nhiều thời gian hơn v&agrave; kết th&uacute;c với &iacute;t m&aacute;u hơn, khiến lượt gank đầu ti&ecirc;n (thứ đ&aacute;ng lẽ ra l&agrave; điểm mạnh của c&ocirc;) trở n&ecirc;n yếu hơn dự t&iacute;nh. Ch&uacute;ng t&ocirc;i cũng đang t&igrave;m c&aacute;ch điều chỉnh c&ocirc; ấy trong giai đoạn sau của trận đấu, gi&uacute;p c&ocirc; trở th&agrave;nh một lựa chọn tiềm năng khi những điểm mạnh kh&aacute;c của c&ocirc; đ&atilde; bị suy giảm.&nbsp;</blockquote>\r\n\r\n<h4><img src=\"https://am-a.akamaihd.net/image?f=http://ddragon.leagueoflegends.com/cdn/13.16.1/img/passive/ElisePassive.png\" style=\"height:70px; width:70px\" />Nội Tại - Nữ Ho&agrave;ng Nhền Nhện</h4>\r\n\r\n<ul>\r\n	<li><strong>S&aacute;t Thương Ph&eacute;p Cộng Th&ecirc;m Tr&ecirc;n Đ&ograve;n Đ&aacute;nh</strong>: 10/20/30/40 (+20% SMPT) &rArr;&nbsp;<strong>12/22/32/42</strong>&nbsp;(+20% SMPT)</li>\r\n	<li><strong>Hồi M&aacute;u Tr&ecirc;n Mỗi Đ&ograve;n Đ&aacute;nh</strong>: 4/6/8/10 (+8% SMPT) &rArr;&nbsp;<strong>6/8/10/12</strong>&nbsp;(+8% SMPT)</li>\r\n</ul>\r\n\r\n<hr />\r\n<h4><img src=\"https://am-a.akamaihd.net/image?f=http://ddragon.leagueoflegends.com/cdn/13.16.1/img/spell/EliseHumanE.png\" style=\"height:70px; width:70px\" />E - K&eacute;n Nhện</h4>\r\n\r\n<ul>\r\n	<li><strong>Thời Gian L&agrave;m Cho&aacute;ng</strong>: 1,6/1,7/1,8/1,9/2 gi&acirc;y &rArr; 1,6/1,8/2/2,2/2,4 gi&acirc;y</li>\r\n</ul>\r\n', 'Trong phiên bản tuần này chúng tôi có một vài mục tiêu như sau: Đầu tiên, chúng tôi sẽ điều chỉnh các đấu sĩ không tận dụng được nhiều các tùy chọn trang bị cho đấu sĩ hiện tại.', '2023-08-30', 0);
INSERT INTO `tbpost` (`idpost`, `title`, `anhmota`, `slug`, `content`, `descpost`, `time`, `status`) VALUES
(11, 'ĐỘI NGŨ PHÁT TRIỂN: THAY ĐỔI LỊCH TRÌNH XẾP HẠNG', '2023-Key-Art.jpg', 'doi-ngu-phat-trien-thay-doi-lich-trinh-xep-hang', '<p>S&aacute;ng h&ocirc;m nay, ch&uacute;ng t&ocirc;i đ&atilde; tuy&ecirc;n bố rằng bắt đầu từ năm sau, LMHT sẽ được chia th&agrave;nh 3 kỳ Xếp Hạng. Ngo&agrave;i ra, những thay đổi lớn đối với lối chơi thường d&agrave;nh cho giai đoạn Tiền M&ugrave;a Giải v&agrave;o th&aacute;ng 11 thay v&agrave;o đ&oacute; sẽ được ra mắt v&agrave;o th&aacute;ng 1 năm sau. B&agrave;i viết n&agrave;y sẽ đi v&agrave;o giải th&iacute;ch l&yacute; do đằng sau c&aacute;c thay đổi n&agrave;y của ch&uacute;ng t&ocirc;i cũng như một v&agrave;i t&aacute;c động của ch&uacute;ng l&ecirc;n khoảng thời gian c&ograve;n lại trong năm.</p>\r\n\r\n<h2>Th&ocirc;ng tin ch&iacute;nh</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<ul>\r\n		<li>Kỳ xếp hạng hiện tại sẽ được k&eacute;o d&agrave;i đến ng&agrave;y 03/01</li>\r\n		<li>C&aacute;c thay đổi về lối chơi d&agrave;nh cho giai đoạn&nbsp;<del>Tiền M&ugrave;a Giải&nbsp;</del>2024 sẽ được ra mắt tr&ecirc;n m&aacute;y chủ PBE v&agrave;o ng&agrave;y 20/11</li>\r\n		<li>Những thay đổi n&agrave;y sẽ ch&iacute;nh thức ra mắt c&ugrave;ng bản cập nhật 14.1 v&agrave;o ng&agrave;y 09/01/2024</li>\r\n		<li>Kỳ 1 cũng sẽ bắt đầu v&agrave;o ng&agrave;y 09/01</li>\r\n		<li>Kỳ 2 sẽ bắt đầu v&agrave;o th&aacute;ng 5</li>\r\n		<li>Kỳ 3 sẽ bắt đầu v&agrave;o th&aacute;ng 9</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<h2>L&yacute; do đằng sau quyết định n&agrave;y l&agrave; g&igrave;?</h2>\r\n\r\n<p>Ch&uacute;ng t&ocirc;i đ&atilde; chia m&ugrave;a giải năm nay (2023) th&agrave;nh 2 kỳ để khiến trải nghiệm Đấu Xếp Hạng c&oacute; &yacute; nghĩa xuy&ecirc;n suốt cả năm, qua đ&oacute; khắc phục t&igrave;nh trạng &quot;đem con bỏ chợ&quot; v&agrave; ngừng tham gia Đấu Xếp Hạng hoặc chuyển sang l&agrave;m smurf của người chơi. Sau đợt t&aacute;i thiết lập xếp hạng giữa năm vừa qua, số lượng người chơi tiếp tục tham gia Đấu Xếp Hạng trong khoảng thời gian giữa năm hiện tại nhiều hơn những năm trước. Th&ocirc;ng qua việc bổ sung th&aacute;ng 11 v&agrave; 12 v&agrave;o m&ugrave;a giải v&agrave; chuyển sang &aacute;p dụng 3 kỳ với mỗi kỳ k&eacute;o d&agrave;i 4 th&aacute;ng, ch&uacute;ng t&ocirc;i c&oacute; thể triển khai nhiều cải thiện hơn nữa.</p>\r\n\r\n<p>V&iacute; dụ, c&oacute; một bộ phận người chơi chỉ tập trung v&agrave;o chế độ Đấu Xếp Hạng v&agrave; kh&ocirc;ng ng&oacute; ng&agrave;ng đến những chế độ kh&aacute;c. Với việc bổ sung th&ecirc;m 2 th&aacute;ng n&agrave;y v&agrave;o m&ugrave;a giải xếp hạng, họ sẽ c&oacute; thể chơi LMHT quanh năm. Đối với những người chơi kh&aacute;c, c&oacute; th&ecirc;m c&aacute;c kỳ xếp hạng trong năm sẽ gi&uacute;p họ an t&acirc;m &quot;g&aacute;c ph&iacute;m, bu&ocirc;ng chuột&quot; khỏi chế độ đấu xếp hạng v&agrave;i th&aacute;ng v&agrave; bỏ qua 1 kỳ v&igrave; việc đ&oacute; sẽ kh&ocirc;ng c&ograve;n ảnh hưởng đến h&agrave;nh tr&igrave;nh &quot;leo rank&quot; 10 th&aacute;ng nữa.</p>\r\n\r\n<p>&Aacute;p dụng 3 kỳ xếp hạng đồng nghĩa với việc ch&uacute;ng t&ocirc;i sẽ c&oacute; 3 thời điểm trong năm để thực hiện những thay đổi lớn về lối chơi cốt l&otilde;i m&agrave; kh&ocirc;ng l&agrave;m ảnh hưởng đến tiến tr&igrave;nh &quot;leo rank&quot; c&ograve;n dang dở. Bản cập nhật mang thi&ecirc;n hướng &quot;giữa m&ugrave;a giải&quot; sẽ ra mắt v&agrave;o đầu kỳ xếp hạng thứ hai, qua đ&oacute; khắc phục c&aacute;c vấn đề đ&aacute;ng lưu t&acirc;m hơn về c&aacute;c thay đổi đầu m&ugrave;a giải, đồng thời triển khai c&aacute;c cải thiện đối với t&igrave;nh trạng của tr&ograve; chơi như bản cập nhật chống chịu năm 2022. Kỳ xếp hạng thứ ba sẽ khởi đầu với c&aacute;c thay đổi nhỏ hơn v&igrave; kỳ xếp hạng n&agrave;y diễn ra gần thời điểm với CKTG v&agrave; đội ngũ ph&aacute;t triển sẽ tập trung nhiều hơn v&agrave;o c&aacute;c thay đổi lớn hơn cho giai đoạn khởi động m&ugrave;a giải năm tiếp theo.</p>\r\n\r\n<p>Thay đổi n&agrave;y cũng sẽ đưa tất cả người chơi về c&ugrave;ng vạch xuất ph&aacute;t v&agrave;o đầu năm. Một trong những t&aacute;c dụng phụ của giai đoạn Tiền M&ugrave;a Giải l&agrave; mỗi khi đến th&aacute;ng 1, một bộ phận người chơi đ&atilde; quen thuộc với những thay đổi mới trong khi nhiều người chơi kh&aacute;c mới chỉ được trải nghiệm lần đầu. Bằng c&aacute;ch triển khai những thay đổi n&agrave;y v&agrave;o đầu năm, mọi người chơi sẽ c&ugrave;ng nhau định h&igrave;nh xu hướng chơi mới. (Li&ecirc;n quan đến việc kh&aacute;m ph&aacute; n&agrave;y, giai đoạn Khởi Động M&ugrave;a Giải thường kh&ocirc;ng mấy hấp dẫn với những người chơi Đấu Thường đ&atilde; chơi suốt giai đoạn Tiền M&ugrave;a Giải v&igrave; chẳng c&ograve;n g&igrave; mới mẻ đối với họ.)</p>\r\n\r\n<p>Cuối c&ugrave;ng, ch&uacute;ng t&ocirc;i cho rằng người chơi sẽ rất h&agrave;o hứng khi c&oacute; cơ hội kiếm được 3 trang phục Vinh Quang trong một năm, mỗi kỳ 1 trang phục!</p>\r\n\r\n<p>Bằng c&aacute;ch triển khai c&aacute;c thay đổi đối với lối chơi c&ugrave;ng l&uacute;c bắt đầu m&ugrave;a giải Xếp Hạng v&agrave;o đầu năm, ch&uacute;ng t&ocirc;i sẽ đảm bảo được rằng&nbsp;<strong>giai đoạn Khởi Động M&ugrave;a Giải l&agrave; thời điểm th&uacute; vị nhất để trải nghiệm LMHT v&agrave; chế độ Đấu Xếp Hạng sẽ mang t&iacute;nh c&ocirc;ng bằng hơn (mặc d&ugrave; c&oacute; thể kh&aacute; hỗn loạn)</strong>.</p>\r\n\r\n<h2>Quản L&yacute; Rủi Ro</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Dẫu vậy, ch&uacute;ng t&ocirc;i hiểu r&otilde; rằng việc triển khai những thay đổi lớn nhất về lối chơi ngay khi m&ugrave;a giải Xếp Hạng bắt đầu sẽ dẫn đến nhiều rủi ro. Trước khi quyết định triển khai thay đổi n&agrave;y, ch&uacute;ng t&ocirc;i đ&atilde; x&aacute;c định v&agrave; đ&aacute;nh gi&aacute; những rủi ro lớn nhất.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>Độ ổn định của chế độ Đấu Xếp Hạng v&agrave; giải đấu Esports</h3>\r\n\r\n<p>Rủi ro r&otilde; r&agrave;ng nhất cần được xem x&eacute;t ch&iacute;nh l&agrave; l&agrave;m thế n&agrave;o để đảm bảo rằng chế độ Đấu Xếp Hạng v&agrave; đấu trường chuy&ecirc;n nghiệp c&oacute; một khởi đầu &quot;xu&ocirc;i ch&egrave;o m&aacute;t m&aacute;i&quot; từ đầu năm. Ch&uacute;ng t&ocirc;i sẽ sớm đưa c&aacute;c thay đổi đối với lối chơi l&ecirc;n m&aacute;y chủ PBE (dự kiến l&agrave; ng&agrave;y 20/11) để c&oacute; thời gian điều chỉnh trước khi ch&iacute;nh thức cho ra mắt. Ch&uacute;ng t&ocirc;i cũng sẽ triển khai những thay đổi n&agrave;y tr&ecirc;n m&aacute;y chủ giải đấu để c&aacute;c tuyển thủ chuy&ecirc;n nghiệp c&oacute; thể luyện tập l&agrave;m quen trước khi m&ugrave;a giải khởi tranh.</p>\r\n\r\n<p>Trước đ&acirc;y, những bản cập nhật đầu ti&ecirc;n trong năm thường g&acirc;y ra ảnh hưởng lớn trong qu&aacute; tr&igrave;nh ch&uacute;ng t&ocirc;i c&acirc;n bằng tr&ograve; chơi, vậy n&ecirc;n c&oacute; lẽ năm 2024 cũng sẽ kh&ocirc;ng&nbsp;<em>qu&aacute;</em>&nbsp;kh&aacute;c biệt so với những năm trước đ&oacute;. Khi quay trở lại v&agrave;o th&aacute;ng 1, ch&uacute;ng t&ocirc;i sẽ thực hiện một loạt c&aacute;c tinh chỉnh cuối c&ugrave;ng trước khi tung ra bản cập nhật 14.1, cũng như nhanh ch&oacute;ng đưa ra c&aacute;c cập nhật c&acirc;n bằng nối theo sau dựa tr&ecirc;n t&igrave;nh h&igrave;nh những ng&agrave;y đầu m&ugrave;a giải. Sau đ&oacute;, ch&uacute;ng t&ocirc;i c&oacute; thể sẽ thực hiện nhiều điều chỉnh lớn hơn trong bản cập nhật 14.2 v&agrave; 14.3.</p>\r\n\r\n<h3>Tiếp Thu Phản Hồi</h3>\r\n\r\n<p>Mỗi khi triển khai những thay đổi lớn về lối chơi, ch&uacute;ng t&ocirc;i muốn thực hiện điều chỉnh dựa tr&ecirc;n phản hồi từ người chơi. Do c&aacute;c thay đổi trong giai đoạn Tiền M&ugrave;a Giải sẽ được chuyển sang thời điểm bắt đầu m&ugrave;a giải Xếp Hạng (v&agrave; chủ yếu được thử nghiệm tr&ecirc;n m&aacute;y chủ PBE), ch&uacute;ng t&ocirc;i muốn chia sẻ về quy tr&igrave;nh xử l&yacute; phản hồi bởi v&igrave; ch&uacute;ng c&oacute; thể sẽ kh&ocirc;ng ngay lập tức dẫn đến những thay đổi lớn trước khi mọi thứ được ch&iacute;nh thức ra mắt.</p>\r\n\r\n<p>Loại phản hồi m&agrave; ch&uacute;ng t&ocirc;i c&oacute; thể xử l&yacute; nhanh ch&oacute;ng nhất l&agrave; c&aacute;c b&aacute;o c&aacute;o lỗi. Tiếp theo đ&oacute;, c&aacute;c phản hồi về những tương t&aacute;c&nbsp;<em>cụ thể</em>&nbsp;đ&ocirc;i khi c&oacute; thể gi&uacute;p &iacute;ch cho ch&uacute;ng t&ocirc;i. V&iacute; dụ như tương t&aacute;c giữa hiệu ứng trang bị với 1 kỹ năng nhất định của tướng hay c&aacute;ch c&aacute;c điều chỉnh về chỉ số ảnh hưởng đến những yếu tố như khả năng tiến h&oacute;a của Kai&#39;Sa. Điều n&agrave;y kh&aacute; tương đồng với sửa lỗi ở điểm ch&uacute;ng gi&uacute;p ch&uacute;ng t&ocirc;i tr&aacute;nh t&igrave;nh trạng lạm dụng v&agrave; c&aacute;c tương t&aacute;c ngo&agrave;i &yacute; muốn.</p>\r\n\r\n<p>Những phản hồi kh&oacute; nhằn nhất thường l&agrave; c&aacute;c quan điểm định t&iacute;nh về những t&iacute;nh năng chủ chốt của ch&uacute;ng t&ocirc;i, chẳng hạn như mức độ th&uacute; vị, c&ocirc;ng bằng, hữu &iacute;ch của ch&uacute;ng so với trước đ&acirc;y, hay liệu ch&uacute;ng c&oacute; ph&ugrave; hợp với LMHT hay kh&ocirc;ng. Ch&uacute;ng t&ocirc;i sử dụng phản hồi n&agrave;y để nắm bắt xem cần để mắt đến điều g&igrave; khi c&aacute;c thay đổi ch&iacute;nh thức l&ecirc;n s&oacute;ng chứ &iacute;t khi xử l&yacute; ngay tr&ecirc;n m&aacute;y chủ PBE. Ngay cả khi phản hồi từ m&aacute;y chủ PBE đ&aacute;ng ch&uacute; &yacute;, ch&uacute;ng t&ocirc;i vẫn muốn quan s&aacute;t c&aacute;ch người chơi ở khắp mọi nơi trải nghiệm những thay đổi n&agrave;y tr&ecirc;n m&aacute;y chủ ch&iacute;nh thức. Nếu phản hồi kh&ocirc;ng c&oacute; g&igrave; thay đổi, ch&uacute;ng t&ocirc;i sẽ giải quyết ch&uacute;ng trong những bản cập nhật tiếp theo.</p>\r\n\r\n<h3>L&yacute; Do N&ecirc;n Chơi Trong Th&aacute;ng 11 v&agrave; 12</h3>\r\n\r\n<p>Trước đ&acirc;y, v&igrave; chế độ Đấu Xếp Hạng thường đ&oacute;ng cửa v&agrave;o th&aacute;ng 11 v&agrave; 12, nhiều người chơi chờ đ&oacute;n những thay đổi to lớn trong giai đoạn Tiền M&ugrave;a Giải để gi&uacute;p cho LMHT duy tr&igrave; sự hấp dẫn cho đến hết năm. V&igrave; nội dung Tiền M&ugrave;a Giải sẽ được chuyển sang đầu năm, sau đ&acirc;y l&agrave; những nội dung kh&aacute;c ch&uacute;ng t&ocirc;i đ&atilde; chuẩn bị sẵn.</p>\r\n\r\n<p>Đầu ti&ecirc;n, kỳ đấu xếp hạng hiện tại sẽ k&eacute;o d&agrave;i đến th&aacute;ng 1. Thứ hai, nếu bạn th&iacute;ch trải nghiệm những th&uacute; vui&nbsp;<em>kh&ocirc;ng phải l&agrave;</em>&nbsp;leo hạng, ch&uacute;ng t&ocirc;i sẽ mang chế độ V&otilde; Đ&agrave;i trở lại trong th&aacute;ng 12!</p>\r\n\r\n<h3>Tần Suất Thay Đổi Xuy&ecirc;n Suốt Năm</h3>\r\n\r\n<p>D&ugrave; đ&atilde; đề cập ở ph&iacute;a tr&ecirc;n, ch&uacute;ng t&ocirc;i vẫn muốn nhắc lại rằng chuyển sang &aacute;p dụng m&ocirc; h&igrave;nh 3 kỳ xếp hạng v&agrave; đưa giai đoạn tiền m&ugrave;a giải đến th&aacute;ng 1 kh&ocirc;ng c&oacute; nghĩa l&agrave; ch&uacute;ng t&ocirc;i sẽ tung ra 3 bản cập nhật với quy m&ocirc; tiền m&ugrave;a giải mỗi năm. Ch&uacute;ng t&ocirc;i nhắm đến việc cho ra mắt 1 bản cập nhật với quy m&ocirc; giữa m&ugrave;a giải cho kỳ 2 v&agrave;o th&aacute;ng 5, v&agrave; 1 bản cập nhật nhỏ hơn cho kỳ 3 v&agrave;o th&aacute;ng 9. Việc c&oacute; 3 khung thời gian r&otilde; r&agrave;ng để thực hiện c&aacute;c sửa đổi to lớn đối với tr&ograve; chơi đảm bảo rằng người chơi sẽ kh&ocirc;ng phải chờ đợi&nbsp;<em>qu&aacute;</em>&nbsp;l&acirc;u trước khi ch&uacute;ng t&ocirc;i c&oacute; thể khắc phục c&aacute;c vấn đề đe dọa sự c&acirc;n bằng của tr&ograve; chơi.</p>\r\n\r\n<h3>X&oacute;a Bỏ Thời Gian Ngừng Đấu Xếp Hạng</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>D&ugrave; bổ sung th&ecirc;m th&aacute;ng 11 v&agrave; 12 v&agrave;o lịch Đấu Xếp Hạng sẽ mang lại niềm vui cho những người chơi chỉ &quot;c&agrave;y rank&quot;, những người chơi kh&aacute;c c&oacute; thể thấy lo lắng khi thiếu đi khoảng thời gian tất cả đều &quot;ngừng đấu xếp hạng&quot;. Ch&uacute;ng t&ocirc;i cho rằng việc &aacute;p dụng c&aacute;c kỳ xếp hạng thường xuy&ecirc;n hơn v&agrave; ngắn hơn sẽ gi&uacute;p người chơi an t&acirc;m bỏ qua 1 kỳ rồi trở lại v&agrave; lợi hại hơn xưa. Dẫu vậy, ch&uacute;ng t&ocirc;i cũng sẽ theo d&otilde;i kỳ xếp hạng được k&eacute;o d&agrave;i hiện tại v&agrave; Kỳ 3 trong năm tới để xem liệu thực tế c&oacute; đ&uacute;ng như vậy hay kh&ocirc;ng.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Đ&acirc;y l&agrave; thay đổi to lớn nhất ch&uacute;ng t&ocirc;i từng thực hiện đối với cơ cấu thường ni&ecirc;n của LMHT. Ch&uacute;ng t&ocirc;i rất h&agrave;o hứng mong chờ được thấy những lợi &iacute;ch m&agrave; thay đổi n&agrave;y mang lại, nhưng cũng biết rằng thay đổi ở cường độ n&agrave;y c&oacute; thể g&acirc;y cho&aacute;ng ngợp. Ch&uacute;ng t&ocirc;i sẽ cố gắng hết sức để đảm bảo việc chuyển đổi su&ocirc;n sẻ nhất c&oacute; thể v&agrave; mong rằng bạn cũng cảm thấy h&agrave;o hứng!</p>\r\n', 'Sáng hôm nay, chúng tôi đã tuyên bố rằng bắt đầu từ năm sau, LMHT sẽ được chia thành 3 kỳ Xếp Hạng. Ngoài ra, những thay đổi lớn đối với lối chơi thường dành cho giai đoạn Tiền Mùa Giải vào tháng 11 thay vào đó sẽ được ra mắt vào tháng 1 năm sau.', '2023-08-30', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbrole`
--

CREATE TABLE `tbrole` (
  `idrole` int(11) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbrole`
--

INSERT INTO `tbrole` (`idrole`, `role`) VALUES
(1, 'Top'),
(2, 'Jungle'),
(3, 'Middle'),
(4, 'ADC'),
(5, 'Support');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbtierlist`
--

CREATE TABLE `tbtierlist` (
  `idtier` int(11) NOT NULL,
  `tier` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbtierlist`
--

INSERT INTO `tbtierlist` (`idtier`, `tier`) VALUES
(1, 'S'),
(2, 'A'),
(3, 'B');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbvideokill`
--

CREATE TABLE `tbvideokill` (
  `idvideo` int(11) NOT NULL,
  `idhero` int(11) NOT NULL,
  `videoint` varchar(255) NOT NULL,
  `video1` varchar(255) NOT NULL,
  `video2` varchar(255) NOT NULL,
  `video3` varchar(255) NOT NULL,
  `video4` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbvideokill`
--

INSERT INTO `tbvideokill` (`idvideo`, `idhero`, `videoint`, `video1`, `video2`, `video3`, `video4`) VALUES
(1, 1, 'ability_0266_P1.webm           ', 'ability_0266_Q1.webm           ', 'ability_0266_W1.webm           ', 'ability_0266_E1.webm           ', 'ability_0266_R1.webm           '),
(2, 3, 'ability_0103_P1.webm   ', 'ability_0103_Q1.webm   ', 'ability_0103_W1.webm   ', 'ability_0103_E1.webm   ', 'ability_0103_R1.webm   '),
(3, 4, 'ability_0084_P1.webm  ', 'ability_0084_Q1.webm  ', 'ability_0084_W1.webm  ', 'ability_0084_E1.webm  ', 'ability_0084_R1.webm  '),
(4, 5, 'ability_0166_P1.webm  ', 'ability_0166_Q1.webm  ', 'ability_0166_W1.webm  ', 'ability_0166_E1.webm  ', 'ability_0166_R1.webm  '),
(5, 6, 'ability_0350_P1.webm  ', 'ability_0350_Q1.webm  ', 'ability_0350_W1.webm  ', 'ability_0350_E1.webm  ', 'ability_0350_R1.webm  '),
(6, 7, 'ability_0011_P1.webm ', 'ability_0011_Q1.webm ', 'ability_0011_W1.webm ', 'ability_0011_E1.webm ', 'ability_0011_R1.webm '),
(7, 8, 'ability_0498_P1.webm  ', 'ability_0498_Q1.webm  ', 'ability_0498_W1.webm  ', 'ability_0498_E1.webm  ', 'ability_0498_R1.webm  '),
(8, 9, 'ability_0122_P1.webm ', 'ability_0122_Q1.webm ', 'ability_0122_W1.webm ', 'ability_0122_E1.webm ', 'ability_0122_R1.webm '),
(9, 10, 'ability_0238_P1.webm', 'ability_0238_Q1.webm', 'ability_0238_W1.webm', 'ability_0238_E1.webm', 'ability_0238_R1.webm'),
(10, 11, 'thresh-p.webm', 'thresh-q.webm', 'thresh-w.webm', 'thresh-e.webm', 'thresh-r.webm'),
(11, 12, 'ability_0157_P1.webm', 'ability_0157_Q1.webm', 'ability_0157_W1.webm', 'ability_0157_E1.webm', 'ability_0157_R1.webm'),
(12, 13, 'ability_0523_P1.webm', 'ability_0523_Q1.webm', 'ability_0523_W1.webm', '', 'ability_0523_R1.webm'),
(13, 14, '    ', 'ability_0081_Q1.webm    ', 'ability_0081_W1.webm    ', 'ability_0081_E1.webm    ', 'ability_0081_R1.webm    '),
(14, 15, 'ability_0040_P1.webm', 'ability_0040_Q1.webm', 'ability_0040_W1.webm', 'ability_0040_E1.webm', 'ability_0040_R1.webm'),
(15, 16, 'ability_0013_P1.mp4', 'ability_0013_Q1.webm', 'ability_0013_W1.webm', 'ability_0013_E1.webm', 'ability_0013_R1.webm');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-25 09:47:29', NULL, 1),
(2, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-25 10:22:50', '25-08-2023 04:09:07 PM', 1),
(3, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-25 10:40:36', '25-08-2023 04:10:38 PM', 1),
(4, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-25 11:36:34', '25-08-2023 05:27:14 PM', 1),
(5, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-25 12:05:29', '25-08-2023 06:36:20 PM', 1),
(6, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-25 13:06:26', '25-08-2023 09:47:15 PM', 1),
(7, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-25 16:17:19', '25-08-2023 10:21:25 PM', 1),
(8, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-25 16:51:31', '25-08-2023 10:46:41 PM', 1),
(9, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-25 17:16:46', '25-08-2023 10:54:05 PM', 1),
(10, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-25 17:24:09', '25-08-2023 10:59:24 PM', 1),
(11, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-25 17:29:32', '25-08-2023 11:01:01 PM', 1),
(12, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-25 17:31:06', '25-08-2023 11:02:12 PM', 1),
(13, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-25 17:32:16', '25-08-2023 11:10:26 PM', 1),
(14, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-25 17:40:31', '25-08-2023 11:16:56 PM', 1),
(15, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-26 17:11:50', NULL, 1),
(16, 'thinh@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-26 17:45:34', '26-08-2023 11:32:05 PM', 1),
(17, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-27 01:20:30', '27-08-2023 07:11:49 AM', 1),
(18, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-27 15:07:41', NULL, 1),
(19, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-28 11:02:27', '28-08-2023 04:34:37 PM', 1),
(20, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-28 11:05:32', '28-08-2023 04:41:44 PM', 1),
(21, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-28 11:11:48', '28-08-2023 04:42:43 PM', 1),
(22, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-28 11:12:48', '28-08-2023 04:43:33 PM', 1),
(23, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-28 11:13:37', NULL, 0),
(24, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-28 11:13:40', '29-08-2023 12:28:19 PM', 1),
(25, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-29 06:58:27', '29-08-2023 02:08:35 PM', 1),
(26, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-29 08:38:47', NULL, 1),
(27, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-29 08:39:08', '29-08-2023 02:23:12 PM', 1),
(28, 'djnajdnajdnj@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-30 15:36:49', NULL, 0),
(29, '1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-30 15:39:01', '31-08-2023 11:05:47 AM', 1),
(30, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-31 06:07:10', '31-08-2023 11:37:45 AM', 1),
(31, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-31 06:08:43', '31-08-2023 11:40:50 AM', 1),
(32, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-31 07:26:43', '31-08-2023 12:57:50 PM', 1),
(33, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-31 07:56:58', '01-09-2023 07:16:12 PM', 1),
(34, '1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-01 13:46:23', '01-09-2023 07:44:10 PM', 1),
(35, '1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-01 14:14:17', '01-09-2023 07:56:41 PM', 1),
(36, '1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-01 14:26:46', '01-09-2023 08:00:36 PM', 1),
(37, '1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-01 14:30:41', '01-09-2023 08:15:15 PM', 1),
(38, '1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-01 14:45:20', '01-09-2023 08:22:20 PM', 1),
(39, '1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-01 14:52:29', '01-09-2023 08:55:17 PM', 1),
(40, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-02 02:44:23', '02-09-2023 10:15:27 PM', 1),
(41, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-05 13:16:33', '05-09-2023 07:13:56 PM', 1),
(42, '1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-05 13:45:38', NULL, 1),
(43, '1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-05 14:36:29', '05-09-2023 08:18:55 PM', 1),
(44, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-05 14:49:00', '05-09-2023 08:50:19 PM', 1),
(45, 'thinh1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-05 15:44:11', '05-09-2023 09:16:54 PM', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `regDate`, `updationDate`) VALUES
(1, 'Nguyễn Công Thịnh', 'thinh1@gmail.com', 123456, '202cb962ac59075b964b07152d234b70', '123', '123', '123', 123, '2023-08-25 09:47:21', NULL),
(4, 'Nguyễn Công Thịnh', 'thinh@gmail.com', 123456, '202cb962ac59075b964b07152d234b70', '1', '1', '1', 1, '2023-08-26 17:45:23', NULL),
(5, 'Nguyễn Công thịnh', '1@gmail.com', 1231313131, '202cb962ac59075b964b07152d234b70', '123', '123', '123', 123, '2023-08-30 15:38:27', NULL),
(6, 'Nguyễn Công Thịnh ', 'thinh2@gmail.com', 123456789, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, NULL, '2023-08-31 06:21:35', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `combo`
--
ALTER TABLE `combo`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`idorder`);

--
-- Chỉ mục cho bảng `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`idod`);

--
-- Chỉ mục cho bảng `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbban`
--
ALTER TABLE `tbban`
  ADD PRIMARY KEY (`idban`);

--
-- Chỉ mục cho bảng `tbcounter`
--
ALTER TABLE `tbcounter`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbdesckill`
--
ALTER TABLE `tbdesckill`
  ADD PRIMARY KEY (`iddesc`);

--
-- Chỉ mục cho bảng `tbhero`
--
ALTER TABLE `tbhero`
  ADD PRIMARY KEY (`idhero`);

--
-- Chỉ mục cho bảng `tbpost`
--
ALTER TABLE `tbpost`
  ADD PRIMARY KEY (`idpost`);

--
-- Chỉ mục cho bảng `tbrole`
--
ALTER TABLE `tbrole`
  ADD PRIMARY KEY (`idrole`);

--
-- Chỉ mục cho bảng `tbtierlist`
--
ALTER TABLE `tbtierlist`
  ADD PRIMARY KEY (`idtier`);

--
-- Chỉ mục cho bảng `tbvideokill`
--
ALTER TABLE `tbvideokill`
  ADD PRIMARY KEY (`idvideo`);

--
-- Chỉ mục cho bảng `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `combo`
--
ALTER TABLE `combo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `idorder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `idod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tbban`
--
ALTER TABLE `tbban`
  MODIFY `idban` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `tbcounter`
--
ALTER TABLE `tbcounter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `tbdesckill`
--
ALTER TABLE `tbdesckill`
  MODIFY `iddesc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `tbhero`
--
ALTER TABLE `tbhero`
  MODIFY `idhero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `tbpost`
--
ALTER TABLE `tbpost`
  MODIFY `idpost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `tbtierlist`
--
ALTER TABLE `tbtierlist`
  MODIFY `idtier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tbvideokill`
--
ALTER TABLE `tbvideokill`
  MODIFY `idvideo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
