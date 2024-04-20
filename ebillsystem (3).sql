-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2024 at 07:14 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ebillsystem`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `unitstoamount` (IN `units` INT(14), OUT `result` INT(14))   BEGIN
   
    DECLARE a INT(14) DEFAULT 0;
    DECLARE b INT(14) DEFAULT 0;
    DECLARE c INT(14) DEFAULT 0;

    SELECT twohundred FROM unitsRate INTO a ;
    SELECT fivehundred FROM unitsRate INTO b ;
    SELECT thousand FROM unitsRate INTO c  ;

    IF units<200
    then
        SELECT a*units INTO result;
    
    ELSEIF units<500
    then
        SELECT (a*200)+(b*(units-200)) INTO result;
    ELSEIF units > 500
    then
        SELECT (a*200)+(b*(300))+(c*(units-500)) INTO result;
    END IF;

END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `curdate1` () RETURNS INT(11)  BEGIN
    DECLARE x INT;
    SET x = DAYOFMONTH(CURDATE());
    IF (x=1)
    THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(14) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `pass`) VALUES
(1, 'Administrator One', 'admin@gmail.com', 'Password@123'),
(2, 'Administrator Two', 'admin2@gmail.com', 'admin2');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(14) NOT NULL,
  `aid` int(14) NOT NULL,
  `uid` int(14) NOT NULL,
  `units` int(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(10) NOT NULL,
  `bdate` date NOT NULL,
  `ddate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `aid`, `uid`, `units`, `amount`, `status`, `bdate`, `ddate`) VALUES
(17, 1, 8, 210, 450.00, 'PROCESSED', '2023-07-06', '2023-08-05'),
(18, 1, 1, 61, 122.00, 'PROCESSED', '2023-07-10', '2023-08-09'),
(19, 1, 2, 78, 156.00, 'PROCESSED', '2023-07-10', '2023-08-09'),
(20, 1, 3, 70, 140.00, 'PROCESSED', '2023-07-10', '2023-08-09'),
(21, 1, 4, 98, 196.00, 'PROCESSED', '2023-07-10', '2023-08-09'),
(22, 1, 9, 55, 110.00, 'PROCESSED', '2023-07-10', '2023-08-09'),
(23, 1, 11, 89, 178.00, 'PROCESSED', '2023-07-10', '2023-08-09'),
(24, 1, 7, 103, 206.00, 'PENDING', '2023-07-10', '2023-08-09'),
(25, 1, 1, 123, 246.00, 'PROCESSED', '2023-10-31', '2023-11-30'),
(26, 1, 2, 125, 250.00, 'PROCESSED', '2023-10-31', '2023-11-30'),
(27, 2, 1, 90, 180.00, 'PROCESSED', '2023-11-01', '2023-12-01'),
(28, 1, 2, 82, 164.00, 'PROCESSED', '2023-11-01', '2023-12-01'),
(29, 1, 1, 125, 250.00, 'PROCESSED', '2023-11-06', '2023-12-06'),
(30, 1, 2, 156, 312.00, 'PROCESSED', '2023-11-06', '2023-12-06'),
(31, 1, 1, 56, 112.00, 'PROCESSED', '2023-11-07', '2023-12-07'),
(32, 1, 6, 125, 250.00, 'PROCESSED', '2023-12-26', '2024-01-25'),
(33, 1, 3, 159, 318.00, 'PENDING', '2023-12-26', '2024-01-25'),
(34, 1, 5, 147, 294.00, 'PENDING', '2023-12-26', '2024-01-25'),
(35, 1, 9, 201, 405.00, 'PENDING', '2023-12-26', '2024-01-25'),
(36, 1, 1, 45, 90.00, 'PROCESSED', '2024-01-20', '2024-02-19'),
(37, 1, 3, 102, 204.00, 'PENDING', '2024-02-10', '2024-03-11'),
(38, 1, 34, 101, 202.00, 'PROCESSED', '2024-02-10', '2024-03-11'),
(39, 1, 11, 125, 250.00, 'PROCESSED', '2024-02-26', '2024-03-27'),
(40, 1, 29, 200, 400.00, 'PROCESSED', '2024-03-01', '2024-03-31'),
(41, 1, 1, 168, 336.00, 'PROCESSED', '2024-03-04', '2024-04-03'),
(42, 1, 3, 158, 316.00, 'PENDING', '2024-03-04', '2024-04-03'),
(43, 1, 2, 245, 625.00, 'PROCESSED', '2024-03-04', '2024-04-03'),
(44, 1, 8, 200, 400.00, 'PROCESSED', '2024-03-04', '2024-04-03'),
(45, 1, 32, 150, 300.00, 'PROCESSED', '2024-03-06', '2024-04-05'),
(46, 1, 29, 175, 350.00, 'PROCESSED', '2024-03-07', '2024-04-06'),
(47, 1, 1, 150, 300.00, 'PROCESSED', '2024-03-07', '2024-04-06'),
(48, 1, 30, 154, 308.00, 'PENDING', '2024-03-14', '2024-04-13'),
(49, 1, 1, 150, 300.00, 'PROCESSED', '2024-03-31', '2024-04-30'),
(50, 1, 4, 85, 170.00, 'PROCESSED', '2024-03-31', '2024-04-30'),
(51, 1, 11, 150, 300.00, 'PROCESSED', '2024-03-31', '2024-04-30'),
(52, 1, 2, 230, 550.00, 'PROCESSED', '2024-03-31', '2024-04-30'),
(53, 1, 3, 30, 60.00, 'PENDING', '2024-03-31', '2024-04-30'),
(54, 1, 5, 350, 1150.00, 'PROCESSED', '2024-03-31', '2024-04-30'),
(55, 1, 1, 85, 170.00, 'PROCESSED', '2024-04-03', '2024-05-03'),
(56, 1, 2, 96, 192.00, 'PROCESSED', '2024-04-03', '2024-05-03'),
(57, 1, 3, 150, 300.00, 'PENDING', '2024-04-03', '2024-05-03'),
(58, 1, 4, 160, 320.00, 'PROCESSED', '2024-04-03', '2024-05-03'),
(59, 1, 11, 142, 284.00, 'PROCESSED', '2024-04-03', '2024-05-03'),
(60, 1, 29, 58, 116.00, 'PROCESSED', '2024-04-03', '2024-05-03'),
(61, 1, 28, 56, 112.00, 'PROCESSED', '2024-04-03', '2024-05-03'),
(62, 1, 32, 168, 336.00, 'PROCESSED', '2024-04-03', '2024-05-03'),
(63, 1, 5, 182, 364.00, 'PROCESSED', '2024-04-03', '2024-05-03'),
(64, 1, 7, 85, 170.00, 'PENDING', '2024-04-03', '2024-05-03'),
(65, 1, 2, 120, 240.00, 'PROCESSED', '2024-04-04', '2024-05-04'),
(66, 1, 1, 140, 280.00, 'PENDING', '2024-04-04', '2024-05-04'),
(67, 1, 3, 150, 300.00, 'PENDING', '2024-04-04', '2024-05-04'),
(68, 1, 38, 200, 400.00, 'PENDING', '2024-04-04', '2024-05-04'),
(69, 1, 39, 40, 80.00, 'PENDING', '2024-04-04', '2024-05-04'),
(70, 1, 4, 120, 240.00, 'PENDING', '2024-04-04', '2024-05-04');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `id` int(14) NOT NULL,
  `uid` int(14) NOT NULL,
  `aid` int(14) NOT NULL,
  `complaint` varchar(140) NOT NULL,
  `status` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`id`, `uid`, `aid`, `complaint`, `status`) VALUES
(1, 1, 1, 'Transaction Not Processed', 'PROCESSED'),
(2, 1, 1, 'Transaction Not Processed', 'PROCESSED'),
(3, 2, 1, 'Previous Complaint Not Processed', 'PROCESSED'),
(4, 2, 1, 'Transaction Not Processed', 'PROCESSED'),
(5, 2, 2, 'Transaction Not Processed', 'PROCESSED'),
(6, 1, 1, 'Bill Not Correct', 'PROCESSED'),
(7, 3, 1, 'Bill Not Correct', 'PROCESSED'),
(8, 3, 2, 'Transaction Not Processed', 'PROCESSED'),
(9, 4, 2, 'Transaction Not Processed', 'PROCESSED'),
(10, 4, 1, 'Bill Not Correct', 'PROCESSED'),
(11, 5, 2, 'Bill Generated Late', 'PROCESSED'),
(12, 1, 2, 'Bill Generated Late', 'NOT PROCESSED'),
(13, 11, 1, 'Bill Generated Late', 'PROCESSED'),
(14, 1, 2, 'Bill Not Correct', 'PROCESSED'),
(15, 30, 1, 'Bill Generated Late', 'NOT PROCESSED'),
(16, 26, 1, 'Bill Generated Late', 'PROCESSED'),
(17, 2, 1, 'Transaction Not Processed', 'PROCESSED'),
(18, 2, 2, 'Transaction Not Processed', 'NOT PROCESSED'),
(19, 9, 2, 'Bill Generated Late', 'PROCESSED'),
(20, 32, 1, 'Bill Generated Late', 'PROCESSED'),
(21, 29, 2, 'Bill Not Correct', 'NOT PROCESSED'),
(22, 2, 2, 'Bill Not Correct', 'NOT PROCESSED'),
(23, 1, 1, 'Bill is not correct. Not able to pay the bill.', 'NOT PROCESSED'),
(24, 1, 1, 'Transaction Not Processed', 'NOT PROCESSED'),
(25, 2, 1, 'Bill not generated', 'NOT PROCESSED'),
(26, 2, 2, 'Previous Complaint Not Processed', 'NOT PROCESSED'),
(27, 7, 2, 'Bill not generated', 'NOT PROCESSED'),
(28, 2, 1, 'Bill generated late not able to pay.\r\n', 'NOT PROCESSED');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(14) NOT NULL,
  `bid` int(14) NOT NULL,
  `payable` decimal(10,2) NOT NULL,
  `pdate` date DEFAULT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `bid`, `payable`, `pdate`, `status`) VALUES
(17, 17, 450.00, '2023-07-06', 'PROCESSED'),
(18, 18, 122.00, '2023-07-10', 'PROCESSED'),
(19, 19, 156.00, '2023-11-01', 'PROCESSED'),
(20, 20, 140.00, '2023-07-10', 'PROCESSED'),
(21, 21, 196.00, '2024-02-10', 'PROCESSED'),
(22, 22, 110.00, '2023-07-10', 'PROCESSED'),
(23, 23, 178.00, '2023-07-10', 'PROCESSED'),
(24, 24, 206.00, NULL, 'PENDING'),
(25, 25, 246.00, '2023-10-31', 'PROCESSED'),
(26, 26, 250.00, '2024-03-31', 'PROCESSED'),
(27, 27, 180.00, '2023-11-01', 'PROCESSED'),
(28, 28, 164.00, '2023-11-01', 'PROCESSED'),
(29, 29, 415.00, '2024-01-20', 'PROCESSED'),
(30, 30, 477.00, '2024-04-04', 'PROCESSED'),
(31, 31, 112.00, '2024-04-03', 'PROCESSED'),
(32, 32, 250.00, '2024-03-31', 'PROCESSED'),
(33, 33, 318.00, NULL, 'PENDING'),
(34, 34, 294.00, NULL, 'PENDING'),
(35, 35, 405.00, NULL, 'PENDING'),
(36, 36, 255.00, '2024-04-03', 'PROCESSED'),
(37, 37, 204.00, NULL, 'PENDING'),
(38, 38, 202.00, '2024-02-26', 'PROCESSED'),
(39, 39, 250.00, '2024-03-31', 'PROCESSED'),
(40, 40, 400.00, '2024-03-04', 'PROCESSED'),
(41, 41, 336.00, '2024-04-03', 'PROCESSED'),
(42, 42, 316.00, NULL, 'PENDING'),
(43, 43, 625.00, '2024-03-07', 'PROCESSED'),
(44, 44, 400.00, '2024-03-04', 'PROCESSED'),
(45, 45, 300.00, '2024-04-03', 'PROCESSED'),
(46, 46, 350.00, '2024-03-07', 'PROCESSED'),
(47, 47, 300.00, '2024-04-03', 'PROCESSED'),
(48, 48, 308.00, NULL, 'PENDING'),
(49, 49, 300.00, '2024-04-03', 'PROCESSED'),
(50, 50, 170.00, '2024-04-03', 'PROCESSED'),
(51, 51, 300.00, '2024-04-03', 'PROCESSED'),
(52, 52, 550.00, '2024-04-03', 'PROCESSED'),
(53, 53, 60.00, NULL, 'PENDING'),
(54, 54, 1150.00, '2024-04-03', 'PROCESSED'),
(55, 55, 170.00, '2024-04-03', 'PROCESSED'),
(56, 56, 192.00, '2024-04-03', 'PROCESSED'),
(57, 57, 300.00, NULL, 'PENDING'),
(58, 58, 320.00, '2024-04-03', 'PROCESSED'),
(59, 59, 284.00, '2024-04-03', 'PROCESSED'),
(60, 60, 116.00, '2024-04-03', 'PROCESSED'),
(61, 61, 112.00, '2024-04-03', 'PROCESSED'),
(62, 62, 336.00, '2024-04-03', 'PROCESSED'),
(63, 63, 364.00, '2024-04-03', 'PROCESSED'),
(64, 64, 170.00, NULL, 'PENDING'),
(65, 65, 240.00, '2024-04-04', 'PROCESSED'),
(66, 66, 280.00, NULL, 'PENDING'),
(67, 67, 300.00, NULL, 'PENDING'),
(68, 68, 400.00, NULL, 'PENDING'),
(69, 69, 80.00, NULL, 'PENDING'),
(70, 70, 240.00, NULL, 'PENDING');

-- --------------------------------------------------------

--
-- Table structure for table `unitsrate`
--

CREATE TABLE `unitsrate` (
  `sno` int(1) DEFAULT NULL,
  `twohundred` int(14) NOT NULL,
  `fivehundred` int(14) NOT NULL,
  `thousand` int(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `unitsrate`
--

INSERT INTO `unitsrate` (`sno`, `twohundred`, `fivehundred`, `thousand`) VALUES
(1, 2, 5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(14) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `phone`, `pass`, `address`) VALUES
(1, 'Yash Gupta\n', 'yash@gmail.com', '7450002145', '123', 'Borivali'),
(2, 'Aishwarya Jagtap', 'ash@gmail.com', '7854547855', '123', 'Dahisar'),
(3, 'Sanjana', 'sanj@gmail.com', '7012569980', 'password', 'Kandivali'),
(4, 'Neha Jaiswal', 'neha@gmail.com', '7012458888', 'password', 'Kurla'),
(5, 'Shakshi', 'shakshi@gmail.com', '7012565800', 'password', 'Malad'),
(6, 'Aditiya Jagtap', 'adii@gmail.com', '7896541000', 'password', 'Andheri'),
(7, 'Deepa Gupta', 'deepa@gmail.com', '70145850025', 'password', 'Borivali'),
(8, 'Rajesh', 'rajesh@gmail.com', '7012545555', 'password', 'Dahisar'),
(9, 'Ganpat', 'ganpat@gmail.com', '7696969855', 'password', 'Mira Road'),
(10, 'Vandana', 'vandana@gmail.com', '7896500010', 'password', 'Dahisar'),
(11, 'Devang', 'dev@gmail.com', '7412580020', 'password', 'Virar'),
(14, 'Pallavi', 'p@gmail.com', '896784596', '123', 'borivali'),
(26, 'Saanvi Jaiswal', 'saanvi@gmail.com', '4859621325', '123', 'Kurla'),
(27, 'Aarya Jagtap', 'aarya@gmail.com', '8956451223', '123', 'Dahisar'),
(28, 'Aman Gupta', 'aman@gmail.com', '8596854123', '123', 'Borivali'),
(29, 'Esha Sawant', 'esha@gmail.com', '7563215892', '123', 'Dahisar'),
(30, 'Omkar Ravindran', 'omkar@gmail.com', '4586589655', '123', 'Dahisar'),
(31, 'Saani joshi', 'sanj@gmail.com', '1265897845', '123', 'Kadivali'),
(32, 'Shiva', 'shiva@gmail.com', '7598632145', '123', 'Kandivali'),
(33, 'Raj Bhagat', 'raj@gmail.com', '7896582145', '123', 'Goregaon'),
(34, 'Shruti Meher', 'shruti@gmail.yahoo', '8564875623', '123', 'Borivali'),
(35, 'Sameer Doshi', 'sameer@gmail.com', '7589632547', '123', 'Kandivali'),
(36, 'Kirtan Kanojiya', 'kirtan@gmail.com', '4789563214', '123', 'Malad'),
(37, 'Tirth Parmar', 'tirth@gmail.com', '7896523145', '123', 'Daishar'),
(38, 'Leanne fernandes', 'lea@gmail.com', '8547965412', '123', 'Bhayandar'),
(39, 'Deepak', 'dchauhan2159@gmail.com', '9372798051', 'Deepak', 'mumbai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aid` (`aid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aid` (`aid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bid` (`bid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `complaint_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
