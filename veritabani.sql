-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 16 Haz 2020, 13:38:03
-- Sunucu sürümü: 10.4.11-MariaDB
-- PHP Sürümü: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `insurance_db`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `accident`
--

CREATE TABLE `accident` (
  `id` int(11) NOT NULL,
  `accident_date` date DEFAULT NULL,
  `policy_id` int(11) DEFAULT NULL,
  `accident_text` varchar(500) DEFAULT NULL,
  `amount_paid` double DEFAULT NULL,
  `is_pay` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `township_id` int(11) DEFAULT NULL,
  `full_address` varchar(500) DEFAULT NULL,
  `address_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `address`
--

INSERT INTO `address` (`id`, `city_id`, `township_id`, `full_address`, `address_type_id`) VALUES
(1, 34, 424, 'Istanbul // Bakırköy', 3),
(2, 6, 63, 'Ankara // Çubuk', 3),
(4, 6, 57, 'Barışın evi', 0),
(5, 6, 57, 'Barışın evi', 0),
(6, 1, 5, 'İmamoğlu caddesi', 0),
(7, 1, 1, 'asdasd', 0),
(8, 1, 1, 'asdasd', 0),
(9, 1, 1, 'asdsdaasd', 0),
(10, 1, 1, 'blabla', 1),
(11, 8, 103, 'branch denemesi', 3),
(12, 2, 17, 'Gerger ', 3),
(13, 3, 26, 'Bolvadin bolvadin', 1),
(14, 5, 52, 'asd', 1),
(15, 5, 53, 'asd', 1),
(16, 3, 27, 'Çayındayım', 1),
(17, 1, 6, 'asdasd', 1),
(18, 5, 51, 'asdasd', 1),
(19, 1, 1, 'asd', 1),
(20, 3, 26, 'asd', 1),
(21, 1, 1, 'asdasdasd', 1),
(23, 5, 55, 'asdfasd', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `address_type`
--

CREATE TABLE `address_type` (
  `id` int(11) NOT NULL,
  `address_type_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `address_type`
--

INSERT INTO `address_type` (`id`, `address_type_name`) VALUES
(1, 'customer'),
(2, 'employee'),
(3, 'branch');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `authorization`
--

CREATE TABLE `authorization` (
  `id` int(11) NOT NULL,
  `auth_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `authorization`
--

INSERT INTO `authorization` (`id`, `auth_name`) VALUES
(0, 'customer'),
(1, 'personal'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `branch_name` varchar(50) DEFAULT NULL,
  `branch_address_id` int(11) DEFAULT NULL,
  `branch_start_date` date DEFAULT NULL,
  `branch_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `branch`
--

INSERT INTO `branch` (`id`, `branch_name`, `branch_address_id`, `branch_start_date`, `branch_type_id`) VALUES
(1, 'Istanbul', 1, '2020-06-11', 1),
(2, 'Ankara', 2, '2020-06-10', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `branch_type`
--

CREATE TABLE `branch_type` (
  `id` int(11) NOT NULL,
  `branch_type_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `branch_type`
--

INSERT INTO `branch_type` (`id`, `branch_type_name`) VALUES
(1, 'center'),
(2, 'country');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `car`
--

CREATE TABLE `car` (
  `id` int(11) NOT NULL,
  `production_year` date DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `hp` int(11) DEFAULT NULL,
  `plate` varchar(12) DEFAULT NULL,
  `chassis_number` varchar(50) DEFAULT NULL,
  `motor_number` varchar(50) DEFAULT NULL,
  `car_type_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `lisance_number` varchar(50) DEFAULT NULL,
  `policy_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `car_brand`
--

CREATE TABLE `car_brand` (
  `id` int(11) NOT NULL,
  `car_brand_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `car_model`
--

CREATE TABLE `car_model` (
  `id` int(11) NOT NULL,
  `car_model_name` varchar(50) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `car_type`
--

CREATE TABLE `car_type` (
  `id` int(11) NOT NULL,
  `car_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `car_type`
--

INSERT INTO `car_type` (`id`, `car_type`) VALUES
(1, 'personal'),
(2, 'enterprise');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `city`
--

INSERT INTO `city` (`city_id`, `city_name`) VALUES
(1, 'Adana'),
(2, 'Adıyaman'),
(3, 'Afyonkarahisar'),
(4, 'Ağrı'),
(5, 'Amasya'),
(6, 'Ankara'),
(7, 'Antalya'),
(8, 'Artvin'),
(9, 'Aydın'),
(10, 'Balıkesir'),
(11, 'Bilecik'),
(12, 'Bingöl'),
(13, 'Bitlis'),
(14, 'Bolu'),
(15, 'Burdur'),
(16, 'Bursa'),
(17, 'Çanakkale'),
(18, 'Çankırı'),
(19, 'Çorum'),
(20, 'Denizli'),
(21, 'Diyarbakır'),
(22, 'Edirne'),
(23, 'Elazığ'),
(24, 'Erzincan'),
(25, 'Erzurum'),
(26, 'Eskişehir'),
(27, 'Gaziantep'),
(28, 'Giresun'),
(29, 'Gümüşhane'),
(30, 'Hakkari'),
(31, 'Hatay'),
(32, 'Isparta'),
(33, 'Mersin'),
(34, 'İstanbul'),
(35, 'İzmir'),
(36, 'Kars'),
(37, 'Kastamonu'),
(38, 'Kayseri'),
(39, 'Kırklareli'),
(40, 'Kırşehir'),
(41, 'Kocaeli'),
(42, 'Konya'),
(43, 'Kütahya'),
(44, 'Malatya'),
(45, 'Manisa'),
(46, 'Kahramanmaraş'),
(47, 'Mardin'),
(48, 'Muğla'),
(49, 'Muş'),
(50, 'Nhouseşehir'),
(51, 'Niğde'),
(52, 'Ordu'),
(53, 'Rize'),
(54, 'Sakarya'),
(55, 'Samsun'),
(56, 'Siirt'),
(57, 'Sinop'),
(58, 'Sivas'),
(59, 'Tekirdağ'),
(60, 'Tokat'),
(61, 'Trabzon'),
(62, 'Tunceli'),
(63, 'Şanlıurfa'),
(64, 'Uşak'),
(65, 'Van'),
(66, 'Yozgat'),
(67, 'Zonguldak'),
(68, 'Aksaray'),
(69, 'Bayburt'),
(70, 'Karaman'),
(71, 'Kırıkkale'),
(72, 'Batman'),
(73, 'Şırnak'),
(74, 'Bartın'),
(75, 'Ardahan'),
(76, 'Iğdır'),
(77, 'Yalova'),
(78, 'Karabük'),
(79, 'Kilis'),
(80, 'Osmaniye'),
(81, 'Düzce');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `social_number` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `phone_number` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `customer_address_id` int(11) DEFAULT NULL,
  `birthday` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `customer`
--

INSERT INTO `customer` (`id`, `social_number`, `name`, `surname`, `phone_number`, `email`, `customer_address_id`, `birthday`, `user_id`) VALUES
(1, '12345678910', 'Bülent', 'Bülent', '542542542', 'customer@customer.com', 3, '26-05-1990', 1),
(2, 'asd', 'asdasd', 'asdasd', 'asdasd', 'ads', 15, 'asdasd', 6),
(3, '145396325', 'asdasd', 'asdasd', '165165165', 'blabla@bla.com', 16, 'asdasd', 7),
(4, '12345678910', '2165165', '561651', '5166', 'onemli.com', 17, '65196516', 8),
(5, 'asd', 'asd', 'asd', 'asd', 'asd@ad.com', 18, 'asd', 9),
(6, 'adsads', 'asd', 'asd', 'asdads', 'asd', 19, 'asd', 10),
(7, 'asd', 'asd', 'asd', 'ads', 'asdasd', 20, 'asd', 11),
(8, 'asd', 'asdasdasd', 'asdasdasd', 'asd', 'asdasdasd', 21, 'asdasdasd', 12),
(10, '123', 'Bahtiyar Barış', 'Everese', '123', '123', 1, '123', 4),
(11, '123456789', 'Intel', 'i5', 'asd', 'bbarisbolat@gmail.com', 23, '21965161', 16);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `department_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `department`
--

INSERT INTO `department` (`id`, `department_name`) VALUES
(1, 'customer services'),
(2, 'support personnel'),
(3, 'Personnel'),
(4, 'managament');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `house`
--

CREATE TABLE `house` (
  `id` int(11) NOT NULL,
  `building_year` date DEFAULT NULL,
  `house_price` int(11) DEFAULT NULL,
  `house_type_id` int(11) DEFAULT NULL,
  `house_room_count` int(11) DEFAULT NULL,
  `house_square_meter` int(11) DEFAULT NULL,
  `house_address_id` int(11) DEFAULT NULL,
  `house_owner_id` int(11) DEFAULT NULL,
  `policy_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `house_type`
--

CREATE TABLE `house_type` (
  `id` int(11) NOT NULL,
  `house_type_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `house_type`
--

INSERT INTO `house_type` (`id`, `house_type_name`) VALUES
(1, 'wood'),
(2, 'stone'),
(3, 'beton'),
(4, 'prefabricated');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `insurance_type`
--

CREATE TABLE `insurance_type` (
  `id` int(11) NOT NULL,
  `insurance_type_name` varchar(50) DEFAULT NULL,
  `insurance_percent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `insurance_type`
--

INSERT INTO `insurance_type` (`id`, `insurance_type_name`, `insurance_percent`) VALUES
(1, 'house', 60),
(2, 'car', 75);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `job`
--

INSERT INTO `job` (`id`, `job_name`) VALUES
(1, 'sales'),
(2, 'personnel'),
(3, 'IT'),
(4, 'administrator');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personal`
--

CREATE TABLE `personal` (
  `id` int(11) NOT NULL,
  `personal_social_id` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `birthday` varchar(64) DEFAULT NULL,
  `record_date` varchar(64) DEFAULT NULL,
  `phone_number` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `commission` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `personal`
--

INSERT INTO `personal` (`id`, `personal_social_id`, `name`, `surname`, `birthday`, `record_date`, `phone_number`, `email`, `department_id`, `job_id`, `branch_id`, `commission`) VALUES
(1, '12345678911', 'Baris', 'MySQL', '15-06-2000', '15-06-2000', '123456789', 'admin@admin.com', 4, 4, 2, 100),
(2, 'asd', 'asd', 'asd', 'asd', 'asd', 'asd', 'asd', 3, 3, 2, 21);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `policy`
--

CREATE TABLE `policy` (
  `id` int(11) NOT NULL,
  `policy_type_id` int(11) DEFAULT NULL,
  `insurance_type_id` int(11) DEFAULT NULL,
  `start_date` varchar(50) DEFAULT NULL,
  `pay_date` varchar(50) DEFAULT NULL,
  `end_date` varchar(50) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `policy`
--

INSERT INTO `policy` (`id`, `policy_type_id`, `insurance_type_id`, `start_date`, `pay_date`, `end_date`, `cost`, `employee_id`, `customer_id`) VALUES
(1, 1, 1, '18-09-1999', '18-09-2020', '18-09-2022', 1780000, 1, 1),
(2, 2, 2, '18-09-1999', '18-09-2020', '18-09-2022', 350000, 1, 3),
(4, 2, 1, '63132', '12332', '321321', 950000, 1, 4),
(5, 2, 2, '654165', '564654', '465465', 4654, 1, 11);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `policy_type`
--

CREATE TABLE `policy_type` (
  `id` int(11) NOT NULL,
  `policy_type_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `policy_type`
--

INSERT INTO `policy_type` (`id`, `policy_type_name`) VALUES
(1, 'individual'),
(2, 'entreprise');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `township`
--

CREATE TABLE `township` (
  `id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `township_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `township`
--

INSERT INTO `township` (`id`, `city_id`, `township_name`) VALUES
(1, 1, 'Aladağ'),
(2, 1, 'Ceyhan'),
(3, 1, 'Çukurova'),
(4, 1, 'Feke'),
(5, 1, 'İmamoğlu'),
(6, 1, 'Karaisalı'),
(7, 1, 'Karataş'),
(8, 1, 'Kozan'),
(9, 1, 'Pozantı'),
(10, 1, 'Saimbeyli'),
(11, 1, 'Sarıçam'),
(12, 1, 'Tufanbeyli'),
(13, 1, 'Yumurtalık'),
(14, 1, 'Yüreğir'),
(15, 2, 'Besni'),
(16, 2, 'Çelikhan'),
(17, 2, 'Gerger'),
(18, 2, 'Gölbaşı'),
(19, 2, 'Kahta'),
(20, 2, 'Merkez'),
(21, 2, 'Samsat'),
(22, 2, 'Sincik'),
(23, 2, 'Tut'),
(24, 3, 'Başmakçı'),
(25, 3, 'Bayat'),
(26, 3, 'Bolvadin'),
(27, 3, 'Çay'),
(28, 3, 'Çobanlar'),
(29, 3, 'Dazkırı'),
(30, 3, 'Dinar'),
(31, 3, 'Emirdağ'),
(32, 3, 'houseciler'),
(33, 3, 'Hocalar'),
(34, 3, 'İhsaniye'),
(35, 3, 'İscehisar'),
(36, 3, 'Kızılören'),
(37, 3, 'Merkez'),
(38, 3, 'Sandıklı'),
(39, 3, 'Sultandağı'),
(40, 3, 'Şuhut'),
(41, 4, 'Diyadin'),
(42, 4, 'Doğubayazıt'),
(43, 4, 'Eleşkirt'),
(44, 4, 'Hamur'),
(45, 4, 'Merkez'),
(46, 4, 'Patnos'),
(47, 4, 'Taşlıçay'),
(48, 4, 'Tutak'),
(49, 5, 'Göynücek'),
(50, 5, 'Gümüşhacıköy'),
(51, 5, 'Hamamözü'),
(52, 5, 'Merkez'),
(53, 5, 'Merzifon'),
(54, 5, 'Suluova'),
(55, 5, 'Taşova'),
(56, 6, 'Akyurt'),
(57, 6, 'Altındağ'),
(58, 6, 'Ayaş'),
(59, 6, 'Bala'),
(60, 6, 'Beypazarı'),
(61, 6, 'Çamlıdere'),
(62, 6, 'Çankaya'),
(63, 6, 'Çubuk'),
(64, 6, 'Elmadağ'),
(65, 6, 'Etimesgut'),
(66, 6, 'houseren'),
(67, 6, 'Gölbaşı'),
(68, 6, 'Güdül'),
(69, 6, 'Haymana'),
(70, 6, 'Kalecik'),
(71, 6, 'accidentn'),
(72, 6, 'Keçiören'),
(73, 6, 'Kızılcahamam'),
(74, 6, 'Mamak'),
(75, 6, 'Nallıhan'),
(76, 6, 'Polatlı'),
(77, 6, 'Pursaklar'),
(78, 6, 'Sincan'),
(79, 6, 'Şereflikoçhisar'),
(80, 6, 'Yenimahalle'),
(81, 7, 'Akseki'),
(82, 7, 'Aksu'),
(83, 7, 'Alanya'),
(84, 7, 'Demre'),
(85, 7, 'Döşemealtı'),
(86, 7, 'Elmalı'),
(87, 7, 'Finike'),
(88, 7, 'Gazipaşa'),
(89, 7, 'Gündoğmuş'),
(90, 7, 'İbradı'),
(91, 7, 'Kaş'),
(92, 7, 'Kemer'),
(93, 7, 'Kepez'),
(94, 7, 'Konyaaltı'),
(95, 7, 'Korkuteli'),
(96, 7, 'Kumluca'),
(97, 7, 'Manavgat'),
(98, 7, 'Muratpaşa'),
(99, 7, 'Serik'),
(100, 8, 'Ardanuç'),
(101, 8, 'Arhavi'),
(102, 8, 'Borçka'),
(103, 8, 'Hopa'),
(104, 8, 'Merkez'),
(105, 8, 'Murgul'),
(106, 8, 'Şavşat'),
(107, 8, 'Yusufeli'),
(108, 9, 'Bozdoğan'),
(109, 9, 'Buharkent'),
(110, 9, 'Çine'),
(111, 9, 'Didim'),
(112, 9, 'Efeler'),
(113, 9, 'Germencik'),
(114, 9, 'İncirliova'),
(115, 9, 'Kcarasu'),
(116, 9, 'Karpuzlu'),
(117, 9, 'Koçarlı'),
(118, 9, 'Köşk'),
(119, 9, 'Kuşadası'),
(120, 9, 'Kuyucak'),
(121, 9, 'Nazilli'),
(122, 9, 'Söke'),
(123, 9, 'Sultanhisar'),
(124, 9, 'Yenipazar'),
(125, 10, 'Altıeylül'),
(126, 10, 'Ayvalık'),
(127, 10, 'Balya'),
(128, 10, 'Bandırma'),
(129, 10, 'Bigadiç'),
(130, 10, 'Burhaniye'),
(131, 10, 'Dursunbey'),
(132, 10, 'Edremit'),
(133, 10, 'Erdek'),
(134, 10, 'Gömeç'),
(135, 10, 'Gönen'),
(136, 10, 'Havran'),
(137, 10, 'İvrindi'),
(138, 10, 'Karesi'),
(139, 10, 'Kepsut'),
(140, 10, 'Manyas'),
(141, 10, 'Marmara'),
(142, 10, 'Savaştepe'),
(143, 10, 'Sındırgı'),
(144, 10, 'Susurluk'),
(145, 11, 'Bozüyük'),
(146, 11, 'Gölpazarı'),
(147, 11, 'İnhisar'),
(148, 11, 'Merkez'),
(149, 11, 'Osmaneli'),
(150, 11, 'Pazaryeri'),
(151, 11, 'Söğüt'),
(152, 11, 'Yenipazar'),
(153, 12, 'Adaklı'),
(154, 12, 'Genç'),
(155, 12, 'Karlıova'),
(156, 12, 'Kiğı'),
(157, 12, 'Merkez'),
(158, 12, 'Solhan'),
(159, 12, 'Yayladere'),
(160, 12, 'Yedisu'),
(161, 13, 'Adilchouseaz'),
(162, 13, 'Ahlat'),
(163, 13, 'Güroymak'),
(164, 13, 'Hizan'),
(165, 13, 'Merkez'),
(166, 13, 'Mutki'),
(167, 13, 'Tatvan'),
(168, 14, 'Dörtdivan'),
(169, 14, 'Gerede'),
(170, 14, 'Göynük'),
(171, 14, 'Kıbrıscık'),
(172, 14, 'Mengen'),
(173, 14, 'Merkez'),
(174, 14, 'Mudurnu'),
(175, 14, 'Seben'),
(176, 14, 'Yeniçağa'),
(177, 15, 'Ağlasun'),
(178, 15, 'Altınyayla'),
(179, 15, 'Bucak'),
(180, 15, 'Çavdır'),
(181, 15, 'Çeltikçi'),
(182, 15, 'Gölhisar'),
(183, 15, 'Karamanlı'),
(184, 15, 'Kemer'),
(185, 15, 'Merkez'),
(186, 15, 'Tefenni'),
(187, 15, 'Yeşilova'),
(188, 16, 'Büyükorhan'),
(189, 16, 'Gemlik'),
(190, 16, 'Gürsu'),
(191, 16, 'Harmancık'),
(192, 16, 'İnegöl'),
(193, 16, 'İznik'),
(194, 16, 'Kcarabey'),
(195, 16, 'Keles'),
(196, 16, 'Kestel'),
(197, 16, 'Mudanya'),
(198, 16, 'Mustafa Kemal Paşa'),
(199, 16, 'Nilüfer'),
(200, 16, 'Orhaneli'),
(201, 16, 'Orhangazi'),
(202, 16, 'Osmangazi'),
(203, 16, 'Yenişehir'),
(204, 16, 'Yıldırım'),
(205, 17, 'Ayvacık'),
(206, 17, 'Bayramiç'),
(207, 17, 'Biga'),
(208, 17, 'Çan'),
(209, 17, 'Eceabat'),
(210, 17, 'Ezine'),
(211, 17, 'Gelibolu'),
(212, 17, 'Gökçeada'),
(213, 17, 'Lapseki'),
(214, 17, 'Merkez'),
(215, 17, 'Yenice'),
(216, 18, 'Atkcaralar'),
(217, 18, 'Bayramören'),
(218, 18, 'Çerkeş'),
(219, 18, 'Eldivan'),
(220, 18, 'Ilgaz'),
(221, 18, 'Kızılırmak'),
(222, 18, 'Korgun'),
(223, 18, 'Kurşunlu'),
(224, 18, 'Merkez'),
(225, 18, 'Orta'),
(226, 18, 'Şabanözü'),
(227, 18, 'Yapraklı'),
(228, 19, 'Alaca'),
(229, 19, 'Bayat'),
(230, 19, 'Boğazkale'),
(231, 19, 'Dodurga'),
(232, 19, 'İskilip'),
(233, 19, 'Kargı'),
(234, 19, 'Laçin'),
(235, 19, 'Mecitözü'),
(236, 19, 'Merkez'),
(237, 19, 'Oğuzlar'),
(238, 19, 'Ortaköy'),
(239, 19, 'Osmancık'),
(240, 19, 'Sungurlu'),
(241, 19, 'Uğurludağ'),
(242, 20, 'Acıpayam'),
(243, 20, 'Babadağ'),
(244, 20, 'Baklan'),
(245, 20, 'Bekilli'),
(246, 20, 'Beyağaç'),
(247, 20, 'Bozkurt'),
(248, 20, 'Buldan'),
(249, 20, 'Çal'),
(250, 20, 'Çameli'),
(251, 20, 'Çardak'),
(252, 20, 'Çivril'),
(253, 20, 'Güney'),
(254, 20, 'Honaz'),
(255, 20, 'Kale'),
(256, 20, 'Merkezefendi'),
(257, 20, 'Pamukkale'),
(258, 20, 'Sarayköy'),
(259, 20, 'Serinhisar'),
(260, 20, 'Tavas'),
(261, 21, 'Bağlar'),
(262, 21, 'Bismil'),
(263, 21, 'Çermik'),
(264, 21, 'Çınar'),
(265, 21, 'Çüngüş'),
(266, 21, 'Dicle'),
(267, 21, 'Eğil'),
(268, 21, 'Ergani'),
(269, 21, 'Hani'),
(270, 21, 'Hazro'),
(271, 21, 'Kayapınar'),
(272, 21, 'Kocaköy'),
(273, 21, 'Kulp'),
(274, 21, 'Lice'),
(275, 21, 'Silvan'),
(276, 21, 'Sur'),
(277, 21, 'Yenişehir'),
(278, 22, 'Enez'),
(279, 22, 'Havsa'),
(280, 22, 'İpsala'),
(281, 22, 'Keşan'),
(282, 22, 'Lalapaşa'),
(283, 22, 'Meriç'),
(284, 22, 'Merkez'),
(285, 22, 'Süloğlu'),
(286, 22, 'Uzunköprü'),
(287, 23, 'Ağın'),
(288, 23, 'Alacakaya'),
(289, 23, 'Arıcak'),
(290, 23, 'Baskil'),
(291, 23, 'Karakoçan'),
(292, 23, 'Keban'),
(293, 23, 'Kovancılar'),
(294, 23, 'Maden'),
(295, 23, 'Merkez'),
(296, 23, 'Palu'),
(297, 23, 'Sivrice'),
(298, 24, 'Çayırlı'),
(299, 24, 'İliç'),
(300, 24, 'Kemah'),
(301, 24, 'Kemaliye'),
(302, 24, 'Merkez'),
(303, 24, 'Otlukbeli'),
(304, 24, 'Refahiye'),
(305, 24, 'Tercan'),
(306, 24, 'Üzümlü'),
(307, 25, 'Aşkale'),
(308, 25, 'Aziziye'),
(309, 25, 'Çat'),
(310, 25, 'Hınıs'),
(311, 25, 'Horasan'),
(312, 25, 'İspir'),
(313, 25, 'Karaçoban'),
(314, 25, 'Karayazı'),
(315, 25, 'Köprüköy'),
(316, 25, 'Narman'),
(317, 25, 'Oltu'),
(318, 25, 'Olur'),
(319, 25, 'Palandöken'),
(320, 25, 'Pasinler'),
(321, 25, 'Pazaryolu'),
(322, 25, 'Şenkaya'),
(323, 25, 'Tekman'),
(324, 25, 'Tortum'),
(325, 25, 'Uzundere'),
(326, 25, 'Yakutiye'),
(327, 26, 'Alpu'),
(328, 26, 'Beylikova'),
(329, 26, 'Çifteler'),
(330, 26, 'Günyüzü'),
(331, 26, 'Han'),
(332, 26, 'İnönü'),
(333, 26, 'Mahmudiye'),
(334, 26, 'Mihalgazi'),
(335, 26, 'Mihalıççık'),
(336, 26, 'Odunpazarı'),
(337, 26, 'Sarıcakaya'),
(338, 26, 'Seyitgazi'),
(339, 26, 'Sivrihisar'),
(340, 26, 'Tepebaşı'),
(341, 27, 'Araban'),
(342, 27, 'İslahiye'),
(343, 27, 'Karkamış'),
(344, 27, 'Nizip'),
(345, 27, 'Nurdağı'),
(346, 27, 'Oğuzeli'),
(347, 27, 'Şahinbey'),
(348, 27, 'Şahinbey'),
(349, 27, 'Şehitkamil'),
(350, 27, 'Yavuzeli'),
(351, 28, 'Alucra'),
(352, 28, 'Bulancak'),
(353, 28, 'Çamoluk'),
(354, 28, 'Çanakçı'),
(355, 28, 'Dereli'),
(356, 28, 'Doğankent'),
(357, 28, 'Espiye'),
(358, 28, 'Eynesil'),
(359, 28, 'Görele'),
(360, 28, 'Güce'),
(361, 28, 'Keşap'),
(362, 28, 'Merkez'),
(363, 28, 'Piraziz'),
(364, 28, 'Şebinkarahisar'),
(365, 28, 'Tirebolu'),
(366, 28, 'Yağlıdere'),
(367, 29, 'Kelkit'),
(368, 29, 'Köse'),
(369, 29, 'Kürtün'),
(370, 29, 'Merkez'),
(371, 29, 'Şiran'),
(372, 29, 'Torul'),
(373, 30, 'Çukurca'),
(374, 30, 'Merkez'),
(375, 30, 'Şemdinli'),
(376, 30, 'Yüksekova'),
(377, 31, 'Altınözü'),
(378, 31, 'Antakya'),
(379, 31, 'Arsuz'),
(380, 31, 'Belen'),
(381, 31, 'Defne'),
(382, 31, 'Dörtyol'),
(383, 31, 'Erzin'),
(384, 31, 'Hassa'),
(385, 31, 'İskenderun'),
(386, 31, 'Kırıkhan'),
(387, 31, 'Kumlu'),
(388, 31, 'Payas'),
(389, 31, 'Reyhanlı'),
(390, 31, 'Samandağ'),
(391, 31, 'Yayladağı'),
(392, 32, 'Aksu'),
(393, 32, 'Atabey'),
(394, 32, 'Eğirdir'),
(395, 32, 'Gelendost'),
(396, 32, 'Gönen'),
(397, 32, 'Keçiborlu'),
(398, 32, 'Merkez'),
(399, 32, 'Senirkent'),
(400, 32, 'Sütçüler'),
(401, 32, 'Şarkikaraağaç'),
(402, 32, 'Uluborlu'),
(403, 32, 'Yalvaç'),
(404, 32, 'Yenişarbademli'),
(405, 33, 'Akdeniz'),
(406, 33, 'Anamur'),
(407, 33, 'Aydıncık'),
(408, 33, 'Bozyazı'),
(409, 33, 'Çamlıyayla'),
(410, 33, 'Erdemli'),
(411, 33, 'Gülnar'),
(412, 33, 'Mezitli'),
(413, 33, 'Mut'),
(414, 33, 'Silifke'),
(415, 33, 'Tarsus'),
(416, 33, 'Tarsus'),
(417, 33, 'Yenişehir'),
(418, 34, 'Adalar'),
(419, 34, 'Arnavutköy'),
(420, 34, 'Ataşehir'),
(421, 34, 'Avcılar'),
(422, 34, 'Bağcılar'),
(423, 34, 'Bahçelihouseler'),
(424, 34, 'Bakırköy'),
(425, 34, 'Başakşehir'),
(426, 34, 'Bayrampaşa'),
(427, 34, 'Beşiktaş'),
(428, 34, 'Beykoz'),
(429, 34, 'Beylikdüzü'),
(430, 34, 'Beyoğlu'),
(431, 34, 'Büyükçekmece'),
(432, 34, 'Çatalca'),
(433, 34, 'Çekmeköy'),
(434, 34, 'Esenler'),
(435, 34, 'Esenyurt'),
(436, 34, 'Eyüp'),
(437, 34, 'Fatih'),
(438, 34, 'Gaziosmanpaşa'),
(439, 34, 'Güngören'),
(440, 34, 'Kadıköy'),
(441, 34, 'Kağıthane'),
(442, 34, 'Kartal'),
(443, 34, 'Küçükçekmece'),
(444, 34, 'Maltepe'),
(445, 34, 'Pendik'),
(446, 34, 'Sancaktepe'),
(447, 34, 'Sarıyer'),
(448, 34, 'Silivri'),
(449, 34, 'Sultanbeyli'),
(450, 34, 'Sultangazi'),
(451, 34, 'Şile'),
(452, 34, 'Şişli'),
(453, 34, 'Tuzla'),
(454, 34, 'Ümraniye'),
(455, 34, 'Üsküdar'),
(456, 34, 'Zeytinburnu'),
(457, 35, 'Aliağa'),
(458, 35, 'Balçova'),
(459, 35, 'Bayındır'),
(460, 35, 'Bayraklı'),
(461, 35, 'Bergama'),
(462, 35, 'Beydağ'),
(463, 35, 'Bornova'),
(464, 35, 'Buca'),
(465, 35, 'Çeşme'),
(466, 35, 'Çiğli'),
(467, 35, 'Dikili'),
(468, 35, 'Foça'),
(469, 35, 'Gaziemir'),
(470, 35, 'Güzelbahçe'),
(471, 35, 'Karabağlar'),
(472, 35, 'Karaburun'),
(473, 35, 'Karşıyaka'),
(474, 35, 'Kemalpaşa'),
(475, 35, 'Kınık'),
(476, 35, 'Kiraz'),
(477, 35, 'Konak'),
(478, 35, 'Menderes'),
(479, 35, 'Menemen'),
(480, 35, 'Narlıdere'),
(481, 35, 'Ödemiş'),
(482, 35, 'Seferihisar'),
(483, 35, 'Selçuk'),
(484, 35, 'Tire'),
(485, 35, 'Torbalı'),
(486, 35, 'Urla'),
(487, 36, 'Akyaka'),
(488, 36, 'Arpaçay'),
(489, 36, 'Digor'),
(490, 36, 'Kağızman'),
(491, 36, 'Merkez'),
(492, 36, 'Sarıkamış'),
(493, 36, 'Selim'),
(494, 36, 'Susuz'),
(495, 37, 'Abana'),
(496, 37, 'Ağlı'),
(497, 37, 'Araç'),
(498, 37, 'Azdavay'),
(499, 37, 'Bozkurt'),
(500, 37, 'Cide'),
(501, 37, 'Çatalzeytin'),
(502, 37, 'Daday'),
(503, 37, 'Dhouserekani'),
(504, 37, 'Doğanyurt'),
(505, 37, 'Hanönü'),
(506, 37, 'İhsangazi'),
(507, 37, 'İnebolu'),
(508, 37, 'Küre'),
(509, 37, 'Merkez'),
(510, 37, 'Pınarbaşı'),
(511, 37, 'Seydiler'),
(512, 37, 'Şenpazar'),
(513, 37, 'Taşköprü'),
(514, 37, 'Tosya'),
(515, 38, 'Akkışla'),
(516, 38, 'Bünyan'),
(517, 38, 'Dhouseeli'),
(518, 38, 'Felahiye'),
(519, 38, 'Hacılar'),
(520, 38, 'İncesu'),
(521, 38, 'Kocasinan'),
(522, 38, 'Melikgazi'),
(523, 38, 'Özvatan'),
(524, 38, 'Pınarbaşı'),
(525, 38, 'Sarıoğlan'),
(526, 38, 'Sarız'),
(527, 38, 'Talas'),
(528, 38, 'Tomarza'),
(529, 38, 'Yahyalı'),
(530, 38, 'Yeşilhisar'),
(531, 39, 'Babaeski'),
(532, 39, 'Demirköy'),
(533, 39, 'Kofçaz'),
(534, 39, 'Lüleburgaz'),
(535, 39, 'Merkez'),
(536, 39, 'Pehlivanköy'),
(537, 39, 'Pınarhisar'),
(538, 39, 'Vize'),
(539, 40, 'Akçakent'),
(540, 40, 'Akpınar'),
(541, 40, 'Boztepe'),
(542, 40, 'Çiçekdağı'),
(543, 40, 'Kaman'),
(544, 40, 'Merkez'),
(545, 40, 'Mucur'),
(546, 41, 'Başiskele'),
(547, 41, 'Çayırova'),
(548, 41, 'Darıca'),
(549, 41, 'Derince'),
(550, 41, 'Dilovası'),
(551, 41, 'Gebze'),
(552, 41, 'Gölcük'),
(553, 41, 'İzmit'),
(554, 41, 'Kandıra'),
(555, 41, 'Karamürsel'),
(556, 41, 'Kartepe'),
(557, 41, 'Körfez'),
(558, 42, 'Ahırlı'),
(559, 42, 'Akören'),
(560, 42, 'Akşehir'),
(561, 42, 'Altınekin'),
(562, 42, 'Beyşehir'),
(563, 42, 'Bozkır'),
(564, 42, 'Cihanbeyli'),
(565, 42, 'Çeltik'),
(566, 42, 'Çumra'),
(567, 42, 'Derbent'),
(568, 42, 'Derebucak'),
(569, 42, 'Doğanhisar'),
(570, 42, 'Emirgazi'),
(571, 42, 'Ereğli'),
(572, 42, 'Güneysınır'),
(573, 42, 'Hadim'),
(574, 42, 'Halkapınar'),
(575, 42, 'Hüyük'),
(576, 42, 'Ilgın'),
(577, 42, 'Kadınhanı'),
(578, 42, 'Karapınar'),
(579, 42, 'Karatay'),
(580, 42, 'Kulu'),
(581, 42, 'Meram'),
(582, 42, 'Sarayönü'),
(583, 42, 'Selçuklu'),
(584, 42, 'Seydişehir'),
(585, 42, 'Taşkent'),
(586, 42, 'Tuzlukçu'),
(587, 42, 'Yalıhüyük'),
(588, 42, 'Yunak'),
(589, 43, 'Altıntaş'),
(590, 43, 'Aslanapa'),
(591, 43, 'Çavdarhisar'),
(592, 43, 'Domaniç'),
(593, 43, 'Dumlupınar'),
(594, 43, 'Emet'),
(595, 43, 'Gediz'),
(596, 43, 'Hisarcık'),
(597, 43, 'Merkez'),
(598, 43, 'Pazarlar'),
(599, 43, 'Simav'),
(600, 43, 'Şaphane'),
(601, 43, 'Tavşanlı'),
(602, 44, 'Akçadağ'),
(603, 44, 'Arapgir'),
(604, 44, 'Arguvan'),
(605, 44, 'Battalgazi'),
(606, 44, 'Darende'),
(607, 44, 'Doğanşehir'),
(608, 44, 'Doğanyol'),
(609, 44, 'Hekimhan'),
(610, 44, 'Kale'),
(611, 44, 'Kuluncak'),
(612, 44, 'Pütürge'),
(613, 44, 'Yazıhan'),
(614, 44, 'Yeşilyurt'),
(615, 45, 'Ahmetli'),
(616, 45, 'Akhisar'),
(617, 45, 'Alaşehir'),
(618, 45, 'Demirci'),
(619, 45, 'Gölmarmara'),
(620, 45, 'Gördes'),
(621, 45, 'Kırkağaç'),
(622, 45, 'Köprübaşı'),
(623, 45, 'Kula'),
(624, 45, 'Salihli'),
(625, 45, 'Sarıgöl'),
(626, 45, 'Saruhanlı'),
(627, 45, 'Selendi'),
(628, 45, 'Soma'),
(629, 45, 'Şehzadeler'),
(630, 45, 'Turgutlu'),
(631, 45, 'Yunusemre'),
(632, 46, 'Afşin'),
(633, 46, 'Andırın'),
(634, 46, 'Çağlayancerit'),
(635, 46, 'Dulkadiroğlu'),
(636, 46, 'Ekinözü'),
(637, 46, 'Elbistan'),
(638, 46, 'Göksun'),
(639, 46, 'Nurhak'),
(640, 46, 'Onikişubat'),
(641, 46, 'Pazarcık'),
(642, 46, 'Türkoğlu'),
(643, 47, 'Artuklu'),
(644, 47, 'Dargeçit'),
(645, 47, 'Derik'),
(646, 47, 'Kızıltepe'),
(647, 47, 'Mazıdağı'),
(648, 47, 'Midyat'),
(649, 47, 'Nusaybin'),
(650, 47, 'Ömerli'),
(651, 47, 'Savur'),
(652, 47, 'Yeşilli'),
(653, 48, 'Bodrum'),
(654, 48, 'Dalaman'),
(655, 48, 'Datça'),
(656, 48, 'Fethiye'),
(657, 48, 'Kavaklıdere'),
(658, 48, 'Köyceğiz'),
(659, 48, 'Marmaris'),
(660, 48, 'Menteşe'),
(661, 48, 'Milas'),
(662, 48, 'Ortaca'),
(663, 48, 'Seydikemer'),
(664, 48, 'Ula'),
(665, 48, 'Yatağan'),
(666, 49, 'Bulanık'),
(667, 49, 'Hasköy'),
(668, 49, 'Korkut'),
(669, 49, 'Malazgirt'),
(670, 49, 'Merkez'),
(671, 49, 'Varto'),
(672, 50, 'Acıgöl'),
(673, 50, 'Avanos'),
(674, 50, 'Derinkuyu'),
(675, 50, 'Gülşehir'),
(676, 50, 'Hacıbektaş'),
(677, 50, 'Kozaklı'),
(678, 50, 'Merkez'),
(679, 50, 'Ürgüp'),
(680, 51, 'Altunhisar'),
(681, 51, 'Bor'),
(682, 51, 'Çamardı'),
(683, 51, 'Çiftlik'),
(684, 51, 'Merkez'),
(685, 51, 'Ulukışla'),
(686, 52, 'Akkuş'),
(687, 52, 'Altınordu'),
(688, 52, 'Aybastı'),
(689, 52, 'Çamaş'),
(690, 52, 'Çatalpınar'),
(691, 52, 'Çaybaşı'),
(692, 52, 'Fatsa'),
(693, 52, 'Gölköy'),
(694, 52, 'Gülyalı'),
(695, 52, 'Gürgentepe'),
(696, 52, 'İkizce'),
(697, 52, 'Kabadüz'),
(698, 52, 'Kabataş'),
(699, 52, 'Korgan'),
(700, 52, 'Kumru'),
(701, 52, 'Mesudiye'),
(702, 52, 'Perşembe'),
(703, 52, 'Ulubey'),
(704, 52, 'Ünye'),
(705, 53, 'Ardeşen'),
(706, 53, 'Çamlıhemşin'),
(707, 53, 'Çayeli'),
(708, 53, 'Derepazarı'),
(709, 53, 'Fındıklı'),
(710, 53, 'Güneysu'),
(711, 53, 'Hemşin'),
(712, 53, 'İkizdere'),
(713, 53, 'İyidere'),
(714, 53, 'Kalkandere'),
(715, 53, 'Merkez'),
(716, 53, 'Pazar'),
(717, 54, 'Adapazarı'),
(718, 54, 'Akyazı'),
(719, 54, 'Arifiye'),
(720, 54, 'Erenler'),
(721, 54, 'Ferizli'),
(722, 54, 'Geyve'),
(723, 54, 'Hendek'),
(724, 54, 'Karapürçek'),
(725, 54, 'Karasu'),
(726, 54, 'Kaynarca'),
(727, 54, 'Kocaali'),
(728, 54, 'Pamukova'),
(729, 54, 'Sapanca'),
(730, 54, 'Serdivan'),
(731, 54, 'Söğütlü'),
(732, 54, 'Taraklı'),
(733, 55, '19 Mayıs'),
(734, 55, 'Alaçam'),
(735, 55, 'Asarcık'),
(736, 55, 'Atakum'),
(737, 55, 'Ayvacık'),
(738, 55, 'Bafra'),
(739, 55, 'Canik'),
(740, 55, 'Çarşamba'),
(741, 55, 'Havza'),
(742, 55, 'İlkadım'),
(743, 55, 'Kavak'),
(744, 55, 'Ladik'),
(745, 55, 'Salıpazarı'),
(746, 55, 'Tekkeköy'),
(747, 55, 'Terme'),
(748, 55, 'Vezirköprü'),
(749, 55, 'Yakakent'),
(750, 56, 'Baykan'),
(751, 56, 'Eruh'),
(752, 56, 'Kurtalan'),
(753, 56, 'Merkez'),
(754, 56, 'Pervari'),
(755, 56, 'Şirvan'),
(756, 56, 'Tillo'),
(757, 57, 'Ayancık'),
(758, 57, 'Boyabat'),
(759, 57, 'Dikmen'),
(760, 57, 'Durağan'),
(761, 57, 'Erfelek'),
(762, 57, 'Gerze'),
(763, 57, 'Merkez'),
(764, 57, 'Saraydüzü'),
(765, 57, 'Türkeli'),
(766, 58, 'Akıncılar'),
(767, 58, 'Altınyayla'),
(768, 58, 'Divriği'),
(769, 58, 'Doğanşar'),
(770, 58, 'Gemerek'),
(771, 58, 'Gölova'),
(772, 58, 'Gürün'),
(773, 58, 'Hafik'),
(774, 58, 'İmranlı'),
(775, 58, 'Kangal'),
(776, 58, 'Koyulhisar'),
(777, 58, 'Merkez'),
(778, 58, 'Suşehri'),
(779, 58, 'Şarkışla'),
(780, 58, 'Ulaş'),
(781, 58, 'Yıldızeli'),
(782, 58, 'Zara'),
(783, 59, 'Çerkezköy'),
(784, 59, 'Çorlu'),
(785, 59, 'Ergene'),
(786, 59, 'Hayrabolu'),
(787, 59, 'Malkara'),
(788, 59, 'Marmaraereğlisi'),
(789, 59, 'Muratlı'),
(790, 59, 'Saray'),
(791, 59, 'Süleymanpaşa'),
(792, 59, 'Şarköy'),
(793, 60, 'Almus'),
(794, 60, 'Artova'),
(795, 60, 'Başçiftlik'),
(796, 60, 'Erbaa'),
(797, 60, 'Merkez'),
(798, 60, 'Niksar'),
(799, 60, 'Pazar'),
(800, 60, 'Reşadiye'),
(801, 60, 'Sulusaray'),
(802, 60, 'Turhal'),
(803, 60, 'Yeşilyurt'),
(804, 60, 'Zile'),
(805, 61, 'Akçaabat'),
(806, 61, 'Araklı'),
(807, 61, 'Arsin'),
(808, 61, 'Beşikdüzü'),
(809, 61, 'Çarşıbaşı'),
(810, 61, 'Çaykara'),
(811, 61, 'Dernekpazarı'),
(812, 61, 'Düzköy'),
(813, 61, 'Hayrat'),
(814, 61, 'Köprübaşı'),
(815, 61, 'Maçka'),
(816, 61, 'Of'),
(817, 61, 'Ortahisar'),
(818, 61, 'Sürmene'),
(819, 61, 'Şalpazarı'),
(820, 61, 'Tonya'),
(821, 61, 'Vakfıkebir'),
(822, 61, 'Yomra'),
(823, 62, 'Çemişgezek'),
(824, 62, 'Hozat'),
(825, 62, 'Mazgirt'),
(826, 62, 'Merkez'),
(827, 62, 'Nazımiye'),
(828, 62, 'Ovacık'),
(829, 62, 'Pertek'),
(830, 62, 'Pülümür'),
(831, 63, 'Akçakale'),
(832, 63, 'Birecik'),
(833, 63, 'Bozova'),
(834, 63, 'Ceylanpınar'),
(835, 63, 'Eyyübiye'),
(836, 63, 'Halfeti'),
(837, 63, 'Haliliye'),
(838, 63, 'Harran'),
(839, 63, 'Hilvan'),
(840, 63, 'Karaköprü'),
(841, 63, 'Siverek'),
(842, 63, 'Suruç'),
(843, 63, 'Viranşehir'),
(844, 64, 'Banaz'),
(845, 64, 'Eşme'),
(846, 64, 'Karahallı'),
(847, 64, 'Merkez'),
(848, 64, 'Sivaslı'),
(849, 64, 'Ulubey'),
(850, 65, 'Bahçesaray'),
(851, 65, 'Başkale'),
(852, 65, 'Çaldıran'),
(853, 65, 'Çatak'),
(854, 65, 'Edremit'),
(855, 65, 'Erciş'),
(856, 65, 'Ghouseaş'),
(857, 65, 'Gürpınar'),
(858, 65, 'İpekyolu'),
(859, 65, 'Muradiye'),
(860, 65, 'Özalp'),
(861, 65, 'Saray'),
(862, 65, 'Tuşba'),
(863, 66, 'Akdağmadeni'),
(864, 66, 'Aydıncık'),
(865, 66, 'Boğazlıyan'),
(866, 66, 'Çandır'),
(867, 66, 'Çayıralan'),
(868, 66, 'Çekerek'),
(869, 66, 'Kadışehri'),
(870, 66, 'Merkez'),
(871, 66, 'Saraykent'),
(872, 66, 'Sarıkaya'),
(873, 66, 'Sorgun'),
(874, 66, 'Şefaatli'),
(875, 66, 'Yenifakılı'),
(876, 66, 'Yerköy'),
(877, 67, 'Alaplı'),
(878, 67, 'Çaycuma'),
(879, 67, 'Dhouserek'),
(880, 67, 'Ereğli'),
(881, 67, 'Gökçebey'),
(882, 67, 'Merkez'),
(883, 68, 'Ağaçören'),
(884, 68, 'Eskil'),
(885, 68, 'Gülağaç'),
(886, 68, 'Güzelyurt'),
(887, 68, 'Merkez'),
(888, 68, 'Ortaköy'),
(889, 68, 'Sarıyahşi'),
(890, 69, 'Aydıntepe'),
(891, 69, 'Demirözü'),
(892, 69, 'Merkez'),
(893, 70, 'Ayrancı'),
(894, 70, 'Başyayla'),
(895, 70, 'Ermenek'),
(896, 70, 'Kazımkarabekir'),
(897, 70, 'Merkez'),
(898, 70, 'Sarıveliler'),
(899, 71, 'Bahşili'),
(900, 71, 'Balışeyh'),
(901, 71, 'Çelebi'),
(902, 71, 'Delice'),
(903, 71, 'Karakeçili'),
(904, 71, 'Keskin'),
(905, 71, 'Merkez'),
(906, 71, 'Sulakyurt'),
(907, 71, 'Yahşihan'),
(908, 72, 'Beşiri'),
(909, 72, 'Gercüş'),
(910, 72, 'Hasankeyf'),
(911, 72, 'Kozluk'),
(912, 72, 'Merkez'),
(913, 72, 'Sason'),
(914, 73, 'Beytüşşebap'),
(915, 73, 'Cizre'),
(916, 73, 'Güçlükonak'),
(917, 73, 'İdil'),
(918, 73, 'Merkez'),
(919, 73, 'Silopi'),
(920, 73, 'Uludere'),
(921, 74, 'Amasra'),
(922, 74, 'Kurucaşile'),
(923, 74, 'Merkez'),
(924, 74, 'Ulus'),
(925, 75, 'Çıldır'),
(926, 75, 'Damal'),
(927, 75, 'Göle'),
(928, 75, 'Hanak'),
(929, 75, 'Merkez'),
(930, 75, 'Posof'),
(931, 76, 'Aralık'),
(932, 76, 'Karakoyunlu'),
(933, 76, 'Merkez'),
(934, 76, 'Tuzluca'),
(935, 77, 'Altınova'),
(936, 77, 'Armutlu'),
(937, 77, 'Çınarcık'),
(938, 77, 'Çiftlikköy'),
(939, 77, 'Merkez'),
(940, 77, 'Termal'),
(941, 78, 'Eflani'),
(942, 78, 'Eskipazar'),
(943, 78, 'Merkez'),
(944, 78, 'Ovacık'),
(945, 78, 'Safranbolu'),
(946, 78, 'Yenice'),
(947, 79, 'Elbeyli'),
(948, 79, 'Merkez'),
(949, 79, 'Musabeyli'),
(950, 79, 'Polateli'),
(951, 80, 'Bahçe'),
(952, 80, 'Düziçi'),
(953, 80, 'Hasanbeyli'),
(954, 80, 'Kadirli'),
(955, 80, 'Merkez'),
(956, 80, 'Sumbas'),
(957, 80, 'Toprakkale'),
(958, 81, 'Akçakoca'),
(959, 81, 'Cumayeri'),
(960, 81, 'Çilimli'),
(961, 81, 'Gölyaka'),
(962, 81, 'Gümüşova'),
(963, 81, 'Kaynaşlı'),
(964, 81, 'Merkez'),
(965, 81, 'Yığılca');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `user_auth` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `user_auth`) VALUES
(1, 'customer@customer.com', '1920', 0),
(2, 'admin@admin.com', '1978', 2),
(14, 'asd', 'asd', 1),
(16, 'bbarisbolat@gmail.com', '1453', 0);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `accident`
--
ALTER TABLE `accident`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `address_type`
--
ALTER TABLE `address_type`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `authorization`
--
ALTER TABLE `authorization`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `branch_type`
--
ALTER TABLE `branch_type`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `car_brand`
--
ALTER TABLE `car_brand`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `car_model`
--
ALTER TABLE `car_model`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `car_type`
--
ALTER TABLE `car_type`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Tablo için indeksler `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `house_type`
--
ALTER TABLE `house_type`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `insurance_type`
--
ALTER TABLE `insurance_type`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `policy`
--
ALTER TABLE `policy`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `policy_type`
--
ALTER TABLE `policy_type`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `township`
--
ALTER TABLE `township`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `accident`
--
ALTER TABLE `accident`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Tablo için AUTO_INCREMENT değeri `address_type`
--
ALTER TABLE `address_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `branch_type`
--
ALTER TABLE `branch_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `car`
--
ALTER TABLE `car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `car_brand`
--
ALTER TABLE `car_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `car_model`
--
ALTER TABLE `car_model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `car_type`
--
ALTER TABLE `car_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Tablo için AUTO_INCREMENT değeri `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `house`
--
ALTER TABLE `house`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `house_type`
--
ALTER TABLE `house_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `insurance_type`
--
ALTER TABLE `insurance_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `personal`
--
ALTER TABLE `personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `policy`
--
ALTER TABLE `policy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `policy_type`
--
ALTER TABLE `policy_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `township`
--
ALTER TABLE `township`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=966;

--
-- Tablo için AUTO_INCREMENT değeri `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
