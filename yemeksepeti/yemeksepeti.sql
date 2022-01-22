-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 05 Oca 2022, 15:35:59
-- Sunucu sürümü: 10.4.22-MariaDB
-- PHP Sürümü: 8.1.0

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
(2, 'testtt', '123', '202cb962ac59075b964b07152d234b70', '123', ''),
(3, 'akif', 'akif', '202cb962ac59075b964b07152d234b70', '123', 'testtt'),
(4, 'MÜFİDE', 'MÜFİDE', '202cb962ac59075b964b07152d234b70', '123', 'test'),
(5, 'GÜLÇE', 'gülçe', '202cb962ac59075b964b07152d234b70', '123', 'zonguldak malatya halkalı istanbul'),
(6, 'AKİFİM', 'AKİF55', '202cb962ac59075b964b07152d234b70', '42', 'SAMSUN KONYA MECİDİYEKÖY İSTANBUL');

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

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `cpassword` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `cpassword`, `date`) VALUES
(13, 'EREN', '$2y$10$jX8iDZcIiJ3d2oIwy1EoIu5f7LhWXRcNkUuTm7Pfshc', '', '2022-01-03 20:18:21'),
(14, 'MÜFİDE', '$2y$10$tvBqTcLBOu6rw8Hagx9Tn.ArXRb6T3YHNnwbOdw1Kk5', '', '2022-01-03 20:18:31'),
(15, 'TEST', '$2y$10$LLgz.eERA2miBuGq3qn0mekwe0cdQUUOoZ1YXftDeS.', '', '2022-01-03 20:18:37'),
(16, 'GÜLÇE', '$2y$10$tZHMbw377I.6t7RSj/Zx4efKARHQ/E/SCSOsyfumnDT', '', '2022-01-03 20:18:53');

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
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `food_customer`
--
ALTER TABLE `food_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `food_items`
--
ALTER TABLE `food_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- Tablo için AUTO_INCREMENT değeri `food_orders`
--
ALTER TABLE `food_orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
