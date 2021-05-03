-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: May 03, 2021 at 02:11 PM
-- Server version: 8.0.23
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nss_mysql`
--

-- --------------------------------------------------------

--
-- Table structure for table `grouplist`
--

CREATE TABLE `grouplist` (
  `rowid` int NOT NULL,
  `gid` int NOT NULL DEFAULT '0',
  `username` char(16) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `grouplist`
--

INSERT INTO `grouplist` (`rowid`, `gid`, `username`) VALUES
(1, 5000, 'cinergi');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `name` varchar(16) NOT NULL DEFAULT '',
  `password` varchar(34) NOT NULL DEFAULT 'x',
  `gid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`name`, `password`, `gid`) VALUES
('foobaz', 'x', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `rowid` int NOT NULL,
  `key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` char(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`rowid`, `key`, `username`) VALUES
(1, 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbOJiexP8AiohKiZhclRkrFeKaUk8omOC4lZu6alZGQoLAY+TR/x41jGysG8c3fogXeSp5cAg8euGpMbJG/PRVXjTfEBe/fKdWya6ENMQ9vofLnR+JCY5FL3pNPnPHAHHZCSe3Xw5wXQ0umP/xrFa6ajFds1rzP69YMu8dK6/gs+K6fb+hLGPfGh4tPFkP1WtI6gMw9F55TTi3+CyUc+NJXLbcA1Ou7m2LrKBUvsbZH1ASGR2RJD2l4dR3PHgq76QhfOp7eO8s+Q39fetwNFG912fCNpLD4KymH8ZBYM0itgxWfQvkagn8x9uOsqBKW9QNmD+J7QKgz0pdm3dWOwtB imported-openssh-key', 'cinergi');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(16) NOT NULL DEFAULT '',
  `uid` int NOT NULL,
  `gid` int NOT NULL DEFAULT '5000',
  `gecos` varchar(128) NOT NULL DEFAULT '',
  `homedir` varchar(255) NOT NULL DEFAULT '',
  `shell` varchar(64) NOT NULL DEFAULT '/bin/bash',
  `password` varchar(128) NOT NULL DEFAULT 'x',
  `lstchg` bigint NOT NULL DEFAULT '1',
  `min` bigint NOT NULL DEFAULT '0',
  `max` bigint NOT NULL DEFAULT '99999',
  `warn` bigint NOT NULL DEFAULT '0',
  `inact` bigint NOT NULL DEFAULT '0',
  `expire` bigint NOT NULL DEFAULT '-1',
  `flag` bigint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `uid`, `gid`, `gecos`, `homedir`, `shell`, `password`, `lstchg`, `min`, `max`, `warn`, `inact`, `expire`, `flag`) VALUES
('cinergi', 5000, 5000, 'Ben Goodwin', '/home/cinergi', '/bin/bash', '$6$G2pAloKLyLW7j$MvDFG4fa3EYExucCxvgzTI.NSJybyQFIBZG4yesYFJjJsLsgGx/xg.aIV8gf32al9iq0zAGZROm7fHTmVBl8p/', 1, 0, 99999, 0, 0, -1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `grouplist`
--
ALTER TABLE `grouplist`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `uid` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `grouplist`
--
ALTER TABLE `grouplist`
  MODIFY `rowid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `gid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5001;

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `rowid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5001;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
