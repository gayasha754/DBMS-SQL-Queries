-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 25, 2021 at 05:22 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee`
--

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
CREATE TABLE IF NOT EXISTS `dept` (
  `DEPTNO` int(2) NOT NULL,
  `DNAME` varchar(50) NOT NULL,
  `LOC` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`DEPTNO`, `DNAME`, `LOC`) VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

-- --------------------------------------------------------

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
CREATE TABLE IF NOT EXISTS `emp` (
  `EMPNO` varchar(4) NOT NULL,
  `ENAME` varchar(50) NOT NULL,
  `JOB` varchar(20) NOT NULL,
  `MGR` int(4) DEFAULT NULL,
  `HIREDATE` date NOT NULL,
  `SAL` int(11) NOT NULL,
  `COMM` int(11) DEFAULT NULL,
  `DEPTNO` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `emp`
--

INSERT INTO `emp` (`EMPNO`, `ENAME`, `JOB`, `MGR`, `HIREDATE`, `SAL`, `COMM`, `DEPTNO`) VALUES
('7369', 'SMITH', 'CLERK', 7902, '1983-06-13', 800, NULL, 20),
('7499', 'ALLEN', 'SALESMAN', 7698, '1983-08-15', 1600, 300, 30),
('7521', 'WARD', 'SALESMAN', 7698, '1984-03-26', 1250, 500, 30),
('7566', 'JONES', 'MANAGER', 7839, '1983-10-31', 2975, NULL, 20),
('7654', 'MARTIN', 'SALESMAN', 7698, '1983-12-05', 1250, 1400, 30),
('7698', 'BLAKE', 'MANAGER', 7839, '1984-06-11', 2850, NULL, 30),
('7782', 'CLARK', 'MANAGER', 7839, '1984-05-14', 2450, NULL, 10),
('7788', 'SCOTT', 'ANALYST', 7566, '1984-03-05', 3000, NULL, 20),
('7839', 'KING', 'PRESIDENT', NULL, '1984-07-09', 5000, NULL, 10),
('7844', 'TURNER', 'SALESMAN', 7698, '1984-06-04', 1500, 0, 30),
('7876', 'ADAMS', 'CLERK', 7788, '1984-06-04', 1100, NULL, 20),
('7900', 'JAMES', 'CLERK', 7698, '1984-07-23', 950, NULL, 30),
('7902', 'FORD', 'ANALYST', 7566, '1983-12-05', 3000, NULL, 20),
('7934', 'MILLER', 'CLERK', 7782, '1983-11-21', 1300, NULL, 10);

-- --------------------------------------------------------

--
-- Table structure for table `salgrade`
--

DROP TABLE IF EXISTS `salgrade`;
CREATE TABLE IF NOT EXISTS `salgrade` (
  `GRADE` int(2) NOT NULL,
  `LOSAL` int(11) NOT NULL,
  `HISAL` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salgrade`
--

INSERT INTO `salgrade` (`GRADE`, `LOSAL`, `HISAL`) VALUES
(1, 700, 1200),
(2, 1201, 1400),
(3, 1401, 2000),
(4, 2001, 3000),
(5, 3001, 9999);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
