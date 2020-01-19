-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2018 at 03:27 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carfactory`
--

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `batchNo` int(10) UNSIGNED NOT NULL,
  `productionlineID` int(10) UNSIGNED NOT NULL,
  `factoryID` int(10) UNSIGNED NOT NULL,
  `modelID` int(10) UNSIGNED NOT NULL,
  `batch_size` int(11) NOT NULL,
  `batch_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batchNo`, `productionlineID`, `factoryID`, `modelID`, `batch_size`, `batch_date`) VALUES
(1, 1, 1, 1, 20, '2018-01-20'),
(2, 2, 1, 3, 30, '2018-01-21'),
(3, 3, 1, 5, 40, '2018-01-21'),
(4, 1, 2, 7, 20, '2018-01-22'),
(5, 2, 2, 9, 20, '2018-01-22');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int(10) UNSIGNED NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `description`) VALUES
(1, 'hatchback'),
(2, 'sedan'),
(3, 'mpv'),
(4, 'suv'),
(5, 'crossover'),
(6, 'coupe'),
(7, 'convertible');

-- --------------------------------------------------------

--
-- Table structure for table `factory`
--

CREATE TABLE `factory` (
  `factoryID` int(10) UNSIGNED NOT NULL,
  `address` text NOT NULL,
  `faxNo` varchar(20) NOT NULL,
  `phoneNo` varchar(20) NOT NULL,
  `manager` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factory`
--

INSERT INTO `factory` (`factoryID`, `address`, `faxNo`, `phoneNo`, `manager`) VALUES
(1, 'address1', '111-111-111', '(111)11111', 1),
(2, 'address2', '222-222-222', '(222)22222', 2),
(3, 'address3', '333-333-333', '(333)33333', 3),
(4, 'address4', '444-444-444', '(444)44444', 4),
(5, 'address5', '555-555-555', '(555)55555', 5),
(6, 'address6', '666-666-666', '(666)66666', 6),
(7, 'address7', '777-777-777', '(777)77777', 7),
(8, 'address8', '888-888-888', '(888)88888', 8),
(9, 'address9', '999-999-999', '(999)99999', 9),
(10, 'address10', '101-101-101', '(101)01010', 10);

-- --------------------------------------------------------

--
-- Table structure for table `factory_productionline_model`
--

CREATE TABLE `factory_productionline_model` (
  `productionlineID` int(10) UNSIGNED NOT NULL,
  `factoryID` int(10) UNSIGNED NOT NULL,
  `modelID` int(10) UNSIGNED NOT NULL,
  `daily_output` int(10) UNSIGNED NOT NULL,
  `date_last_maintenance` date NOT NULL,
  `date_next_maintenance` date NOT NULL,
  `uptime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factory_productionline_model`
--

INSERT INTO `factory_productionline_model` (`productionlineID`, `factoryID`, `modelID`, `daily_output`, `date_last_maintenance`, `date_next_maintenance`, `uptime`) VALUES
(1, 1, 1, 20, '2018-01-20', '2018-10-20', 262),
(1, 2, 7, 20, '2018-01-21', '2018-10-21', 262),
(2, 1, 3, 30, '2018-01-20', '2018-10-20', 262),
(2, 2, 9, 20, '2018-01-21', '2018-10-21', 262),
(3, 1, 5, 40, '2018-01-20', '2018-10-20', 262);

-- --------------------------------------------------------

--
-- Table structure for table `factory_productionline_staff`
--

CREATE TABLE `factory_productionline_staff` (
  `productionlineID` int(10) UNSIGNED NOT NULL,
  `factoryID` int(10) UNSIGNED NOT NULL,
  `staffID` int(10) UNSIGNED NOT NULL,
  `shift_start` time NOT NULL,
  `shift_end` time NOT NULL,
  `shiftdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factory_productionline_staff`
--

INSERT INTO `factory_productionline_staff` (`productionlineID`, `factoryID`, `staffID`, `shift_start`, `shift_end`, `shiftdate`) VALUES
(1, 1, 21, '07:05:21', '17:00:10', '2018-02-23'),
(1, 2, 24, '07:20:09', '17:00:09', '2018-02-23'),
(2, 1, 22, '07:10:45', '17:00:09', '2018-02-23'),
(2, 2, 25, '07:13:10', '17:00:04', '2018-02-23'),
(3, 1, 23, '07:21:10', '17:00:03', '2018-02-23');

-- --------------------------------------------------------

--
-- Table structure for table `factory_shippingport`
--

CREATE TABLE `factory_shippingport` (
  `shippingportID` int(10) UNSIGNED NOT NULL,
  `factoryID` int(10) UNSIGNED NOT NULL,
  `manager` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factory_shippingport`
--

INSERT INTO `factory_shippingport` (`shippingportID`, `factoryID`, `manager`) VALUES
(1, 1, 11),
(2, 2, 12),
(3, 3, 13),
(4, 4, 14),
(5, 5, 15),
(6, 6, 16),
(7, 7, 17),
(8, 8, 18),
(9, 9, 19),
(10, 10, 20);

-- --------------------------------------------------------

--
-- Table structure for table `factory_shippingport_portlane`
--

CREATE TABLE `factory_shippingport_portlane` (
  `shippingportID` int(10) UNSIGNED NOT NULL,
  `factoryID` int(10) UNSIGNED NOT NULL,
  `portlaneID` int(10) UNSIGNED NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factory_shippingport_portlane`
--

INSERT INTO `factory_shippingport_portlane` (`shippingportID`, `factoryID`, `portlaneID`, `status`) VALUES
(1, 1, 1, 'in-use'),
(1, 1, 2, 'in-use'),
(1, 1, 3, 'in-use'),
(1, 1, 4, 'free'),
(1, 1, 5, 'free'),
(2, 2, 1, 'in-use'),
(2, 2, 2, 'in-use'),
(2, 2, 3, 'free'),
(2, 2, 4, 'free'),
(2, 2, 5, 'free');

-- --------------------------------------------------------

--
-- Table structure for table `inspection`
--

CREATE TABLE `inspection` (
  `inspectorID` int(10) UNSIGNED NOT NULL,
  `batchNo` int(10) UNSIGNED NOT NULL,
  `inspection_date` date NOT NULL,
  `inspection_status` varchar(10) NOT NULL,
  `comments` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inspection`
--

INSERT INTO `inspection` (`inspectorID`, `batchNo`, `inspection_date`, `inspection_status`, `comments`) VALUES
(26, 1, '2018-01-20', 'pass', 'a bit of scrapping on the paint work but overall is okay'),
(26, 2, '2018-01-21', 'pass', 'nothing of note'),
(26, 3, '2018-01-21', 'fail', 'there is a 4-inch hole in all the models!'),
(27, 4, '2018-01-22', 'pass', 'nothing of note'),
(27, 5, '2018-01-22', 'pass', 'nothing of note');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `modelID` int(10) UNSIGNED NOT NULL,
  `categoryID` int(10) UNSIGNED NOT NULL,
  `year_start_production` int(10) UNSIGNED DEFAULT NULL,
  `unit_price` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`modelID`, `categoryID`, `year_start_production`, `unit_price`) VALUES
(1, 1, 1970, 5000),
(2, 2, 1973, 6500),
(3, 3, 1976, 8000),
(4, 4, 1979, 10000),
(5, 5, 1984, 12000),
(6, 6, 1990, 11500),
(7, 7, 1992, 14000),
(8, 2, 1972, 5500),
(9, 1, 1986, 3000),
(10, 4, 2000, 6000);

-- --------------------------------------------------------

--
-- Table structure for table `port_lane`
--

CREATE TABLE `port_lane` (
  `portlaneID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `port_lane`
--

INSERT INTO `port_lane` (`portlaneID`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- --------------------------------------------------------

--
-- Table structure for table `productionline`
--

CREATE TABLE `productionline` (
  `productionlineID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productionline`
--

INSERT INTO `productionline` (`productionlineID`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roleID` int(10) UNSIGNED NOT NULL,
  `rolename` varchar(20) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roleID`, `rolename`, `description`) VALUES
(1, 'line worker', 'maintain operation of the productionlines.'),
(2, 'inspector', 'inspect a models from a batch to ensure production quality.'),
(3, 'port manager', 'manage the shipping port inside their respective factories.'),
(4, 'factory manager', 'manages the daily activities of the factory.');

-- --------------------------------------------------------

--
-- Table structure for table `salespoint`
--

CREATE TABLE `salespoint` (
  `salespointID` int(10) UNSIGNED NOT NULL,
  `address` text NOT NULL,
  `phoneNo` varchar(20) NOT NULL,
  `faxNo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salespoint`
--

INSERT INTO `salespoint` (`salespointID`, `address`, `phoneNo`, `faxNo`) VALUES
(1, 'salesaddress1', '(202)02020', '202-202-202'),
(2, 'salesaddress2', '(303)03030', '303-303-303'),
(3, 'salesaddress3', '(404)04040', '404-404-404'),
(4, 'salesaddress4', '(505)05050', '505-505-505'),
(5, 'salesaddress5', '(606)06060', '606-606-606'),
(6, 'salesaddress6', '(707)07070', '707-707-707'),
(7, 'salesaddress7', '(808)08080', '808-808-808'),
(8, 'salesaddress8', '(909)09090', '909-909-909'),
(9, 'salesaddress9', '(110)11010', '110-110-110'),
(10, 'salesaddress10', '(112)11211', '112-112-112');

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

CREATE TABLE `shipment` (
  `shipmentID` int(10) UNSIGNED NOT NULL,
  `shippingportID` int(10) UNSIGNED NOT NULL,
  `factoryID` int(10) UNSIGNED NOT NULL,
  `portlaneID` int(10) UNSIGNED NOT NULL,
  `batchNo` int(10) UNSIGNED NOT NULL,
  `salespointID` int(10) UNSIGNED NOT NULL,
  `date_shipped` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipment`
--

INSERT INTO `shipment` (`shipmentID`, `shippingportID`, `factoryID`, `portlaneID`, `batchNo`, `salespointID`, `date_shipped`) VALUES
(1, 1, 1, 1, 1, 1, '2018-01-21'),
(2, 1, 1, 2, 2, 2, '2018-01-22'),
(3, 2, 2, 1, 4, 4, '2018-01-23'),
(4, 2, 2, 2, 5, 5, '2018-01-23');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffID` int(10) UNSIGNED NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `roleID` int(10) UNSIGNED NOT NULL,
  `factoryID` int(10) UNSIGNED NOT NULL,
  `hiredate` date DEFAULT NULL,
  `phoneNo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `fname`, `lname`, `gender`, `age`, `roleID`, `factoryID`, `hiredate`, `phoneNo`) VALUES
(1, 'Ahriman', 'Lecroux', 'M', 49, 4, 1, '1983-01-21', '(414) 298-1424'),
(2, 'Casey', 'Loken', 'F', 38, 4, 2, '1985-01-20', '(913) 332-1616'),
(3, 'Sigismund', 'Varg', 'M', 51, 4, 3, '1986-01-19', '(323) 966-2928'),
(4, 'Mary', 'Possel', 'F', 54, 4, 4, '1987-01-21', '(652) 527-6483'),
(5, 'Paula', 'Van Door', 'F', 32, 4, 5, '1989-01-13', '(513) 687-0454'),
(6, 'Lorgar', 'Dorn', 'M', 43, 4, 6, '1990-01-20', '(362) 695-0697'),
(7, 'Tom', 'Ophelius', 'M', 42, 4, 7, '1991-01-11', '(443) 770-4652'),
(8, 'Octavia', 'Vargus', 'F', 49, 4, 8, '1992-01-02', '(221) 468-8377'),
(9, 'Robert', 'Guilliman', 'M', 55, 4, 9, '1980-01-19', '(621) 723-5790'),
(10, 'Conrad', 'Corax', 'M', 43, 4, 10, '1979-01-29', '(875) 626-9722'),
(11, 'Roger', 'Ignatius', 'M', 44, 3, 1, '1983-01-23', '(214) 451-7142'),
(12, 'Porter', 'Roberts', 'M', 46, 3, 2, '1985-01-24', '(210) 531-0433'),
(13, 'Quinsten', 'Rotrius', 'M', 39, 3, 3, '1986-01-22', '(906) 464-7153'),
(14, 'Louis', 'Wheyman', 'M', 40, 3, 4, '1987-01-26', '(439) 500-5875'),
(15, 'Ariel', 'Lane', 'F', 43, 3, 5, '1989-01-15', '(343) 265-3657'),
(16, 'Yoshua', 'Bekowski', 'M', 45, 3, 6, '1990-01-24', '(789) 614-2317'),
(17, 'Marcus', 'Corvy', 'M', 50, 3, 7, '1991-01-14', '(498) 863-6719'),
(18, 'Augustine', 'Earl', 'M', 49, 3, 8, '1992-01-04', '(278) 631-4271'),
(19, 'Alfred', 'Kingsley', 'M', 50, 3, 9, '1980-01-21', '(407) 655-2991'),
(20, 'Fiona', 'Brans', 'F', 42, 3, 10, '1979-01-30', '(881) 703-9178'),
(21, 'Lucas', 'Law', 'M', 41, 1, 1, '1979-01-30', '(752) 541-4033'),
(22, 'Mark', 'Orwel', 'M', 40, 1, 1, '1982-02-24', '(695) 545-3419'),
(23, 'Marcia', 'Poliere', 'F', 37, 1, 1, '1984-07-29', '(470) 759-7329'),
(24, 'Patty', 'Igna', 'F', 37, 1, 2, '1978-07-29', '(318) 940-0424'),
(25, 'Opherus', 'Magnus', 'M', 41, 1, 2, '1973-06-21', '(458) 915-1952'),
(26, 'Lais', 'Strider', 'M', 40, 2, 1, '1974-05-17', '(254) 392-0438'),
(27, 'Marcille', 'Longears', 'F', 40, 2, 2, '1974-03-19', '(878) 352-2858');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`batchNo`),
  ADD KEY `productionlineID` (`productionlineID`,`factoryID`,`modelID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `factory`
--
ALTER TABLE `factory`
  ADD PRIMARY KEY (`factoryID`),
  ADD KEY `manager` (`manager`);

--
-- Indexes for table `factory_productionline_model`
--
ALTER TABLE `factory_productionline_model`
  ADD PRIMARY KEY (`productionlineID`,`factoryID`,`modelID`),
  ADD KEY `factoryID` (`factoryID`),
  ADD KEY `modelID` (`modelID`);

--
-- Indexes for table `factory_productionline_staff`
--
ALTER TABLE `factory_productionline_staff`
  ADD PRIMARY KEY (`productionlineID`,`factoryID`,`staffID`),
  ADD KEY `factoryID` (`factoryID`),
  ADD KEY `staffID` (`staffID`);

--
-- Indexes for table `factory_shippingport`
--
ALTER TABLE `factory_shippingport`
  ADD PRIMARY KEY (`shippingportID`,`factoryID`),
  ADD KEY `factoryID` (`factoryID`),
  ADD KEY `manager` (`manager`);

--
-- Indexes for table `factory_shippingport_portlane`
--
ALTER TABLE `factory_shippingport_portlane`
  ADD PRIMARY KEY (`shippingportID`,`factoryID`,`portlaneID`);

--
-- Indexes for table `inspection`
--
ALTER TABLE `inspection`
  ADD PRIMARY KEY (`inspectorID`,`batchNo`,`inspection_date`),
  ADD KEY `batchNo` (`batchNo`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`modelID`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `port_lane`
--
ALTER TABLE `port_lane`
  ADD PRIMARY KEY (`portlaneID`);

--
-- Indexes for table `productionline`
--
ALTER TABLE `productionline`
  ADD PRIMARY KEY (`productionlineID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleID`);

--
-- Indexes for table `salespoint`
--
ALTER TABLE `salespoint`
  ADD PRIMARY KEY (`salespointID`);

--
-- Indexes for table `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`shipmentID`),
  ADD KEY `shippingportID` (`shippingportID`,`factoryID`,`portlaneID`),
  ADD KEY `batchNo` (`batchNo`),
  ADD KEY `salespointID` (`salespointID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffID`),
  ADD KEY `factoryID` (`factoryID`),
  ADD KEY `roleID` (`roleID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `batch`
--
ALTER TABLE `batch`
  ADD CONSTRAINT `batch_ibfk_1` FOREIGN KEY (`productionlineID`,`factoryID`,`modelID`) REFERENCES `factory_productionline_model` (`productionlineID`, `factoryID`, `modelID`);

--
-- Constraints for table `factory`
--
ALTER TABLE `factory`
  ADD CONSTRAINT `factory_ibfk_1` FOREIGN KEY (`manager`) REFERENCES `staff` (`staffID`);

--
-- Constraints for table `factory_productionline_model`
--
ALTER TABLE `factory_productionline_model`
  ADD CONSTRAINT `factory_productionline_model_ibfk_1` FOREIGN KEY (`productionlineID`) REFERENCES `productionline` (`productionlineID`),
  ADD CONSTRAINT `factory_productionline_model_ibfk_2` FOREIGN KEY (`factoryID`) REFERENCES `factory` (`factoryID`),
  ADD CONSTRAINT `factory_productionline_model_ibfk_3` FOREIGN KEY (`modelID`) REFERENCES `model` (`modelID`);

--
-- Constraints for table `factory_productionline_staff`
--
ALTER TABLE `factory_productionline_staff`
  ADD CONSTRAINT `factory_productionline_staff_ibfk_1` FOREIGN KEY (`productionlineID`) REFERENCES `productionline` (`productionlineID`),
  ADD CONSTRAINT `factory_productionline_staff_ibfk_2` FOREIGN KEY (`factoryID`) REFERENCES `factory` (`factoryID`),
  ADD CONSTRAINT `factory_productionline_staff_ibfk_3` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`);

--
-- Constraints for table `factory_shippingport`
--
ALTER TABLE `factory_shippingport`
  ADD CONSTRAINT `factory_shippingport_ibfk_1` FOREIGN KEY (`factoryID`) REFERENCES `factory` (`factoryID`),
  ADD CONSTRAINT `factory_shippingport_ibfk_2` FOREIGN KEY (`manager`) REFERENCES `staff` (`staffID`);

--
-- Constraints for table `factory_shippingport_portlane`
--
ALTER TABLE `factory_shippingport_portlane`
  ADD CONSTRAINT `factory_shippingport_portlane_ibfk_1` FOREIGN KEY (`shippingportID`,`factoryID`) REFERENCES `factory_shippingport` (`shippingportID`, `factoryID`);

--
-- Constraints for table `inspection`
--
ALTER TABLE `inspection`
  ADD CONSTRAINT `inspection_ibfk_1` FOREIGN KEY (`batchNo`) REFERENCES `batch` (`batchNo`),
  ADD CONSTRAINT `inspection_ibfk_2` FOREIGN KEY (`inspectorID`) REFERENCES `staff` (`staffID`);

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `model_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`);

--
-- Constraints for table `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`shippingportID`,`factoryID`,`portlaneID`) REFERENCES `factory_shippingport_portlane` (`shippingportID`, `factoryID`, `portlaneID`),
  ADD CONSTRAINT `shipment_ibfk_2` FOREIGN KEY (`batchNo`) REFERENCES `batch` (`batchNo`),
  ADD CONSTRAINT `shipment_ibfk_3` FOREIGN KEY (`salespointID`) REFERENCES `salespoint` (`salespointID`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`factoryID`) REFERENCES `factory` (`factoryID`),
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`roleID`) REFERENCES `roles` (`roleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
