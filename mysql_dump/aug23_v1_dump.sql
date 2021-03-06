-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 22, 2013 at 07:22 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pchallenge`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `uname` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `scope` enum('all','encoder','mod','mc') DEFAULT NULL,
  PRIMARY KEY (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`uname`, `password`, `scope`) VALUES
('admin', '7cd99475e3a278c8584641484ddd6aeb', 'all'),
('eco', 'e434dd9c7f573fb03924e0c4d3d44d45', 'encoder'),
('encoder', 'e7d77a94ff18fa23e9fc89e710ff2660', 'encoder'),
('ninz', '84410e60ebe48d90ee0caa7df6179e08', 'encoder'),
('ninz2', 'c9449408bb95f549503fa92de5550a4c', 'mod');

-- --------------------------------------------------------

--
-- Table structure for table `answered_round1`
--

CREATE TABLE IF NOT EXISTS `answered_round1` (
  `q_number` int(10) DEFAULT NULL,
  `team_id` varchar(32) DEFAULT NULL,
  `is_fast_round` tinyint(1) DEFAULT NULL,
  `answered_time` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answered_round1`
--

INSERT INTO `answered_round1` (`q_number`, `team_id`, `is_fast_round`, `answered_time`) VALUES
(1, 'b443db5b092a02c6787d60ae0bf19ad8', 0, 1377199190),
(21, 'b443db5b092a02c6787d60ae0bf19ad8', 0, 1377199192),
(40, '138cd03c355098720838aeef3d26893a', 0, 1377199278),
(22, '138cd03c355098720838aeef3d26893a', 0, 1377199278),
(23, '138cd03c355098720838aeef3d26893a', 0, 1377199279),
(43, '05bd29b524f0851d42e7902d6af59bf1', 0, 1377199280),
(25, '05bd29b524f0851d42e7902d6af59bf1', 0, 1377199280),
(7, '05bd29b524f0851d42e7902d6af59bf1', 0, 1377199281),
(8, '05bd29b524f0851d42e7902d6af59bf1', 0, 1377199281),
(2, 'b443db5b092a02c6787d60ae0bf19ad8', 0, 1377199289),
(3, 'b443db5b092a02c6787d60ae0bf19ad8', 0, 1377199289),
(4, 'b443db5b092a02c6787d60ae0bf19ad8', 0, 1377199289),
(39, 'b443db5b092a02c6787d60ae0bf19ad8', 0, 1377199291);

-- --------------------------------------------------------

--
-- Table structure for table `answered_round2`
--

CREATE TABLE IF NOT EXISTS `answered_round2` (
  `q_number` int(10) NOT NULL,
  `team_id` varchar(32) NOT NULL,
  `bet` int(10) NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '0',
  `badge_in_effect` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answered_round2`
--

INSERT INTO `answered_round2` (`q_number`, `team_id`, `bet`, `is_correct`, `badge_in_effect`) VALUES
(0, 'b443db5b092a02c6787d60ae0bf19ad8', 0, 0, NULL),
(0, '138cd03c355098720838aeef3d26893a', 0, 1, NULL),
(0, '05bd29b524f0851d42e7902d6af59bf1', 0, 0, NULL),
(0, 'f669a1cb5c11d28bdf26fc62535dcc2d', 0, 0, NULL),
(0, 'a4528c5c893594d75a1da7e5d9833ac6', 0, 0, NULL),
(0, '78f183fa5a7d8ecb22b9ad272c3abd79', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_config`
--

CREATE TABLE IF NOT EXISTS `app_config` (
  `app_state` enum('round_1','round_1m','round_2','paused','pre','stopped') DEFAULT NULL,
  `current_question_round2` int(11) DEFAULT NULL,
  `r2_state` enum('init','preview','badge','bet','show_question','timer','show_answer','scores') DEFAULT NULL,
  `round1_question_count` int(11) DEFAULT NULL,
  `badge_count` int(11) DEFAULT NULL,
  `round1_timer` int(11) DEFAULT NULL,
  `round2_question_count` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_config`
--

INSERT INTO `app_config` (`app_state`, `current_question_round2`, `r2_state`, `round1_question_count`, `badge_count`, `round1_timer`, `round2_question_count`) VALUES
('round_1', 0, 'init', 48, 5, 45, 20);

-- --------------------------------------------------------

--
-- Table structure for table `badge`
--

CREATE TABLE IF NOT EXISTS `badge` (
  `id` varchar(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  `query` text NOT NULL,
  `owner` varchar(32) DEFAULT NULL,
  `timestamp` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `badge`
--

INSERT INTO `badge` (`id`, `name`, `count`, `query`, `owner`, `timestamp`) VALUES
('ABS', 'abSORTion', 5, '', NULL, NULL),
('COL', 'Collectibles', 5, '', 'Na''Vi', 1377199291),
('LUC', 'Lucky *Star', 5, '', NULL, NULL),
('OOP', 'Oops, Added It Again', 5, '', NULL, NULL),
('SEG', 'Segmentation Difficult', 5, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `evnt` text,
  `priority` int(10) DEFAULT NULL,
  `date_time` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`evnt`, `priority`, `date_time`) VALUES
('Team Na''Vi answered question number1(e) worth 30pts', 1, 1377175108),
('Team Na''Vi answered question number46(e) worth 30pts', 1, 1377175109),
('Team TongFu answered question number43(e) worth 30pts', 1, 1377175112),
('Team TongFu answered question number9(d) worth 70pts', 1, 1377175113),
('Team TongFu answered question number13(e) worth 30pts', 1, 1377175114),
('Team Fnatic answered question number24(d) worth 70pts', 1, 1377175125),
('Team Alliance answered question number44(a) worth 50pts', 1, 1377175130),
('Team Orange Neolution answered question number33(d) worth 70pts', 1, 1377175134),
('Team iG answered question number39(d) worth 70pts', 1, 1377175139),
('Team Na''Vi answered question number16(e) worth 30pts', 1, 1377175144),
('Team Na''Vi answered question number16(e) worth 30pts', 1, 1377175147),
('Team Na''Vi answered question number16(e) worth 30pts', 1, 1377175149),
('Team Na''Vi answered question number32(a) worth 50pts', 1, 1377175153),
('Team Fnatic answered question number48(d) worth 70pts', 1, 1377175157),
('Team Na''Vi answered question number1(e) worth 30pts', 1, 1377199190),
('Team Na''Vi answered question number21(d) worth 70pts', 1, 1377199192),
('Team iG answered question number40(e) worth 30pts', 1, 1377199278),
('Team iG answered question number22(e) worth 30pts', 1, 1377199278),
('Team iG answered question number23(a) worth 50pts', 1, 1377199279),
('Team Alliance answered question number43(e) worth 30pts', 1, 1377199280),
('Team Alliance answered question number25(e) worth 30pts', 1, 1377199280),
('Team Alliance answered question number7(e) worth 30pts', 1, 1377199281),
('Team Alliance answered question number8(a) worth 50pts', 1, 1377199281),
('Team Na''Vi answered question number2(a) worth 50pts', 1, 1377199289),
('Team Na''Vi answered question number3(d) worth 70pts', 1, 1377199289),
('Team Na''Vi answered question number4(e) worth 30pts', 1, 1377199289),
('Team Na''Vi answered question number39(d) worth 70pts', 1, 1377199291),
('Team Na''Vi obtained the Collectibles badge.', 1, 1377199291);

-- --------------------------------------------------------

--
-- Table structure for table `questions_badge`
--

CREATE TABLE IF NOT EXISTS `questions_badge` (
  `q_number` int(11) NOT NULL,
  `badge_type` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions_badge`
--

INSERT INTO `questions_badge` (`q_number`, `badge_type`) VALUES
(37, 'ABS'),
(38, 'ABS'),
(39, 'ABS'),
(41, 'ABS'),
(42, 'ABS'),
(1, 'COL'),
(2, 'COL'),
(3, 'COL'),
(4, 'COL'),
(5, 'COL'),
(6, 'COL'),
(8, 'COL'),
(9, 'COL'),
(10, 'COL'),
(11, 'COL'),
(12, 'COL'),
(13, 'COL'),
(14, 'COL'),
(15, 'COL'),
(17, 'COL'),
(19, 'COL'),
(20, 'COL'),
(22, 'COL'),
(23, 'COL'),
(24, 'COL'),
(25, 'COL'),
(27, 'COL'),
(28, 'COL'),
(29, 'COL'),
(30, 'COL'),
(32, 'COL'),
(36, 'COL'),
(37, 'COL'),
(38, 'COL'),
(39, 'COL'),
(40, 'COL'),
(41, 'COL'),
(42, 'COL'),
(43, 'COL'),
(44, 'COL'),
(46, 'COL'),
(48, 'COL'),
(3, 'LUC'),
(7, 'LUC'),
(13, 'LUC'),
(24, 'LUC'),
(27, 'LUC'),
(35, 'LUC'),
(44, 'LUC'),
(48, 'LUC'),
(5, 'OOP'),
(7, 'OOP'),
(14, 'OOP'),
(15, 'OOP'),
(24, 'OOP'),
(31, 'OOP'),
(33, 'OOP'),
(3, 'SEG'),
(6, 'SEG'),
(9, 'SEG'),
(12, 'SEG'),
(15, 'SEG'),
(18, 'SEG'),
(21, 'SEG'),
(24, 'SEG'),
(27, 'SEG'),
(30, 'SEG'),
(33, 'SEG'),
(36, 'SEG'),
(39, 'SEG'),
(42, 'SEG'),
(45, 'SEG'),
(48, 'SEG');

-- --------------------------------------------------------

--
-- Table structure for table `questions_round1`
--

CREATE TABLE IF NOT EXISTS `questions_round1` (
  `q_number` int(11) NOT NULL,
  `q_diff` varchar(4) DEFAULT NULL,
  `q_type` varchar(5) DEFAULT NULL,
  `q_multiplier` double DEFAULT NULL,
  `points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions_round1`
--

INSERT INTO `questions_round1` (`q_number`, `q_diff`, `q_type`, `q_multiplier`, `points`) VALUES
(1, 'e', '#d', 1, 30),
(2, 'a', 'pr', 1, 50),
(3, 'd', 'pa', 1, 70),
(4, 'e', 're', 1, 30),
(5, 'a', '#d', 1, 50),
(6, 'd', 're', 1, 70),
(7, 'e', NULL, 1, 30),
(8, 'a', 'pa', 1, 50),
(9, 'd', 'pr', 1, 70),
(10, 'e', '#d', 1, 30),
(11, 'a', '#d', 1, 50),
(12, 'd', 'pa', 1, 70),
(13, 'e', 're', 1, 30),
(14, 'a', 're', 1, 50),
(15, 'd', 'pr', 1, 70),
(16, 'e', NULL, 1, 30),
(17, 'a', 'pr', 1, 50),
(18, 'd', NULL, 1, 70),
(19, 'e', '#d', 1, 30),
(20, 'a', 'pa', 1, 50),
(21, 'd', NULL, 1, 70),
(22, 'e', 'pa', 1, 30),
(23, 'a', 're', 1, 50),
(24, 'd', '#d', 1, 70),
(25, 'e', 'pr', 1, 30),
(26, 'a', NULL, 1, 50),
(27, 'd', '#d', 1, 70),
(28, 'e', 'pr', 1, 30),
(29, 'a', 'pa', 1, 50),
(30, 'd', 're', 1, 70),
(31, 'e', NULL, 1, 30),
(32, 'a', 're', 1, 50),
(33, 'd', NULL, 1, 70),
(34, 'e', 'pa', 1, 30),
(35, 'a', NULL, 1, 50),
(36, 'd', 'pr', 1, 70),
(37, 'e', 'so', 1, 30),
(38, 'a', 'so', 1, 50),
(39, 'd', 'so', 1, 70),
(40, 'e', 'pa', 1, 30),
(41, 'a', NULL, 1, 50),
(42, 'd', NULL, 1, 70),
(43, 'e', 'pr', 1, 30),
(44, 'a', '#d', 1, 50),
(45, 'd', NULL, 1, 70),
(46, 'e', 'pr', 1, 30),
(47, 'e', NULL, 1, 0),
(48, 'd', '#d', 1, 70);

-- --------------------------------------------------------

--
-- Table structure for table `questions_round2`
--

CREATE TABLE IF NOT EXISTS `questions_round2` (
  `q_number` int(11) DEFAULT NULL,
  `q_type` enum('e','a','d') DEFAULT NULL,
  `multiplier` float DEFAULT NULL,
  `points` int(10) DEFAULT NULL,
  `prev_timer` int(10) DEFAULT NULL,
  `badge_timer` int(10) DEFAULT NULL,
  `bet_timer` int(10) DEFAULT NULL,
  `q_timer` int(10) DEFAULT NULL,
  `body` text,
  `answer` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions_round2`
--

INSERT INTO `questions_round2` (`q_number`, `q_type`, `multiplier`, `points`, `prev_timer`, `badge_timer`, `bet_timer`, `q_timer`, `body`, `answer`) VALUES
(1, 'e', 1, 30, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'e', 1, 30, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'e', 1, 30, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'e', 1, 30, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'a', 1.5, 50, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'a', 1.5, 50, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'a', 1.5, 50, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'd', 2, 70, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'd', 2, 70, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'd', 2, 70, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'a', 1.5, 50, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'd', 2, 70, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE IF NOT EXISTS `teams` (
  `team_no` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` varchar(32) NOT NULL,
  `team_name` longtext NOT NULL,
  `team_members` longtext NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contact` longtext NOT NULL,
  PRIMARY KEY (`team_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`team_no`, `team_id`, `team_name`, `team_members`, `date_created`, `contact`) VALUES
(1, 'b443db5b092a02c6787d60ae0bf19ad8', 'Na''Vi', 'member1,member2,member3', '2013-08-17 16:00:00', '8491438290'),
(2, '138cd03c355098720838aeef3d26893a', 'iG', 'Member1,Member2.....', '2013-08-17 16:00:00', '478325'),
(3, '05bd29b524f0851d42e7902d6af59bf1', 'Alliance', 'Member1,Member2.....', '2013-08-17 16:00:00', '32195081'),
(4, 'f669a1cb5c11d28bdf26fc62535dcc2d', 'TongFu', 'Member1,Member2.....', '2013-08-17 16:00:00', '12738194'),
(5, 'a4528c5c893594d75a1da7e5d9833ac6', 'Orange Neolution', 'Member1,Member2.....', '2013-08-17 16:00:00', '43175891'),
(6, '78f183fa5a7d8ecb22b9ad272c3abd79', 'Fnatic', 'Member1,Member2.....', '2013-08-17 16:00:00', '5352334');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
