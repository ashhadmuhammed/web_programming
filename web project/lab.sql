-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Mar 03, 2022 at 03:33 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_name` varchar(30) NOT NULL,
  `b_author` varchar(100) NOT NULL,
  `b_price` int(11) NOT NULL,
  `edition` int(11) NOT NULL,
  `category` int(40) NOT NULL,
  `publication` varchar(50) NOT NULL,
  `issued_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`b_id`, `b_name`, `b_author`, `b_price`, `edition`, `category`, `publication`, `issued_id`) VALUES
(5, 'Grl', 'Chetan', 500, 4, 0, 'DC', 11);

-- --------------------------------------------------------

--
-- Table structure for table `issue_book`
--

DROP TABLE IF EXISTS `issue_book`;
CREATE TABLE IF NOT EXISTS `issue_book` (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `b_id` (`b_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `issue_book`
--

INSERT INTO `issue_book` (`issue_id`, `b_id`, `date`, `status`, `user_id`) VALUES
(6, 5, '2022-03-02 10:56:45', 1, 5656),
(8, 5, '2022-03-02 12:38:37', 0, 5656),
(9, 5, '2022-03-03 03:25:45', 0, 5656),
(10, 5, '2022-03-03 03:26:03', 0, 5656),
(11, 5, '2022-03-03 03:26:12', 0, 5656);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `name` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `category` varchar(10) NOT NULL,
  `department` varchar(5) NOT NULL,
  `email` varchar(20) NOT NULL,
  `contact` bigint(12) NOT NULL,
  `id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `username`, `password`, `category`, `department`, `email`, `contact`, `id`) VALUES
('Athmajan A S', 'admin', '123', 'admin', 'MCA', 'athmajan007@gmail.co', 7012115253, 12),
('Aseel Abdulla', 'aseel@gmail.com', 'user', 'Student', 'M.Tec', 'aseelsm0027@gmail.co', 9207418150, 5656);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `issue_book`
--
ALTER TABLE `issue_book`
  ADD CONSTRAINT `issue_book_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `book` (`b_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `issue_book_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
