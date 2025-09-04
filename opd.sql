-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2024 at 10:14 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opd`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(1, '𝓑𝓻𝓮𝓪𝓴𝓯𝓪𝓼𝓽', 'A delight for veggie lovers! Choose from our wide range of delicious vegetarian pizzas, it\'s softer and tastier', '2024-09-10 18:16:28'),
(3, '𝓜𝓪𝓲𝓷 𝓓𝓲𝓼𝓱𝓮𝓼 (𝓓𝓲𝓷𝓷𝓮𝓻 𝓸𝓻 𝓢𝓹𝓮𝓬𝓲𝓪𝓵 𝓛𝓾𝓷𝓬𝓱)\r\n', 'Indulge into mouth-watering taste of veggie mania range, perfect answer to all your food cravings', '2024-09-10 18:17:43'),
(5, '𝓢𝓷𝓪𝓬𝓴𝓼', 'Complement your veggie with wide range of beverages available at veggie India', '2024-09-10 21:58:58'),
(6, '𝓓𝓮𝓼𝓼𝓮𝓻𝓽\r\n', 'Fresh veggie Tastiest Pan veggie. ... Domino\'s freshly made pan-baked veggie; deliciously soft ,buttery,extra cheesy and delightfully crunchy.', '2024-09-10 07:55:28');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contactreply`
--

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deliverydetails`
--

INSERT INTO `deliverydetails` (`id`, `orderId`, `deliveryBoyName`, `deliveryBoyPhoneNo`, `deliveryTime`, `dateTime`) VALUES
(1, 1, 'swa', 7895230000, 19, '2024-08-19 12:53:28');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `aId` int(12) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Price` int(12) NOT NULL,
  `Desc` text NOT NULL,
  `CategorieId` int(12) NOT NULL,
  `PubDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`aId`, `Name`, `Price`, `Desc`, `CategorieId`, `PubDate`) VALUES
(77, 'Ghavan', 100, 'A traditional rice flour pancake, soft and fluffy, typically served with coconut chutney or jaggery.', 1, '2024-09-26 20:39:04'),
(78, 'Rassa Patal Pohe', 69, 'Poha soaked in a spicy, soupy curry made from coconut and spices, an old Maharashtrian version of the more common dry poha.', 1, '2024-09-26 20:41:01'),
(79, 'Sanja', 89, 'A spiced wheat semolina dish (similar to upma), but with richer spices and tempering.', 1, '2024-09-26 20:41:37'),
(80, 'Varan Bhaat', 120, 'A simple, rustic preparation of yellow lentil dal, mildly spiced, served with plain rice, ghee, and a wedge of lime.', 3, '2024-09-26 20:43:20'),
(81, 'Masale Bhaat', 130, 'A spiced rice dish with vegetables like peas, carrots, and potatoes, flavored with Maharashtrian goda masala.', 3, '2024-09-26 20:45:02'),
(82, 'Pitla Bhakri', 149, 'Pitla is a thick gram flour-based dish with garlic and green chilies, served with *bhakri* (flatbread made from jowar or bajra flour).', 3, '2024-09-26 20:45:33'),
(83, 'Toop Poli', 139, 'Fresh chapati slathered with homemade ghee (toop), a traditional accompaniment to most meals.', 3, '2024-09-26 20:46:06'),
(84, 'Kadhi', 129, 'A mildly spiced yogurt-based curry, flavored with tempered spices like cumin, mustard, and curry leaves.', 3, '2024-09-26 20:46:38'),
(85, 'Alu Chi Bhaji', 139, ' Colocasia leaves (taro) cooked with besan (gram flour) in a sour-spicy gravy, an old Maharashtrian delicacy.', 3, '2024-09-26 22:05:35'),
(86, 'Bharli Vangi', 139, 'Eggplants stuffed with a spiced peanut-coconut filling, slow-cooked until tender.', 3, '2024-09-26 22:07:21'),
(87, 'Alu Wadi', 119, 'Colocasia leaves rolled with a spicy gram flour paste, steamed, and then fried, giving a crispy exterior and soft interior.', 5, '2024-09-26 22:08:26'),
(88, 'Kharwas', 169, ' A delicate pudding made from the first milk of a cow or buffalo after giving birth, traditionally sweetened with jaggery and flavored with cardamom.', 5, '2024-09-26 22:09:23'),
(89, 'Suralichi Vadi (Khandvi)', 139, 'Gram flour rolls filled with a mildly spiced coconut-coriander mixture, garnished with mustard seeds and curry leaves.', 5, '2024-09-26 22:10:42'),
(90, 'Sakhar Bhat', 129, 'A sweetened rice dish with ghee, cardamom, saffron, and garnished with nuts, popular as a celebratory snack.', 5, '2024-09-26 22:11:37'),
(91, 'Basundi', 189, 'A thickened milk dessert, flavored with cardamom and saffron, served chilled and garnished with nuts.', 6, '2024-09-26 22:13:33'),
(92, 'Puran Poli', 129, ' A sweet flatbread stuffed with a mixture of jaggery and split yellow gram, flavored with cardamom.', 6, '2024-09-26 22:14:23'),
(93, 'Narali Bhat', 139, 'Coconut rice made with jaggery, ghee, and flavored with saffron, a festive dish in old Maharashtrian households.', 6, '2024-09-26 22:15:05'),
(94, 'Anarsa', 149, 'A traditional fried pastry made from soaked rice flour and jaggery, topped with poppy seeds.', 6, '2024-09-26 22:15:42'),
(95, 'Sheera (Kesari)', 179, 'A simple sweet made from semolina, ghee, sugar, and milk, sometimes flavored with saffron and nuts.', 6, '2024-09-26 22:16:22'),
(97, 'saw', 80, 'dggdfg', 3, '2024-09-29 18:15:05');

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `aId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `orderId`, `aId`, `itemQuantity`) VALUES
(1, 1, 1, 2),
(2, 1, 14, 2),
(3, 1, 20, 2),
(4, 1, 31, 4),
(5, 1, 42, 2),
(6, 1, 43, 1),
(7, 1, 46, 1),
(8, 2, 1, 1),
(9, 2, 2, 1),
(10, 2, 3, 1),
(11, 2, 6, 1),
(12, 3, 3, 3),
(13, 3, 1, 1),
(14, 3, 5, 1),
(15, 3, 6, 1),
(16, 4, 1, 1),
(17, 4, 2, 1),
(18, 4, 8, 1),
(19, 4, 7, 1),
(20, 4, 6, 1),
(21, 5, 32, 1),
(22, 5, 31, 1),
(23, 5, 30, 1),
(24, 5, 12, 1),
(25, 6, 35, 1),
(26, 6, 72, 1),
(27, 6, 71, 1),
(28, 7, 77, 1),
(29, 7, 78, 1),
(30, 7, 79, 1),
(31, 7, 87, 1),
(32, 7, 88, 1),
(33, 8, 77, 1),
(34, 8, 81, 1),
(35, 8, 86, 1),
(36, 8, 82, 1),
(37, 8, 88, 1),
(38, 8, 89, 1),
(39, 8, 92, 1),
(40, 8, 91, 1),
(41, 10, 78, 1),
(42, 10, 80, 1),
(43, 10, 81, 1),
(44, 10, 85, 1),
(45, 11, 77, 2),
(46, 11, 78, 2),
(47, 11, 79, 2),
(48, 11, 87, 2),
(49, 11, 88, 1),
(50, 11, 89, 1),
(51, 11, 90, 1),
(52, 11, 91, 1),
(53, 11, 92, 1),
(54, 11, 93, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `userId`, `address`, `zipCode`, `phoneNo`, `amount`, `paymentMode`, `orderStatus`, `orderDate`) VALUES
(1, 2, 'add 123r vggn, pimiuom mmmm', 789527, 1230501585, 2836, '0', '6', '2024-08-03 16:43:54'),
(2, 5, 'sldfoisdhfohsd 31261 ioczojvhsdn, dj;vpdjio ', 0, 7895230000, 766, '0', '5', '2024-08-18 19:58:50'),
(3, 5, 'add 123r vggn, pimiuom mmmm', 0, 1230501585, 1014, '0', '6', '2024-08-19 12:44:29'),
(4, 6, 'ABC 22a4, Pune', 101010, 7894561230, 1115, '0', '0', '2024-08-19 14:39:04'),
(5, 6, 'ABC 22a4, Pune', 0, 8012354875, 646, '0', '2', '2024-08-19 15:48:18'),
(6, 10, 'sldfoisdhfohsd 31261 ioczojvhsdn, gddgd', 660000, 6565556666, 321, '0', '0', '2024-09-20 19:56:21'),
(7, 11, 'Wakad 1234, Pune', 101201, 8012354875, 546, '0', '0', '2024-09-26 22:26:55'),
(8, 12, 'Abcd 121, Pune,wakad', 202020, 2001909000, 1144, '0', '0', '2024-09-29 10:40:38'),
(9, 12, 'ABC 22a4, pimiuom mmmm', 0, 8012354875, 458, '0', '0', '2024-09-29 12:37:15'),
(10, 12, 'ABC 22a4, pimiuom mmmm', 0, 8012354875, 458, '0', '0', '2024-09-29 12:38:08'),
(11, 13, 'Pune 20, Wakad', 201020, 8012354875, 1648, '0', '0', '2024-09-29 18:13:46');

-- --------------------------------------------------------

--
-- Table structure for table `sitedetail`
--

CREATE TABLE `sitedetail` (
  `tempId` int(11) NOT NULL,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sitedetail`
--

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'HomeTestDelights', 'swapniltelangi8278@gmail.com', 8010078970, 9226655351, 'PCMC,PUNE-17', '2024-09-03 19:56:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@gmail.com', 1111111111, '1', '$2y$10$AAfxRFOYbl7FdN17rN3fgeiPu/xQrx6MnvRGzqjVHlGqHAM4d9T1i', '2021-04-11 11:40:58'),
(3, 'abc', 'swapnil', 'abc', 'swapniltelangi8278@gmail.com', 8012354875, '0', '$2y$10$YC/CBoOHx69HyCbwevBoq.pt.Uo/XYIB4OSe3Xw48ZQQ2..mWjIey', '2024-08-15 20:20:16'),
(4, 'aditya', 'aditya', 'B', 'aditya@gmail.com', 8012354875, '0', '$2y$10$eld3DTdyBPsknaQ.Lu4qc..kEN36bZ9eSdxAQNcjfqBtkgKZgs4Gy', '2024-08-18 19:41:32'),
(5, 'bapu', 'Bapu', 'patil', 'bapu@gmail.com', 9866666565, '0', '$2y$10$fxw5UN0Py23c0AVds/UZcuVb84Z0LuVNNXoCHmrnxhOdHr/ZZUjIe', '2024-08-18 19:55:25'),
(11, 'mayur1', 'Mayur', 'M', 'Mayur@gmail.com', 8012354875, '0', '$2y$10$x/P2Eis0Y7qlqpoNtAkI1eEgi7ARN276lZO6VRah2RIoL0rIdA.2C', '2024-09-26 22:25:05'),
(12, 'Ram21', 'Ram', 'patil', 'rampaitl@gmail.com', 2028108800, '0', '$2y$10$Eo0ndCchwW6e0W0FE0TuWuxtxwwRl7Ti/5RLSXMo4p0wYiSiWA5A6', '2024-09-29 10:38:24'),
(13, 'ram1', 'Ram', 'Telange', 'swapniltelangi8278@gmail.com', 7895230000, '0', '$2y$10$7MavKkq3qyQWaJ5kljRMXue9ZSFMpOyxnKnawNtQiHWiFk5IGdTc6', '2024-09-29 18:11:40');

-- --------------------------------------------------------

--
-- Table structure for table `viewcart`
--

CREATE TABLE `viewcart` (
  `cartItemId` int(11) NOT NULL,
  `aId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `viewcart`
--

INSERT INTO `viewcart` (`cartItemId`, `aId`, `itemQuantity`, `userId`, `addedDate`) VALUES
(32, 30, 1, 10, '2024-09-20 19:58:47'),
(33, 31, 1, 10, '2024-09-20 19:58:48'),
(34, 35, 1, 10, '2024-09-20 19:58:50'),
(40, 91, 1, 11, '2024-09-26 23:44:08'),
(41, 92, 1, 11, '2024-09-26 23:44:08'),
(42, 93, 1, 11, '2024-09-26 23:44:09'),
(43, 94, 1, 11, '2024-09-26 23:44:10'),
(57, 80, 1, 12, '2024-09-29 12:48:16'),
(58, 77, 1, 12, '2024-09-29 12:58:37'),
(59, 78, 1, 12, '2024-09-29 12:58:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `contactreply`
--
ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`aId`);
ALTER TABLE `item` ADD FULLTEXT KEY `pizzaName` (`Name`,`Desc`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `sitedetail`
--
ALTER TABLE `sitedetail`
  ADD PRIMARY KEY (`tempId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `viewcart`
--
ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartItemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categorieId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `aId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sitedetail`
--
ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
