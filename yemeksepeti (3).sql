-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 22 Oca 2022, 20:26:07
-- Sunucu sürümü: 10.4.18-MariaDB
-- PHP Sürümü: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `yemeksepeti`
--

DELIMITER $$
--
-- Yordamlar
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `FiyatArtan` ()  BEGIN
  SELECT * FROM food_items ORDER BY price ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FiyatAzalan` ()  BEGIN
  SELECT * FROM food_items ORDER BY price DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SiparisTotal` ()  BEGIN
SELECT SUM(price*quantity) AS Total,order_id
FROM food_orders 
GROUP BY order_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TotalSiparisSirali` ()  BEGIN 
SELECT SUM(price),order_id 
FROM food_orders 
GROUP BY order_id 
ORDER BY SUM(price) DESC; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `urunler` ()  BEGIN
  SELECT * FROM food_items;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `food_customer`
--

CREATE TABLE `food_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `food_customer`
--

INSERT INTO `food_customer` (`id`, `name`, `email`, `password`, `phone`, `address`) VALUES
(1, 'test', 'test', '202cb962ac59075b964b07152d234b70', '1234567890', 'A - 1111 Street road, Newyork USA.'),
(2, 'gülçe', 'gulce@hotmail.com', '098f6bcd4621d373cade4e832627b4f6', '234', 'halkalı'),
(4, 'admin', 'admin@hotmail.com', '202cb962ac59075b964b07152d234b70', '123654', 'izü'),
(5, 'nilsu', 'nilsu', '202cb962ac59075b964b07152d234b70', '123654', 'izü');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `food_items`
--

CREATE TABLE `food_items` (
  `id` int(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` int(30) NOT NULL,
  `description` varchar(200) NOT NULL,
  `images` varchar(200) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'ENABLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `food_items`
--

INSERT INTO `food_items` (`id`, `name`, `price`, `description`, `images`, `status`) VALUES
(1, 'Mercimek Çorbası', 15, 'Mercimek Çorbası', 'mercimek.jpg', 'ENABLED'),
(3, 'Çiğ Börek', 12, 'Kıymalı Çiğ Börek', 'cigborek.jpg', 'ENABLED'),
(6, 'Izgara Köfte', 35, 'Izgara köfte pilav ve sebzeler ile', 'kofte.jpg', 'ENABLED'),
(7, 'Pizza', 45, 'İtalyan Pizza', 'karisikpizza.jpg', 'ENABLED'),
(10, 'Latte', 15, '1 shot espresso ve süt', 'latte.jpg', 'DISABLE'),
(11, 'Salata', 25, 'Mevsim Salatası', 'fettus-salatasi-one-cikan.jpg', 'ENABLED'),
(17, 'Tatlı Krep', 25, 'Tatlı krep muhallebi ve yaban mersini dolgusu ile', 'krep.jpg', 'ENABLE'),
(78, 'Patates Kızartması', 20, 'Anne Patatesi', 'patates.jpg', 'ENABLE');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `food_orders`
--

CREATE TABLE `food_orders` (
  `id` int(30) NOT NULL,
  `item_id` int(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `order_date` date NOT NULL,
  `order_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `food_orders`
--

INSERT INTO `food_orders` (`id`, `item_id`, `name`, `price`, `quantity`, `order_date`, `order_id`) VALUES
(18, 1, 'Mercimek Çorbası', 15, 1, '2022-01-07', '278866913387162028'),
(19, 3, 'Çiğ Börek', 12, 1, '2022-01-07', '278866913387162028'),
(20, 6, 'Izgara Köfte', 35, 1, '2022-01-07', '278866913387162028'),
(21, 6, 'Izgara Köfte', 35, 1, '2022-01-07', '464925833323282087'),
(22, 3, 'Çiğ Börek', 12, 3, '2022-01-07', '905963241537175139'),
(23, 1, 'Mercimek Çorbası', 15, 3, '2022-01-07', '905963241537175139'),
(24, 10, 'Latte', 15, 3, '2022-01-07', '905963241537175139'),
(25, 17, 'Tatlı Krep', 25, 3, '2022-01-07', '905963241537175139'),
(26, 78, 'Patates Kızartması', 20, 1, '2022-01-07', '120728544426696810'),
(27, 3, 'Çiğ Börek', 12, 1, '2022-01-08', '341403189240623154'),
(28, 1, 'Mercimek Çorbası', 15, 1, '2022-01-08', '341403189240623154'),
(29, 1, 'Mercimek Çorbası', 15, 1, '2022-01-08', '421878279371975560'),
(30, 1, 'Mercimek Çorbası', 15, 1, '2022-01-08', '602740999079783667'),
(31, 1, 'Mercimek Çorbası', 15, 1, '2022-01-08', '583434405369920806'),
(32, 6, 'Izgara Köfte', 35, 1, '2022-01-08', '818857672444768850'),
(33, 3, 'Çiğ Börek', 12, 1, '2022-01-08', '740259221399847323'),
(34, 1, 'Mercimek Çorbası', 15, 1, '2022-01-08', '740259221399847323'),
(35, 1, 'Mercimek Çorbası', 15, 1, '2022-01-08', '443574803472752229'),
(36, 1, 'Mercimek Çorbası', 15, 1, '2022-01-08', '258369771676126649'),
(37, 6, 'Izgara Köfte', 35, 1, '2022-01-08', '258369771676126649'),
(38, 7, 'Pizza', 45, 1, '2022-01-08', '258369771676126649');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `food_customer`
--
ALTER TABLE `food_customer`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `food_items`
--
ALTER TABLE `food_items`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `food_orders`
--
ALTER TABLE `food_orders`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `food_customer`
--
ALTER TABLE `food_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `food_items`
--
ALTER TABLE `food_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- Tablo için AUTO_INCREMENT değeri `food_orders`
--
ALTER TABLE `food_orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
