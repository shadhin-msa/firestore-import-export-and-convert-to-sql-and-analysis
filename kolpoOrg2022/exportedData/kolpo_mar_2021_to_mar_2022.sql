-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2022 at 07:43 PM
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
-- Database: `kolpo_mar_2021_to_mar_2022`
--

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `fid` varchar(40) NOT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `userId` varchar(40) DEFAULT NULL,
  `tasks` varchar(1000) DEFAULT NULL,
  `planningDeadline` bigint(20) DEFAULT NULL,
  `reviewFinishTime` bigint(20) DEFAULT NULL,
  `reviewIgnored` tinyint(1) DEFAULT NULL,
  `planningIgnored` tinyint(1) DEFAULT NULL,
  `planningFinishTime` bigint(20) DEFAULT NULL,
  `lastWorkedTaskId` varchar(40) DEFAULT NULL,
  `reactions` varchar(40) DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`fid`, `timestamp`, `userId`, `tasks`, `planningDeadline`, `reviewFinishTime`, `reviewIgnored`, `planningIgnored`, `planningFinishTime`, `lastWorkedTaskId`, `reactions`, `message`, `comment`) VALUES
('00znkWNGHwVIuWwe4J5b', 1616522400000, 'UHAosXDZeyeBvr0YCkKnXiJd93B3', '[object Object]', 1616574600000, 1616586757381, 0, 0, 1616566346068, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `days_recored_for_each_user`
-- (See below for the actual view)
--
CREATE TABLE `days_recored_for_each_user` (
`userId` varchar(40)
,`name` varchar(40)
,`noOfDays` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `daywiseofficehours`
-- (See below for the actual view)
--
CREATE TABLE `daywiseofficehours` (
`userId` varchar(40)
,`dayTimestamp` bigint(22)
,`noOfSession` bigint(21)
,`duration` decimal(44,1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `fr__projects_hours_by_users_column`
-- (See below for the actual view)
--
CREATE TABLE `fr__projects_hours_by_users_column` (
`project` varchar(150)
,`Ratul` decimal(34,1)
,`Gigi zaman` decimal(34,1)
,`Rashid Zaman` decimal(34,1)
,`Shadhin` decimal(34,1)
,`Hasan` decimal(34,1)
,`Hasib` decimal(34,1)
,`Md Riaz` decimal(34,1)
,`Prince` decimal(34,1)
,`Saiful` decimal(34,1)
,`Shead Ashraf` decimal(34,1)
,`Shompa Karmoker` decimal(34,1)
,`Sujon` decimal(34,1)
,`Trina` decimal(34,1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `fr___user_active_hours`
-- (See below for the actual view)
--
CREATE TABLE `fr___user_active_hours` (
`user` varchar(40)
,`WorkHour` decimal(33,0)
,`BreakTime` decimal(44,0)
,`OfficeHour` decimal(43,0)
,`ActiveDays(1h office)` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `fr___user_working_days`
-- (See below for the actual view)
--
CREATE TABLE `fr___user_working_days` (
`name` varchar(40)
,`daysRecorded` bigint(21)
,`ActiveDays(1h office)` bigint(21)
,`planningActive` bigint(21)
,`Planned` bigint(21)
,`OnTime` bigint(21)
,`Late` bigint(21)
,`reviewed` bigint(21)
,`planningIgnored` decimal(25,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `officehour`
-- (See below for the actual view)
--
CREATE TABLE `officehour` (
`userId` varchar(40)
,`name` varchar(40)
,`OfficeHour` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `fid` varchar(40) NOT NULL,
  `finished` tinyint(1) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `importance` decimal(4,2) DEFAULT NULL,
  `permitedUsers` varchar(500) DEFAULT NULL,
  `initial` varchar(10) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`fid`, `finished`, `name`, `importance`, `permitedUsers`, `initial`, `color`) VALUES
('0SkF6i5SKdXPAj6FnYzt', 0, 'Play and RnD', '4.00', 'HZUEU4axEmQQwIt8Rz2QiBavqoj2,myxsJVESyfPZTIPpbNRuoKJ7qHF2,xOiMxbgjVqf1CvvOCAAxoxTecB53,UHAosXDZeyeBvr0YCkKnXiJd93B3,CBcNAsLIGFgVG2ImhSJsYvuQoS03,I1urPDn37GR6XGv8DLhY6VeMgOx2,xHCVOvXHZhQjJKVQCw72GuSvUnK2,diX77OG08MOcwWNjlfm4hobz5663,JvA0caFI2pegS1Zp6mPbnVarBbL2,Dg6hESlEwMaMxmY4mJ1DBigTT5w1,KfAzH9AqWHOH1v7hqllAs5RVzOI2', 'PRnD', '#c1ad1b');

-- --------------------------------------------------------

--
-- Stand-in structure for view `projectwiseuserworktime`
-- (See below for the actual view)
--
CREATE TABLE `projectwiseuserworktime` (
`project` varchar(150)
,`user` varchar(40)
,`total_hour` decimal(34,1)
);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `fid` varchar(40) NOT NULL,
  `userId` varchar(40) DEFAULT NULL,
  `entryTime` bigint(20) DEFAULT NULL,
  `exitTime` bigint(20) DEFAULT NULL,
  `createdLater` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`fid`, `userId`, `entryTime`, `exitTime`, `createdLater`) VALUES
('022xdprPqSKdmALY6ZzU', 'myxsJVESyfPZTIPpbNRuoKJ7qHF2', 1639573017000, 1639584845000, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `sessionwithdaytimestamp`
-- (See below for the actual view)
--
CREATE TABLE `sessionwithdaytimestamp` (
`fid` varchar(40)
,`userId` varchar(40)
,`entryTime` bigint(20)
,`duration` bigint(21)
,`dayTimestamp` bigint(22)
);

-- --------------------------------------------------------

--
-- Table structure for table `storedqueries`
--

CREATE TABLE `storedqueries` (
  `title` varchar(20) DEFAULT NULL,
  `query` varchar(10000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `storedqueries`
--

INSERT INTO `storedqueries` (`title`, `query`) VALUES
('projects_work_hour_b', 'SELECT project, max(case when col = \'Gigi zaman\' then value end) as `Gigi zaman`,max(case when col = \'Hasan\' then value end) as `Hasan`,max(case when col = \'Hasib\' then value end) as `Hasib`,max(case when col = \'Md Riaz\' then value end) as `Md Riaz`,max(case when col = \'Prince\' then value end) as `Prince`,max(case when col = \'Rashid Zaman\' then value end) as `Rashid Zaman`,max(case when col = \'Ratul\' then value end) as `Ratul`,max(case when col = \'Saiful\' then value end) as `Saiful`,max(case when col = \'Shadhin\' then value end) as `Shadhin`,max(case when col = \'Shead Ashraf\' then value end) as `Shead Ashraf`,max(case when col = \'Shompa Karmoker\' then value end) as `Shompa Karmoker`,max(case when col = \'Sujon\' then value end) as `Sujon`,max(case when col = \'Trina\' then value end) as `Trina` \r\n                  from\r\n                  (\r\n                    select project, concat(\'\', user) col, total_hour value\r\n                    from projectwiseuserworktime\r\n                  ) as tmp2\r\n                  group by project');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `fid` varchar(40) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `done_time` bigint(20) DEFAULT NULL,
  `start_date` bigint(20) DEFAULT NULL,
  `deadline` bigint(20) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `estimate` int(11) DEFAULT NULL,
  `done` tinyint(1) DEFAULT NULL,
  `removedFromTodo` tinyint(1) DEFAULT NULL,
  `project_id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `milestone_id` varchar(40) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `subTask` varchar(400) DEFAULT NULL,
  `priority` varchar(10) DEFAULT NULL,
  `startDate` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`fid`, `title`, `timestamp`, `done_time`, `start_date`, `deadline`, `duration`, `estimate`, `done`, `removedFromTodo`, `project_id`, `user_id`, `createdBy`, `milestone_id`, `order_id`, `subTask`, `priority`, `startDate`) VALUES
('00e8CIGEYWBwGhrUcbTE', 'Attend guests', 1633327818996, 1633660294798, 1633284000000, 0, 0, 0, 1, NULL, 'wcLd0jZ2O2uk60gKOWl6', 'myxsJVESyfPZTIPpbNRuoKJ7qHF2', 'myxsJVESyfPZTIPpbNRuoKJ7qHF2', 'null', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `timeentries`
--

CREATE TABLE `timeentries` (
  `fid` varchar(40) NOT NULL,
  `startTime` bigint(20) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `isBusy` tinyint(1) DEFAULT 0,
  `taskId` varchar(40) DEFAULT NULL,
  `SubTaskId` varchar(40) DEFAULT NULL,
  `userId` varchar(40) DEFAULT NULL,
  `isExtraWork` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `timeentries`
--

INSERT INTO `timeentries` (`fid`, `startTime`, `duration`, `isBusy`, `taskId`, `SubTaskId`, `userId`, `isExtraWork`) VALUES
('00EBaZXdcackFJU5xtZT', 1632235933000, 4619000, 0, 'aaLSj35CM6UFW6bhClsD', NULL, 'zSKW9rb4mIZLrVQK1dKu8L82y7O2', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `timeentrieswithproject`
-- (See below for the actual view)
--
CREATE TABLE `timeentrieswithproject` (
`fid` varchar(40)
,`startTime` bigint(20)
,`isBusy` tinyint(1)
,`taskId` varchar(40)
,`duration` int(11)
,`userId` varchar(40)
,`project_id` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `userofficedays1hrofficetime`
-- (See below for the actual view)
--
CREATE TABLE `userofficedays1hrofficetime` (
`userId` varchar(40)
,`name` varchar(40)
,`noOfDays` bigint(21)
);

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

-- --------------------------------------------------------

--
-- Stand-in structure for view `workhour`
-- (See below for the actual view)
--
CREATE TABLE `workhour` (
`userId` varchar(40)
,`user` varchar(40)
,`WorkHour` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Structure for view `days_recored_for_each_user`
--
DROP TABLE IF EXISTS `days_recored_for_each_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `days_recored_for_each_user`  AS SELECT `users`.`fid` AS `userId`, `users`.`name` AS `name`, count(0) AS `noOfDays` FROM (`days` `d` left join `users` on(`d`.`userId` = `users`.`fid`)) GROUP BY `d`.`userId` ;

-- --------------------------------------------------------

--
-- Structure for view `daywiseofficehours`
--
DROP TABLE IF EXISTS `daywiseofficehours`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `daywiseofficehours`  AS SELECT `sessionwithdaytimestamp`.`userId` AS `userId`, `sessionwithdaytimestamp`.`dayTimestamp` AS `dayTimestamp`, count(0) AS `noOfSession`, round(sum(`sessionwithdaytimestamp`.`duration`) / 3600000,1) AS `duration` FROM `sessionwithdaytimestamp` GROUP BY `sessionwithdaytimestamp`.`userId`, `sessionwithdaytimestamp`.`dayTimestamp` ;

-- --------------------------------------------------------

--
-- Structure for view `fr__projects_hours_by_users_column`
--
DROP TABLE IF EXISTS `fr__projects_hours_by_users_column`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fr__projects_hours_by_users_column`  AS SELECT `tmp2`.`project` AS `project`, max(case when `tmp2`.`col` = 'Ratul' then `tmp2`.`value` end) AS `Ratul`, max(case when `tmp2`.`col` = 'Gigi zaman' then `tmp2`.`value` end) AS `Gigi zaman`, max(case when `tmp2`.`col` = 'Rashid Zaman' then `tmp2`.`value` end) AS `Rashid Zaman`, max(case when `tmp2`.`col` = 'Shadhin' then `tmp2`.`value` end) AS `Shadhin`, max(case when `tmp2`.`col` = 'Hasan' then `tmp2`.`value` end) AS `Hasan`, max(case when `tmp2`.`col` = 'Hasib' then `tmp2`.`value` end) AS `Hasib`, max(case when `tmp2`.`col` = 'Md Riaz' then `tmp2`.`value` end) AS `Md Riaz`, max(case when `tmp2`.`col` = 'Prince' then `tmp2`.`value` end) AS `Prince`, max(case when `tmp2`.`col` = 'Saiful' then `tmp2`.`value` end) AS `Saiful`, max(case when `tmp2`.`col` = 'Shead Ashraf' then `tmp2`.`value` end) AS `Shead Ashraf`, max(case when `tmp2`.`col` = 'Shompa Karmoker' then `tmp2`.`value` end) AS `Shompa Karmoker`, max(case when `tmp2`.`col` = 'Sujon' then `tmp2`.`value` end) AS `Sujon`, max(case when `tmp2`.`col` = 'Trina' then `tmp2`.`value` end) AS `Trina` FROM (select `projectwiseuserworktime`.`project` AS `project`,concat('',`projectwiseuserworktime`.`user`) AS `col`,`projectwiseuserworktime`.`total_hour` AS `value` from `projectwiseuserworktime`) AS `tmp2` GROUP BY `tmp2`.`project` ;

-- --------------------------------------------------------

--
-- Structure for view `fr___user_active_hours`
--
DROP TABLE IF EXISTS `fr___user_active_hours`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fr___user_active_hours`  AS SELECT `wh`.`user` AS `user`, round(`wh`.`WorkHour` / 3600000,0) AS `WorkHour`, round((`officehour`.`OfficeHour` - `wh`.`WorkHour`) / 3600000,0) AS `BreakTime`, round(`officehour`.`OfficeHour` / 3600000,0) AS `OfficeHour`, `userofficedays1hrofficetime`.`noOfDays` AS `ActiveDays(1h office)` FROM ((`workhour` `wh` left join `officehour` on(`wh`.`userId` = `officehour`.`userId`)) left join `userofficedays1hrofficetime` on(`wh`.`userId` = `userofficedays1hrofficetime`.`userId`)) ORDER BY round(`wh`.`WorkHour` / 3600000,0) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `fr___user_working_days`
--
DROP TABLE IF EXISTS `fr___user_working_days`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fr___user_working_days`  AS SELECT `users`.`name` AS `name`, `offce_all`.`noOfDays` AS `daysRecorded`, `offce1h`.`noOfDays` AS `ActiveDays(1h office)`, count(`d`.`planningDeadline`) AS `planningActive`, count(`d`.`planningFinishTime`) AS `Planned`, count(case when `d`.`planningDeadline` >= `d`.`planningFinishTime` then 1 end) AS `OnTime`, count(case when `d`.`planningDeadline` < `d`.`planningFinishTime` then 1 end) AS `Late`, count(`d`.`reviewFinishTime`) AS `reviewed`, sum(`d`.`planningIgnored`) AS `planningIgnored` FROM (((`days` `d` left join `users` on(`d`.`userId` = `users`.`fid`)) left join `userofficedays1hrofficetime` `offce1h` on(`d`.`userId` = `offce1h`.`userId`)) left join `days_recored_for_each_user` `offce_all` on(`d`.`userId` = `offce_all`.`userId`)) WHERE `d`.`planningDeadline` is not null GROUP BY `d`.`userId` ORDER BY count(`d`.`planningDeadline`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `officehour`
--
DROP TABLE IF EXISTS `officehour`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `officehour`  AS SELECT `sessions`.`userId` AS `userId`, `users`.`name` AS `name`, sum(`sessions`.`exitTime` - `sessions`.`entryTime`) AS `OfficeHour` FROM (`sessions` left join `users` on(`sessions`.`userId` = `users`.`fid`)) GROUP BY `sessions`.`userId` ;

-- --------------------------------------------------------

--
-- Structure for view `projectwiseuserworktime`
--
DROP TABLE IF EXISTS `projectwiseuserworktime`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `projectwiseuserworktime`  AS SELECT `projects`.`name` AS `project`, `users`.`name` AS `user`, round(sum(`tep`.`duration`) / 3600000,1) AS `total_hour` FROM ((`timeentrieswithproject` `tep` left join `projects` on(`tep`.`project_id` = `projects`.`fid`)) left join `users` on(`tep`.`userId` = `users`.`fid`)) GROUP BY `tep`.`project_id`, `tep`.`userId` ;

-- --------------------------------------------------------

--
-- Structure for view `sessionwithdaytimestamp`
--
DROP TABLE IF EXISTS `sessionwithdaytimestamp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sessionwithdaytimestamp`  AS SELECT `sessions`.`fid` AS `fid`, `sessions`.`userId` AS `userId`, `sessions`.`entryTime` AS `entryTime`, `sessions`.`exitTime`- `sessions`.`entryTime` AS `duration`, `sessions`.`entryTime`- `sessions`.`entryTime` MOD 86400000 - 21600000 AS `dayTimestamp` FROM `sessions` ORDER BY `sessions`.`entryTime` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `timeentrieswithproject`
--
DROP TABLE IF EXISTS `timeentrieswithproject`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `timeentrieswithproject`  AS SELECT `te`.`fid` AS `fid`, `te`.`startTime` AS `startTime`, `te`.`isBusy` AS `isBusy`, `te`.`taskId` AS `taskId`, `te`.`duration` AS `duration`, `te`.`userId` AS `userId`, `tasks`.`project_id` AS `project_id` FROM (`timeentries` `te` left join `tasks` on(`te`.`taskId` = `tasks`.`fid`)) ;

-- --------------------------------------------------------

--
-- Structure for view `userofficedays1hrofficetime`
--
DROP TABLE IF EXISTS `userofficedays1hrofficetime`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userofficedays1hrofficetime`  AS SELECT `users`.`fid` AS `userId`, `users`.`name` AS `name`, count(0) AS `noOfDays` FROM (`daywiseofficehours` `dwoh` left join `users` on(`dwoh`.`userId` = `users`.`fid`)) WHERE `dwoh`.`duration` >= 1 GROUP BY `dwoh`.`userId` ;

-- --------------------------------------------------------

--
-- Structure for view `workhour`
--
DROP TABLE IF EXISTS `workhour`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `workhour`  AS SELECT `tep`.`userId` AS `userId`, `users`.`name` AS `user`, sum(`tep`.`duration`) AS `WorkHour` FROM (`timeentrieswithproject` `tep` left join `users` on(`tep`.`userId` = `users`.`fid`)) GROUP BY `tep`.`userId` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `timeentries`
--
ALTER TABLE `timeentries`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`fid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
