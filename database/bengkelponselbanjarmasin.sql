-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jul 2024 pada 12.19
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bengkelponselbanjarmasin`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `brand_list`
--

CREATE TABLE `brand_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `image_path` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `brand_list`
--

INSERT INTO `brand_list` (`id`, `name`, `image_path`, `delete_flag`, `status`, `date_created`, `date_updated`) VALUES
(9, 'VIVO', 'uploads/brands/9.jpeg?v=1721668253', 0, 1, '2024-07-22 09:54:10', '2024-07-23 01:10:53'),
(10, 'OPPO', 'uploads/brands/10.png?v=1721668540', 0, 1, '2024-07-23 01:15:40', '2024-07-23 01:15:40'),
(11, 'SAMSUNG', 'uploads/brands/11.jpg?v=1721668552', 0, 1, '2024-07-23 01:15:52', '2024-07-23 01:15:52'),
(12, 'XIAOMI', 'uploads/brands/12.png?v=1721668569', 0, 1, '2024-07-23 01:16:09', '2024-07-23 01:16:09'),
(13, 'REALME', 'uploads/brands/13.jpg?v=1721668618', 0, 1, '2024-07-23 01:16:58', '2024-07-23 01:16:58'),
(14, 'INFINIX', 'uploads/brands/14.png?v=1721668687', 0, 1, '2024-07-23 01:18:07', '2024-07-23 01:18:07'),
(15, 'APPLE', 'uploads/brands/15.jpg?v=1721668766', 0, 1, '2024-07-23 01:19:26', '2024-07-23 01:19:26'),
(16, 'ASUS', 'uploads/brands/16.jpg?v=1721668872', 0, 1, '2024-07-23 01:21:12', '2024-07-23 01:21:12'),
(17, 'NOKIA', 'uploads/brands/17.webp?v=1721669025', 0, 1, '2024-07-23 01:23:45', '2024-07-23 01:23:45'),
(19, 'LAINNYA', 'uploads/brands/19.png?v=1721671797', 0, 1, '2024-07-23 02:09:57', '2024-07-23 02:09:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `category`, `status`, `delete_flag`, `date_created`) VALUES
(11, 'Case', 1, 0, '2024-07-22 09:54:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_added` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `client_list`
--

INSERT INTO `client_list` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `status`, `delete_flag`, `date_created`, `date_added`) VALUES
(7, 'Dwi ', 'Ade', 'Kurniawan', 'Male', '085821832001', 'Wargo Mulyo', 'dwiadekurniawan10@gmail.com', '3b8eb5b20a401d30772e7abc6abb32d9', 1, 0, '2024-07-22 09:53:17', '2024-07-22 17:17:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mechanics_list`
--

CREATE TABLE `mechanics_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mechanics_list`
--

INSERT INTO `mechanics_list` (`id`, `name`, `contact`, `email`, `status`, `date_created`) VALUES
(4, 'Eko Rommadyanto', '085821832001', 'ekordy@gmail.com', 1, '2024-06-13 00:00:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_items`
--

CREATE TABLE `order_items` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `date_added`) VALUES
(21, 17, 17, 1, '2024-07-22 17:14:00'),
(22, 18, 17, 2, '2024-07-23 08:57:46'),
(23, 19, 17, 1, '2024-07-24 08:14:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `ref_code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `total_amount` float NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending,1 = packed, 2 = for delivery, 3 = on the way, 4 = delivered, 5=cancelled',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `order_list`
--

INSERT INTO `order_list` (`id`, `ref_code`, `client_id`, `total_amount`, `delivery_address`, `status`, `date_created`, `date_updated`) VALUES
(17, '202407-00001', 7, 25000, 'Wargo Mulyo', 4, '2024-07-22 17:14:00', '2024-07-23 09:00:49'),
(18, '202407-00002', 7, 50000, 'Wargo Mulyo', 4, '2024-07-23 08:57:46', '2024-07-23 09:01:00'),
(19, '202407-00003', 7, 25000, 'Wargo Mulyo', 1, '2024-07-24 08:14:14', '2024-07-24 08:16:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `models` text NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `image_path` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `product_list`
--

INSERT INTO `product_list` (`id`, `brand_id`, `category_id`, `name`, `models`, `description`, `price`, `status`, `image_path`, `delete_flag`, `date_created`, `date_updated`) VALUES
(17, 9, 11, 'Case Vivo Model Robot', 'Y21, Y21S, Y21T', '&lt;p&gt;Oke&lt;/p&gt;', 25000, 1, 'uploads/products/17.jpeg?v=1721635158', 0, '2024-07-22 15:59:18', '2024-07-22 15:59:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `request_meta`
--

CREATE TABLE `request_meta` (
  `request_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `request_meta`
--

INSERT INTO `request_meta` (`request_id`, `meta_field`, `meta_value`) VALUES
(10, 'pickup_address', ''),
(10, 'vehicle_registration_number', 'Vivo'),
(10, 'vehicle_model', 'Vivo Y21'),
(10, 'service_id', '12'),
(11, 'pickup_address', ''),
(11, 'vehicle_registration_number', 'Vivo Y21'),
(11, 'vehicle_model', 'Vivo '),
(11, 'service_id', '8'),
(14, 'vehicle_registration_number', 'Iphone Xr'),
(14, 'vehicle_model', 'Aplle'),
(14, 'service_id', '1'),
(15, 'vehicle_registration_number', 'Samsung S15'),
(15, 'vehicle_model', 'Samsung'),
(15, 'service_id', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `service_list`
--

CREATE TABLE `service_list` (
  `id` int(30) NOT NULL,
  `service` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `service_list`
--

INSERT INTO `service_list` (`id`, `service`, `description`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'Ganti LCD', 'Semua Jenis Handpone', 1, 0, '2024-07-22 19:44:55'),
(7, 'Ganti Baterai', '&lt;p&gt;&lt;span style=&quot;font-size: 12.8px;&quot;&gt;Semua Jenis Handpone&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2024-07-23 01:01:02'),
(8, 'Ganti Fleksible Charger', '&lt;p&gt;&lt;span style=&quot;font-size: 12.8px;&quot;&gt;Semua Jenis Handpone&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2024-07-23 01:01:54'),
(9, 'Ganti Fleksible on/off ', '&lt;p&gt;&lt;span style=&quot;font-size: 12.8px;&quot;&gt;Semua Jenis Handpone&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2024-07-23 01:02:37'),
(10, 'Ganti Fleksible Volume', '&lt;p&gt;&lt;span style=&quot;font-size: 12.8px;&quot;&gt;Semua Jenis Handpone&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2024-07-23 01:02:55'),
(11, 'Mati Total', '&lt;p&gt;&lt;span style=&quot;font-size: 12.8px;&quot;&gt;Semua Jenis Handpone&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2024-07-23 02:15:06'),
(12, 'Botloop', '&lt;p&gt;&lt;span style=&quot;font-size: 12.8px;&quot;&gt;Semua Jenis Handpone&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2024-07-23 02:15:43'),
(13, 'Flash, Upgrade & Instal Ulang', '&lt;p&gt;&lt;span style=&quot;font-size: 12.8px;&quot;&gt;Semua Jenis Handpone&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2024-07-23 02:16:26'),
(14, 'Lainnya', '&lt;p&gt;Keruskan Lain nya&lt;/p&gt;', 1, 0, '2024-07-23 12:18:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `service_requests`
--

CREATE TABLE `service_requests` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `service_type` text NOT NULL,
  `mechanic_id` int(30) DEFAULT NULL,
  `price` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `service_requests`
--

INSERT INTO `service_requests` (`id`, `client_id`, `service_type`, `mechanic_id`, `price`, `status`, `date_created`) VALUES
(10, 7, 'Datang Langsung', 4, 150000, 3, '2024-07-23 09:54:35'),
(11, 7, 'Datang Langsung', 4, 50000, 1, '2024-07-23 12:12:39'),
(14, 7, 'Datang Langsung', 4, 200000, 2, '2024-07-23 13:07:18'),
(15, 7, 'Datang Lansung', NULL, 0, 0, '2024-07-24 08:49:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_list`
--

CREATE TABLE `stock_list` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1= IN, 2= Out',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `stock_list`
--

INSERT INTO `stock_list` (`id`, `product_id`, `quantity`, `type`, `date_created`) VALUES
(21, 17, 5, 1, '2024-07-22 15:59:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Bengkel Ponsel Banjarmasin'),
(6, 'short_name', 'Servis dan Penjualan Sparepart'),
(11, 'logo', 'uploads/1721671620_android_icon-icons.com_62762.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1721612640_slider1.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Bengkel Ponsel', 'Banjarmasin', 'bengkelponselbanjarmasin@gmail.com', '7c30ea1994b9a4b794e076f3a49840ef', 'uploads/1721668020_logo.png', NULL, 1, '2021-01-20 14:02:37', '2024-07-23 01:07:30'),
(7, 'Dwi', 'Ade Kurniawan', 'ade', 'a562cfa07c2b1213b3a5c99b756fc206', 'uploads/1721612700_1721543940_1719016392559.jpg', NULL, 2, '2024-06-13 08:52:41', '2024-07-22 09:45:01'),
(8, 'Eko ', 'Rohmadyanto', 'ekordy', 'e5ea9b6d71086dfef3a15f726abcc5bf', 'uploads/1721612700_1721544000_1717466287026.jpg', NULL, 3, '2024-06-13 09:35:06', '2024-07-22 09:45:13');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `brand_list`
--
ALTER TABLE `brand_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- Indeks untuk tabel `mechanics_list`
--
ALTER TABLE `mechanics_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indeks untuk tabel `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeks untuk tabel `request_meta`
--
ALTER TABLE `request_meta`
  ADD KEY `request_id` (`request_id`);

--
-- Indeks untuk tabel `service_list`
--
ALTER TABLE `service_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `service_requests`
--
ALTER TABLE `service_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `mechanic_id` (`mechanic_id`);

--
-- Indeks untuk tabel `stock_list`
--
ALTER TABLE `stock_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `brand_list`
--
ALTER TABLE `brand_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `mechanics_list`
--
ALTER TABLE `mechanics_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `service_list`
--
ALTER TABLE `service_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `service_requests`
--
ALTER TABLE `service_requests`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `stock_list`
--
ALTER TABLE `stock_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `request_meta`
--
ALTER TABLE `request_meta`
  ADD CONSTRAINT `request_meta_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `service_requests` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `service_requests`
--
ALTER TABLE `service_requests`
  ADD CONSTRAINT `service_requests_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_requests_ibfk_2` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanics_list` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `stock_list`
--
ALTER TABLE `stock_list`
  ADD CONSTRAINT `stock_list_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
