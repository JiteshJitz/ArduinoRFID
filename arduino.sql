-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2018 at 10:18 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arduino`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `id` int(11) NOT NULL,
  `RFID` varchar(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`id`, `RFID`, `location`, `datetime`) VALUES
(1, 'FE:1B:0F:63', 'projectRoom', '2018-04-28 17:19:55'),
(2, '3F:FA:E0:29', 'projectRoom', '2018-04-28 17:24:12'),
(3, '3F:FA:E0:29', 'projectRoom', '2018-04-28 17:24:46'),
(4, '3F:FA:E0:29', 'projectRoom', '2018-04-28 17:25:50'),
(5, '3F:FA:E0:29', 'projectRoom', '2018-04-28 17:43:33'),
(6, '3F:FA:E0:29', 'projectRoom', '2018-04-28 17:55:58'),
(7, 'FE:1B:0F:63', 'projectRoom', '2018-04-28 17:57:34'),
(8, 'FE:1B:0F:63', 'bedRoom', '2018-04-28 19:04:09'),
(9, 'FE:1B:0F:63', 'projectRoom', '2018-04-28 19:04:14'),
(10, '8F:2E:85:29', 'bedRoom', '2018-04-29 11:40:23'),
(11, '8F:2E:85:29', 'bedRoom', '2018-04-29 11:41:08'),
(12, '3F:E0:F2:29', 'bedRoom', '2018-04-29 11:43:03'),
(13, '8F:2E:85:29', 'projectRoom', '2018-04-29 11:53:19'),
(14, '8F:2E:85:29', 'projectRoom', '2018-04-29 11:54:03'),
(15, '3F:E0:F2:29', 'bedRoom', '2018-04-29 11:54:18'),
(16, '3F:E0:F2:29', 'projectRoom', '2018-04-29 11:54:42'),
(17, '8F:2E:85:29', 'projectRoom', '2018-04-29 11:54:46'),
(18, '3F:E0:F2:29', 'bedRoom', '2018-04-29 11:55:10'),
(19, '3F:E0:F2:29', 'projectRoom', '2018-04-29 11:55:21'),
(20, '3F:E0:F2:29', 'projectRoom', '2018-04-29 11:55:25'),
(21, '3F:E0:F2:29', 'projectRoom', '2018-04-29 11:56:25'),
(22, '3F:E0:F2:29', 'projectRoom', '2018-04-29 11:56:41'),
(23, '8F:2E:85:29', 'projectRoom', '2018-04-29 12:02:26'),
(24, '8F:2E:85:29', 'bedRoom', '2018-04-29 12:02:48');

-- --------------------------------------------------------

--
-- Table structure for table `datalog`
--

CREATE TABLE `datalog` (
  `idlog` int(4) NOT NULL,
  `RFID` varchar(11) NOT NULL,
  `datetimee` datetime NOT NULL,
  `location` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `datalog`
--

INSERT INTO `datalog` (`idlog`, `RFID`, `datetimee`, `location`) VALUES
(4, '3F:FA:E0:29', '2018-04-28 04:12:12', 1),
(31, '3F:FA:E0:29', '2018-04-28 06:18:41', 1),
(32, 'D0:F1:19:63', '2018-04-29 11:11:56', 1),
(40, 'FE:1B:0F:63', '2018-05-01 14:44:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hello`
--

CREATE TABLE `hello` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hello`
--

INSERT INTO `hello` (`id`, `message`) VALUES
(1, 'yyy'),
(2, 'yyy'),
(3, 'yyy'),
(4, 'yyy'),
(5, 'yyy'),
(6, 'yyy'),
(7, 'yyy'),
(8, 'yyy'),
(9, 'yyy'),
(10, 'yyy'),
(11, 'yyy'),
(12, 'yyy'),
(13, 'yyy'),
(14, 'yyy'),
(15, 'yyy'),
(16, 'yyy');

-- --------------------------------------------------------

--
-- Table structure for table `locationn`
--

CREATE TABLE `locationn` (
  `id` int(2) NOT NULL,
  `place` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locationn`
--

INSERT INTO `locationn` (`id`, `place`) VALUES
(1, 'place1'),
(2, 'place2');

-- --------------------------------------------------------

--
-- Table structure for table `rfidtag`
--

CREATE TABLE `rfidtag` (
  `id` int(2) NOT NULL,
  `RFIDTag` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rfidtag`
--

INSERT INTO `rfidtag` (`id`, `RFIDTag`) VALUES
(1, 'FE:1B:0F:63');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `RFID` varchar(11) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`RFID`, `username`) VALUES
('3F:FA:E0:29', 'personOne'),
('8F:58:70:29', 'lifff'),
('D0:F1:19:63', 'fern'),
('FE:1B:0F:63', 'testRFID');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datalog`
--
ALTER TABLE `datalog`
  ADD PRIMARY KEY (`idlog`),
  ADD KEY `location` (`location`),
  ADD KEY `RFID` (`RFID`);

--
-- Indexes for table `hello`
--
ALTER TABLE `hello`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locationn`
--
ALTER TABLE `locationn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rfidtag`
--
ALTER TABLE `rfidtag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`RFID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `datalog`
--
ALTER TABLE `datalog`
  MODIFY `idlog` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `hello`
--
ALTER TABLE `hello`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `locationn`
--
ALTER TABLE `locationn`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `datalog`
--
ALTER TABLE `datalog`
  ADD CONSTRAINT `RFID` FOREIGN KEY (`RFID`) REFERENCES `user` (`RFID`),
  ADD CONSTRAINT `location` FOREIGN KEY (`location`) REFERENCES `locationn` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
