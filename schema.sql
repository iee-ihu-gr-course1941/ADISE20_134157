-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2020 at 05:50 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adise20_plakoto`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_board` ()  BEGIN


REPLACE INTO board SELECT * FROM board_empty;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `move_checker` (`x1` TINYINT, `y1` TINYINT, `x2` TINYINT, `y2` TINYINT)  BEGIN
DECLARE c, c_color CHAR;
SELECT checker, checker_color INTO c, c_color
FROM `board` WHERE X=x1 AND Y=y1;
UPDATE board
SET checker=p, checker_color=c_color
WHERE X=x2 AND Y=y2;
UPDATE board
SET checker=NULL,checker_color=NULL
WHERE X=x1 AND Y=y1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `board`
--

CREATE TABLE `board` (
  `position_x` tinyint(1) NOT NULL,
  `position_y` tinyint(1) NOT NULL,
  `board_color` enum('B','W') NOT NULL,
  `checker_color` enum('W','B') DEFAULT NULL,
  `checker` enum('P1','P2','P3','P4','P5','P6','P7','P8','P9','P10','P11','P12','P13','P14','P15') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `board`
--

INSERT INTO `board` (`position_x`, `position_y`, `board_color`, `checker_color`, `checker`) VALUES
(1, 1, 'B', 'W', 'P1'),
(1, 2, 'B', 'W', 'P2'),
(1, 3, 'B', 'W', 'P3'),
(1, 4, 'B', 'W', 'P4'),
(1, 5, 'B', 'W', 'P5'),
(1, 6, 'B', NULL, NULL),
(2, 1, 'W', NULL, NULL),
(2, 2, 'W', NULL, NULL),
(2, 3, 'W', NULL, NULL),
(2, 4, 'W', NULL, NULL),
(2, 5, 'W', NULL, NULL),
(2, 6, 'W', NULL, NULL),
(3, 1, 'B', NULL, NULL),
(3, 2, 'B', NULL, NULL),
(3, 3, 'B', NULL, NULL),
(3, 4, 'B', NULL, NULL),
(3, 5, 'B', NULL, NULL),
(3, 6, 'B', NULL, NULL),
(4, 1, 'W', NULL, NULL),
(4, 2, 'W', NULL, NULL),
(4, 3, 'W', NULL, NULL),
(4, 4, 'W', NULL, NULL),
(4, 5, 'W', NULL, NULL),
(4, 6, 'W', NULL, NULL),
(5, 1, 'B', NULL, NULL),
(5, 2, 'B', NULL, NULL),
(5, 3, 'B', NULL, NULL),
(5, 4, 'B', NULL, NULL),
(5, 5, 'B', NULL, NULL),
(5, 6, 'B', NULL, NULL),
(6, 1, 'W', NULL, NULL),
(6, 2, 'W', NULL, NULL),
(6, 3, 'W', NULL, NULL),
(6, 4, 'W', NULL, NULL),
(6, 5, 'W', NULL, NULL),
(6, 6, 'W', NULL, NULL),
(7, 1, 'B', NULL, NULL),
(7, 2, 'B', NULL, NULL),
(7, 3, 'B', NULL, NULL),
(7, 4, 'B', NULL, NULL),
(7, 5, 'B', NULL, NULL),
(7, 6, 'B', NULL, NULL),
(8, 1, 'W', NULL, NULL),
(8, 2, 'W', NULL, NULL),
(8, 3, 'W', NULL, NULL),
(8, 4, 'W', NULL, NULL),
(8, 5, 'W', NULL, NULL),
(8, 6, 'W', NULL, NULL),
(9, 1, 'B', NULL, NULL),
(9, 2, 'B', NULL, NULL),
(9, 3, 'B', NULL, NULL),
(9, 4, 'B', NULL, NULL),
(9, 5, 'B', NULL, NULL),
(9, 6, 'B', NULL, NULL),
(10, 1, 'W', NULL, NULL),
(10, 2, 'W', NULL, NULL),
(10, 3, 'W', NULL, NULL),
(10, 4, 'W', NULL, NULL),
(10, 5, 'W', NULL, NULL),
(10, 6, 'W', NULL, NULL),
(11, 1, 'B', NULL, NULL),
(11, 2, 'B', NULL, NULL),
(11, 3, 'B', NULL, NULL),
(11, 4, 'B', NULL, NULL),
(11, 5, 'B', NULL, NULL),
(11, 6, 'B', NULL, NULL),
(12, 1, 'W', 'B', 'P1'),
(12, 2, 'W', 'B', 'P2'),
(12, 3, 'W', 'B', 'P3'),
(12, 4, 'W', 'B', 'P4'),
(12, 5, 'W', 'B', 'P5'),
(12, 6, 'W', 'B', 'P6');

-- --------------------------------------------------------

--
-- Table structure for table `board_empty`
--

CREATE TABLE `board_empty` (
  `position_x` tinyint(1) NOT NULL,
  `position_y` tinyint(1) NOT NULL,
  `board_color` enum('B','W') DEFAULT NULL,
  `checker_color` enum('W','B') DEFAULT NULL,
  `checker` enum('P1','P2','P3','P4','P5','P6','P7','P8','P9','P10','P11','P12','P13','P14','P15') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `game_status`
--

CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `player_turn` enum('W','B') DEFAULT NULL,
  `resutl` enum('B','W','D') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `game_status`
--
DELIMITER $$
CREATE TRIGGER `game_status_update` BEFORE UPDATE ON `game_status` FOR EACH ROW BEGIN


	SET NEW.last_change = NOW();


END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `username` varchar(20) DEFAULT NULL,
  `checker_color` enum('B','W') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`) VALUES
(1, 'user', '123', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`position_x`,`position_y`);

--
-- Indexes for table `board_empty`
--
ALTER TABLE `board_empty`
  ADD PRIMARY KEY (`position_x`,`position_y`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`checker_color`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
