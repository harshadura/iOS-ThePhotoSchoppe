-- phpMyAdmin SQL Dump
-- version 4.0.10.2
-- http://www.phpmyadmin.net
--
-- Host: 127.6.132.2:3306
-- Generation Time: Sep 05, 2014 at 11:16 AM
-- Server version: 5.5.37
-- PHP Version: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `thephotoschoppe`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_rating`
--

CREATE TABLE IF NOT EXISTS `tbl_user_rating` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `image_id` varchar(255) NOT NULL,
  `rating` int(255) NOT NULL,
  `rating_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `tbl_user_rating`
--

INSERT INTO `tbl_user_rating` (`id`, `user_id`, `image_id`, `rating`, `rating_time`) VALUES
(1, '1', '1', 26, '2014-09-04 12:46:02'),
(2, '12', '13', 206, '2014-09-04 14:28:13'),
(3, '15', '13', 55, '2014-09-04 14:44:40'),
(4, '15', '17', 57, '2014-09-04 14:45:07'),
(5, '67', '1', 245, '2014-09-05 08:57:44'),
(6, '12', '2', 23, '2014-09-05 11:09:53'),
(7, '3', '3', 44, '2014-09-05 11:10:04'),
(8, '4', '332', 0, '2014-09-05 11:10:13'),
(9, '43', '4', 33, '2014-09-05 11:10:26');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
