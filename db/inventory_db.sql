-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2024 at 10:22 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kandi_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `picture` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `picture`) VALUES
(1, 'PEN', ''),
(2, 'PAPER', ''),
(3, 'SAMOSA', ''),
(4, 'LADDU', ''),
(5, 'JALEBI', ''),
(6, 'BATA', ''),
(7, 'Electronics', ''),
(8, 'Heavy Machinery', ''),
(9, 'paper', '');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `coa`
--

CREATE TABLE `coa` (
  `MAIN_CODE` varchar(1) NOT NULL,
  `SUB_CODE` varchar(2) NOT NULL,
  `TR_HEAD` varchar(4) NOT NULL,
  `HEAD_TITLE` varchar(100) NOT NULL,
  `AMOUNT` float DEFAULT NULL,
  `EFFECTED_DATE` date DEFAULT NULL,
  `UNIQUE_NO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coa`
--

INSERT INTO `coa` (`MAIN_CODE`, `SUB_CODE`, `TR_HEAD`, `HEAD_TITLE`, `AMOUNT`, `EFFECTED_DATE`, `UNIQUE_NO`) VALUES
('1', '1', '00', 'Assets', 100000, NULL, NULL),
('1', '1', '0001', 'Cash In Hand', 5000, NULL, NULL),
('1', '1', '0002', 'Cash At Bank', 5000, NULL, NULL),
('1', '1', '001', 'Current Assets', 10000, NULL, NULL),
('1', '2', '0001', 'Computer', 15000, NULL, NULL),
('1', '2', '002', 'Fixed Assets', 30000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coa_trans`
--

CREATE TABLE `coa_trans` (
  `VNO` int(11) NOT NULL,
  `SNO` int(2) DEFAULT NULL,
  `PART` varchar(500) DEFAULT NULL,
  `DRCR` varchar(1) DEFAULT NULL,
  `TRDATE` date NOT NULL,
  `VALDATE` date DEFAULT NULL,
  `SUPFLAG` int(1) DEFAULT NULL,
  `AMOUNT` float DEFAULT NULL,
  `REFNO` varchar(10) DEFAULT NULL,
  `PAIDTO` varchar(100) DEFAULT NULL,
  `TRANS_TYPE` varchar(2) DEFAULT NULL,
  `MAIN_CODE` varchar(1) NOT NULL,
  `SUB_CODE` varchar(2) NOT NULL,
  `TR_HEAD` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `phone_no` varchar(100) DEFAULT NULL,
  `fax_no` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `phone_no`, `fax_no`, `email`, `address`) VALUES
(0, 'DSVV1', '333', '0000', 'ABC@GMAIL.COM', 'HARIDWAR'),
(1, 'dsvv2', '000', '000', 'ABC@GMAIL.COM', 'HARIDWAR'),
(2, 'DSVV3', '0912600103', 'NIL', 'ABC@GMAIL.COM', 'HARIDWAR'),
(3, 'DSVV4', '03459050201', 'Nil', 'ABC@GMAIL.COM', 'HARIDWAR');

-- --------------------------------------------------------

--
-- Table structure for table `company_information`
--

CREATE TABLE `company_information` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `website` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_information`
--

INSERT INTO `company_information` (`id`, `name`, `email`, `contact`, `address`, `website`, `logo`, `date_time`) VALUES
(1, 'DSVV Haridwar', 'admin@dsvv.com', '+9958663113', 'DSVV hardwar', 'http://dsvv.ac.in', 'user2-160x160.jpg', '2018-01-19 11:56:23');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `phone_no` varchar(100) DEFAULT NULL,
  `fax_no` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `trn` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `phone_no`, `fax_no`, `email`, `address`, `trn`) VALUES
(1, 'RAMA SAXENA', '123234', 'RAMA@yahoo.com', 'rama@gmail.com', NULL, NULL),
(2, 'ANIL', '06-5338449', '06-5338440', 'anil@gmail.com', 'Al-Khan, Sharjah, UAE.', '100315120400003');

-- --------------------------------------------------------

--
-- Table structure for table `email_settings`
--

CREATE TABLE `email_settings` (
  `id` int(1) NOT NULL,
  `host` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `port` int(3) NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `sent_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sent_title` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `reply_email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `reply_title` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_settings`
--

INSERT INTO `email_settings` (`id`, `host`, `port`, `email`, `password`, `sent_email`, `sent_title`, `reply_email`, `reply_title`) VALUES
(2, 'gator4113.hostgator.com', 465, 'no-reply@duperty.com', 'MuhammaD@123', 'no-reply@duperty.com', 'Technologicx', 'no-reply@duperty.com', 'Technologicx'),
(1, 'mail.technologicx.com', 465, 'admin@technologicx.com', 'saadi123*', 'admin@technologicx.com', 'Technologicx', 'admin@technologicx.com', 'Technologicx');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EMP_NO` varchar(20) CHARACTER SET utf8 NOT NULL,
  `EMP_NAME` varchar(40) CHARACTER SET utf8 NOT NULL,
  `EMP_F_NAME` varchar(40) CHARACTER SET utf8 NOT NULL,
  `EMP_CURR_ADDRESS` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `EMP_PAR_ADDRESS` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `CNIC_NO` varchar(16) CHARACTER SET utf8 NOT NULL,
  `APPOINTMENT_DATE` date NOT NULL,
  `GENDER` varchar(10) CHARACTER SET utf8 NOT NULL,
  `COUNTRY_ID` int(11) DEFAULT NULL,
  `PROV_ID` int(11) DEFAULT NULL,
  `DIV_ID` int(11) DEFAULT NULL,
  `DIS_ID` int(11) DEFAULT NULL,
  `BATCH_NO` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ENTRY_TO_GOV` date DEFAULT NULL,
  `PIC` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `PHONE` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `MOBILE_SMS` varchar(40) CHARACTER SET utf8 NOT NULL,
  `MOBILE` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `EMAIL` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `PERSONAL_FILE_NO` int(11) DEFAULT NULL,
  `MACHINE_ID` int(10) DEFAULT NULL,
  `MACHINE_NO` int(2) DEFAULT NULL,
  `REMARKS` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `BARCODE` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `E_USER_ID` int(11) DEFAULT NULL,
  `E_DATE_TIME` datetime DEFAULT NULL,
  `U_USER_ID` int(11) DEFAULT NULL,
  `U_DATE_TIME` datetime DEFAULT NULL,
  `FLAG` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_profile`
--

CREATE TABLE `employee_profile` (
  `EMP_ID` int(11) NOT NULL,
  `EMP_NAME` varchar(300) NOT NULL,
  `EMP_ADDRESS` varchar(300) NOT NULL,
  `EMP_PHONE` varchar(300) NOT NULL,
  `EMP_CELL` varchar(300) NOT NULL,
  `EMP_EMAIL` varchar(300) NOT NULL,
  `EMP_PIC` varchar(300) NOT NULL,
  `EMP_GENDER` varchar(11) NOT NULL,
  `EMP_DATE` date NOT NULL,
  `CREATED_DATE` date DEFAULT NULL,
  `CREATED_USERID` int(11) DEFAULT NULL,
  `UPDATED_DATE` date DEFAULT NULL,
  `UPDATED_USERID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_profile`
--

INSERT INTO `employee_profile` (`EMP_ID`, `EMP_NAME`, `EMP_ADDRESS`, `EMP_PHONE`, `EMP_CELL`, `EMP_EMAIL`, `EMP_PIC`, `EMP_GENDER`, `EMP_DATE`, `CREATED_DATE`, `CREATED_USERID`, `UPDATED_DATE`, `UPDATED_USERID`) VALUES
(1, 'ravi kumar dubey', 'Haridwar', '9027214554', '9027214554', 'ravi@gmail.com', 'employee_pics/3e70faef699d1b5a8c8ddc449fac5988.jpg', 'MALE', '2018-09-01', '2018-09-01', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` varchar(13) NOT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `size` varchar(100) NOT NULL,
  `color` varchar(15) DEFAULT NULL,
  `flag` int(1) NOT NULL,
  `purchase_rate` float DEFAULT NULL,
  `article_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `item_name`, `category_id`, `size`, `color`, `flag`, `purchase_rate`, `article_no`) VALUES
('100000001', 'Samsung Galaxy S7 Edge - 32GB', 7, '121', 'nnkln', 1, 100, '1212'),
('100000002', 'Apple MacBook Pro MD101LL-Intel Core i5', 4, '12', 'black', 1, 200, 'A-121'),
('100000003', 'Sony Play Station', 7, '', '', 1, 290, 'S-001'),
('100000004', 'Nikon D5500 - 24 MP SLR Camera', 7, '', '', 1, 900, 'N-12900'),
('100000005', 'Bata Men\'s  Sports Shoes', 6, '', '', 1, 210, 'LS-123'),
('100000006', 'Xtouch Z1 Dual Sim - 16GB', 7, '', '', 1, 1050, 'X-16GB'),
('1321654657', 'pen', 2, '20', 'BLUE', 1, 12, 'renold'),
('paper 234 131', 'paper', 2, 'A4', 'WHITE', 1, 12, 'paper 234');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` int(11) NOT NULL,
  `purchase_no` int(11) NOT NULL,
  `item_id` varchar(13) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `expire_date` date NOT NULL,
  `purchase_qty` int(11) DEFAULT NULL,
  `purchase_amount` float(11,2) DEFAULT 0.00,
  `purchase_rate` float(11,3) DEFAULT 0.000,
  `sales_rate` float(11,2) NOT NULL DEFAULT 0.00,
  `balance` float(11,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`purchase_id`, `purchase_no`, `item_id`, `category_id`, `expire_date`, `purchase_qty`, `purchase_amount`, `purchase_rate`, `sales_rate`, `balance`) VALUES
(1, 1, '100000002', 4, '2018-06-07', 10, 2000.00, 200.000, 0.00, 0.00),
(2, 1, '100000001', 7, '2018-06-07', 10, 1000.00, 100.000, 0.00, 0.00),
(3, 1, '100000003', 7, '2018-06-07', 10, 2900.00, 290.000, 0.00, 0.00),
(4, 2, '100000001', 7, '2018-06-07', 9, 900.00, 100.000, 0.00, 0.00),
(5, 2, '100000002', 4, '2018-06-07', 6, 1200.00, 200.000, 0.00, 0.00),
(6, 2, '100000003', 7, '2018-06-07', 12, 3480.00, 290.000, 0.00, 0.00),
(7, 2, '100000004', 7, '2018-06-07', 6, 5400.00, 900.000, 0.00, 0.00),
(8, 2, '100000005', 6, '2018-06-07', 17, 3570.00, 210.000, 0.00, 0.00),
(9, 2, '100000006', 7, '2018-06-07', 9, 9450.00, 1050.000, 0.00, 0.00),
(10, 3, '100000001', 7, '2018-09-01', 10, 1000.00, 100.000, 0.00, 0.00),
(11, 3, '100000002', 4, '2018-09-01', 5, 1000.00, 200.000, 0.00, 0.00),
(12, 3, '100000003', 7, '2018-09-01', 8, 2320.00, 290.000, 0.00, 0.00),
(13, 4, '100000001', 7, '2018-09-01', 10, 1000.00, 100.000, 0.00, 0.00),
(14, 4, '100000002', 4, '2018-09-01', 8, 1600.00, 200.000, 0.00, 0.00),
(15, 4, '100000004', 7, '2018-09-01', 7, 6300.00, 900.000, 0.00, 0.00),
(16, 4, '100000006', 7, '2018-09-01', 6, 6300.00, 1050.000, 0.00, 0.00),
(17, 5, '100000001', 7, '2024-02-01', 1, 100.00, 100.000, 0.00, 0.00),
(18, 5, '100000004', 7, '2024-02-01', 1, 900.00, 900.000, 0.00, 0.00),
(19, 5, '1321654657', 2, '2024-02-01', 1, 12.00, 12.000, 0.00, 0.00),
(20, 5, '100000006', 7, '2024-02-01', 1, 1050.00, 1050.000, 0.00, 0.00),
(21, 5, '100000005', 6, '2024-02-01', 1, 210.00, 210.000, 0.00, 0.00),
(22, 5, '100000002', 4, '2024-02-01', 1, 200.00, 200.000, 0.00, 0.00),
(23, 5, '100000005', 6, '2024-02-01', 1, 210.00, 210.000, 0.00, 0.00),
(24, 6, '100000003', 7, '2024-02-01', 1, 290.00, 290.000, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_company`
--

CREATE TABLE `purchase_company` (
  `purchase_no` int(11) NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `purchase_discount` float(11,2) DEFAULT 0.00,
  `purchase_amount_total` float(11,2) DEFAULT 0.00,
  `purchase_status` int(1) DEFAULT 0,
  `payment_mode` varchar(1) DEFAULT NULL,
  `balance` float(11,2) DEFAULT 0.00,
  `grand_total` float(11,2) DEFAULT 0.00,
  `due_amount` float(11,2) DEFAULT NULL,
  `purchase_user_id` int(11) DEFAULT NULL,
  `pur_no` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_company`
--

INSERT INTO `purchase_company` (`purchase_no`, `purchase_date`, `vendor_id`, `company_id`, `purchase_discount`, `purchase_amount_total`, `purchase_status`, `payment_mode`, `balance`, `grand_total`, `due_amount`, `purchase_user_id`, `pur_no`) VALUES
(1, '2018-06-18', 1, 0, 0.00, 5900.00, 1, NULL, 0.00, 5900.00, 0.00, 1, 'PUR-12018-06'),
(2, '2018-06-06', 2, 2, 0.00, 24000.00, 1, NULL, 0.00, 24000.00, 0.00, 1, 'PUR-22018-06'),
(3, '2018-09-01', 2, 0, 2.00, 4233.00, 1, NULL, 0.00, 4320.00, 0.60, 1, 'PUR-32018-09'),
(4, '2018-09-01', 3, 3, 5.00, 14440.00, 1, NULL, 0.00, 15200.00, 0.00, 1, 'PUR-42018-09'),
(5, '2024-02-01', 2, 1, 2.00, 2333.00, 1, NULL, 0.00, 2682.00, 295.36, 1, 'PUR-52024-02'),
(6, '2024-02-21', 3, 1, 1.00, 290.00, 1, NULL, 0.00, 290.00, 0.00, 1, 'PUR-62024-02');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return`
--

CREATE TABLE `purchase_return` (
  `return_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `purchase_no` int(11) NOT NULL,
  `return_date` date NOT NULL,
  `item_id` varchar(13) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `purchase_qty` int(11) DEFAULT NULL,
  `return_qty` int(11) NOT NULL,
  `purchase_amount` float(11,2) DEFAULT NULL,
  `purchase_rate` float(11,3) DEFAULT NULL,
  `sales_rate` float(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `route_charges`
--

CREATE TABLE `route_charges` (
  `charge_id` int(11) NOT NULL,
  `source` varchar(100) DEFAULT NULL,
  `destination` varchar(100) DEFAULT NULL,
  `amount` float(11,2) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_no` int(11) NOT NULL,
  `sales_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `sales_discount` int(11) NOT NULL,
  `sales_amount_total` float(11,2) DEFAULT NULL,
  `paid` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `sales_status` varchar(1) DEFAULT NULL,
  `payment_mode` varchar(1) DEFAULT NULL,
  `grand_total` float(11,2) DEFAULT NULL,
  `invoice_no` int(11) DEFAULT NULL,
  `payment` varchar(10) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `vat` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_no`, `sales_date`, `customer_id`, `company_id`, `sales_discount`, `sales_amount_total`, `paid`, `balance`, `sales_status`, `payment_mode`, `grand_total`, `invoice_no`, `payment`, `type`, `vat`) VALUES
(1, '2018-05-01', 1, 0, 0, 640.00, 640, 0, '1', NULL, 640.00, 4629746, NULL, NULL, NULL),
(2, '2018-05-02', 2, 1, 0, 330.00, 330, 0, '1', NULL, 330.00, 8570350, NULL, NULL, NULL),
(3, '2018-06-18', 1, 3, 0, 3445.00, 3445, 0, '1', NULL, 3445.00, 1253812, NULL, NULL, NULL),
(4, '2018-09-01', 1, 2, 0, 2089.00, 2089, 0, '1', NULL, 2089.00, 7974863, NULL, NULL, NULL),
(5, '2024-02-14', 1, 0, 0, 0.00, 0, 0, '1', NULL, 0.00, 1459722, NULL, NULL, NULL),
(6, '2024-02-13', 1, 0, 0, 3436.00, 0, 3436, '1', NULL, 3436.00, 4050055, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_detail`
--

CREATE TABLE `sales_detail` (
  `sales_id` int(11) NOT NULL,
  `sales_no` int(11) DEFAULT NULL,
  `item_id` varchar(13) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sales_qty` int(11) DEFAULT NULL,
  `sales_discount` float(11,2) DEFAULT NULL,
  `sales_rate` int(11) DEFAULT NULL,
  `sales_amount` float(11,2) DEFAULT NULL,
  `sales_status` varchar(1) DEFAULT NULL,
  `payment_mode` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_detail`
--

INSERT INTO `sales_detail` (`sales_id`, `sales_no`, `item_id`, `category_id`, `sales_qty`, `sales_discount`, `sales_rate`, `sales_amount`, `sales_status`, `payment_mode`) VALUES
(1, 1, '100000001', 1, 2, NULL, 110, 220.00, NULL, NULL),
(2, 1, '100000002', 1, 2, NULL, 210, 420.00, NULL, NULL),
(3, 2, '100000001', 1, 3, NULL, 110, 330.00, NULL, NULL),
(4, 3, '100000001', 7, 2, NULL, 110, 220.00, NULL, NULL),
(5, 3, '100000002', 4, 4, NULL, 210, 840.00, NULL, NULL),
(6, 3, '100000003', 7, 3, NULL, 335, 1005.00, NULL, NULL),
(7, 3, '100000006', 7, 1, NULL, 1380, 1380.00, NULL, NULL),
(8, 4, '100000001', 7, 3, NULL, 110, 321.00, NULL, NULL),
(9, 4, '100000002', 4, 7, NULL, 210, 1463.00, NULL, NULL),
(10, 4, '100000005', 6, 1, NULL, 305, 305.00, NULL, NULL),
(11, 6, '100000001', 7, 2, NULL, 110, 220.00, NULL, NULL),
(12, 6, '100000004', 7, 2, NULL, 1250, 2500.00, NULL, NULL),
(13, 6, '100000003', 7, 2, NULL, 335, 670.00, NULL, NULL),
(14, 6, '1321654657', 2, 2, NULL, 23, 46.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_return`
--

CREATE TABLE `sales_return` (
  `return_id` int(11) NOT NULL,
  `sales_no` int(11) DEFAULT NULL,
  `sales_id` int(11) NOT NULL,
  `sales_date` date NOT NULL,
  `return_date` date NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `sales_qty` int(11) DEFAULT NULL,
  `return_qty` int(11) DEFAULT NULL,
  `sales_rate` float(11,2) DEFAULT NULL,
  `sales_amount` float(11,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `type`, `value`) VALUES
(1, 'terms', '<p></p><p></p><p></p><ul><li>All approvals (NOCs) related to clearance of underground services will arrange Nove Global.&nbsp;<br></li>\r\n<li>The above-quoted transportation charges are based on the present prevailing rates which should be valid two months. Beyond that transportation, charges may vary.&nbsp;<br></li>\r\n<li>Driver, Trailer &amp; Diesel will be provided by deluxe general transport.&nbsp;<br></li>\r\n<li>Deluxe general transport will not responsible for any kind of natural disaster etc.&nbsp;<br></li>\r\n<li>In the event of adverse weather condition like a sandstorm, strong rain, high wind velocity or any other force majeure, which disable our equipment from working, will not be considered as contract working time.<br></li>\r\n<li>&nbsp;All gate passes and documents for equipment and operation must be provided by Nove Global.&nbsp;<br></li>\r\n<li>Any consequences will mutually decide if not in our quotation or agreement<br></li></ul><p></p><p></p><p></p>');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `stock_no` int(11) NOT NULL,
  `item_id` varchar(13) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `stock_qty` int(11) DEFAULT NULL,
  `purchase_rate` int(11) NOT NULL,
  `stock_rate` float(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_no`, `item_id`, `category_id`, `stock_qty`, `purchase_rate`, `stock_rate`) VALUES
(1, '100000001', 7, 233, 100, 110.00),
(2, '100000002', 4, 320, 200, 210.00),
(3, '100000003', 7, 127, 290, 335.00),
(4, '100000004', 7, 13, 900, 1250.00),
(5, '100000005', 6, 19, 210, 305.00),
(6, '100000006', 7, 16, 1050, 1380.00),
(7, '1321654657', 2, 21, 12, 23.00),
(8, 'paper 234 131', 2, 22, 12, 23.00);

-- --------------------------------------------------------

--
-- Table structure for table `usr_group`
--

CREATE TABLE `usr_group` (
  `GROUP_ID` int(11) NOT NULL,
  `GROUP_NAME` varchar(100) NOT NULL,
  `CREATED_DATE` date DEFAULT NULL,
  `CREATED_USERID` int(11) DEFAULT NULL,
  `UPDATED_DATE` date DEFAULT NULL,
  `UPDATED_USERID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usr_group`
--

INSERT INTO `usr_group` (`GROUP_ID`, `GROUP_NAME`, `CREATED_DATE`, `CREATED_USERID`, `UPDATED_DATE`, `UPDATED_USERID`) VALUES
(1, 'Superadmin', '2015-02-27', 1, NULL, NULL),
(2, 'General Manager', '2015-02-27', 1, NULL, NULL),
(3, 'Designer', '2015-02-27', 1, NULL, NULL),
(4, 'developer', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usr_menu`
--

CREATE TABLE `usr_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_TEXT` varchar(100) DEFAULT NULL,
  `MENU_URL` varchar(500) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SORT_ORDER` int(11) DEFAULT NULL,
  `SHOW_IN_MENU` int(11) DEFAULT NULL,
  `IS_ADMIN` varchar(1) DEFAULT NULL,
  `CREATED_DATE` date DEFAULT NULL,
  `CREATED_USERID` int(11) DEFAULT NULL,
  `UPDATED_DATE` date DEFAULT NULL,
  `UPDATED_USERID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usr_menu`
--

INSERT INTO `usr_menu` (`MENU_ID`, `MENU_TEXT`, `MENU_URL`, `PARENT_ID`, `SORT_ORDER`, `SHOW_IN_MENU`, `IS_ADMIN`, `CREATED_DATE`, `CREATED_USERID`, `UPDATED_DATE`, `UPDATED_USERID`) VALUES
(1, 'User Management', '#', 0, 1, 1, '1', NULL, NULL, NULL, NULL),
(2, 'Add User', 'users/add_user', 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
(3, 'General Settings', '#', 0, 2, 1, NULL, NULL, NULL, NULL, NULL),
(4, 'Add Menu', 'generals/addmenu', 3, 3, 1, NULL, NULL, NULL, NULL, NULL),
(5, 'People', '#', 0, 3, 1, NULL, NULL, NULL, NULL, NULL),
(9, 'List Employees', 'employees/employee_list', 5, 6, 1, NULL, NULL, NULL, NULL, NULL),
(18, 'Add Menu', 'generals/addmenu', 1, 2, 1, NULL, '2016-06-09', 1, NULL, NULL),
(21, 'Add Group', 'generals/add_group', 3, 2, 1, NULL, '2016-06-16', 1, NULL, NULL),
(31, 'Product', 'Category/list_category', 0, 4, 1, NULL, '2018-05-06', 1, NULL, NULL),
(32, 'Manage Category', 'Category/list_category', 31, 1, 1, NULL, '2018-05-06', 1, NULL, NULL),
(33, 'Manage Vendor', 'vendor/list_vendors', 5, 2, 1, NULL, '2018-05-06', 1, NULL, NULL),
(34, 'Manage Customers', 'customer/list_customers', 5, 3, 1, NULL, '2018-05-06', 1, NULL, NULL),
(35, 'Purchase', '#', 0, 5, 1, NULL, '2018-05-06', 1, NULL, NULL),
(36, 'New Purchase', 'purchase/new_purchase', 35, 1, 1, NULL, '2018-05-06', 1, NULL, NULL),
(37, 'Purchase History', 'purchase/purchase_history', 35, 2, 1, NULL, '2018-05-06', 1, NULL, NULL),
(38, 'Sales', '#', 0, 6, 1, NULL, '2018-05-06', 1, NULL, NULL),
(39, 'New Sale', 'sales/new_sale', 38, 1, 1, NULL, '2018-05-06', 1, NULL, NULL),
(40, 'Sales History', 'sales/sales_history', 38, 2, 1, NULL, '2018-05-06', 1, NULL, NULL),
(41, 'Stock', '#', 0, 7, 1, NULL, '2018-05-06', 1, NULL, NULL),
(42, 'List Stock', 'stock/list_stock', 41, 1, 1, NULL, '2018-05-06', 1, NULL, NULL),
(43, 'List Products', 'item/list_items', 31, 2, 1, NULL, '2018-05-06', 1, NULL, NULL),
(44, 'Reports', '#', 0, 8, 1, NULL, '2018-05-11', 1, NULL, NULL),
(45, 'Purchase Report', 'reports/purchase', 44, 1, 1, NULL, '2018-05-11', 1, NULL, NULL),
(46, 'Sales Report', 'reports/sales_report', 44, 2, 1, NULL, '2018-05-11', 1, NULL, NULL),
(47, 'Company Info', 'Generals/edit_company_info', 3, 3, 1, NULL, '2018-05-11', 1, NULL, NULL),
(48, 'List Companies', 'company/list_company', 5, 4, 1, NULL, '2018-05-11', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usr_permission`
--

CREATE TABLE `usr_permission` (
  `PER_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `MENU_ID` int(11) NOT NULL,
  `PER_SELECT` varchar(1) NOT NULL,
  `PER_INSERT` varchar(1) NOT NULL,
  `PER_UPDATE` varchar(1) NOT NULL,
  `PER_DELETE` varchar(1) NOT NULL,
  `CREATED_DATE` date DEFAULT NULL,
  `CREATED_USERID` int(11) DEFAULT NULL,
  `UPDATED_DATE` date DEFAULT NULL,
  `UPDATED_USERID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usr_permission`
--

INSERT INTO `usr_permission` (`PER_ID`, `GROUP_ID`, `MENU_ID`, `PER_SELECT`, `PER_INSERT`, `PER_UPDATE`, `PER_DELETE`, `CREATED_DATE`, `CREATED_USERID`, `UPDATED_DATE`, `UPDATED_USERID`) VALUES
(1, 2, 2, '1', '1', '1', '0', NULL, NULL, '2018-05-17', 1),
(2, 2, 3, '0', '0', '0', '0', NULL, NULL, '2018-05-17', 1),
(3, 2, 4, '0', '0', '0', '0', NULL, NULL, '2018-05-17', 1),
(4, 2, 5, '1', '0', '0', '0', NULL, NULL, '2018-05-17', 1),
(5, 2, 6, '0', '0', '0', '0', NULL, NULL, '2016-06-16', 1),
(6, 2, 9, '1', '0', '0', '0', NULL, NULL, '2018-05-17', 1),
(7, 2, 10, '0', '0', '0', '0', NULL, NULL, '2016-06-16', 1),
(8, 2, 11, '0', '0', '0', '0', NULL, NULL, '2016-06-16', 1),
(9, 2, 12, '1', '0', '0', '0', NULL, NULL, '2016-06-16', 1),
(10, 2, 13, '1', '0', '0', '0', NULL, NULL, '2016-06-16', 1),
(11, 2, 14, '1', '0', '0', '0', NULL, NULL, '2016-06-16', 1),
(12, 2, 15, '0', '0', '0', '0', '2015-03-02', 1, '2016-06-16', 1),
(13, 2, 16, '0', '0', '0', '0', '2015-03-02', 1, '2016-06-16', 1),
(14, 2, 17, '0', '0', '0', '0', '2015-03-02', 1, '2016-06-16', 1),
(15, 2, 18, '0', '0', '0', '0', '2015-03-02', 1, '2018-05-17', 1),
(16, 2, 19, '1', '0', '0', '0', '2015-03-02', 1, '2016-06-16', 1),
(17, 1, 2, '0', '0', '0', '0', '2015-03-06', 1, '2015-04-15', 1),
(18, 1, 3, '1', '1', '1', '1', '2015-03-06', 1, '2015-04-15', 1),
(19, 1, 5, '0', '0', '0', '0', '2015-03-06', 1, '2015-04-15', 1),
(20, 1, 6, '0', '0', '0', '0', '2015-03-06', 1, '2015-04-15', 1),
(21, 1, 9, '0', '0', '0', '0', '2015-03-06', 1, NULL, NULL),
(22, 1, 10, '0', '0', '0', '0', '2015-03-06', 1, NULL, NULL),
(23, 1, 11, '0', '0', '0', '0', '2015-03-06', 1, NULL, NULL),
(24, 1, 12, '0', '0', '0', '0', '2015-03-06', 1, '2015-04-15', 1),
(25, 1, 13, '0', '0', '0', '0', '2015-03-06', 1, '2015-04-15', 1),
(26, 1, 14, '0', '0', '0', '0', '2015-03-06', 1, '2015-04-15', 1),
(27, 1, 15, '0', '0', '0', '0', '2015-03-06', 1, NULL, NULL),
(28, 1, 16, '0', '0', '0', '0', '2015-03-06', 1, NULL, NULL),
(29, 1, 17, '0', '0', '0', '0', '2015-03-06', 1, NULL, NULL),
(30, 1, 18, '0', '0', '0', '0', '2015-03-06', 1, NULL, NULL),
(31, 1, 19, '0', '0', '0', '0', '2015-03-06', 1, NULL, NULL),
(32, 1, 21, '1', '1', '1', '1', '2015-03-06', 1, '2015-04-15', 1),
(33, 1, 22, '1', '1', '1', '1', '2015-03-06', 1, '2015-04-15', 1),
(34, 2, 21, '0', '0', '0', '0', '2015-03-16', 1, '2018-05-17', 1),
(35, 2, 22, '1', '0', '0', '0', '2015-03-16', 1, '2017-10-18', 1),
(36, 2, 23, '0', '0', '0', '0', '2015-03-16', 1, '2017-10-18', 1),
(37, 2, 24, '0', '0', '0', '0', '2015-03-16', 1, '2017-10-18', 1),
(38, 2, 25, '0', '0', '0', '0', '2015-03-16', 1, '2017-10-18', 1),
(39, 1, 23, '0', '0', '0', '0', '2015-04-15', 1, '2015-04-15', 1),
(40, 1, 24, '0', '0', '0', '0', '2015-04-15', 1, '2015-04-15', 1),
(41, 1, 25, '0', '0', '0', '0', '2015-04-15', 1, '2015-04-15', 1),
(42, 1, 26, '0', '0', '0', '0', '2015-04-15', 1, '2015-04-15', 1),
(43, 2, 26, '0', '0', '0', '0', '2015-09-11', 1, '2017-10-18', 1),
(44, 2, 27, '0', '0', '0', '0', '2015-09-11', 1, '2017-10-18', 1),
(45, 2, 28, '0', '0', '0', '0', '2015-09-11', 1, '2017-10-18', 1),
(46, 2, 29, '0', '0', '0', '0', '2015-09-11', 1, '2017-10-18', 1),
(47, 2, 1, '1', '0', '0', '0', '2016-06-16', 1, '2018-05-17', 1),
(48, 2, 7, '0', '0', '0', '0', '2016-06-16', 1, NULL, NULL),
(49, 2, 8, '0', '0', '0', '0', '2016-06-16', 1, NULL, NULL),
(50, 2, 20, '0', '0', '0', '0', '2016-06-16', 1, NULL, NULL),
(51, 3, 1, '0', '0', '0', '0', '2017-08-01', 1, NULL, NULL),
(52, 3, 2, '0', '0', '0', '0', '2017-08-01', 1, NULL, NULL),
(53, 3, 3, '0', '0', '0', '0', '2017-08-01', 1, NULL, NULL),
(54, 3, 4, '0', '0', '0', '0', '2017-08-01', 1, NULL, NULL),
(55, 3, 5, '1', '0', '0', '0', '2017-08-01', 1, NULL, NULL),
(56, 3, 9, '1', '0', '0', '0', '2017-08-01', 1, NULL, NULL),
(57, 3, 18, '0', '0', '0', '0', '2017-08-01', 1, NULL, NULL),
(58, 3, 21, '0', '0', '0', '0', '2017-08-01', 1, NULL, NULL),
(59, 2, 31, '1', '0', '0', '0', '2018-05-11', 1, '2018-05-17', 1),
(60, 2, 32, '1', '1', '0', '0', '2018-05-11', 1, '2018-05-17', 1),
(61, 2, 33, '1', '0', '0', '0', '2018-05-11', 1, '2018-05-17', 1),
(62, 2, 34, '1', '0', '0', '0', '2018-05-11', 1, '2018-05-17', 1),
(63, 2, 35, '1', '0', '0', '0', '2018-05-11', 1, '2018-05-17', 1),
(64, 2, 36, '0', '0', '0', '0', '2018-05-11', 1, '2018-05-17', 1),
(65, 2, 37, '1', '0', '0', '0', '2018-05-11', 1, '2018-05-17', 1),
(66, 2, 38, '1', '0', '0', '0', '2018-05-11', 1, '2018-05-17', 1),
(67, 2, 39, '0', '0', '0', '0', '2018-05-11', 1, '2018-05-17', 1),
(68, 2, 40, '1', '0', '0', '0', '2018-05-11', 1, '2018-05-17', 1),
(69, 2, 41, '1', '0', '0', '0', '2018-05-11', 1, '2018-05-17', 1),
(70, 2, 42, '1', '0', '0', '0', '2018-05-11', 1, '2018-05-17', 1),
(71, 2, 43, '1', '1', '0', '0', '2018-05-11', 1, '2018-05-17', 1),
(72, 2, 44, '1', '0', '0', '0', '2018-05-11', 1, '2018-05-17', 1),
(73, 2, 45, '1', '0', '0', '0', '2018-05-11', 1, '2018-05-17', 1),
(74, 2, 46, '1', '0', '0', '0', '2018-05-11', 1, '2018-05-17', 1),
(75, 2, 47, '0', '0', '0', '0', '2018-05-11', 1, '2018-05-17', 1),
(76, 2, 48, '1', '0', '0', '0', '2018-05-11', 1, '2018-05-17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usr_user`
--

CREATE TABLE `usr_user` (
  `USER_ID` int(11) NOT NULL,
  `USER_NAME` varchar(100) NOT NULL,
  `U_PASSWORD` varchar(500) NOT NULL,
  `EMP_NO` varchar(20) DEFAULT NULL,
  `logged_in` int(1) DEFAULT NULL,
  `IS_ACTIVE` varchar(1) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `SUP_ADMIN` varchar(1) DEFAULT NULL,
  `CREATED_DATE` date DEFAULT NULL,
  `CREATED_USERID` int(11) DEFAULT NULL,
  `UPDATED_DATE` date DEFAULT NULL,
  `UPDATED_USERID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usr_user`
--

INSERT INTO `usr_user` (`USER_ID`, `USER_NAME`, `U_PASSWORD`, `EMP_NO`, `logged_in`, `IS_ACTIVE`, `GROUP_ID`, `SUP_ADMIN`, `CREATED_DATE`, `CREATED_USERID`, `UPDATED_DATE`, `UPDATED_USERID`) VALUES
(1, 'superadmin', 'adcd7048512e64b48da55b027577886ee5a36350', '0', NULL, '1', 1, NULL, NULL, NULL, '2017-08-08', 1),
(2, 'sameer', 'adcd7048512e64b48da55b027577886ee5a36350', '1', NULL, '1', 2, NULL, '2015-03-16', 1, '2015-09-11', 0),
(4, 'sohail', 'adcd7048512e64b48da55b027577886ee5a36350', '3', NULL, '1', 3, NULL, '2016-08-03', 1, NULL, NULL),
(5, '0', 'adcd7048512e64b48da55b027577886ee5a36350', '0', NULL, '1', 0, NULL, '2018-05-11', 1, NULL, NULL),
(6, 'ravi dubey', 'adcd7048512e64b48da55b027577886ee5a36350', '0', NULL, '1', 4, NULL, '2024-02-01', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(100) DEFAULT NULL,
  `phone_no` varchar(100) DEFAULT NULL,
  `fax_no` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendor_id`, `vendor_name`, `phone_no`, `fax_no`, `email`, `company_id`) VALUES
(1, 'abc.pv.ltd', '333', '0000', 'ABCD@YAHOO.COM', 0),
(2, 'dsvv.pv.ltd', '333', '0000', 'ABCD@YAHOO.COM', 0),
(3, 'bhagwati.canteen.pvt.ltd', '1233', '12133', 'admin@yahoo.com', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `coa`
--
ALTER TABLE `coa`
  ADD PRIMARY KEY (`MAIN_CODE`,`SUB_CODE`,`TR_HEAD`);

--
-- Indexes for table `coa_trans`
--
ALTER TABLE `coa_trans`
  ADD PRIMARY KEY (`VNO`,`TRDATE`,`MAIN_CODE`,`SUB_CODE`,`TR_HEAD`),
  ADD KEY `FK_coa_trans_coa_id` (`MAIN_CODE`,`SUB_CODE`,`TR_HEAD`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `company_information`
--
ALTER TABLE `company_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `email_settings`
--
ALTER TABLE `email_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_profile`
--
ALTER TABLE `employee_profile`
  ADD PRIMARY KEY (`EMP_ID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`);

--
-- Indexes for table `purchase_company`
--
ALTER TABLE `purchase_company`
  ADD PRIMARY KEY (`purchase_no`);

--
-- Indexes for table `purchase_return`
--
ALTER TABLE `purchase_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `route_charges`
--
ALTER TABLE `route_charges`
  ADD PRIMARY KEY (`charge_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_no`);

--
-- Indexes for table `sales_detail`
--
ALTER TABLE `sales_detail`
  ADD KEY `sales_id` (`sales_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settings_id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_no`);

--
-- Indexes for table `usr_group`
--
ALTER TABLE `usr_group`
  ADD PRIMARY KEY (`GROUP_ID`),
  ADD UNIQUE KEY `UK_GROUP_NAME` (`GROUP_NAME`);

--
-- Indexes for table `usr_menu`
--
ALTER TABLE `usr_menu`
  ADD PRIMARY KEY (`MENU_ID`),
  ADD KEY `FK_usr_menu_usr_menu_menu_id` (`PARENT_ID`);

--
-- Indexes for table `usr_permission`
--
ALTER TABLE `usr_permission`
  ADD PRIMARY KEY (`PER_ID`),
  ADD KEY `FK_usr_permission_usr_group_group_id` (`GROUP_ID`),
  ADD KEY `FK_usr_permission_usr_menu_menu_id` (`MENU_ID`);

--
-- Indexes for table `usr_user`
--
ALTER TABLE `usr_user`
  ADD PRIMARY KEY (`USER_ID`),
  ADD UNIQUE KEY `UK_USER_NAME` (`USER_NAME`),
  ADD KEY `FK_usr_user_hrm_employees_emp_no` (`EMP_NO`),
  ADD KEY `FK_usr_user_usr_group_group_id` (`GROUP_ID`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `company_information`
--
ALTER TABLE `company_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `email_settings`
--
ALTER TABLE `email_settings`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_profile`
--
ALTER TABLE `employee_profile`
  MODIFY `EMP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `route_charges`
--
ALTER TABLE `route_charges`
  MODIFY `charge_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sales_detail`
--
ALTER TABLE `sales_detail`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `stock_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `vendor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
