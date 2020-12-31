-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2020 at 05:32 PM
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
-- Database: `adise`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_board` ()  BEGIN
	replace into board select * from board_empty;
	update `players` set username=null, token=null;
    update `game_status` set `status`='not active', `p_turn`=null, `result`=null, dice1=null, dice2=null;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `move_piece` (IN `x1` TINYINT, IN `y1` TINYINT, IN `x2` TINYINT, IN `y2` TINYINT)  BEGIN
	declare  p, p_color char;
	
	select  piece, piece_color into p, p_color FROM `board` WHERE X=x1 AND Y=y1;
	
	update board
	set piece=p, piece_color=p_color
	where x=x2 and y=y2;
	
	UPDATE board
	SET piece=null,piece_color=null
	WHERE X=x1 AND Y=y1;
	update game_status set p_turn=if(p_color='W','B','W');
	
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `board`
--

CREATE TABLE `board` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `b_color` enum('B','W') NOT NULL,
  `piece_color` enum('W','B') DEFAULT NULL,
  `piece` int(11) DEFAULT NULL,
  `occupied_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `board`
--

INSERT INTO `board` (`x`, `y`, `b_color`, `piece_color`, `piece`, `occupied_by`) VALUES
(1, 1, 'B', 'W', 1, NULL),
(1, 2, 'B', 'W', 2, NULL),
(1, 3, 'B', 'W', 3, NULL),
(1, 4, 'B', 'W', 4, NULL),
(1, 5, 'B', 'W', 5, NULL),
(1, 6, 'B', 'W', 6, NULL),
(1, 7, 'B', 'W', 7, NULL),
(1, 8, 'B', 'W', 8, NULL),
(1, 9, 'B', 'W', 9, NULL),
(1, 10, 'B', 'W', 10, NULL),
(1, 11, 'B', 'W', 11, NULL),
(1, 12, 'B', 'W', 12, NULL),
(1, 13, 'B', 'W', 13, NULL),
(1, 14, 'B', 'W', 14, NULL),
(1, 15, 'B', 'W', 15, NULL),
(2, 1, 'W', NULL, NULL, NULL),
(3, 1, 'B', NULL, NULL, NULL),
(4, 1, 'W', NULL, NULL, NULL),
(5, 1, 'B', NULL, NULL, NULL),
(6, 1, 'W', NULL, NULL, NULL),
(7, 1, 'B', NULL, NULL, NULL),
(8, 1, 'W', NULL, NULL, NULL),
(9, 1, 'B', NULL, NULL, NULL),
(10, 1, 'W', NULL, NULL, NULL),
(11, 1, 'B', NULL, NULL, NULL),
(12, 1, 'W', NULL, NULL, NULL),
(13, 1, 'B', NULL, NULL, NULL),
(14, 1, 'W', NULL, NULL, NULL),
(15, 1, 'B', NULL, NULL, NULL),
(16, 1, 'W', 'W', NULL, NULL),
(17, 1, 'B', NULL, NULL, NULL),
(18, 1, 'W', NULL, NULL, NULL),
(19, 1, 'B', NULL, NULL, NULL),
(20, 1, 'W', NULL, NULL, NULL),
(21, 1, 'B', NULL, NULL, NULL),
(22, 1, 'W', NULL, NULL, NULL),
(23, 1, 'B', NULL, NULL, NULL),
(24, 1, 'W', 'B', 1, NULL),
(24, 2, 'W', 'B', 2, NULL),
(24, 3, 'W', 'B', 3, NULL),
(24, 4, 'W', 'B', 4, NULL),
(24, 5, 'W', 'B', 5, NULL),
(24, 6, 'W', 'B', 6, NULL),
(24, 7, 'W', 'B', 7, NULL),
(24, 8, 'W', 'B', 8, NULL),
(24, 9, 'W', 'B', 9, NULL),
(24, 10, 'W', 'B', 10, NULL),
(24, 11, 'W', 'B', 11, NULL),
(24, 12, 'W', 'B', 12, NULL),
(24, 13, 'W', 'B', 13, NULL),
(24, 14, 'W', 'B', 14, NULL),
(24, 15, 'W', 'B', 15, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `board_empty`
--

CREATE TABLE `board_empty` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `b_color` enum('B','W') NOT NULL,
  `piece_color` enum('W','B') DEFAULT NULL,
  `piece` int(11) DEFAULT NULL,
  `occupied_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `board_empty`
--

INSERT INTO `board_empty` (`x`, `y`, `b_color`, `piece_color`, `piece`, `occupied_by`) VALUES
(1, 1, 'B', 'W', 1, NULL),
(1, 2, 'B', 'W', 2, NULL),
(1, 3, 'B', 'W', 3, NULL),
(1, 4, 'B', 'W', 4, NULL),
(1, 5, 'B', 'W', 5, NULL),
(1, 6, 'B', 'W', 6, NULL),
(1, 7, 'B', 'W', 7, NULL),
(1, 8, 'B', 'W', 8, NULL),
(1, 9, 'B', 'W', 9, NULL),
(1, 10, 'B', 'W', 10, NULL),
(1, 11, 'B', 'W', 11, NULL),
(1, 12, 'B', 'W', 12, NULL),
(1, 13, 'B', 'W', 13, NULL),
(1, 14, 'B', 'W', 14, NULL),
(1, 15, 'B', 'W', 15, NULL),
(2, 1, 'W', NULL, NULL, NULL),
(3, 1, 'B', NULL, NULL, NULL),
(4, 1, 'W', NULL, NULL, NULL),
(5, 1, 'B', NULL, NULL, NULL),
(6, 1, 'W', NULL, NULL, NULL),
(7, 1, 'B', NULL, NULL, NULL),
(8, 1, 'W', NULL, NULL, NULL),
(9, 1, 'B', NULL, NULL, NULL),
(10, 1, 'W', NULL, NULL, NULL),
(11, 1, 'B', NULL, NULL, NULL),
(12, 1, 'W', NULL, NULL, NULL),
(13, 1, 'B', NULL, NULL, NULL),
(14, 1, 'W', NULL, NULL, NULL),
(15, 1, 'B', NULL, NULL, NULL),
(16, 1, 'W', 'W', NULL, NULL),
(17, 1, 'B', NULL, NULL, NULL),
(18, 1, 'W', NULL, NULL, NULL),
(19, 1, 'B', NULL, NULL, NULL),
(20, 1, 'W', NULL, NULL, NULL),
(21, 1, 'B', NULL, NULL, NULL),
(22, 1, 'W', NULL, NULL, NULL),
(23, 1, 'B', NULL, NULL, NULL),
(24, 1, 'W', 'B', 1, NULL),
(24, 2, 'W', 'B', 2, NULL),
(24, 3, 'W', 'B', 3, NULL),
(24, 4, 'W', 'B', 4, NULL),
(24, 5, 'W', 'B', 5, NULL),
(24, 6, 'W', 'B', 6, NULL),
(24, 7, 'W', 'B', 7, NULL),
(24, 8, 'W', 'B', 8, NULL),
(24, 9, 'W', 'B', 9, NULL),
(24, 10, 'W', 'B', 10, NULL),
(24, 11, 'W', 'B', 11, NULL),
(24, 12, 'W', 'B', 12, NULL),
(24, 13, 'W', 'B', 13, NULL),
(24, 14, 'W', 'B', 14, NULL),
(24, 15, 'W', 'B', 15, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `game_status`
--

CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','\r\nended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('W','B') DEFAULT NULL,
  `dice1` smallint(6) DEFAULT NULL,
  `dice2` smallint(6) DEFAULT NULL,
  `result` enum('B','W','D') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `game_status`
--

INSERT INTO `game_status` (`status`, `p_turn`, `dice1`, `dice2`, `result`, `last_change`) VALUES
('not active', NULL, NULL, NULL, NULL, '2020-12-31 16:29:58');

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
  `piece_color` enum('B','W') NOT NULL,
  `token` varchar(32) DEFAULT NULL,
  `last_action` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`username`, `piece_color`, `token`, `last_action`) VALUES
(NULL, 'B', NULL, '2020-12-31 16:29:33'),
(NULL, 'W', NULL, '2020-12-31 16:29:58');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `msg` varchar(200) NOT NULL,
  `username` varchar(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`) VALUES
(2, 'admin', '202cb962ac59075b964b07152d234b70'),
(5, 'guest', '202cb962ac59075b964b07152d234b70'),
(8, 'test', '202cb962ac59075b964b07152d234b70');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`x`,`y`);

--
-- Indexes for table `board_empty`
--
ALTER TABLE `board_empty`
  ADD PRIMARY KEY (`x`,`y`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`piece_color`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`,`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
