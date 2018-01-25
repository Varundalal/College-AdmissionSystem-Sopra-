-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2015 at 07:12 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `college_admission`
--

-- --------------------------------------------------------

--
-- Table structure for table `admission_form`
--

CREATE TABLE IF NOT EXISTS `admission_form` (
  `admission_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(10) NOT NULL,
  `college_id` varchar(10) NOT NULL,
  `stream_id` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `rdate` date NOT NULL,
  `tenth` int(11) NOT NULL,
  `twelveth` int(11) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `content_type` varchar(150) NOT NULL,
  `category` varchar(50) NOT NULL DEFAULT 'General',
  PRIMARY KEY (`admission_id`),
  UNIQUE KEY `userid` (`userid`,`college_id`,`stream_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `admission_form`
--

INSERT INTO `admission_form` (`admission_id`, `userid`, `college_id`, `stream_id`, `status`, `rdate`, `tenth`, `twelveth`, `filename`, `content_type`, `category`) VALUES
(1, '26', '1', 'Btech', 'Accepted', '2015-05-10', 99, 80, 'doc_1431256366208', 'text/plain', 'General'),
(3, '30', '1', 'Btech', 'Pending', '2015-05-15', 99, 80, 'doc_1431702389000', 'image/jpeg', 'OBC'),
(4, '31', '1', 'Btech11', 'Pending', '2015-05-15', 90, 90, 'doc_1431709862075', 'text/plain', 'General');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
