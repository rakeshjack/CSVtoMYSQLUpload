-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 06, 2018 at 11:24 AM
-- Server version: 5.7.22-0ubuntu0.17.10.1
-- PHP Version: 7.1.17-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parthiban_leadsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance_entry`
--

CREATE TABLE `attendance_entry` (
  `id` int(11) NOT NULL,
  `empid` int(10) NOT NULL,
  `entry_date` datetime NOT NULL,
  `sign_intime` datetime NOT NULL,
  `sign_ingps` int(10) NOT NULL,
  `sign_outtime` datetime NOT NULL,
  `sign_outgps` int(10) NOT NULL,
  `signIn_appimode` enum('Self','Supervisor') NOT NULL COMMENT 'Supervisor/Self',
  `sign_inby` int(10) NOT NULL,
  `sign_instatus` bigint(4) NOT NULL COMMENT 'PendingApproval(default at Signin)/Approved/Rejected',
  `signout_appimode` enum('Self','Supervisor') NOT NULL COMMENT 'Supervisor/Self',
  `signout_by` int(10) NOT NULL COMMENT 'employe_id',
  `signout_status` bigint(4) NOT NULL COMMENT 'PendingApproval(default at Signin)/Approved',
  `remarks` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(10) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `cityid` int(11) NOT NULL COMMENT 'Primary key for table',
  `countryid` int(11) NOT NULL COMMENT 'Foreign key from country table',
  `stateid` int(11) NOT NULL COMMENT 'Foreign key from state table',
  `cityname` varchar(50) NOT NULL DEFAULT 'Chennai' COMMENT 'City Name',
  `citystatus` char(1) NOT NULL DEFAULT 'N' COMMENT 'Status N/Y',
  `userid` int(11) NOT NULL DEFAULT '1' COMMENT 'created by (user id)',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `ipaddress` varchar(50) NOT NULL DEFAULT '192.168.1.10' COMMENT 'ip address of user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`cityid`, `countryid`, `stateid`, `cityname`, `citystatus`, `userid`, `timestamp`, `ipaddress`) VALUES
(1, 2, 1, 'sivakasi', 'Y', 1, '2018-08-27 12:00:31', '0:0:0:0:0:0:0:1'),
(4, 3, 5, 'washington', 'Y', 1, '2018-08-27 12:48:31', '0:0:0:0:0:0:0:1');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `compname` varchar(50) NOT NULL,
  `comptype` varchar(30) NOT NULL DEFAULT 'NA',
  `compadd1` varchar(100) NOT NULL DEFAULT 'NA',
  `compadd2` varchar(100) NOT NULL DEFAULT 'NA',
  `compadd3` varchar(100) NOT NULL DEFAULT 'NA',
  `compstate` int(11) NOT NULL,
  `compcity` int(11) NOT NULL,
  `comppin` varchar(10) NOT NULL DEFAULT '0',
  `compcountry` int(11) NOT NULL,
  `comppan` varchar(30) NOT NULL DEFAULT '0',
  `compgstno` varchar(30) NOT NULL DEFAULT '0',
  `comptinno` varchar(30) NOT NULL DEFAULT '0',
  `comptele` varchar(30) NOT NULL DEFAULT '0',
  `compcontact1` varchar(30) NOT NULL DEFAULT 'NA',
  `compcontdesig1` varchar(30) NOT NULL DEFAULT 'NA',
  `compcontmob1` varchar(30) NOT NULL DEFAULT '0',
  `compcontact2` varchar(30) NOT NULL DEFAULT 'NA',
  `compcontdesig2` varchar(30) NOT NULL DEFAULT 'NA',
  `compcontmob2` varchar(30) NOT NULL DEFAULT '0',
  `compemail` varchar(30) NOT NULL DEFAULT 'NA',
  `compwebsite` varchar(30) NOT NULL DEFAULT 'NA',
  `complogo` longblob NOT NULL,
  `comprem` text NOT NULL,
  `compmailauth` varchar(30) NOT NULL DEFAULT 'NA',
  `compmailhost` varchar(50) NOT NULL DEFAULT 'NA',
  `compmailport` int(11) NOT NULL DEFAULT '0',
  `compmailssltrust` varchar(10) NOT NULL DEFAULT 'NA',
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `compname`, `comptype`, `compadd1`, `compadd2`, `compadd3`, `compstate`, `compcity`, `comppin`, `compcountry`, `comppan`, `compgstno`, `comptinno`, `comptele`, `compcontact1`, `compcontdesig1`, `compcontmob1`, `compcontact2`, `compcontdesig2`, `compcontmob2`, `compemail`, `compwebsite`, `complogo`, `comprem`, `compmailauth`, `compmailhost`, `compmailport`, `compmailssltrust`, `status`) VALUES
(3, 'Thinksynq.in', 'PrivateLimited', 'Seethamaal Colon', 'gh', 'dfgh', 1, 1, '3', 2, 'fgh', 'fgh', 'fgdh', 'dfgh', 'dfgh', 'dfgh', '9834398343', 'dfgh', 'dfgh', 'fghd', 'thinkysnq', 'dfgh', '', 'dfgh', 'dfgh', 'fgh', 456, 'dhdfghdfgh', 1);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL COMMENT 'Primary key for table',
  `countryname` varchar(255) NOT NULL COMMENT 'Name of Country',
  `countrystatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Status 1 Active | satus 0 Inactive',
  `userid` int(11) NOT NULL DEFAULT '1' COMMENT 'Created By User',
  `creationtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `ipaddress` varchar(50) NOT NULL DEFAULT '192.168.1.10' COMMENT 'Ip address'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `countryname`, `countrystatus`, `userid`, `creationtime`, `ipaddress`) VALUES
(2, 'India', 1, 1, '2018-08-27 10:11:04', '0:0:0:0:0:0:0:1'),
(3, 'America', 1, 1, '2018-08-27 10:11:15', '0:0:0:0:0:0:0:1'),
(5, 'South Africa', 1, 1, '2018-09-03 06:16:03', '192.168.1.10'),
(6, 'USA', 2, 1, '2018-09-05 05:01:50', '192.168.1.10');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `type` int(1) NOT NULL DEFAULT '1',
  `empType` int(1) NOT NULL COMMENT '1=Emlpoyee;2=Agency',
  `empCode` varchar(10) NOT NULL DEFAULT '0',
  `teamLeadFlag` int(1) NOT NULL DEFAULT '0' COMMENT '1=Yes,2=No,0 =Undefined',
  `teamLeadCode` varchar(10) NOT NULL DEFAULT '0' COMMENT '0=undefined',
  `empName` varchar(50) NOT NULL,
  `empMobNo` varchar(10) NOT NULL DEFAULT '0' COMMENT '0 = undefined',
  `mailId` varchar(50) NOT NULL,
  `doj` date DEFAULT NULL,
  `designation` int(11) DEFAULT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `imsi_number` varchar(50) DEFAULT NULL,
  `image` text,
  `status` int(1) NOT NULL COMMENT '1=Active;2=Inactive',
  `createDate` date NOT NULL,
  `createBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `type`, `empType`, `empCode`, `teamLeadFlag`, `teamLeadCode`, `empName`, `empMobNo`, `mailId`, `doj`, `designation`, `username`, `password`, `imsi_number`, `image`, `status`, `createDate`, `createBy`) VALUES
(1, 2, 1, '9554455', 1, '', 'rajesh', '8787545454', '', '0000-00-00', 2, 'rajesh', 'MTIz', '405869005204967', 'Fri_Aug_17_2018_11_23_20-Chrysanthemum.jpg', 1, '2018-08-24', 0),
(2, 2, 1, '9544554', 2, '9554455', 'vinoth', '8785545454', '', '0000-00-00', 2, 'vinoth', 'MTIz', '', 'Mon_Aug_13_2018_16_09_47-Tulips.jpg', 1, '2018-08-13', 0),
(3, 2, 1, '9554545', 1, '', 'karthi', '8785454545', '', '0000-00-00', 2, 'karthi', 'MTIz', '', 'Mon_Aug_13_2018_16_10_21-Tulips.jpg', 1, '2018-08-14', 0),
(4, 2, 1, '9545454', 2, '9554455', 'raj', '7445545454', '', '0000-00-00', 2, 'raj', 'MTIz', '', 'Mon_Aug_13_2018_16_11_03-Tulips.jpg', 1, '2018-08-13', 0),
(5, 1, 1, '9541422', 1, '', 'hari', '8685644566', '', '2016-03-01', 1, 'hari', 'MTIz', '5656566465454', 'Mon_Aug_13_2018_18_12_48-Hydrangeas.jpg', 1, '2018-08-14', 0),
(6, 2, 1, '9966656', 2, '9554455', 'raji', '8745544445', 'raji@gmail.com', '2018-08-05', 1, 'raji', 'MTIz', '', 'Fri_Aug_17_2018_11_18_19-Tulips.jpg', 1, '2018-08-17', 0),
(7, 2, 1, '9894540', 2, '9554545', 'Elango', '9894540143', '', '0000-00-00', 2, '143', 'MTQz', '', 'Fri_Aug_17_2018_15_14_54-clientlogo_old.jpg', 1, '2018-08-17', 0),
(8, 1, 1, '0', 0, '0', 'Rakeshradhakrishnan', '0', '445', '2018-09-14', NULL, 'test', '$2y$10$O6Y1OhCnDzXWBarBUeZrhOrACWCGwWN21kvgdKeg6GZLgoDlSj0wC', NULL, NULL, 1, '2018-09-05', 1),
(9, 1, 1, '0', 0, '0', 'Rakesh', '97843434', 'rakeshjack7@gmail.co', '1970-01-01', 1, 'testingg', '$2y$10$m38dX0pCGzRSk.Nd5VQReeXa7.Cq3dJTbgUw4hEGnbUmuFWahGt2e', NULL, NULL, 1, '2018-09-05', 1),
(10, 1, 1, '-477', 0, '0', 'Rakeshjack7', '9788787867', 'rakeshjack7@gmail.co', '2018-09-20', 2, 'rakeshjack223232', '$2y$10$QQqi46dj8MYZBWo.oWnw0uXeNDkh//ne0sd74sf6nO7c.IiDtpPyi', NULL, NULL, 1, '2018-09-05', 1),
(11, 1, 2, 'LEAD869', 0, '0', 'rakeshjack712', '779879778', 'rakeshkaljac@gmail.c', '2018-09-13', 6, 'test12weerrt', '$2y$10$5HJUnXxIYDe2taZJwHDuH.rVjBGy2D3naS5eZvJE5i7yWC31OAOSW', NULL, NULL, 1, '2018-09-05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `holiday_list`
--

CREATE TABLE `holiday_list` (
  `id` int(11) NOT NULL,
  `manager_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `desci` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL COMMENT 'Primary key for table',
  `country_id` int(11) NOT NULL COMMENT 'Foreign key from country table',
  `statename` varchar(50) NOT NULL DEFAULT 'Tamilnadu' COMMENT 'Statename entry',
  `statestatus` char(1) NOT NULL DEFAULT 'N' COMMENT 'Status  1=Yes 2=No',
  `userid` int(11) NOT NULL DEFAULT '1' COMMENT 'created by (user id)',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `ipaddress` varchar(50) NOT NULL DEFAULT '192.168.1.10' COMMENT 'ip address of user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `country_id`, `statename`, `statestatus`, `userid`, `timestamp`, `ipaddress`) VALUES
(1, 2, 'Tamilnadu', '1', 1, '2018-08-27 11:00:20', '0:0:0:0:0:0:0:1'),
(2, 2, 'Karanataka1', '1', 1, '2018-08-27 11:06:03', '0:0:0:0:0:0:0:1'),
(5, 3, 'Los Angels', '1', 1, '2018-08-27 11:08:49', '0:0:0:0:0:0:0:1'),
(6, 2, 'Kerala', '1', 1, '2018-09-05 13:25:31', '192.168.1.10'),
(7, 2, 'Orissa', '1', 1, '2018-09-05 13:27:08', '192.168.1.10'),
(8, 2, 'Karanataka', '1', 1, '2018-09-06 05:05:56', '192.168.1.10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `log_name` varchar(20) NOT NULL,
  `log_pass` text NOT NULL,
  `log_type` int(2) NOT NULL,
  `branch_id` int(5) DEFAULT NULL COMMENT 'From ''branch'' table ''branch_Id''',
  `log_datetime` datetime DEFAULT NULL COMMENT 'Last login date time',
  `log_c_by` int(5) NOT NULL COMMENT 'Entry created by ''emp id'' from ''employees'' table',
  `log_c_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Entry created date time',
  `log_e_by` int(5) DEFAULT NULL COMMENT 'Entry edited by ''emp id'' from ''employees'' table',
  `log_e_datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Entry edit date time',
  `log_acc_status` int(1) NOT NULL COMMENT '1=Login account is active, 2=Login account is inactive',
  `log_flg` int(1) DEFAULT NULL COMMENT '1=User login is live, 2=User logout',
  `log_privileges` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `log_name`, `log_pass`, `log_type`, `branch_id`, `log_datetime`, `log_c_by`, `log_c_datetime`, `log_e_by`, `log_e_datetime`, `log_acc_status`, `log_flg`, `log_privileges`) VALUES
(1, 'test', '$2y$10$O6wL5.cf9fkxjYmD5k7UjuIxrVqMg2Ad4Odnb9acQHDlgFCDPmOHS', 1, 1, NULL, 1, '2018-08-18 17:40:37', NULL, '2018-08-31 16:55:24', 1, NULL, NULL),
(2, 'user', '$2y$10$D6ca52HAAy7xX87gpLSU3uGbFajRiEM9WGeh.KvYOzKW.vSRXAgPC', 2, 1, NULL, 1, '2018-08-28 14:06:47', 1, '2018-09-05 00:00:00', 1, NULL, NULL),
(4, 'raj', '$2y$10$d5y0sckg/4w9BvMIMX0.J.S/u1Rkm8SmK7bOgKGcO57G.ARFvUuq2', 2, 2, NULL, 1, '2018-08-28 14:24:57', 1, '2018-09-05 00:00:00', 1, NULL, NULL),
(5, 'kiran', '$2y$10$1RjIYy5O4411BuinRNrevOkNwq4m.Xj1cwVqdeLTf1pmD.iVMQGx.', 3, NULL, NULL, 1, '2018-09-05 00:00:00', 1, '2018-09-05 00:00:00', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1=Yes,2=No',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `role_name`, `status`, `created_at`, `created_by`) VALUES
(1, 'Super Admin', 1, '2018-09-05 07:17:38', 1),
(2, 'Admin', 1, '2018-09-05 07:19:44', 1),
(3, 'Users', 1, '2018-09-05 08:12:55', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance_entry`
--
ALTER TABLE `attendance_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`cityid`),
  ADD UNIQUE KEY `cityname` (`cityname`),
  ADD KEY `countryid` (`countryid`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `compstate` (`compstate`),
  ADD KEY `compstate_2` (`compstate`),
  ADD KEY `compcity` (`compcity`),
  ADD KEY `compcountry` (`compcountry`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empType` (`empType`),
  ADD KEY `empCode` (`empCode`);

--
-- Indexes for table `holiday_list`
--
ALTER TABLE `holiday_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `statename` (`statename`),
  ADD KEY `countryid` (`country_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance_entry`
--
ALTER TABLE `attendance_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `cityid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for table', AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for table', AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `holiday_list`
--
ALTER TABLE `holiday_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for table', AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
