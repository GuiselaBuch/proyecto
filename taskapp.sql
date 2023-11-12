-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2023 at 08:46 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taskapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2023-10-28-181739', 'App\\Database\\Migrations\\CreateTask', 'default', 'App', 1698517126, 1),
(2, '2023-10-28-182041', 'App\\Database\\Migrations\\AddTimestampsToTask', 'default', 'App', 1698517305, 2),
(3, '2023-10-28-182335', 'App\\Database\\Migrations\\CreateUser', 'default', 'App', 1698517454, 3),
(4, '2023-10-28-182546', 'App\\Database\\Migrations\\AddUserIdToTask', 'default', 'App', 1698517587, 4),
(5, '2023-10-28-182732', 'App\\Database\\Migrations\\AddIndexToTaskCreatedAt', 'default', 'App', 1698517743, 5),
(6, '2023-10-28-183041', 'App\\Database\\Migrations\\AddIsAdminToUser', 'default', 'App', 1698517870, 6),
(7, '2023-10-28-183218', 'App\\Database\\Migrations\\AddAccountActivationToUser', 'default', 'App', 1698517978, 7),
(8, '2023-10-28-183337', 'App\\Database\\Migrations\\AddPasswordResetToUser', 'default', 'App', 1698518052, 8),
(9, '2023-10-28-183451', 'App\\Database\\Migrations\\AddProfileImageToUser', 'default', 'App', 1698518119, 9);

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(5) UNSIGNED NOT NULL,
  `description` varchar(128) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `description`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Primer Task', '2023-10-28 18:44:12', '2023-10-28 18:44:12', 2),
(2, 'segundo task', '2023-10-28 18:45:24', '2023-10-28 18:45:24', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(5) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `activation_hash` varchar(64) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `reset_hash` varchar(64) DEFAULT NULL,
  `reset_expires_at` datetime DEFAULT NULL,
  `profile_image` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password_hash`, `created_at`, `updated_at`, `is_admin`, `activation_hash`, `is_active`, `reset_hash`, `reset_expires_at`, `profile_image`) VALUES
(1, 'danilo', 'daniloAdm@example.com', '$2y$10$sn9DTe451wvf6OkiOs2yeOox63Ws3q4R68oTIBxEcH2cE8rTbHzDa', '2023-10-28 18:36:47', '2023-10-28 18:36:47', 1, '9796c1dbdd90b5301ca45a8cb5ec1350be7016ac750840d289f9d136e2349c39', 1, NULL, NULL, NULL),
(2, 'jose', 'jose@example.com', '$2y$10$hdbmKURAhjN7hiF8EuHLsO1MyY6drIe8p5wHSuMu2m2nKCN/Hs9vm', '2023-10-28 18:40:16', '2023-10-28 18:43:16', 0, '4869b8062be968840148e6e54957246f51a46a04ce37a326ae6c5864819f30f5', 1, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_user_id_fk` (`user_id`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `activation_hash` (`activation_hash`),
  ADD UNIQUE KEY `reset_hash` (`reset_hash`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
