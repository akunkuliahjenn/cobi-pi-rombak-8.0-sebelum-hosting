-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 29, 2025 at 07:49 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `corner_bites_sia`
--
CREATE DATABASE IF NOT EXISTS `corner_bites_sia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `corner_bites_sia`;

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
CREATE TABLE `activity_logs` (
  `id` int(3) UNSIGNED NOT NULL,
  `user_id` int(3) UNSIGNED DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `activity_type` varchar(30) DEFAULT NULL,
  `activity_description` text DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `username`, `activity_type`, `activity_description`, `user_agent`, `created_at`) VALUES
(21, 12, 'admin', 'login', 'Admin login ke sistem', NULL, '2025-07-12 11:47:50'),
(22, 14, 'cornerbites', 'register', 'User cornerbites baru saja mendaftar', NULL, '2025-07-11 13:47:50'),
(23, 14, 'cornerbites', 'login', 'User cornerbites baru saja login', NULL, '2025-07-12 12:47:50'),
(24, 12, 'admin', 'reset_password', 'Admin mereset password untuk User cornerbites', NULL, '2025-07-12 10:47:50'),
(25, 14, 'cornerbites', 'change_password', 'User cornerbites mengganti password', NULL, '2025-07-12 09:47:50'),
(26, 16, 'anandacookies', 'register', 'User anandacookies baru saja mendaftar', NULL, '2025-07-12 07:47:50'),
(27, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', NULL, '2025-07-12 13:02:50'),
(28, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 14:00:21'),
(29, 14, 'cornerbites', 'login', 'User cornerbites baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 14:00:24'),
(30, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 14:00:26'),
(31, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 14:00:30'),
(32, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 14:10:24'),
(33, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 14:10:28'),
(34, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 14:21:14'),
(35, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 14:21:17'),
(36, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 14:48:07'),
(37, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 14:48:11'),
(38, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:14:11'),
(39, 14, 'cornerbites', 'login', 'User cornerbites baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:14:25'),
(40, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:14:27'),
(41, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:14:29'),
(42, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:14:34'),
(43, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:14:49'),
(44, 12, 'admin', 'update_user', 'Admin mengupdate data user: anandacookies', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:15:03'),
(45, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:15:06'),
(46, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:15:16'),
(47, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:15:19'),
(48, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:15:32'),
(49, 12, 'admin', 'reset_password', 'Admin mereset password untuk User ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:15:43'),
(50, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:15:47'),
(51, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:15:56'),
(52, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:16:12'),
(53, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:16:19'),
(54, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:16:52'),
(55, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:16:57'),
(56, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:18:15'),
(57, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:18:19'),
(58, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:18:59'),
(59, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:21:22'),
(60, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:32:37'),
(61, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:32:43'),
(62, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:34:14'),
(63, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:34:18'),
(64, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:34:36'),
(65, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:34:42'),
(66, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:34:48'),
(67, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:42:43'),
(68, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:44:14'),
(69, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:44:18'),
(70, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:44:45'),
(71, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:44:52'),
(72, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:45:03'),
(73, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:49:32'),
(74, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:49:50'),
(75, 14, 'cornerbites', 'login', 'User cornerbites baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:49:54'),
(76, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:49:58'),
(77, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:50:03'),
(78, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:52:33'),
(79, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:56:59'),
(80, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:57:08'),
(81, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:58:13'),
(82, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:58:24'),
(83, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 15:59:54'),
(84, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:00:28'),
(85, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:07:08'),
(86, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:07:15'),
(87, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:10:17'),
(88, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:10:22'),
(89, 12, 'admin', 'reset_password', 'Admin mereset password untuk User anandacookies', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:11:05'),
(90, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:11:11'),
(91, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:11:53'),
(92, 12, 'admin', 'reset_password', 'Admin mereset password untuk User anandacookies', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:12:01'),
(93, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:12:06'),
(94, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:12:39'),
(95, 12, 'admin', 'reset_password', 'Admin mereset password untuk User anandacookies', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:13:02'),
(96, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:13:06'),
(97, NULL, 'test123', 'register', 'User test123 baru saja mendaftar', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:16:04'),
(98, NULL, 'test123', 'login', 'User test123 baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:16:11'),
(99, NULL, 'test123', 'logout', 'User test123 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:16:15'),
(100, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:16:18'),
(101, 12, 'admin', 'reset_password', 'Admin mereset password untuk User test123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:16:25'),
(102, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:16:28'),
(103, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:16:49'),
(104, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:16:53'),
(105, NULL, 'testo', 'register', 'User testo baru saja mendaftar', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:18:02'),
(106, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:18:13'),
(107, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:18:18'),
(108, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:18:22'),
(109, 12, 'admin', 'reset_password', 'Admin mereset password untuk User testo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:18:37'),
(110, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:18:43'),
(111, 14, 'cornerbites', 'login', 'User cornerbites baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:30:12'),
(112, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:30:15'),
(113, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:34:47'),
(114, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:35:00'),
(115, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:35:11'),
(116, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:40:40'),
(117, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:40:43'),
(118, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:42:06'),
(119, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:42:23'),
(120, 12, 'admin', 'reset_password', 'Admin mereset password untuk User anandacookies', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:42:31'),
(121, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:42:34'),
(122, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:43:15'),
(123, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:43:18'),
(124, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:43:23'),
(125, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:44:55'),
(126, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:45:06'),
(127, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:46:07'),
(128, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:46:19'),
(129, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:46:42'),
(130, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:46:46'),
(131, 12, 'admin', 'reset_password', 'Admin mereset password untuk User testo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:47:16'),
(132, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:47:19'),
(133, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:47:48'),
(134, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:47:52'),
(135, 12, 'admin', 'reset_password', 'Admin mereset password untuk User testo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:48:01'),
(136, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:48:04'),
(137, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:49:28'),
(138, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:49:53'),
(139, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:50:53'),
(140, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:51:00'),
(141, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:53:22'),
(142, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:53:26'),
(143, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:55:56'),
(144, 14, 'cornerbites', 'login', 'User cornerbites baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:56:01'),
(145, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:56:03'),
(146, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:56:06'),
(147, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:57:39'),
(148, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:57:43'),
(149, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:58:05'),
(150, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 16:59:08'),
(151, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:00:21'),
(152, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:05:56'),
(153, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:06:12'),
(154, 12, 'admin', 'reset_password', 'Admin mereset password untuk User testo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:06:23'),
(155, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:06:25'),
(156, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:08:47'),
(157, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:17:08'),
(158, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:17:48'),
(159, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:22:14'),
(160, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:22:23'),
(161, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:22:57'),
(162, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:23:01'),
(163, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:23:11'),
(164, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:23:23'),
(165, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:23:27'),
(166, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:23:31'),
(167, 12, 'admin', 'reset_password', 'Admin mereset password untuk User testo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:24:53'),
(168, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:25:00'),
(169, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:30:41'),
(170, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:30:52'),
(171, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:35:49'),
(172, NULL, 'testo', 'change_password', 'User mengganti password setelah reset admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:36:18'),
(173, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:36:21'),
(174, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:37:00'),
(175, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:37:02'),
(176, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:37:07'),
(177, 12, 'admin', 'reset_password', 'Admin mereset password untuk User testo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:37:17'),
(178, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:37:21'),
(179, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:41:34'),
(180, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:44:44'),
(181, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:44:50'),
(182, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:45:27'),
(183, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:45:47'),
(184, NULL, 'testo', 'change_password', 'User mengganti password setelah reset admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:46:35'),
(185, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:49:02'),
(186, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:51:28'),
(187, 12, 'admin', 'reset_password', 'Admin mereset password untuk User testo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:51:39'),
(188, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:51:42'),
(189, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:51:50'),
(190, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:54:28'),
(191, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:54:42'),
(192, 12, 'admin', 'reset_password', 'Admin mereset password untuk User testo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:54:50'),
(193, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:54:53'),
(194, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:54:58'),
(195, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 17:57:27'),
(196, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:04:50'),
(197, 12, 'admin', 'reset_password', 'Admin mereset password untuk User testo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:05:00'),
(198, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:05:03'),
(199, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:05:07'),
(200, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:05:51'),
(201, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:08:16'),
(202, 12, 'admin', 'reset_password', 'Admin mereset password untuk User testo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:08:25'),
(203, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:08:27'),
(204, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:08:34'),
(205, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:08:56'),
(206, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:09:06'),
(207, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:09:39'),
(208, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:13:22'),
(209, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:13:48'),
(210, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:16:14'),
(211, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:16:19'),
(212, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:16:23'),
(213, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:16:37'),
(214, 14, 'cornerbites', 'login', 'User cornerbites baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:16:39'),
(215, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:16:41'),
(216, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:16:47'),
(217, 12, 'admin', 'reset_password', 'Admin mereset password untuk User testo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:16:59'),
(218, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:17:04'),
(219, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:17:10'),
(220, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:18:26'),
(221, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:18:37'),
(222, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:25:56'),
(223, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:26:03'),
(224, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:26:05'),
(225, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:26:11'),
(226, 12, 'admin', 'reset_password', 'Admin mereset password untuk User testo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:26:20'),
(227, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:26:26'),
(228, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:26:35'),
(229, NULL, 'testo', 'change_password', 'Password berhasil diubah setelah reset admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:26:43'),
(230, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:26:48'),
(231, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:27:06'),
(232, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:27:11'),
(233, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:28:29'),
(234, NULL, 'testo', 'login', 'User testo baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:30:40'),
(235, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:30:42'),
(236, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:31:04'),
(237, 12, 'admin', 'reset_password', 'Admin mereset password untuk User anandacookies', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:31:13'),
(238, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:31:16'),
(239, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:31:23'),
(240, 16, 'anandacookies', 'change_password', 'Password berhasil diubah setelah reset admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:31:33'),
(241, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:31:37'),
(242, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:31:40'),
(243, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:34:27'),
(244, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:34:30'),
(245, 14, 'cornerbites', 'login', 'User cornerbites baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:35:26'),
(246, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:35:29'),
(247, 14, 'cornerbites', 'login', 'User cornerbites baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:38:17'),
(248, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:38:27'),
(249, 14, 'cornerbites', 'login', 'User cornerbites baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:41:37'),
(250, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:41:40'),
(251, 14, 'cornerbites', 'login', 'User cornerbites baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:47:51'),
(252, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:48:15'),
(253, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:48:26'),
(254, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:52:55'),
(255, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:53:02'),
(256, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:53:49'),
(257, 14, 'cornerbites', 'login', 'User cornerbites baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 18:53:55'),
(258, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 19:27:40'),
(259, 14, 'cornerbites', 'login', 'User cornerbites baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 19:27:45'),
(260, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 19:29:21'),
(261, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 19:29:25'),
(262, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 19:29:42'),
(263, 12, 'admin', 'login', 'User admin baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 19:29:46'),
(264, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 19:32:00'),
(265, 14, 'cornerbites', 'login', 'User cornerbites baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 19:32:03'),
(266, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 19:42:03'),
(267, 14, 'cornerbites', 'login', 'User cornerbites baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 19:42:25'),
(268, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 19:42:31'),
(269, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 19:42:34');
INSERT INTO `activity_logs` (`id`, `user_id`, `username`, `activity_type`, `activity_description`, `user_agent`, `created_at`) VALUES
(270, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 19:44:17'),
(271, 16, 'anandacookies', 'login', 'User anandacookies baru saja login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-12 19:44:31'),
(272, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 05:32:11'),
(273, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 05:50:07'),
(274, 16, 'anandacookies', 'LOGIN_SUCCESS', 'User anandacookies logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 05:54:21'),
(275, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 05:54:33'),
(276, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 05:54:38'),
(277, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 05:54:42'),
(278, 16, 'anandacookies', 'LOGIN_SUCCESS', 'User anandacookies logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 05:55:21'),
(279, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 05:56:06'),
(280, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 05:56:29'),
(281, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:01:01'),
(282, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:01:04'),
(283, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:01:06'),
(284, 16, 'anandacookies', 'LOGIN_SUCCESS', 'User anandacookies logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:01:09'),
(285, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:01:17'),
(286, NULL, 'testo', 'LOGIN_SUCCESS', 'User testo logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:01:21'),
(287, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:01:35'),
(288, 16, 'anandacookies', 'LOGIN_SUCCESS', 'User anandacookies logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:01:38'),
(289, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:01:44'),
(290, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:01:47'),
(291, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:01:52'),
(292, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:03:49'),
(293, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:04:02'),
(294, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:04:14'),
(295, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:04:24'),
(296, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:04:35'),
(297, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:04:48'),
(298, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:06:02'),
(299, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:06:16'),
(300, 16, 'anandacookies', 'LOGIN_SUCCESS', 'User anandacookies logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:06:29'),
(301, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:06:35'),
(302, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:44:08'),
(303, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 06:44:11'),
(304, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 07:05:10'),
(305, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 07:05:17'),
(306, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 08:42:03'),
(307, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 08:48:06'),
(308, NULL, 'testo', 'LOGIN_FAILED', 'Failed login attempt for username: testo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 08:49:00'),
(309, NULL, 'testo', 'LOGIN_FAILED', 'Failed login attempt for username: testo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 08:49:06'),
(310, NULL, 'testo', 'password_reset_email', 'Temporary password sent via email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:38:27'),
(311, NULL, 'testo', 'password_reset_email', 'Temporary password sent via email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:38:34'),
(312, NULL, 'testo', 'LOGIN_FAILED', 'Failed login attempt for username: testo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:39:00'),
(313, NULL, 'testo', 'LOGIN_FAILED', 'Failed login attempt for username: testo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:39:09'),
(314, NULL, 'testo', 'password_reset_email', 'Temporary password sent via email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:40:17'),
(315, NULL, 'testo', 'LOGIN_SUCCESS', 'User testo logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:41:22'),
(316, NULL, 'testo', 'change_password', 'Password berhasil diubah setelah reset admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:41:35'),
(317, NULL, 'testo', 'LOGIN_SUCCESS', 'User testo logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:41:41'),
(318, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:42:09'),
(319, NULL, 'testo', 'password_reset_email', 'Temporary password sent via email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:42:22'),
(320, NULL, 'testo', 'LOGIN_FAILED', 'Failed login attempt for username: testo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:42:59'),
(321, NULL, 'testo', 'LOGIN_SUCCESS', 'User testo logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:43:03'),
(322, NULL, 'testo', 'change_password', 'Password berhasil diubah setelah reset admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:43:28'),
(323, NULL, 'testo', 'LOGIN_SUCCESS', 'User testo logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:43:36'),
(324, NULL, 'testo', 'logout', 'User testo baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:43:39'),
(325, NULL, 'gbot968', 'register', 'User gbot968 baru saja mendaftar', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:50:07'),
(326, NULL, 'gbot968', 'LOGIN_SUCCESS', 'User gbot968 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:50:18'),
(327, NULL, 'gbot968', 'logout', 'User gbot968 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:50:21'),
(328, NULL, 'gbot968', 'password_reset_email', 'Temporary password sent via email with username verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:50:29'),
(329, NULL, 'gbot968', 'LOGIN_FAILED', 'Failed login attempt for username: gbot968', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:51:04'),
(330, NULL, 'gbot968', 'LOGIN_SUCCESS', 'User gbot968 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:51:08'),
(331, NULL, 'gbot968', 'change_password', 'Password berhasil diubah setelah reset admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:51:16'),
(332, NULL, 'gbot968', 'LOGIN_SUCCESS', 'User gbot968 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:51:21'),
(333, NULL, 'gbot968', 'logout', 'User gbot968 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:51:27'),
(334, NULL, 'gbot968', 'password_reset_email', 'Temporary password sent via email with username verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:56:52'),
(335, NULL, 'gbot968', 'LOGIN_SUCCESS', 'User gbot968 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:57:17'),
(336, NULL, 'gbot968', 'change_password', 'Password berhasil diubah setelah reset admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:57:53'),
(337, NULL, 'gbot968', 'LOGIN_SUCCESS', 'User gbot968 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 09:58:44'),
(338, NULL, 'gbot968', 'logout', 'User gbot968 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:04:55'),
(339, NULL, 'gbot968', 'password_reset_email', 'Temporary password sent via email with username verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:05:03'),
(340, NULL, 'gbot968', 'password_reset_email', 'Temporary password sent via email with username verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:05:13'),
(341, NULL, 'gbot968', 'LOGIN_FAILED', 'Failed login attempt for username: gbot968', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:05:47'),
(342, NULL, 'gbot968', 'LOGIN_FAILED', 'Failed login attempt for username: gbot968', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:05:56'),
(343, NULL, 'gbot968', 'password_reset_email', 'Temporary password sent via email with username verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:06:26'),
(344, NULL, 'gbot968', 'LOGIN_FAILED', 'Failed login attempt for username: gbot968', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:06:41'),
(345, NULL, 'gbot968', 'LOGIN_FAILED', 'Failed login attempt for username: gbot968', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:07:34'),
(346, NULL, 'gbot968', 'LOGIN_FAILED', 'Failed login attempt for username: gbot968', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:07:46'),
(347, NULL, 'gbot968', 'password_reset_email', 'Temporary password sent via email with username verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:07:56'),
(348, NULL, 'gbot967', 'register', 'User gbot967 baru saja mendaftar', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:09:07'),
(349, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:09:10'),
(350, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:09:11'),
(351, 20, 'gbot967', 'password_reset_email', 'Temporary password sent via email with username verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:09:24'),
(352, NULL, 'gbot967', 'LOGIN_FAILED', 'Failed login attempt for username: gbot967', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:09:44'),
(353, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:09:48'),
(354, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:11:02'),
(355, NULL, 'gbot967', 'LOGIN_FAILED', 'Failed login attempt for username: gbot967', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:11:11'),
(356, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:11:14'),
(357, 20, 'gbot967', 'change_password', 'Password berhasil diubah setelah reset admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:11:22'),
(358, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:11:25'),
(359, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 10:11:27'),
(360, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 11:24:46'),
(361, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 11:44:55'),
(362, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 11:44:59'),
(363, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 14:01:04'),
(364, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 14:55:44'),
(365, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 14:56:03'),
(366, 16, 'anandacookies', 'LOGIN_SUCCESS', 'User anandacookies logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 14:56:06'),
(367, 16, 'anandacookies', 'logout', 'User anandacookies baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 14:56:11'),
(368, 20, 'gbot967', 'password_reset_email', 'Temporary password sent via email with username verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:15:37'),
(369, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:16:13'),
(370, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:22:33'),
(371, 20, 'gbot967', 'password_reset_email', 'Temporary password sent via email with username verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:22:40'),
(372, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:23:00'),
(373, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:24:49'),
(374, 20, 'gbot967', 'password_reset_email', 'Temporary password sent via email with username verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:25:11'),
(375, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:25:36'),
(376, 20, 'gbot967', 'change_password', 'Password berhasil diubah setelah reset admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:29:04'),
(377, NULL, 'anandacookies', 'LOGIN_FAILED', 'Failed login attempt for username: anandacookies', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:29:10'),
(378, NULL, 'anandacookies', 'LOGIN_FAILED', 'Failed login attempt for username: anandacookies', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:29:13'),
(379, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:29:20'),
(380, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:29:22'),
(381, 20, 'gbot967', 'password_reset_email', 'Temporary password sent via email with username verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:44:03'),
(382, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:44:24'),
(383, 20, 'gbot967', 'TEMP_PASSWORD_LOGIN', 'User logged in with temporary password and redirected to change password', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:44:24'),
(384, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:48:11'),
(385, 20, 'gbot967', 'password_reset_email', 'Temporary password sent via email with username verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:48:18'),
(386, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:48:50'),
(387, 20, 'gbot967', 'TEMP_PASSWORD_LOGIN', 'User logged in with temporary password and redirected to change password', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:48:50'),
(388, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:49:01'),
(389, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:49:05'),
(390, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:49:10'),
(391, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:49:28'),
(392, 20, 'gbot967', 'TEMP_PASSWORD_LOGIN', 'User logged in with temporary password and redirected to change password', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:49:28'),
(393, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:50:43'),
(394, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:53:28'),
(395, 20, 'gbot967', 'TEMP_PASSWORD_LOGIN', 'User logged in with temporary password and redirected to change password', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:53:28'),
(396, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:54:29'),
(397, 20, 'gbot967', 'password_reset_email', 'Temporary password sent via email with username verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:59:19'),
(398, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:59:41'),
(399, 20, 'gbot967', 'TEMP_PASSWORD_LOGIN', 'User logged in with temporary password and redirected to change password', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 15:59:41'),
(400, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 16:09:27'),
(401, 20, 'gbot967', 'password_reset_email', 'Temporary password sent via email with username verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 16:14:07'),
(402, 20, 'gbot967', 'TEMP_PASSWORD_LOGIN', 'User logged in with temporary password and redirected to change password', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 16:14:29'),
(403, 20, 'gbot967', 'TEMP_PASSWORD_LOGIN', 'User logged in with temporary password and redirected to change password', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 16:14:36'),
(404, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 16:15:38'),
(405, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 16:15:59'),
(406, 20, 'gbot967', 'TEMP_PASSWORD_LOGIN', 'User logged in with temporary password and redirected to change password', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 16:17:24'),
(407, 20, 'gbot967', 'password_reset_email', 'Temporary password sent via email with username verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 16:17:43'),
(408, 20, 'gbot967', 'TEMP_PASSWORD_LOGIN', 'User logged in with temporary password and redirected to change password', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 16:17:58'),
(409, NULL, 'cornerbites', 'LOGIN_FAILED', 'Failed login attempt for username: cornerbites', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 16:18:45'),
(410, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 16:18:50'),
(411, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 16:18:53'),
(412, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 16:19:02'),
(413, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 16:19:19'),
(414, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 16:19:25'),
(415, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 16:19:45'),
(416, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 16:29:16'),
(417, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-13 16:33:31'),
(418, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 05:47:01'),
(419, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 05:48:41'),
(420, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 05:48:43'),
(421, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 05:49:09'),
(422, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 05:49:36'),
(423, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 06:03:29'),
(424, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 06:03:33'),
(425, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 07:22:18'),
(426, 20, 'gbot967', 'otp_reset_request', 'OTP reset password request sent to email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 07:57:56'),
(427, 20, 'gbot967', 'otp_verified', 'OTP verified successfully for password reset', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:01:30'),
(428, 20, 'gbot967', 'password_reset_success', 'Password reset completed via OTP verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:01:43'),
(429, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:01:52'),
(430, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:03:13'),
(431, 20, 'gbot967', 'otp_reset_request', 'OTP reset password request sent to email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:03:57'),
(432, 20, 'gbot967', 'otp_reset_request', 'OTP reset password request sent to email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:04:16'),
(433, 20, 'gbot967', 'otp_reset_request', 'OTP reset password request sent to email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:04:46'),
(434, 20, 'gbot967', 'otp_verified', 'OTP verified successfully for password reset', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:05:59'),
(435, 20, 'gbot967', 'otp_reset_request', 'OTP reset password request sent to email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:06:06'),
(436, 20, 'gbot967', 'otp_verified', 'OTP verified successfully for password reset', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:06:20'),
(437, 20, 'gbot967', 'password_reset_success', 'Password reset completed via OTP verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:06:31'),
(438, 20, 'gbot967', 'otp_reset_request', 'OTP reset password request sent to email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:07:01'),
(439, 20, 'gbot967', 'otp_reset_request', 'OTP reset password request sent to email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:07:24'),
(440, 20, 'gbot967', 'otp_verified', 'OTP verified successfully for password reset', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:07:35'),
(441, 20, 'gbot967', 'otp_reset_request', 'OTP reset password request sent to email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:08:33'),
(442, 20, 'gbot967', 'otp_reset_request', 'OTP reset password request sent to email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:08:57'),
(443, 20, 'gbot967', 'otp_verified', 'OTP verified successfully for password reset', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:09:11'),
(444, 20, 'gbot967', 'password_reset_success', 'Password reset completed via OTP verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:09:18'),
(445, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:09:27'),
(446, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:48:41'),
(447, 20, 'gbot967', 'otp_reset_request', 'OTP reset password request sent to email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:48:46'),
(448, 20, 'gbot967', 'otp_verified', 'OTP verified successfully for password reset', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:49:03'),
(449, 20, 'gbot967', 'password_reset_success', 'Password reset completed via OTP verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:49:18'),
(450, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 08:50:08'),
(451, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 09:14:24'),
(452, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 10:05:34'),
(453, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 10:32:24'),
(454, 20, 'gbot967', 'otp_reset_request', 'OTP reset password request sent to email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 10:32:30'),
(455, 20, 'gbot967', 'otp_verified', 'OTP verified successfully for password reset', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 10:32:44'),
(456, 20, 'gbot967', 'password_reset_success', 'Password reset completed via OTP verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 10:32:50'),
(457, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 10:32:56'),
(458, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 10:46:50'),
(459, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 10:46:52'),
(460, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 13:26:23'),
(461, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 13:32:18'),
(462, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 13:32:30'),
(463, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 13:49:54'),
(464, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 13:49:59'),
(465, NULL, 'cornerbites', 'LOGIN_FAILED', 'Failed login attempt for username: cornerbites', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 13:50:28'),
(466, NULL, 'cornerbites', 'LOGIN_FAILED', 'Failed login attempt for username: cornerbites', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 13:50:34'),
(467, NULL, 'cornerbites', 'LOGIN_FAILED', 'Failed login attempt for username: cornerbites', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 13:50:44'),
(468, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 13:50:46'),
(469, NULL, 'cornerbites', 'LOGIN_FAILED', 'Failed login attempt for username: cornerbites', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 13:50:49'),
(470, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 13:50:57'),
(471, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 13:55:51'),
(472, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 14:07:50'),
(473, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 14:07:53'),
(474, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 14:12:24'),
(475, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 14:12:26'),
(476, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 14:14:28'),
(477, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 14:14:30'),
(478, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 14:14:33'),
(479, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 14:27:07'),
(480, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 14:29:45'),
(481, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 14:30:47'),
(482, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 14:51:27'),
(483, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 14:51:31'),
(484, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 15:24:37'),
(485, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 15:43:33'),
(486, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 15:47:46'),
(487, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 15:47:51'),
(488, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 15:49:03'),
(489, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 15:49:05'),
(490, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 15:49:37'),
(491, 20, 'gbot967', 'otp_reset_request', 'OTP reset password request sent to email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 15:51:24'),
(492, 20, 'gbot967', 'otp_verified', 'OTP verified successfully for password reset', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 15:51:45'),
(493, 20, 'gbot967', 'password_reset_success', 'Password reset completed via OTP verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 15:51:50'),
(494, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 15:51:59'),
(495, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 16:50:45'),
(496, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 18:25:22');
INSERT INTO `activity_logs` (`id`, `user_id`, `username`, `activity_type`, `activity_description`, `user_agent`, `created_at`) VALUES
(497, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 18:25:33'),
(498, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 19:08:52'),
(499, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 19:08:52'),
(500, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 19:08:56'),
(501, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-14 19:09:03'),
(502, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 06:04:23'),
(503, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 06:04:25'),
(504, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 06:04:30'),
(505, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 08:02:35'),
(506, 20, 'gbot967', 'otp_reset_request', 'OTP reset password request sent to email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 08:41:07'),
(507, 20, 'gbot967', 'otp_reset_request', 'OTP reset password request sent to email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 09:06:48'),
(508, 20, 'gbot967', 'otp_verified', 'OTP verified successfully for password reset', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 09:07:13'),
(509, 20, 'gbot967', 'password_reset_success', 'Password reset completed via OTP verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 09:13:29'),
(510, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 09:43:53'),
(511, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 10:03:02'),
(512, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 10:03:08'),
(513, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 10:03:12'),
(514, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 10:04:35'),
(515, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 10:32:38'),
(516, NULL, 'gbot968', 'register', 'User gbot968 baru saja mendaftar', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 10:33:30'),
(517, NULL, 'gbot968', 'LOGIN_SUCCESS', 'User gbot968 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 10:33:37'),
(518, NULL, 'gbot968', 'logout', 'User gbot968 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 10:33:39'),
(519, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 10:33:42'),
(520, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 11:05:10'),
(521, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 11:05:14'),
(522, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 11:07:00'),
(523, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 11:07:32'),
(524, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 11:11:54'),
(525, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 11:11:57'),
(526, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 13:14:50'),
(527, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 13:24:18'),
(528, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 13:28:51'),
(529, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 13:29:23'),
(530, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 13:58:13'),
(531, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 14:04:16'),
(532, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 14:09:10'),
(533, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 14:12:00'),
(534, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 17:36:24'),
(535, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 17:55:58'),
(536, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 17:56:02'),
(537, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 17:56:06'),
(538, NULL, 'gbot968', 'LOGIN_FAILED', 'Failed login attempt for username: gbot968', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 17:56:10'),
(539, NULL, 'gbot968', 'LOGIN_FAILED', 'Failed login attempt for username: gbot968', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 17:56:13'),
(540, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 17:56:17'),
(541, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 17:56:24'),
(542, NULL, 'gbot968', 'register', 'User gbot968 baru saja mendaftar', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 17:56:37'),
(543, 22, 'gbot968', 'LOGIN_SUCCESS', 'User gbot968 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 17:56:47'),
(544, 22, 'gbot968', 'logout', 'User gbot968 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:02:19'),
(545, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:02:23'),
(546, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:02:36'),
(547, NULL, 'gbot968', 'LOGIN_FAILED', 'Failed login attempt for username: gbot968', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:02:40'),
(548, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:03:28'),
(549, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:03:42'),
(550, 22, 'gbot968', 'LOGIN_SUCCESS', 'User gbot968 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:03:45'),
(551, 22, 'gbot968', 'logout', 'User gbot968 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:14:07'),
(552, 22, 'gbot968', 'LOGIN_SUCCESS', 'User gbot968 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:14:10'),
(553, 22, 'gbot968', 'logout', 'User gbot968 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:17:43'),
(554, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:17:52'),
(555, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:17:59'),
(556, 22, 'gbot968', 'LOGIN_SUCCESS', 'User gbot968 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:20:24'),
(557, 22, 'gbot968', 'logout', 'User gbot968 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:31:08'),
(558, NULL, 'testo', 'LOGIN_FAILED', 'Failed login attempt for username: testo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:31:11'),
(559, 22, 'gbot968', 'LOGIN_SUCCESS', 'User gbot968 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:31:17'),
(560, 22, 'gbot968', 'logout', 'User gbot968 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:33:05'),
(561, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:33:18'),
(562, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:33:37'),
(563, NULL, 'gbot9968', 'LOGIN_FAILED', 'Failed login attempt for username: gbot9968', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:33:46'),
(564, 22, 'gbot968', 'LOGIN_SUCCESS', 'User gbot968 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:34:00'),
(565, 22, 'gbot968', 'LOGIN_SUCCESS', 'User gbot968 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:36:54'),
(566, 22, 'gbot968', 'logout', 'User gbot968 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:55:15'),
(567, NULL, 'gbot96s', 'LOGIN_FAILED', 'Failed login attempt - username not found: gbot96s', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:55:18'),
(568, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:55:26'),
(569, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:55:28'),
(570, NULL, 'gbot967', 'LOGIN_FAILED', 'Failed login attempt - wrong password for username: gbot967', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:55:31'),
(571, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-15 18:59:39'),
(572, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 04:07:06'),
(573, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:04:39'),
(574, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:04:56'),
(575, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:05:16'),
(576, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:09:48'),
(577, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:09:58'),
(578, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:10:56'),
(579, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:10:59'),
(580, NULL, 'yogawiratama', 'register', 'User yogawiratama baru saja mendaftar', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:11:54'),
(581, 23, 'yogawiratama', 'LOGIN_SUCCESS', 'User yogawiratama logged in successfully', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '2025-07-16 05:12:35'),
(582, 23, 'yogawiratama', 'logout', 'User yogawiratama baru saja logout', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '2025-07-16 05:12:38'),
(583, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:12:53'),
(584, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:13:20'),
(585, 23, 'yogawiratama', 'otp_reset_request', 'OTP reset password request sent to email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:13:25'),
(586, 23, 'yogawiratama', 'otp_verified', 'OTP verified successfully for password reset', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:13:48'),
(587, 23, 'yogawiratama', 'password_reset_success', 'Password reset completed via OTP verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:14:02'),
(588, NULL, 'yogawiratama', 'LOGIN_FAILED', 'Failed login attempt - wrong password for username: yogawiratama', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:14:12'),
(589, 23, 'yogawiratama', 'LOGIN_SUCCESS', 'User yogawiratama logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:14:19'),
(590, 23, 'yogawiratama', 'logout', 'User yogawiratama baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:14:33'),
(591, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:15:51'),
(592, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:15:54'),
(593, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:55:55'),
(594, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 05:55:57'),
(595, 20, 'gbot967', 'otp_reset_request', 'OTP reset password request sent to email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 15:52:24'),
(596, 20, 'gbot967', 'otp_verified', 'OTP verified successfully for password reset', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 15:53:28'),
(597, 20, 'gbot967', 'password_reset_success', 'Password reset completed via OTP verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 16:02:46'),
(598, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 16:03:32'),
(599, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 16:11:25'),
(600, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 16:11:28'),
(601, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 17:14:43'),
(602, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 17:14:50'),
(603, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 17:15:54'),
(604, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-16 17:19:50'),
(605, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-17 08:38:24'),
(606, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-17 08:44:05'),
(607, 20, 'gbot967', 'LOGIN_SUCCESS', 'User gbot967 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-17 12:54:36'),
(608, 20, 'gbot967', 'logout', 'User gbot967 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-17 14:24:17'),
(609, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-17 14:24:21'),
(610, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-17 14:26:11'),
(611, 22, 'gbot968', 'LOGIN_SUCCESS', 'User gbot968 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-17 19:21:10'),
(612, 22, 'gbot968', 'LOGIN_SUCCESS', 'User gbot968 logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-17 19:21:11'),
(613, 22, 'gbot968', 'logout', 'User gbot968 baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-17 20:36:34'),
(614, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-17 22:48:08'),
(615, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-18 03:57:40'),
(616, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-20 07:01:56'),
(617, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-20 07:55:12'),
(618, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-20 07:55:16'),
(619, NULL, 'admin', 'LOGIN_FAILED', 'Failed login attempt - wrong password for username: admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-20 13:42:09'),
(620, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-20 13:42:14'),
(621, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-20 13:43:38'),
(622, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-20 13:43:42'),
(623, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-20 13:44:46'),
(624, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-20 13:44:48'),
(625, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-21 11:07:25'),
(626, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-22 05:18:03'),
(627, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-22 08:11:20'),
(628, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-22 14:56:25'),
(629, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-24 09:53:08'),
(630, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-24 10:13:31'),
(631, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-24 10:13:33'),
(632, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-24 12:15:04'),
(633, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 07:29:16'),
(634, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 09:31:44'),
(635, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 11:32:45'),
(636, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 11:40:01'),
(637, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 11:40:08'),
(638, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 11:47:21'),
(639, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 11:47:25'),
(640, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 11:57:38'),
(641, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 11:57:39'),
(642, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 11:57:43'),
(643, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 11:57:45'),
(644, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 11:57:50'),
(645, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 11:57:51'),
(646, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 12:05:23'),
(647, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 12:05:25'),
(648, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 12:36:12'),
(649, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 12:36:14'),
(650, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 13:26:51'),
(651, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 13:26:53'),
(652, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-25 14:16:51'),
(653, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 05:16:05'),
(654, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 05:16:23'),
(655, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 05:16:27'),
(656, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 05:27:13'),
(657, 12, 'admin', 'otp_reset_request', 'OTP reset password request sent to email', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 05:27:25'),
(658, 12, 'admin', 'otp_verified', 'OTP verified successfully for password reset', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 05:27:46'),
(659, 12, 'admin', 'password_reset_success', 'Password reset completed via OTP verification', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 05:28:23'),
(660, NULL, 'admin', 'LOGIN_FAILED', 'Failed login attempt - wrong password for username: admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 05:28:29'),
(661, 12, 'admin', 'LOGIN_SUCCESS', 'User admin logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 05:28:35'),
(662, 12, 'admin', 'logout', 'User admin baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 05:32:09'),
(663, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 05:32:11'),
(664, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 05:48:53'),
(665, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 05:48:55'),
(666, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 07:26:54'),
(667, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 07:26:57'),
(668, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 08:14:18'),
(669, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 08:14:19'),
(670, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 11:00:45'),
(671, 14, 'cornerbites', 'logout', 'User cornerbites baru saja logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 11:41:41'),
(672, 14, 'cornerbites', 'LOGIN_SUCCESS', 'User cornerbites logged in successfully', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-29 14:20:10');

-- --------------------------------------------------------

--
-- Table structure for table `labor_costs`
--

DROP TABLE IF EXISTS `labor_costs`;
CREATE TABLE `labor_costs` (
  `id` int(3) UNSIGNED NOT NULL,
  `position_name` varchar(30) NOT NULL,
  `hourly_rate` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `labor_costs`
--

INSERT INTO `labor_costs` (`id`, `position_name`, `hourly_rate`, `is_active`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Barista', '25000.00', 1, '2025-06-30 19:25:30', '2025-06-30 19:25:30', 1),
(2, 'Baker', '7000.00', 1, '2025-06-30 19:25:30', '2025-07-09 18:46:40', 1),
(3, 'Kitchen Staff', '20000.00', 1, '2025-06-30 19:25:30', '2025-06-30 19:25:30', 1),
(4, 'Manager', '50000.00', 1, '2025-06-30 19:25:30', '2025-06-30 19:25:30', 1),
(5, 'Intern', '20000.00', 1, '2025-07-01 06:31:02', '2025-07-01 06:31:02', 1),
(6, 'Pembantu', '5000.00', 1, '2025-07-01 07:19:35', '2025-07-01 07:19:35', 1),
(7, 'test', '1500000.00', 0, '2025-07-03 08:35:58', '2025-07-03 09:29:17', 1),
(8, 'Baker', '15000.00', 1, '2025-07-11 13:25:04', '2025-07-11 13:25:04', 1),
(9, 'Kasir', '15000.00', 1, '2025-07-11 13:25:33', '2025-07-11 13:25:33', 1),
(10, 'Baker', '15000.00', 0, '2025-07-11 08:29:27', '2025-07-14 08:51:03', 14),
(11, 'Baker', '15000.00', 1, '2025-07-11 08:29:40', '2025-07-11 08:29:40', 16),
(12, 'Intern', '15000.00', 0, '2025-07-11 08:30:28', '2025-07-11 13:32:07', 16),
(13, 'Intern', '30000.00', 0, '2025-07-12 07:48:46', '2025-07-14 08:50:04', 14),
(14, 'Baker', '15000.00', 0, '2025-07-14 05:06:44', '2025-07-14 05:52:57', 20),
(15, 'Pembantu', '1200.00', 0, '2025-07-14 05:37:05', '2025-07-14 05:52:22', 20),
(16, 'Pembantu', '15000.00', 0, '2025-07-14 05:53:06', '2025-07-14 05:53:13', 20),
(17, 'Pembantu', '30000.00', 0, '2025-07-14 05:56:48', '2025-07-14 05:59:50', 20),
(18, 'Baker', '12222.00', 0, '2025-07-14 06:01:01', '2025-07-14 06:01:06', 20),
(19, 'Baker', '30000.00', 0, '2025-07-14 06:01:25', '2025-07-14 06:01:32', 20),
(20, 'Baker', '15000.00', 0, '2025-07-14 07:21:50', '2025-07-14 07:21:54', 20),
(21, 'Baker', '3000000.00', 0, '2025-07-14 07:22:15', '2025-07-14 07:22:21', 20),
(22, 'test', '15000.00', 0, '2025-07-14 08:32:56', '2025-07-14 08:33:01', 20),
(23, 'Baker', '32000.00', 0, '2025-07-14 08:49:09', '2025-07-14 08:49:12', 20),
(24, 'Baker', '15000.00', 0, '2025-07-14 08:55:59', '2025-07-14 08:56:02', 14),
(25, 'Baker', '15000.00', 0, '2025-07-14 08:56:18', '2025-07-14 08:56:25', 14),
(26, 'Baker', '15000.00', 0, '2025-07-14 08:56:43', '2025-07-14 08:56:46', 14),
(27, 'Baker', '15000.00', 0, '2025-07-14 09:02:41', '2025-07-14 09:02:45', 14),
(28, 'Baker', '15000.00', 0, '2025-07-14 09:02:52', '2025-07-14 09:36:04', 14),
(29, 'Pembantu', '15000.00', 0, '2025-07-14 09:38:57', '2025-07-14 09:39:02', 14),
(30, 'Baker', '15000.00', 0, '2025-07-14 09:41:29', '2025-07-14 09:41:32', 14),
(31, 'Baker', '15000.00', 0, '2025-07-14 09:42:03', '2025-07-14 09:42:10', 14),
(32, 'Baker', '15000.00', 0, '2025-07-14 09:44:38', '2025-07-14 09:44:41', 14),
(33, 'Baker', '15000.00', 0, '2025-07-14 09:46:54', '2025-07-14 09:46:57', 14),
(34, 'Baker', '15000.00', 0, '2025-07-14 09:47:32', '2025-07-14 09:47:35', 14),
(35, 'Baker', '15000.00', 0, '2025-07-14 09:51:10', '2025-07-14 09:51:13', 14),
(36, 'Baker', '15000.00', 0, '2025-07-14 09:55:33', '2025-07-14 09:55:37', 14),
(37, 'Baker', '30000.00', 0, '2025-07-14 09:56:59', '2025-07-14 09:57:02', 14),
(38, 'Baker', '15000.00', 0, '2025-07-14 09:58:43', '2025-07-14 09:58:46', 14),
(39, 'Baker', '15000.00', 0, '2025-07-14 09:59:06', '2025-07-14 09:59:09', 14),
(40, 'Baker', '15000.00', 0, '2025-07-14 10:47:57', '2025-07-14 10:48:00', 14),
(41, 'Baker', '15000.00', 0, '2025-07-14 10:52:10', '2025-07-14 10:52:13', 20),
(42, 'Baker', '15000.00', 1, '2025-07-14 11:38:53', '2025-07-14 14:17:29', 20),
(43, 'Baker', '22.00', 0, '2025-07-14 14:15:44', '2025-07-14 14:15:49', 20),
(44, 'Baker', '15000.00', 0, '2025-07-15 10:34:10', '2025-07-24 08:12:54', 14),
(45, 'Intern', '20000.00', 1, '2025-07-17 09:24:15', '2025-07-17 09:24:15', 20),
(46, 'Baker', '15000.00', 0, '2025-07-24 04:58:43', '2025-07-25 05:12:27', 14),
(49, 'Baker', '15000.00', 0, '2025-07-25 06:33:44', '2025-07-25 07:20:09', 14),
(50, 'Baker', '15000.00', 0, '2025-07-25 07:20:12', '2025-07-25 07:37:37', 14),
(51, 'Baker', '15000.00', 1, '2025-07-25 08:35:50', '2025-07-25 08:35:50', 14),
(52, 'Baker 2', '2.00', 1, '2025-07-29 00:51:13', '2025-07-29 00:51:13', 14),
(53, 'Baker 3', '3.00', 1, '2025-07-29 00:51:15', '2025-07-29 00:51:15', 14),
(54, 'Baker 4', '4.00', 1, '2025-07-29 00:51:19', '2025-07-29 00:51:19', 14),
(55, 'Baker 5', '5.00', 1, '2025-07-29 00:51:22', '2025-07-29 00:51:22', 14),
(56, 'Baker 6', '6.00', 1, '2025-07-29 00:51:26', '2025-07-29 00:51:26', 14);

-- --------------------------------------------------------

--
-- Table structure for table `otp_tokens`
--

DROP TABLE IF EXISTS `otp_tokens`;
CREATE TABLE `otp_tokens` (
  `id` int(3) UNSIGNED NOT NULL,
  `user_id` int(3) UNSIGNED NOT NULL,
  `email` varchar(50) NOT NULL,
  `otp_code` varchar(6) NOT NULL,
  `otp_hash` varchar(255) NOT NULL COMMENT 'Hash dari OTP untuk keamanan',
  `expires_at` datetime NOT NULL,
  `used` tinyint(1) DEFAULT 0,
  `attempt_count` int(11) DEFAULT 0 COMMENT 'Jumlah percobaan verifikasi',
  `max_attempts` int(11) DEFAULT 3 COMMENT 'Maksimal percobaan',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabel untuk menyimpan OTP reset password';

--
-- Dumping data for table `otp_tokens`
--

INSERT INTO `otp_tokens` (`id`, `user_id`, `email`, `otp_code`, `otp_hash`, `expires_at`, `used`, `attempt_count`, `max_attempts`, `created_at`) VALUES
(1, 20, 'gbot967@gmail.com', '240093', '$2y$10$tws2ljDrMkQ3u4XM9kWtReb0xBdBZUFsSu0J8Pj6Jlco0akHrdEf6', '2025-07-14 10:02:56', 1, 0, 3, '2025-07-14 07:57:56'),
(4, 20, 'gbot967@gmail.com', '992718', '$2y$10$BTEdRJ9J1NzIF.0ThPrVFef7ligDbQnsEH8jkKnm6.25s.RNitIN6', '2025-07-14 10:09:46', 1, 2, 3, '2025-07-14 08:04:46'),
(5, 20, 'gbot967@gmail.com', '313544', '$2y$10$7fhaHPXD7MXiAu6GNlWkrukZsgKTjsnc2iIKbiRpAlT1idOXoIiDW', '2025-07-14 10:11:06', 1, 0, 3, '2025-07-14 08:06:06'),
(7, 20, 'gbot967@gmail.com', '180935', '$2y$10$KNBDK69KwFQSIWAIWeDtR.1D9VnfZO5G6CGVmC5p40t2ishX1baV.', '2025-07-14 10:12:24', 1, 0, 3, '2025-07-14 08:07:24'),
(9, 20, 'gbot967@gmail.com', '944225', '$2y$10$hpfNSxV5MjL5XVSDe46pQOYIT1wN0lwsvi6N93JBX55In6//L5SOK', '2025-07-14 10:13:57', 1, 0, 3, '2025-07-14 08:08:57'),
(10, 20, 'gbot967@gmail.com', '526712', '$2y$10$zwwuNnRAT0qfWM5DDQ8bP.r/KzO8q/l2Y7xRh0VwapZez7uzynOaK', '2025-07-14 10:53:46', 1, 0, 3, '2025-07-14 08:48:46'),
(11, 20, 'gbot967@gmail.com', '603668', '$2y$10$IE9z7Pc24OncXRjADLJOAODaMCkIAWjpiWVpw125LXBUnfRCpG.mG', '2025-07-14 12:37:30', 1, 0, 3, '2025-07-14 10:32:30'),
(12, 20, 'gbot967@gmail.com', '317392', '$2y$10$./h92N85YusX96wSDeqKN.I9HauA.mtwMdHG8l1B61qCRKj/ht0gC', '2025-07-14 17:56:24', 1, 0, 3, '2025-07-14 15:51:24'),
(14, 20, 'gbot967@gmail.com', '683158', '$2y$10$kYR1X8uZhMoMWuVod6376eRXtNQM85UJ3URybYbApNZtuo46Oovmy', '2025-07-15 11:11:48', 1, 0, 3, '2025-07-15 09:06:48'),
(15, 23, 'wiratamayoga1@gmail.com', '699403', '$2y$10$IcMEfaIOcfo.AOWrQsLRke6PFf25lqKKpwCQJsi9zOsuZLm0V08se', '2025-07-16 07:18:25', 1, 0, 3, '2025-07-16 05:13:25'),
(16, 20, 'gbot967@gmail.com', '328499', '$2y$10$q2/zXDnbdFZb9HxJInHyR./zK0CG5ImAeJXEAk.7pmDH7naJ8xEIG', '2025-07-16 17:57:24', 1, 0, 3, '2025-07-16 15:52:24'),
(17, 12, 'nandana.rasendriya294@gmail.com', '831949', '$2y$10$O8ehwgvEH8HyWURQSfTyBOnKADks.m4GILPq7LeioxjDLhHPd.wp2', '2025-07-29 07:32:25', 1, 0, 3, '2025-07-29 05:27:25');

-- --------------------------------------------------------

--
-- Table structure for table `overhead_costs`
--

DROP TABLE IF EXISTS `overhead_costs`;
CREATE TABLE `overhead_costs` (
  `id` int(3) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(13,2) NOT NULL,
  `allocation_method` enum('percentage','per_unit','per_hour') DEFAULT 'percentage',
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estimated_uses` int(11) DEFAULT 1,
  `user_id` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `overhead_costs`
--

INSERT INTO `overhead_costs` (`id`, `name`, `description`, `amount`, `allocation_method`, `is_active`, `created_at`, `updated_at`, `estimated_uses`, `user_id`) VALUES
(1, 'Sewa Toko', 'Biaya sewa bulanan', '500000.00', 'percentage', 1, '2025-06-30 19:25:30', '2025-07-08 17:05:02', 1, 1),
(2, 'Listrik & Air', 'Utility bulanan', '300000.00', '', 1, '2025-06-30 19:25:30', '2025-07-10 13:55:01', 10, 1),
(3, 'Gaji Admin', 'Gaji karyawan admin', '3000000.00', 'percentage', 0, '2025-06-30 19:25:30', '2025-07-07 14:33:36', 1, 1),
(4, 'Penyusutan Peralatan', 'Depresiasi peralatan produksi', '500000.00', '', 1, '2025-06-30 19:25:30', '2025-07-10 13:52:20', 1, 1),
(5, 'test', '', '15000.00', 'per_unit', 0, '2025-06-30 19:28:00', '2025-07-09 18:23:17', 1, 1),
(6, 'Contoh', 'Contoh', '20000.00', 'percentage', 0, '2025-07-01 06:30:49', '2025-07-03 08:54:18', 1, 1),
(7, 'Listrik', '', '50000.00', 'percentage', 0, '2025-07-01 06:40:02', '2025-07-03 09:01:16', 1, 1),
(8, 'Air', 'Test', '505000.00', 'percentage', 0, '2025-07-01 06:46:05', '2025-07-07 14:33:51', 1, 1),
(9, 'Gaji Yoga', 'test', '50000.00', 'percentage', 0, '2025-07-01 08:00:52', '2025-07-01 08:45:55', 1, 1),
(10, 'Gaji Nanda', 'test', '20000.00', 'percentage', 0, '2025-07-01 08:00:58', '2025-07-09 18:29:55', 1, 1),
(11, 'Gaji Haikal', 'test', '55555.00', 'percentage', 0, '2025-07-01 08:01:10', '2025-07-09 18:29:53', 1, 1),
(12, 'Apar', 'test', '50000.00', 'percentage', 0, '2025-07-01 08:32:52', '2025-07-03 08:54:22', 1, 1),
(13, 'Popo', 'test', '50000.00', 'percentage', 0, '2025-07-03 08:10:08', '2025-07-03 08:10:15', 1, 1),
(14, 'Gas', 'Gas', '22000.00', '', 0, '2025-07-03 08:53:18', '2025-07-10 13:17:36', 3, 1),
(15, 'Contoh1', 'Test', '500000.00', 'percentage', 0, '2025-07-03 09:09:31', '2025-07-03 10:05:35', 1, 1),
(16, 'Gas', 'Gas', '22000.00', '', 1, '2025-07-10 13:18:31', '2025-07-10 13:18:31', 8, 1),
(17, 'gas', 'gas', '22000.00', '', 1, '2025-07-11 13:26:22', '2025-07-11 13:26:22', 8, 1),
(18, 'Air', 'test', '500000.00', '', 0, '2025-07-11 08:31:40', '2025-07-11 13:32:45', 30, 14),
(19, 'Air', 'testtttt', '5555.00', '', 0, '2025-07-14 05:06:38', '2025-07-14 05:41:12', 30, 20),
(20, 'Air', 'test', '50000.00', '', 0, '2025-07-14 05:34:29', '2025-07-14 05:53:00', 30, 20),
(21, 'Gas', 'gas', '22000.00', '', 0, '2025-07-14 05:35:59', '2025-07-14 05:52:28', 9, 20),
(22, 'Gas', 'gas', '22000.00', '', 0, '2025-07-14 05:57:28', '2025-07-14 05:57:31', 30, 20),
(23, 'Air', 'test', '22000.00', '', 0, '2025-07-14 07:22:38', '2025-07-14 07:22:40', 30, 20),
(24, 'Gas', 'asdsa', '50000.00', '', 0, '2025-07-14 08:49:35', '2025-07-14 08:49:37', 30, 20),
(25, 'Gas', 'asda', '1312.00', 'per_unit', 0, '2025-07-14 09:55:48', '2025-07-14 09:55:50', 123, 14),
(26, 'Air', 'sadsad', '21313.00', '', 1, '2025-07-14 11:41:36', '2025-07-14 14:17:38', 123, 20),
(27, 'Gas', 'gas', '50000.00', '', 0, '2025-07-24 04:58:11', '2025-07-24 07:51:11', 8, 14),
(28, 'Gas', 'gas', '25000.00', '', 0, '2025-07-24 04:58:22', '2025-07-25 05:12:48', 30, 14),
(29, 'Gas', 'gas', '23000.00', '', 0, '2025-07-24 08:00:14', '2025-07-25 05:13:07', 35, 14),
(30, 'test', 'asdsa', '12321.00', '', 0, '2025-07-25 07:32:39', '2025-07-25 07:34:29', 2, 14),
(31, 'test', 'asdsa', '50000.00', '', 0, '2025-07-25 07:32:46', '2025-07-25 07:32:49', 23, 14),
(32, '1', '1', '1.00', '', 1, '2025-07-29 00:45:51', '2025-07-29 00:45:51', 1, 14),
(33, '2', '2', '2.00', '', 1, '2025-07-29 00:45:55', '2025-07-29 00:45:55', 2, 14),
(34, '3', '3', '3.00', '', 1, '2025-07-29 00:45:59', '2025-07-29 00:45:59', 3, 14),
(35, '4', '4', '4.00', '', 1, '2025-07-29 00:46:03', '2025-07-29 00:46:03', 4, 14),
(36, '5', '5', '5.00', '', 1, '2025-07-29 00:46:07', '2025-07-29 00:46:07', 5, 14),
(37, '6', '6', '6.00', '', 1, '2025-07-29 00:46:13', '2025-07-29 00:46:13', 6, 14),
(38, '7', '7', '7.00', '', 1, '2025-07-29 00:46:16', '2025-07-29 00:46:16', 7, 14),
(39, '8', '8', '8.00', '', 1, '2025-07-29 00:46:21', '2025-07-29 00:46:21', 8, 14);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `id` int(3) UNSIGNED NOT NULL,
  `user_id` int(3) UNSIGNED NOT NULL,
  `email` varchar(50) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `used` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabel untuk token reset password';

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`id`, `user_id`, `email`, `token`, `expires_at`, `used`, `created_at`) VALUES
(1, 20, 'gbot967@gmail.com', '73764ed550f1457d2fd1673351e97849fae30f2d40d275ab3dd1cf31a609cdbd', '2025-07-14 10:11:30', 1, '2025-07-14 08:01:30'),
(2, 20, 'gbot967@gmail.com', 'bd6ffc425e0a11aeebb3228a66d0640b054cff477fee6f04c292e87ae16a6e2b', '2025-07-14 10:15:59', 0, '2025-07-14 08:05:59'),
(3, 20, 'gbot967@gmail.com', 'f110421696bd755266833ac67fc0374efd7ef4b9a7fe2763b99587b2ee920e8d', '2025-07-14 10:16:20', 1, '2025-07-14 08:06:20'),
(4, 20, 'gbot967@gmail.com', '68d5072016d42cc66d409d2a7c1d6ae6a568f5a30a790d24f2eda5e45647ba3d', '2025-07-14 10:17:35', 0, '2025-07-14 08:07:35'),
(5, 20, 'gbot967@gmail.com', '9628305ec157c27f3c2f95591d4fb624996749ea13628623bbe1ea1090041931', '2025-07-14 10:19:11', 1, '2025-07-14 08:09:11'),
(6, 20, 'gbot967@gmail.com', '53b201282af8425755d7a22d2af77adc348f135ef6dd45089c1c5be0a164c9b2', '2025-07-14 10:59:03', 1, '2025-07-14 08:49:03'),
(7, 20, 'gbot967@gmail.com', 'ac99d154cb806816632b552e92c79d14b1e28c775c201a88f6643c2b5b0cd554', '2025-07-14 12:42:44', 1, '2025-07-14 10:32:44'),
(8, 20, 'gbot967@gmail.com', '09bd1ca2ebaca39657f753f4fb42b65d5ef756484d067400a7bfd817fa9c150d', '2025-07-14 18:01:45', 1, '2025-07-14 15:51:45'),
(9, 20, 'gbot967@gmail.com', '6e4d11b7144ad83980cc5d2e3da31949d95a88aee665c16d936ebf12f8748330', '2025-07-15 11:17:13', 1, '2025-07-15 09:07:13'),
(10, 23, 'wiratamayoga1@gmail.com', '52428c59693b12a134de9ea2848dc50fec312c621acffaae9d4f0e49d5aa34d1', '2025-07-16 07:23:48', 1, '2025-07-16 05:13:48'),
(11, 20, 'gbot967@gmail.com', '9d8afc7ee46837ddad6dd47065e052ffe671152d61d6a53b527212ac9cd031ff', '2025-07-16 18:03:28', 1, '2025-07-16 15:53:28'),
(12, 12, 'nandana.rasendriya294@gmail.com', 'f68f71f4b72e39c7ecd0595a5d2f4e38c046e37a1feb69cf190ae8ba90f6dcb9', '2025-07-29 07:37:46', 1, '2025-07-29 05:27:46');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(3) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `unit` varchar(15) DEFAULT NULL,
  `cost_price` decimal(13,2) DEFAULT NULL,
  `production_yield` int(11) DEFAULT 1,
  `sale_price` decimal(13,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `production_time_hours` decimal(5,2) DEFAULT 1.00,
  `overhead_percentage` decimal(5,2) DEFAULT 0.00,
  `direct_labor_cost` decimal(15,2) DEFAULT 0.00,
  `user_id` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `unit`, `cost_price`, `production_yield`, `sale_price`, `created_at`, `updated_at`, `production_time_hours`, `overhead_percentage`, `direct_labor_cost`, `user_id`) VALUES
(8, 'Donat Deso', 'pcs', '12769.17', 30, '18242.00', '2025-07-01 06:33:01', '2025-07-10 14:04:17', '6.00', '0.00', '0.00', 1),
(29, 'Donat Deso', 'pcs', '27563.00', 1, '5000.00', '2025-07-14 10:07:40', '2025-07-17 08:40:58', '1.00', '0.00', '0.00', 20),
(50, 'Donat Madu', 'pcs', NULL, 1, '0.00', '2025-07-17 14:24:06', '2025-07-17 14:24:06', '1.00', '0.00', '0.00', 20),
(74, 'Burger', 'pcs', NULL, 1, '0.00', '2025-07-29 05:33:18', '2025-07-29 05:33:18', '1.00', '0.00', '0.00', 14),
(76, '2', 'pcs', '15000.00', 1, '18750.00', '2025-07-29 05:44:08', '2025-07-29 10:18:47', '1.00', '0.00', '0.00', 14),
(77, '3', 'pcs', '15000.00', 1, '18750.00', '2025-07-29 05:44:10', '2025-07-29 10:56:54', '1.00', '0.00', '0.00', 14),
(78, '4', 'pcs', '15000.00', 1, '18750.00', '2025-07-29 05:44:13', '2025-07-29 10:58:52', '1.00', '0.00', '0.00', 14),
(79, '5', 'pcs', '15000.00', 1, '18750.00', '2025-07-29 05:44:17', '2025-07-29 10:59:07', '1.00', '0.00', '0.00', 14),
(80, '6', 'pcs', '15000.00', 1, '18750.00', '2025-07-29 05:44:19', '2025-07-29 11:00:18', '1.00', '0.00', '0.00', 14),
(81, '7', 'pcs', NULL, 1, '0.00', '2025-07-29 05:44:23', '2025-07-29 05:44:23', '1.00', '0.00', '0.00', 14),
(82, '8', 'pcs', NULL, 1, '0.00', '2025-07-29 05:44:26', '2025-07-29 05:44:26', '1.00', '0.00', '0.00', 14),
(83, '9', 'pcs', NULL, 1, '0.00', '2025-07-29 05:44:29', '2025-07-29 05:44:29', '1.00', '0.00', '0.00', 14),
(84, '10', 'pcs', NULL, 1, '0.00', '2025-07-29 05:44:32', '2025-07-29 05:44:32', '1.00', '0.00', '0.00', 14),
(85, '11', 'pcs', NULL, 1, '0.00', '2025-07-29 05:44:34', '2025-07-29 05:44:34', '1.00', '0.00', '0.00', 14),
(86, '12', 'pcs', NULL, 1, '0.00', '2025-07-29 05:44:37', '2025-07-29 05:44:37', '1.00', '0.00', '0.00', 14),
(87, '13', 'pcs', NULL, 1, '0.00', '2025-07-29 10:06:49', '2025-07-29 10:06:49', '1.00', '0.00', '0.00', 14),
(88, '14', 'pcs', NULL, 1, '0.00', '2025-07-29 10:06:52', '2025-07-29 10:06:52', '1.00', '0.00', '0.00', 14),
(89, '15', 'pcs', NULL, 1, '0.00', '2025-07-29 10:06:55', '2025-07-29 10:06:55', '1.00', '0.00', '0.00', 14),
(90, '16', 'pcs', NULL, 1, '0.00', '2025-07-29 10:06:59', '2025-07-29 10:06:59', '1.00', '0.00', '0.00', 14);

-- --------------------------------------------------------

--
-- Table structure for table `product_labor_manual`
--

DROP TABLE IF EXISTS `product_labor_manual`;
CREATE TABLE `product_labor_manual` (
  `id` int(3) UNSIGNED NOT NULL,
  `product_id` int(3) UNSIGNED NOT NULL,
  `labor_id` int(3) UNSIGNED NOT NULL,
  `custom_hours` decimal(5,2) DEFAULT NULL,
  `custom_hourly_rate` decimal(10,2) DEFAULT NULL,
  `total_cost` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_labor_manual`
--

INSERT INTO `product_labor_manual` (`id`, `product_id`, `labor_id`, `custom_hours`, `custom_hourly_rate`, `total_cost`, `created_at`, `user_id`) VALUES
(29, 8, 2, '6.00', '7000.00', '42000.00', '2025-07-09 18:46:51', 1),
(44, 76, 51, '1.00', '15000.00', '15000.00', '2025-07-29 10:18:43', 14),
(45, 77, 51, '1.00', '15000.00', '15000.00', '2025-07-29 10:56:52', 14),
(46, 78, 51, '1.00', '15000.00', '15000.00', '2025-07-29 10:58:49', 14),
(47, 79, 51, '1.00', '15000.00', '15000.00', '2025-07-29 10:59:04', 14),
(48, 80, 51, '1.00', '15000.00', '15000.00', '2025-07-29 11:00:15', 14);

-- --------------------------------------------------------

--
-- Table structure for table `product_overhead_manual`
--

DROP TABLE IF EXISTS `product_overhead_manual`;
CREATE TABLE `product_overhead_manual` (
  `id` int(3) UNSIGNED NOT NULL,
  `product_id` int(3) UNSIGNED NOT NULL,
  `overhead_id` int(3) UNSIGNED NOT NULL,
  `custom_amount` decimal(15,2) DEFAULT NULL,
  `multiplier` decimal(5,2) DEFAULT 1.00,
  `final_amount` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `allocation_method` varchar(50) DEFAULT 'fixed',
  `user_id` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_overhead_manual`
--

INSERT INTO `product_overhead_manual` (`id`, `product_id`, `overhead_id`, `custom_amount`, `multiplier`, `final_amount`, `created_at`, `allocation_method`, `user_id`) VALUES
(56, 8, 14, '22000.00', '1.00', '22000.00', '2025-07-09 18:43:19', 'fixed', 1),
(60, 8, 16, '22000.00', '1.00', '22000.00', '2025-07-10 13:51:17', 'fixed', 1),
(64, 8, 2, '300000.00', '1.00', '300000.00', '2025-07-10 13:55:10', 'fixed', 1),
(67, 29, 26, '21313.00', '1.00', '21313.00', '2025-07-17 08:40:58', 'fixed', 20);

-- --------------------------------------------------------

--
-- Table structure for table `product_recipes`
--

DROP TABLE IF EXISTS `product_recipes`;
CREATE TABLE `product_recipes` (
  `id` int(3) UNSIGNED NOT NULL,
  `product_id` int(3) UNSIGNED NOT NULL,
  `raw_material_id` int(3) UNSIGNED NOT NULL,
  `quantity_used` decimal(10,4) NOT NULL COMMENT 'Jumlah bahan baku yang digunakan untuk 1 unit produk jadi',
  `unit_measurement` varchar(50) DEFAULT NULL COMMENT 'Satuan pengukuran dalam resep (e.g., gram, ml, pcs)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `user_id` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Resep produk jadi berdasarkan bahan baku';

--
-- Dumping data for table `product_recipes`
--

INSERT INTO `product_recipes` (`id`, `product_id`, `raw_material_id`, `quantity_used`, `unit_measurement`, `created_at`, `updated_at`, `user_id`) VALUES
(55, 8, 2, '500.0000', 'gram', '2025-07-09 12:32:21', NULL, 1),
(56, 8, 4, '150.0000', 'gram', '2025-07-09 12:32:29', NULL, 1),
(57, 8, 3, '100.0000', 'gram', '2025-07-09 12:32:34', NULL, 1),
(63, 8, 6, '250.0000', 'gram', '2025-07-10 13:50:48', NULL, 1),
(69, 29, 32, '250.0000', 'gram', '2025-07-14 10:39:33', NULL, 20);

-- --------------------------------------------------------

--
-- Table structure for table `raw_materials`
--

DROP TABLE IF EXISTS `raw_materials`;
CREATE TABLE `raw_materials` (
  `id` int(3) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `unit` varchar(15) NOT NULL,
  `type` enum('bahan','kemasan') NOT NULL DEFAULT 'bahan',
  `purchase_price_per_unit` decimal(13,2) NOT NULL DEFAULT 0.00,
  `default_package_quantity` decimal(10,3) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `user_id` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Daftar bahan baku dan kemasan';

--
-- Dumping data for table `raw_materials`
--

INSERT INTO `raw_materials` (`id`, `name`, `brand`, `unit`, `type`, `purchase_price_per_unit`, `default_package_quantity`, `created_at`, `updated_at`, `user_id`) VALUES
(2, 'Tepung', 'Bola Salju', 'gram', 'bahan', '10000.00', '1000.000', '2025-06-22 10:56:53', '2025-07-08 17:05:50', 1),
(3, 'Maizena', 'Maizenaku', 'gram', 'bahan', '13000.00', '250.000', '2025-06-22 11:27:04', '2025-07-09 12:32:59', 1),
(4, 'Gula Pasir', 'Gulaku', 'gram', 'bahan', '17500.00', '1000.000', '2025-06-22 11:32:01', '2025-07-08 17:05:41', 1),
(6, 'Gula Merah', 'Pido', 'gram', 'bahan', '25000.00', '1000.000', '2025-06-24 08:03:20', '2025-07-08 17:05:35', 1),
(7, 'Gula Halus', 'Claris', 'gram', 'bahan', '20000.00', '1000.000', '2025-06-24 08:03:47', '2025-07-08 17:05:27', 1),
(9, 'Plastik Bawang', '', 'pcs', 'kemasan', '30000.00', '1000.000', '2025-06-24 08:45:35', '2025-07-08 07:45:13', 1),
(12, 'Plastik Kiloan', 'Bawang', 'pcs', 'kemasan', '20000.00', '500.000', '2025-07-03 12:45:43', '2025-07-06 10:36:45', 1),
(13, 'Gula Aren', 'Pedang', 'ml', 'bahan', '150000.00', '1000.000', '2025-07-03 13:39:43', '2025-07-07 16:30:44', 1),
(14, 'Air Miras', 'OrangTua', 'ml', 'bahan', '27000.00', '1000.000', '2025-07-06 10:56:55', '2025-07-08 05:39:45', 1),
(21, 'Air', 'Aqua', 'ml', 'bahan', '15000.00', '1000.000', '2025-07-11 13:43:25', NULL, 16),
(27, 'Teh', 'Tongji', 'gram', 'bahan', '10000.00', '500.000', '2025-07-11 15:42:44', NULL, 16),
(29, 'Plastik', 'Bawang', 'pcs', 'kemasan', '250000.00', '500.000', '2025-07-11 16:05:34', '2025-07-11 11:05:56', 16),
(32, 'Gula Aren', 'Pedang', 'ml', 'bahan', '25000.00', '1000.000', '2025-07-14 10:07:07', '2025-07-16 11:12:24', 20),
(43, 'Gula Halus', 'Gulaku', 'gram', 'bahan', '10000.00', '1000.000', '2025-07-24 12:32:29', NULL, 16),
(59, 'qwerty', 'qwerty', 'kg', 'kemasan', '123.00', '123.000', '2025-07-25 13:53:42', '2025-07-25 09:05:00', 14),
(60, 'Saos Sambal', 'Belibis', 'gram', 'bahan', '25000.00', '1000.000', '2025-07-29 05:34:09', '2025-07-29 00:34:18', 14),
(61, 'Daging Giling', 'Toko Daging Nusantara', 'gram', 'bahan', '100000.00', '1000.000', '2025-07-29 05:34:53', '2025-07-29 00:35:22', 14),
(63, 'Margarin', 'Mother Choice', 'gram', 'bahan', '18500.00', '500.000', '2025-07-29 05:38:43', NULL, 14),
(64, 'Tepung Terigu', 'Cakra', 'gram', 'bahan', '12800.00', '1000.000', '2025-07-29 05:39:05', NULL, 14),
(65, 'Gula Pasir', 'Gulaku', 'gram', 'bahan', '17500.00', '1000.000', '2025-07-29 05:39:21', NULL, 14),
(66, 'Telur', 'Warung', 'pcs', 'bahan', '7500.00', '3.000', '2025-07-29 05:39:55', NULL, 14),
(67, 'Ragi', 'Fermipan', 'gram', 'bahan', '63000.00', '450.000', '2025-07-29 05:40:47', NULL, 14),
(68, 'Garam', 'Dolphin', 'gram', 'bahan', '12000.00', '500.000', '2025-07-29 05:41:12', NULL, 14),
(69, '1', '1', 'kg', 'kemasan', '1.00', '1.000', '2025-07-29 05:59:30', NULL, 14),
(70, '2', '2', 'kg', 'kemasan', '2.00', '2.000', '2025-07-29 05:59:35', NULL, 14),
(71, '3', '3', 'kg', 'kemasan', '3.00', '3.000', '2025-07-29 05:59:41', '2025-07-29 01:00:21', 14),
(72, '4', '4', 'kg', 'kemasan', '4.00', '4.000', '2025-07-29 06:00:28', NULL, 14),
(73, '5', '5', 'kg', 'kemasan', '5.00', '5.000', '2025-07-29 06:00:33', NULL, 14),
(75, 'Teh', 'OrangTua', 'kg', 'bahan', '12000.00', '1000.000', '2025-07-29 07:15:42', NULL, 14),
(76, 'Gas', 'test', 'kg', 'bahan', '2000.00', '20000.000', '2025-07-29 07:15:50', NULL, 14),
(77, 'Gula Halus', 'Gulaku', 'kg', 'bahan', '15000.00', '1000.000', '2025-07-29 08:17:03', NULL, 14);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(3) UNSIGNED NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `must_change_password` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`, `must_change_password`) VALUES
(12, 'admin', 'nandana.rasendriya294@gmail.com', '$2y$10$LFY1HYZUw8AdAY8u9odACOoFO5FHwWHDHMXGa7MG0Y3N23MBVSnw.', 'admin', '2025-06-19 08:55:53', 0),
(14, 'cornerbites', NULL, '$2y$10$57rR1UDizpPcZ9pxNQqp7eEH9OwTzyS1MKbcagbWdldVXd7vWR5pe', 'user', '2025-06-19 12:33:26', 0),
(15, 'yogagi', NULL, '$2y$10$hAYCkLzWy7GmNnAFVAD4reqwd0zI6WpUQi5FuFIU9H2.P6ZrzjZi2', 'user', '2025-06-20 12:32:34', 0),
(16, 'anandacookies', NULL, '$2y$10$ES0HcxMXvN4.mcpAzH4GPOHU0Xbjm62J7whgVJyi.vSXVDapglutq', 'user', '2025-07-11 05:26:27', 0),
(20, 'gbot967', 'gbot967@gmail.com', '$2y$10$CRZFOdPXPH5Oz2cDTtVK1OOLxjnme9yT5/6CtTirmY.ecojPwgU4i', 'user', '2025-07-13 10:09:07', 0),
(22, 'gbot968', 'gbot968@gmail.com', '$2y$10$YvacEyvRLnkEcWb9FI6A4./jdcfHH57hqcqY3BEIaqchgV2aJJYiC', 'user', '2025-07-15 17:56:37', 0),
(23, 'yogawiratama', 'wiratamayoga1@gmail.com', '$2y$10$Eg.dnTx.kgnVM4XQ3HyAR.1OXRunWeB1y4R7FP.eAywKPY3Cmx3Su', 'user', '2025-07-16 05:11:54', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_ibfk_1` (`user_id`);

--
-- Indexes for table `labor_costs`
--
ALTER TABLE `labor_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp_tokens`
--
ALTER TABLE `otp_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_otp_hash` (`otp_hash`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_expires` (`expires_at`);

--
-- Indexes for table `overhead_costs`
--
ALTER TABLE `overhead_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_token` (`token`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_expires` (`expires_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_product_per_user` (`name`,`unit`,`user_id`);

--
-- Indexes for table `product_labor_manual`
--
ALTER TABLE `product_labor_manual`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_labor_unique` (`product_id`,`labor_id`),
  ADD KEY `labor_id` (`labor_id`);

--
-- Indexes for table `product_overhead_manual`
--
ALTER TABLE `product_overhead_manual`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_overhead_unique` (`product_id`,`overhead_id`),
  ADD KEY `overhead_id` (`overhead_id`);

--
-- Indexes for table `product_recipes`
--
ALTER TABLE `product_recipes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_raw_material_unique` (`product_id`,`raw_material_id`),
  ADD KEY `idx_product_lookup` (`product_id`,`raw_material_id`),
  ADD KEY `product_recipes_ibfk_2` (`raw_material_id`);

--
-- Indexes for table `raw_materials`
--
ALTER TABLE `raw_materials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_raw_material_complete` (`name`,`brand`,`unit`,`user_id`),
  ADD UNIQUE KEY `unique_raw_material_per_user` (`name`,`brand`,`unit`,`user_id`),
  ADD KEY `idx_type_name` (`type`,`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=673;

--
-- AUTO_INCREMENT for table `labor_costs`
--
ALTER TABLE `labor_costs`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `otp_tokens`
--
ALTER TABLE `otp_tokens`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `overhead_costs`
--
ALTER TABLE `overhead_costs`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `product_labor_manual`
--
ALTER TABLE `product_labor_manual`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `product_overhead_manual`
--
ALTER TABLE `product_overhead_manual`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `product_recipes`
--
ALTER TABLE `product_recipes`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `raw_materials`
--
ALTER TABLE `raw_materials`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `otp_tokens`
--
ALTER TABLE `otp_tokens`
  ADD CONSTRAINT `otp_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD CONSTRAINT `password_reset_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_labor_manual`
--
ALTER TABLE `product_labor_manual`
  ADD CONSTRAINT `product_labor_manual_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_labor_manual_ibfk_2` FOREIGN KEY (`labor_id`) REFERENCES `labor_costs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_overhead_manual`
--
ALTER TABLE `product_overhead_manual`
  ADD CONSTRAINT `product_overhead_manual_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_overhead_manual_ibfk_2` FOREIGN KEY (`overhead_id`) REFERENCES `overhead_costs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_recipes`
--
ALTER TABLE `product_recipes`
  ADD CONSTRAINT `product_recipes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_recipes_ibfk_2` FOREIGN KEY (`raw_material_id`) REFERENCES `raw_materials` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
