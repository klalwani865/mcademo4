-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2024 at 08:06 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_aptutorial`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_details_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_qty` int(11) NOT NULL,
  `pro_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_master`
--

CREATE TABLE `order_master` (
  `order_id` int(11) NOT NULL,
  `order_date` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `shippingname` varchar(200) NOT NULL,
  `shippingmobile` bigint(20) NOT NULL,
  `shippingaddress` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_master`
--

INSERT INTO `order_master` (`order_id`, `order_date`, `user_id`, `order_status`, `shippingname`, `shippingmobile`, `shippingaddress`) VALUES
(1, '26-02-24', 1, 'Pending', 'Divya', 8200146158, 'ABC near Bus stand,jnd'),
(2, '26-02-24', 1, 'Pending', 'Divya', 8200146158, 'ABC near Bus stand,jnd');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `is_active` varchar(2) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`, `is_active`, `insert_date`) VALUES
(1, 'iphone11', '1', '2024-02-20 06:26:46'),
(2, 'samsung', '1', '2024-02-20 06:26:55'),
(3, 'Mi', '1', '2024-02-20 06:27:01'),
(4, 'Lenovo', '1', '2024-02-22 04:50:44'),
(5, 'SmartMobile', '1', '2024-02-19 18:30:00'),
(6, 'SmartMobile', '1', '2024-02-19 18:30:00'),
(7, 'iphone15', '1', '2024-02-19 18:30:00'),
(8, 'PowerBank', '1', '2024-02-22 04:51:23');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productmaster`
--

CREATE TABLE `tbl_productmaster` (
  `pro_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `pro_titel` varchar(200) NOT NULL,
  `pro_details` text NOT NULL,
  `pro_price` int(11) NOT NULL,
  `pro_imagepath` varchar(200) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `is_active` varchar(3) NOT NULL,
  `is_delete` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_productmaster`
--

INSERT INTO `tbl_productmaster` (`pro_id`, `qty`, `pro_titel`, `pro_details`, `pro_price`, `pro_imagepath`, `sub_category_id`, `is_active`, `is_delete`) VALUES
(7, 10, 'Apple iPhone 15', 'iphone 11 5G Black Colour', 80990, 'iphone15.jpg', 0, '1', '0'),
(8, 15, 'Samsung Glaxy S24', 'Screen Size\r\n6.2 inches screen\r\nWeight\r\n167 grams\r\nStorage Capacity\r\n128 GB, 256 GB, 512 GB\r\nRear Camera Resolution\r\n50 MP Rear Camera\r\nFront Camera Resolution\r\n12 MP Front Camera\r\nRelease Date\r\nJanuary 2024\r\nRAM\r\nRAM: 8 GB', 80000, 'samsung.jpg', 0, '1', '0'),
(9, 15, 'Samsung Glaxy S24', 'Screen Size\r\n6.2 inches screen\r\nWeight\r\n167 grams\r\nStorage Capacity\r\n128 GB, 256 GB, 512 GB\r\nRear Camera Resolution\r\n50 MP Rear Camera\r\nFront Camera Resolution\r\n12 MP Front Camera\r\nRelease Date\r\nJanuary 2024\r\nRAM\r\nRAM: 8 GB', 80000, 'samsung.jpg', 0, '1', '0'),
(10, 15, 'Samsung Glaxy S24', 'Screen Size\r\n6.2 inches screen\r\nWeight\r\n167 grams\r\nStorage Capacity\r\n128 GB, 256 GB, 512 GB\r\nRear Camera Resolution\r\n50 MP Rear Camera\r\nFront Camera Resolution\r\n12 MP Front Camera\r\nRelease Date\r\nJanuary 2024\r\nRAM\r\nRAM: 8 GB', 80000, 'samsung.jpg', 0, '1', '0'),
(11, 25, 'OnePlus Smart TV', 'Connectivity: 3 HDMI ports to connect set top box, Blu Ray players, gaming console | 2 USB ports to connect hard drives and other USB devices | Dual-band Wi-Fi\r\nSound : 24 Watts Output | Dolby Audio | Dolby Atmos Decoding\r\nSmart TV features: Android TV | OnePlus Connect Ecosystem| Google Assistant | Chromecast, Miracast, DLNA | Auto Low Latency Mode | Supported Apps : Netflix, Youtube, Prime Video, Hotstar, SonyLiv, Hungama, JioCinema, Zee5, Eros Now, Oxygen Play', 25000, 'smartrv.jpg', 0, '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategory`
--

CREATE TABLE `tbl_subcategory` (
  `sub_category_id` int(11) NOT NULL,
  `sub_category_name` varchar(30) NOT NULL,
  `category_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_subcategory`
--

INSERT INTO `tbl_subcategory` (`sub_category_id`, `sub_category_name`, `category_id`, `is_active`, `insert_date`) VALUES
(1, 'iphone15', 0, 1, '2024-02-23 04:39:10'),
(2, 'Leptop', 0, 1, '2024-02-22 06:29:09'),
(3, 'powerBank', 0, 1, '2024-02-22 06:33:51'),
(4, 'Dell Leptop', 0, 1, '2024-02-21 18:30:00'),
(5, 'SmartTV', 0, 1, '2024-02-21 18:30:00'),
(7, 'Samsung Glaxy S24\n', 0, 1, '2024-02-23 05:42:16');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_details_id`);

--
-- Indexes for table `order_master`
--
ALTER TABLE `order_master`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_productmaster`
--
ALTER TABLE `tbl_productmaster`
  ADD PRIMARY KEY (`pro_id`);

--
-- Indexes for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  ADD PRIMARY KEY (`sub_category_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_details_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_master`
--
ALTER TABLE `order_master`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_productmaster`
--
ALTER TABLE `tbl_productmaster`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  MODIFY `sub_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
