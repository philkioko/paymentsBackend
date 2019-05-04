-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2019 at 03:12 PM
-- Server version: 5.7.22
-- PHP Version: 7.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payments`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `itemname` varchar(100) NOT NULL,
  `items_image` varchar(100) NOT NULL,
  `items_price` varchar(100) NOT NULL,
  `date_created` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `customer_name`, `payment_id`, `itemname`, `items_image`, `items_price`, `date_created`, `created_at`, `updated_at`) VALUES
(17, 'Patrick Njeru', 10, 'Classic Trench Coat', 'http://localhost:8000/images/product-04.jpg', '$93.20', '2019-04-29', '2019-05-04 03:11:16', '2019-05-04 03:11:16'),
(18, 'Patrick Njeru', 10, 'Only Check Trouser', 'http://localhost:8000/images/product-03.jpg', '$34.75', '2019-04-30', '2019-05-04 03:11:16', '2019-05-04 03:11:16'),
(19, 'Patrick Njeru', 10, 'Esprit Ruffle Shirt', 'http://localhost:8000/images/product-01.jpg', '$16.64', '2019-04-30', '2019-05-04 03:11:16', '2019-05-04 03:11:16'),
(20, 'Susan Kimani', 12, 'Esprit Ruffle Shirt', 'http://localhost:8000/images/product-01.jpg', '$16.64', '2019-05-04', '2019-05-04 09:45:21', '2019-05-04 09:45:21'),
(21, 'Susan Kimani', 12, 'Herschel supply', 'http://localhost:8000/images/product-02.jpg', '$35.31', '2019-05-04', '2019-05-04 09:45:21', '2019-05-04 09:45:21'),
(22, 'Susan Kimani', 12, 'Only Check Trouser', 'http://localhost:8000/images/product-03.jpg', '$34.75', '2019-05-04', '2019-05-04 09:45:21', '2019-05-04 09:45:21'),
(23, 'Nana mafimbo', 13, 'Classic Trench Coat', 'http://localhost:8000/images/product-04.jpg', '$93.20', '2019-05-04', '2019-05-04 09:46:57', '2019-05-04 09:46:57'),
(24, 'Nana mafimbo', 13, 'Esprit Ruffle Shirt', 'http://localhost:8000/images/product-01.jpg', '$16.64', '2019-05-04', '2019-05-04 09:46:57', '2019-05-04 09:46:57'),
(25, 'Nana mafimbo', 13, 'Herschel supply', 'http://localhost:8000/images/product-02.jpg', '$35.31', '2019-05-04', '2019-05-04 09:46:57', '2019-05-04 09:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `logging_time` datetime NOT NULL,
  `loggout_time` datetime DEFAULT NULL,
  `duration` varchar(100) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `username`, `logging_time`, `loggout_time`, `duration`, `created_at`, `updated_at`) VALUES
(5, 9, 'phil', '2019-05-02 18:48:17', NULL, '0', '2019-05-02 15:48:17', '2019-05-02 15:48:17'),
(6, 9, 'phil', '2019-05-02 18:53:41', NULL, '0', '2019-05-02 15:53:41', '2019-05-02 15:53:41'),
(7, 9, 'phil', '2019-05-03 03:59:05', NULL, '0', '2019-05-03 00:59:05', '2019-05-03 00:59:05'),
(8, 9, 'phil', '2019-05-03 08:31:13', NULL, '0', '2019-05-03 05:31:13', '2019-05-03 05:31:13'),
(9, 9, 'phil', '2019-05-03 08:31:29', NULL, '0', '2019-05-03 05:31:29', '2019-05-03 05:31:29'),
(10, 9, 'phil', '2019-05-03 08:36:55', NULL, '0', '2019-05-03 05:36:55', '2019-05-03 05:36:55'),
(11, 9, 'phil', '2019-05-03 08:55:20', NULL, '0', '2019-05-03 05:55:20', '2019-05-03 05:55:20'),
(12, 9, 'phil', '2019-05-03 21:28:59', NULL, '0', '2019-05-03 18:28:59', '2019-05-03 18:28:59'),
(13, 9, 'phil', '2019-05-03 22:03:11', NULL, '0', '2019-05-03 19:03:11', '2019-05-03 19:03:11'),
(14, 9, 'phil', '2019-05-04 00:23:37', NULL, '0', '2019-05-03 21:23:37', '2019-05-03 21:23:37'),
(15, 9, 'phil', '2019-05-04 00:23:47', NULL, '0', '2019-05-03 21:23:47', '2019-05-03 21:23:47'),
(16, 9, 'phil', '2019-05-04 00:24:28', NULL, '0', '2019-05-03 21:24:28', '2019-05-03 21:24:28'),
(17, 9, 'phil', '2019-05-04 03:48:38', NULL, '0', '2019-05-04 00:48:38', '2019-05-04 00:48:38'),
(18, 9, 'phil', '2019-05-04 03:53:44', NULL, '0', '2019-05-04 00:53:44', '2019-05-04 00:53:44'),
(19, 9, 'phil', '2019-05-04 04:02:23', NULL, '0', '2019-05-04 01:02:23', '2019-05-04 01:02:23'),
(20, 9, 'phil', '2019-05-04 04:55:01', NULL, '0', '2019-05-04 01:55:01', '2019-05-04 01:55:01'),
(21, 9, 'phil', '2019-05-04 06:16:40', NULL, '0', '2019-05-04 03:16:40', '2019-05-04 03:16:40'),
(22, 9, 'phil', '2019-05-04 12:47:40', NULL, '0', '2019-05-04 09:47:40', '2019-05-04 09:47:40');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `amount_paid` varchar(100) NOT NULL,
  `items_totals` varchar(100) NOT NULL,
  `date_created` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `customer_id`, `customer_name`, `amount_paid`, `items_totals`, `date_created`, `created_at`, `updated_at`) VALUES
(10, 17, 'Patrick Njeru', '150', '145', '2019-05-04', '2019-05-04 03:11:16', '2019-05-04 03:11:16'),
(11, 18, 'Susan Kimani', '100', '87', '2019-05-04', '2019-05-04 09:43:28', '2019-05-04 09:43:28'),
(12, 19, 'Susan Kimani', '87', '87', '2019-05-04', '2019-05-04 09:45:21', '2019-05-04 09:45:21'),
(13, 20, 'Nana mafimbo', '150', '145', '2019-05-04', '2019-05-04 09:46:57', '2019-05-04 09:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullnames` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullnames`, `username`, `email`, `password`, `status`, `created_at`, `updated_at`) VALUES
(9, 'philip', 'phil', 'kiokophil@gmail.com', '$2y$10$bc/nbdcLrRWTQzqv9usgoe1HS.K4VjBHYtLxLxA6nN9fXd9Uxta/W', 1, '2019-05-02 10:19:52', '2019-05-02 10:19:52'),
(17, 'Patrick Njeru', 'paty', 'patrick@gmail.com', '$2y$10$RF2hCG8H0mzejcE37/vlyeNf0uBIFz7wG8KIF2PcCqBY/jaVXpweC', 0, '2019-05-04 03:10:43', '2019-05-04 03:10:43'),
(19, 'Susan Kimani', 'sus', 'sus@gmail.com', '$2y$10$acWtWX5G7Ef5hWbzryLP9OWXn1wnEw0bnHRmOeBTmC.ZYVW1W3lA6', 0, '2019-05-04 09:45:08', '2019-05-04 09:45:08'),
(20, 'Nana mafimbo', 'nana', 'nana@gmail.com', '$2y$10$d5LEb9rfYybBnEZU7GcO4O.F7bKMtYN4GKAfSKzN9UOfb7ilZUvrC', 0, '2019-05-04 09:46:45', '2019-05-04 09:46:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
