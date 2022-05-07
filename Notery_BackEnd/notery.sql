-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2018 at 06:32 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!40101 SET NAMES utf8mb4 */
;
--
-- Database: `lfnotes`
--
-- --------------------------------------------------------
--
-- Table structure for table `avatars`
--
CREATE TABLE `avatars` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_persian_ci NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_persian_ci;
--
-- Dumping data for table `avatars`
--
INSERT INTO `avatars` (`id`, `name`, `image`)
VALUES (1, 'female', 'uploads/avatars/female.png'),
  (2, 'male', 'uploads/avatars/male.png');
-- --------------------------------------------------------
--
-- Table structure for table `notes`
--
CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `message` varchar(5000) COLLATE utf8_persian_ci NOT NULL,
  `seen` tinyint(4) NOT NULL COMMENT '0= unseen ; 1 = seen',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_persian_ci;
-- --------------------------------------------------------
--
-- Table structure for table `settings`
--
CREATE TABLE `settings` (
  `user_id` int(11) NOT NULL,
  `nightMode` tinyint(4) NOT NULL,
  `font` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `bgColor` varchar(8) COLLATE utf8_persian_ci NOT NULL,
  `textColor` varchar(8) COLLATE utf8_persian_ci NOT NULL,
  `fontSize` tinyint(4) NOT NULL,
  `avatar` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_persian_ci;
-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(60) COLLATE utf8_persian_ci NOT NULL,
  `fname` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `lname` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=female ; 1= male',
  `password` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `longer_pass` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `session` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_persian_ci;
--
-- Indexes for dumped tables
--
--
-- Indexes for table `avatars`
--
ALTER TABLE `avatars`
ADD PRIMARY KEY (`id`);
--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);
--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
ADD PRIMARY KEY (`user_id`),
  ADD KEY `avatar` (`avatar`);
--
-- Indexes for table `users`
--
ALTER TABLE `users`
ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);
--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `avatars`
--
ALTER TABLE `avatars`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;
--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--
--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
ADD CONSTRAINT `settings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `settings_ibfk_2` FOREIGN KEY (`avatar`) REFERENCES `avatars` (`id`);
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;