-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2022 at 01:52 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kolpo2022`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `fid` varchar(40) NOT NULL,
  `runningSessionId` varchar(40) DEFAULT NULL,
  `isBusy` tinyint(1) DEFAULT NULL,
  `milestoneView` tinyint(1) DEFAULT NULL,
  `initial` varchar(10) DEFAULT NULL,
  `todoDetails` tinyint(1) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `fcmToken` varchar(200) DEFAULT NULL,
  `myNote` varchar(4000) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `lastWorkEndTimestamp` bigint(20) DEFAULT NULL,
  `IdleAlertReceivedAt` bigint(20) DEFAULT NULL,
  `lastAutoEndDayX` bigint(20) DEFAULT NULL,
  `extraInfoWrongRunningSession30thSept21` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`fid`, `runningSessionId`, `isBusy`, `milestoneView`, `initial`, `todoDetails`, `email`, `color`, `name`, `fcmToken`, `myNote`, `type`, `active`, `lastWorkEndTimestamp`, `IdleAlertReceivedAt`, `lastAutoEndDayX`, `extraInfoWrongRunningSession30thSept21`) VALUES
('HZUEU4axEmQQwIt8Rz2QiBavqoj2', 'SqoCPMN8UQZbmVO5fhkt', 0, 1, 'Sh', 1, 'shadhin@kolpo.org', '#b2f582', 'Shadhin', '', NULL, 'admin', 1, 1649079394365, 1648965258554, 1648922400000, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`fid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
