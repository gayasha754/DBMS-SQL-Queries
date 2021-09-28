-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2021 at 01:22 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `delivery`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerNo` int(11) NOT NULL,
  `CustomerName` varchar(20) NOT NULL,
  `OutstandingAmount` int(11) NOT NULL,
  `SalesRepNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerNo`, `CustomerName`, `OutstandingAmount`, `SalesRepNo`) VALUES
(7840, 'Harris', 6480, 654),
(7870, 'Miles', 1000, 345),
(8590, 'Gonzales', 2835, 654),
(9870, 'Winston', 5000, 345);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `CustomerNo` int(11) NOT NULL,
  `ProductNO` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`CustomerNo`, `ProductNO`, `Date`, `Qty`) VALUES
(8590, 3, '2010-08-09', 150);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductNo` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductNo`, `Name`, `Price`) VALUES
(1, 'Astra', 120),
(2, 'Horlicks', 200),
(3, 'Sunquick', 240),
(4, 'Anchor', 320);

-- --------------------------------------------------------

--
-- Table structure for table `salesrep`
--

CREATE TABLE `salesrep` (
  `SalesRepNo` int(11) NOT NULL,
  `RepName` varchar(20) NOT NULL,
  `HireDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salesrep`
--

INSERT INTO `salesrep` (`SalesRepNo`, `RepName`, `HireDate`) VALUES
(345, 'Perera', '2004-01-25'),
(434, 'Samaraweera', '2004-11-23'),
(654, 'Jayawardana', '2005-02-01'),
(734, 'Jayasooriya', '2007-03-02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerNo`,`SalesRepNo`),
  ADD KEY `delivery_fk` (`SalesRepNo`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`CustomerNo`,`ProductNO`),
  ADD KEY `product_fk` (`ProductNO`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductNo`);

--
-- Indexes for table `salesrep`
--
ALTER TABLE `salesrep`
  ADD PRIMARY KEY (`SalesRepNo`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `delivery_fk` FOREIGN KEY (`SalesRepNo`) REFERENCES `salesrep` (`SalesRepNo`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `customer_fk` FOREIGN KEY (`CustomerNo`) REFERENCES `customer` (`CustomerNo`),
  ADD CONSTRAINT `product_fk` FOREIGN KEY (`ProductNO`) REFERENCES `product` (`ProductNo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
