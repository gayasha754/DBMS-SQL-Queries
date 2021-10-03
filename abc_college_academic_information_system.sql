-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 25, 2021 at 05:45 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abc_college_academic_information_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `coursecode` varchar(4) NOT NULL,
  `title` varchar(30) NOT NULL,
  `school` varchar(30) NOT NULL,
  PRIMARY KEY (`coursecode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`coursecode`, `title`, `school`) VALUES
('AB12', 'Applied Biology', 'Scientific Studies'),
('CE65', 'Civil Engineering', 'Engineering'),
('CS30', 'Computer Science', 'Computing');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
CREATE TABLE IF NOT EXISTS `result` (
  `regno` varchar(5) NOT NULL,
  `unitcode` varchar(4) NOT NULL,
  `exammark` int(3) NOT NULL,
  `cwkmark` int(3) NOT NULL,
  PRIMARY KEY (`regno`,`unitcode`),
  KEY `unitcode` (`unitcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`regno`, `unitcode`, `exammark`, `cwkmark`) VALUES
('F4567', 'ES32', 67, 90),
('F4567', 'MA43', 32, 21),
('F4567', 'RD19', 76, 100),
('F8910', 'FP54', 78, 12),
('F8910', 'HA34', 55, 23);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `regno` varchar(5) NOT NULL,
  `name` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `telno` varchar(12) NOT NULL,
  `coursecode` varchar(4) NOT NULL,
  `address` varchar(30) NOT NULL,
  PRIMARY KEY (`regno`),
  KEY `coursecode` (`coursecode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`regno`, `name`, `dob`, `telno`, `coursecode`, `address`) VALUES
('F4567', 'Sally', '1972-01-01', '020-73318844', 'CS30', 'Address 1'),
('F8910', 'Andrew', '1977-12-06', '01322-865833', 'AB12', 'Address 2'),
('P7651', 'Brian', '1974-11-21', '020-85466540', 'CS30', 'Address 3'),
('PO123', 'John', '1976-02-09', '01322-843311', 'CE65', 'Address 4');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
CREATE TABLE IF NOT EXISTS `unit` (
  `unitcode` varchar(4) NOT NULL,
  `title` varchar(30) NOT NULL,
  `year` int(1) NOT NULL,
  PRIMARY KEY (`unitcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unitcode`, `title`, `year`) VALUES
('ES22', 'Engineering Science', 2),
('ES32', 'Expert Systems', 2),
('FP54', 'Food Preservation', 3),
('HA34', 'Human Anatomy', 3),
('MA43', 'Mathematics', 2),
('PH90', 'Physics', 1),
('RD19', 'Relational Databases', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`regno`) REFERENCES `student` (`regno`),
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`unitcode`) REFERENCES `unit` (`unitcode`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`coursecode`) REFERENCES `course` (`coursecode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
