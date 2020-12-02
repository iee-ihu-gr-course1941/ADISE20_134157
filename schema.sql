-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 02 Δεκ 2020 στις 13:11:22
-- Έκδοση διακομιστή: 10.4.16-MariaDB
-- Έκδοση PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `adise20_plakoto`
--

DELIMITER $$
--
-- Διαδικασίες
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_board` ()  BEGIN

REPLACE INTO board SELECT * FROM board_empty;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `board`
--

CREATE TABLE `board` (
  `position_x` tinyint(1) NOT NULL,
  `position_y` tinyint(1) NOT NULL,
  `board_color` enum('B','W') NOT NULL,
  `checker_color` enum('W','B') DEFAULT NULL,
  `checker` enum('P1','P2','P3','P4','P5','P6','P7','P8','P9','P10','P11','P12','P13','P14','P15') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Άδειασμα δεδομένων του πίνακα `board`
--

INSERT INTO `board` (`position_x`, `position_y`, `board_color`, `checker_color`, `checker`) VALUES
(1, 1, 'B', 'W', 'P1'),
(1, 2, 'B', 'W', 'P2'),
(1, 3, 'B', 'W', 'P3'),
(1, 4, 'B', 'W', 'P4'),
(1, 5, 'B', 'W', 'P5'),
(1, 6, 'B', 'W', 'P6'),
(1, 7, 'B', 'W', 'P7'),
(1, 8, 'B', 'W', 'P8'),
(1, 9, 'B', 'W', 'P9'),
(1, 10, 'B', 'W', 'P10'),
(1, 11, 'B', 'W', 'P11'),
(1, 12, 'B', 'W', 'P12'),
(1, 13, 'B', 'W', 'P13'),
(1, 14, 'B', 'W', 'P14'),
(1, 15, 'B', 'W', 'P15'),
(2, 1, 'W', NULL, NULL),
(2, 2, 'W', NULL, NULL),
(2, 3, 'W', NULL, NULL),
(2, 4, 'W', NULL, NULL),
(2, 5, 'W', NULL, NULL),
(2, 6, 'W', NULL, NULL),
(2, 7, 'W', NULL, NULL),
(2, 8, 'W', NULL, NULL),
(2, 9, 'W', NULL, NULL),
(2, 10, 'W', NULL, NULL),
(2, 11, 'W', NULL, NULL),
(2, 12, 'W', NULL, NULL),
(2, 13, 'W', NULL, NULL),
(2, 14, 'W', NULL, NULL),
(2, 15, 'W', NULL, NULL),
(3, 1, 'B', NULL, NULL),
(3, 2, 'B', NULL, NULL),
(3, 3, 'B', NULL, NULL),
(3, 4, 'B', NULL, NULL),
(3, 5, 'B', NULL, NULL),
(3, 6, 'B', NULL, NULL),
(3, 7, 'B', NULL, NULL),
(3, 8, 'B', NULL, NULL),
(3, 9, 'B', NULL, NULL),
(3, 10, 'B', NULL, NULL),
(3, 11, 'B', NULL, NULL),
(3, 12, 'B', NULL, NULL),
(3, 13, 'B', NULL, NULL),
(3, 14, 'B', NULL, NULL),
(3, 15, 'B', NULL, NULL),
(4, 1, 'W', NULL, NULL),
(4, 2, 'W', NULL, NULL),
(4, 3, 'W', NULL, NULL),
(4, 4, 'W', NULL, NULL),
(4, 5, 'W', NULL, NULL),
(4, 6, 'W', NULL, NULL),
(4, 7, 'W', NULL, NULL),
(4, 8, 'W', NULL, NULL),
(4, 9, 'W', NULL, NULL),
(4, 10, 'W', NULL, NULL),
(4, 11, 'W', NULL, NULL),
(4, 12, 'W', NULL, NULL),
(4, 13, 'W', NULL, NULL),
(4, 14, 'W', NULL, NULL),
(4, 15, 'W', NULL, NULL),
(5, 1, 'B', NULL, NULL),
(5, 2, 'B', NULL, NULL),
(5, 3, 'B', NULL, NULL),
(5, 4, 'B', NULL, NULL),
(5, 5, 'B', NULL, NULL),
(5, 6, 'B', NULL, NULL),
(5, 7, 'B', NULL, NULL),
(5, 8, 'B', NULL, NULL),
(5, 9, 'B', NULL, NULL),
(5, 10, 'B', NULL, NULL),
(5, 11, 'B', NULL, NULL),
(5, 12, 'B', NULL, NULL),
(5, 13, 'B', NULL, NULL),
(5, 14, 'B', NULL, NULL),
(5, 15, 'B', NULL, NULL),
(6, 1, 'W', NULL, NULL),
(6, 2, 'W', NULL, NULL),
(6, 3, 'W', NULL, NULL),
(6, 4, 'W', NULL, NULL),
(6, 5, 'W', NULL, NULL),
(6, 6, 'W', NULL, NULL),
(6, 7, 'W', NULL, NULL),
(6, 8, 'W', NULL, NULL),
(6, 9, 'W', NULL, NULL),
(6, 10, 'W', NULL, NULL),
(6, 11, 'W', NULL, NULL),
(6, 12, 'W', NULL, NULL),
(6, 13, 'W', NULL, NULL),
(6, 14, 'W', NULL, NULL),
(6, 15, 'W', NULL, NULL),
(7, 1, 'B', NULL, NULL),
(7, 2, 'B', NULL, NULL),
(7, 3, 'B', NULL, NULL),
(7, 4, 'B', NULL, NULL),
(7, 5, 'B', NULL, NULL),
(7, 6, 'B', NULL, NULL),
(7, 7, 'B', NULL, NULL),
(7, 8, 'B', NULL, NULL),
(7, 9, 'B', NULL, NULL),
(7, 10, 'B', NULL, NULL),
(7, 11, 'B', NULL, NULL),
(7, 12, 'B', NULL, NULL),
(7, 13, 'B', NULL, NULL),
(7, 14, 'B', NULL, NULL),
(7, 15, 'B', NULL, NULL),
(8, 1, 'W', NULL, NULL),
(8, 2, 'W', NULL, NULL),
(8, 3, 'W', NULL, NULL),
(8, 4, 'W', NULL, NULL),
(8, 5, 'W', NULL, NULL),
(8, 6, 'W', NULL, NULL),
(8, 7, 'W', NULL, NULL),
(8, 8, 'W', NULL, NULL),
(8, 9, 'W', NULL, NULL),
(8, 10, 'W', NULL, NULL),
(8, 11, 'W', NULL, NULL),
(8, 12, 'W', NULL, NULL),
(8, 13, 'W', NULL, NULL),
(8, 14, 'W', NULL, NULL),
(8, 15, 'W', NULL, NULL),
(9, 1, 'B', NULL, NULL),
(9, 2, 'B', NULL, NULL),
(9, 3, 'B', NULL, NULL),
(9, 4, 'B', NULL, NULL),
(9, 5, 'B', NULL, NULL),
(9, 6, 'B', NULL, NULL),
(9, 7, 'B', NULL, NULL),
(9, 8, 'B', NULL, NULL),
(9, 9, 'B', NULL, NULL),
(9, 10, 'B', NULL, NULL),
(9, 11, 'B', NULL, NULL),
(9, 12, 'B', NULL, NULL),
(9, 13, 'B', NULL, NULL),
(9, 14, 'B', NULL, NULL),
(9, 15, 'B', NULL, NULL),
(10, 1, 'W', NULL, NULL),
(10, 2, 'W', NULL, NULL),
(10, 3, 'W', NULL, NULL),
(10, 4, 'W', NULL, NULL),
(10, 5, 'W', NULL, NULL),
(10, 6, 'W', NULL, NULL),
(10, 7, 'W', NULL, NULL),
(10, 8, 'W', NULL, NULL),
(10, 9, 'W', NULL, NULL),
(10, 10, 'W', NULL, NULL),
(10, 11, 'W', NULL, NULL),
(10, 12, 'W', NULL, NULL),
(10, 13, 'W', NULL, NULL),
(10, 14, 'W', NULL, NULL),
(10, 15, 'W', NULL, NULL),
(11, 1, 'B', NULL, NULL),
(11, 2, 'B', NULL, NULL),
(11, 3, 'B', NULL, NULL),
(11, 4, 'B', NULL, NULL),
(11, 5, 'B', NULL, NULL),
(11, 6, 'B', NULL, NULL),
(11, 7, 'B', NULL, NULL),
(11, 8, 'B', NULL, NULL),
(11, 9, 'B', NULL, NULL),
(11, 10, 'B', NULL, NULL),
(11, 11, 'B', NULL, NULL),
(11, 12, 'B', NULL, NULL),
(11, 13, 'B', NULL, NULL),
(11, 14, 'B', NULL, NULL),
(11, 15, 'B', NULL, NULL),
(12, 1, 'W', NULL, NULL),
(12, 2, 'W', NULL, NULL),
(12, 3, 'W', NULL, NULL),
(12, 4, 'W', NULL, NULL),
(12, 5, 'W', NULL, NULL),
(12, 6, 'W', NULL, NULL),
(12, 7, 'W', NULL, NULL),
(12, 8, 'W', NULL, NULL),
(12, 9, 'W', NULL, NULL),
(12, 10, 'W', NULL, NULL),
(12, 11, 'W', NULL, NULL),
(12, 12, 'W', NULL, NULL),
(12, 13, 'W', NULL, NULL),
(12, 14, 'W', NULL, NULL),
(12, 15, 'W', NULL, NULL);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `board_empty`
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
-- Δομή πίνακα για τον πίνακα `game_status`
--

CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `player_turn` enum('W','B') DEFAULT NULL,
  `resutl` enum('B','W','D') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Δείκτες `game_status`
--
DELIMITER $$
CREATE TRIGGER `game_status_update` BEFORE UPDATE ON `game_status` FOR EACH ROW BEGIN

	SET NEW.last_change = NOW();

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `players`
--

CREATE TABLE `players` (
  `username` varchar(20) DEFAULT NULL,
  `checker_color` enum('B','W') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`position_x`,`position_y`);

--
-- Ευρετήρια για πίνακα `board_empty`
--
ALTER TABLE `board_empty`
  ADD PRIMARY KEY (`position_x`,`position_y`);

--
-- Ευρετήρια για πίνακα `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`checker_color`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
