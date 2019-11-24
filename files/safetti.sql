-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 10, 2019 at 12:48 PM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `safetti`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_users`
--

CREATE TABLE `auth_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `second_key` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `validation_code` varchar(100) DEFAULT NULL,
  `auth_user_types_id` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_informations`
--

CREATE TABLE `auth_user_informations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `document` varchar(20) NOT NULL,
  `birthdate` varchar(80) DEFAULT NULL,
  `email` varchar(80) NOT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `term_conditions` tinyint(1) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_types`
--

CREATE TABLE `auth_user_types` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cus_access_custom`
--

CREATE TABLE `cus_access_custom` (
  `custom_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cus_adjustments`
--

CREATE TABLE `cus_adjustments` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `message` text,
  `custom_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cus_adjustment_files`
--

CREATE TABLE `cus_adjustment_files` (
  `id` int(11) NOT NULL,
  `file` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `adjustment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cus_custom`
--

CREATE TABLE `cus_custom` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cus_custom_designs`
--

CREATE TABLE `cus_custom_designs` (
  `id` int(11) NOT NULL,
  `colors` text,
  `links` text,
  `custom_id` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cus_custom_files`
--

CREATE TABLE `cus_custom_files` (
  `id` int(11) NOT NULL,
  `custom_id` int(11) NOT NULL,
  `file` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cus_custom_products`
--

CREATE TABLE `cus_custom_products` (
  `id` int(11) NOT NULL,
  `custom_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cus_custom_sizes`
--

CREATE TABLE `cus_custom_sizes` (
  `id` int(11) NOT NULL,
  `sizes` text,
  `custom_product_id` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cus_gartnets`
--

CREATE TABLE `cus_gartnets` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cus_genders`
--

CREATE TABLE `cus_genders` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cus_general_discounts`
--

CREATE TABLE `cus_general_discounts` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rules` text,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cus_payments`
--

CREATE TABLE `cus_payments` (
  `id` int(11) NOT NULL,
  `custom_id` int(11) NOT NULL,
  `external_reference` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `price` float DEFAULT NULL,
  `payment_ref` varchar(600) DEFAULT NULL,
  `url_payment` varchar(800) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cus_products`
--

CREATE TABLE `cus_products` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` text,
  `price` float DEFAULT NULL,
  `quantity_min` int(11) DEFAULT NULL,
  `genders_id` int(11) NOT NULL,
  `sports_id` int(11) NOT NULL,
  `product_types_id` int(11) NOT NULL,
  `gartnets_id` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cus_products_assets`
--

CREATE TABLE `cus_products_assets` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `file` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cus_product_types`
--

CREATE TABLE `cus_product_types` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cus_sports`
--

CREATE TABLE `cus_sports` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `saf_cms`
--

CREATE TABLE `saf_cms` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `content` text,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `saf_countries`
--

CREATE TABLE `saf_countries` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `iso3` varchar(3) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `saf_countries`
--

INSERT INTO `saf_countries` (`id`, `name`, `iso3`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'Afghanistan', 'AFG', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(2, 'Aland Islands', 'ALA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(3, 'Albania', 'ALB', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(4, 'Algeria', 'DZA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(5, 'American Samoa', 'ASM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(6, 'Andorra', 'AND', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(7, 'Angola', 'AGO', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(8, 'Anguilla', 'AIA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(9, 'Antarctica', 'ATA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(10, 'Antigua And Barbuda', 'ATG', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(11, 'Argentina', 'ARG', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(12, 'Armenia', 'ARM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(13, 'Aruba', 'ABW', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(14, 'Australia', 'AUS', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(15, 'Austria', 'AUT', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(16, 'Azerbaijan', 'AZE', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(17, 'Bahamas The', 'BHS', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(18, 'Bahrain', 'BHR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(19, 'Bangladesh', 'BGD', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(20, 'Barbados', 'BRB', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(21, 'Belarus', 'BLR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(22, 'Belgium', 'BEL', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(23, 'Belize', 'BLZ', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(24, 'Benin', 'BEN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(25, 'Bermuda', 'BMU', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(26, 'Bhutan', 'BTN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(27, 'Bolivia', 'BOL', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(28, 'Bosnia and Herzegovina', 'BIH', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(29, 'Botswana', 'BWA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(30, 'Bouvet Island', 'BVT', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(31, 'Brasil', 'BRA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(32, 'British Indian Ocean Territory', 'IOT', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(33, 'Brunei', 'BRN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(34, 'Bulgaria', 'BGR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(35, 'Burkina Faso', 'BFA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(36, 'Burundi', 'BDI', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(37, 'Cambodia', 'KHM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(38, 'Cameroon', 'CMR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(39, 'Canada', 'CAN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(40, 'Cape Verde', 'CPV', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(41, 'Cayman Islands', 'CYM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(42, 'Central African Republic', 'CAF', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(43, 'Chad', 'TCD', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(44, 'Chile', 'CHL', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(45, 'China', 'CHN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(46, 'Christmas Island', 'CXR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(47, 'Cocos (Keeling) Islands', 'CCK', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(48, 'Colombia', 'COL', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(49, 'Comoros', 'COM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(50, 'Congo', 'COG', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(51, 'Congo The Democratic Republic Of The', 'COD', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(52, 'Cook Islands', 'COK', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(53, 'Costa Rica', 'CRI', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(54, 'Cote D\'Ivoire (Ivory Coast)', 'CIV', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(55, 'Croatia (Hrvatska)', 'HRV', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(56, 'Cuba', 'CUB', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(57, 'Cyprus', 'CYP', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(58, 'Czech Republic', 'CZE', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(59, 'Denmark', 'DNK', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(60, 'Djibouti', 'DJI', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(61, 'Dominica', 'DMA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(62, 'Dominican Republic', 'DOM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(63, 'East Timor', 'TLS', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(64, 'Ecuador', 'ECU', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(65, 'Egypt', 'EGY', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(66, 'El Salvador', 'SLV', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(67, 'Equatorial Guinea', 'GNQ', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(68, 'Eritrea', 'ERI', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(69, 'Estonia', 'EST', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(70, 'Ethiopia', 'ETH', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(71, 'Falkland Islands', 'FLK', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(72, 'Faroe Islands', 'FRO', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(73, 'Fiji Islands', 'FJI', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(74, 'Finland', 'FIN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(75, 'France', 'FRA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(76, 'French Guiana', 'GUF', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(77, 'French Polynesia', 'PYF', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(78, 'French Southern Territories', 'ATF', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(79, 'Gabon', 'GAB', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(80, 'Gambia The', 'GMB', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(81, 'Georgia', 'GEO', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(82, 'Germany', 'DEU', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(83, 'Ghana', 'GHA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(84, 'Gibraltar', 'GIB', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(85, 'Greece', 'GRC', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(86, 'Greenland', 'GRL', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(87, 'Grenada', 'GRD', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(88, 'Guadeloupe', 'GLP', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(89, 'Guam', 'GUM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(90, 'Guatemala', 'GTM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(91, 'Guernsey and Alderney', 'GGY', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(92, 'Guinea', 'GIN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(93, 'Guinea-Bissau', 'GNB', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(94, 'Guyana', 'GUY', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(95, 'Haiti', 'HTI', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(96, 'Heard and McDonald Islands', 'HMD', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(97, 'Honduras', 'HND', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(98, 'Hong Kong S.A.R.', 'HKG', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(99, 'Hungary', 'HUN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(100, 'Iceland', 'ISL', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(101, 'India', 'IND', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(102, 'Indonesia', 'IDN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(103, 'Iran', 'IRN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(104, 'Iraq', 'IRQ', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(105, 'Ireland', 'IRL', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(106, 'Israel', 'ISR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(107, 'Italy', 'ITA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(108, 'Jamaica', 'JAM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(109, 'Japan', 'JPN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(110, 'Jersey', 'JEY', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(111, 'Jordan', 'JOR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(112, 'Kazakhstan', 'KAZ', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(113, 'Kenya', 'KEN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(114, 'Kiribati', 'KIR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(115, 'Korea North', 'PRK', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(116, 'Korea South', 'KOR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(117, 'Kuwait', 'KWT', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(118, 'Kyrgyzstan', 'KGZ', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(119, 'Laos', 'LAO', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(120, 'Latvia', 'LVA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(121, 'Lebanon', 'LBN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(122, 'Lesotho', 'LSO', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(123, 'Liberia', 'LBR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(124, 'Libya', 'LBY', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(125, 'Liechtenstein', 'LIE', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(126, 'Lithuania', 'LTU', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(127, 'Luxembourg', 'LUX', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(128, 'Macau S.A.R.', 'MAC', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(129, 'Macedonia', 'MKD', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(130, 'Madagascar', 'MDG', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(131, 'Malawi', 'MWI', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(132, 'Malaysia', 'MYS', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(133, 'Maldives', 'MDV', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(134, 'Mali', 'MLI', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(135, 'Malta', 'MLT', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(136, 'Man (Isle of)', 'IMN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(137, 'Marshall Islands', 'MHL', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(138, 'Martinique', 'MTQ', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(139, 'Mauritania', 'MRT', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(140, 'Mauritius', 'MUS', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(141, 'Mayotte', 'MYT', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(142, 'Mexico', 'MEX', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(143, 'Micronesia', 'FSM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(144, 'Moldova', 'MDA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(145, 'Monaco', 'MCO', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(146, 'Mongolia', 'MNG', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(147, 'Montenegro', 'MNE', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(148, 'Montserrat', 'MSR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(149, 'Morocco', 'MAR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(150, 'Mozambique', 'MOZ', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(151, 'Myanmar', 'MMR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(152, 'Namibia', 'NAM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(153, 'Nauru', 'NRU', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(154, 'Nepal', 'NPL', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(155, 'Netherlands Antilles', 'ANT', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(156, 'Netherlands The', 'NLD', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(157, 'New Caledonia', 'NCL', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(158, 'New Zealand', 'NZL', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(159, 'Nicaragua', 'NIC', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(160, 'Niger', 'NER', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(161, 'Nigeria', 'NGA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(162, 'Niue', 'NIU', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(163, 'Norfolk Island', 'NFK', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(164, 'Northern Mariana Islands', 'MNP', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(165, 'Norway', 'NOR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(166, 'Oman', 'OMN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(167, 'Pakistan', 'PAK', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(168, 'Palau', 'PLW', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(169, 'Palestinian Territory Occupied', 'PSE', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(170, 'Panama', 'PAN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(171, 'Papua new Guinea', 'PNG', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(172, 'Paraguay', 'PRY', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(173, 'Peru', 'PER', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(174, 'Philippines', 'PHL', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(175, 'Pitcairn Island', 'PCN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(176, 'Poland', 'POL', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(177, 'Portugal', 'PRT', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(178, 'Puerto Rico', 'PRI', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(179, 'Qatar', 'QAT', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(180, 'Reunion', 'REU', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(181, 'Romania', 'ROU', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(182, 'Russia', 'RUS', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(183, 'Rwanda', 'RWA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(184, 'Saint Helena', 'SHN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(185, 'Saint Kitts And Nevis', 'KNA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(186, 'Saint Lucia', 'LCA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(187, 'Saint Pierre and Miquelon', 'SPM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(188, 'Saint Vincent And The Grenadines', 'VCT', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(189, 'Saint-Barthelemy', 'BLM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(190, 'Saint-Martin (French part)', 'MAF', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(191, 'Samoa', 'WSM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(192, 'San Marino', 'SMR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(193, 'Sao Tome and Principe', 'STP', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(194, 'Saudi Arabia', 'SAU', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(195, 'Senegal', 'SEN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(196, 'Serbia', 'SRB', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(197, 'Seychelles', 'SYC', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(198, 'Sierra Leone', 'SLE', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(199, 'Singapore', 'SGP', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(200, 'Slovakia', 'SVK', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(201, 'Slovenia', 'SVN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(202, 'Solomon Islands', 'SLB', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(203, 'Somalia', 'SOM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(204, 'South Africa', 'ZAF', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(205, 'South Georgia', 'SGS', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(206, 'South Sudan', 'SSD', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(207, 'Spain', 'ESP', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(208, 'Sri Lanka', 'LKA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(209, 'Sudan', 'SDN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(210, 'Suriname', 'SUR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(211, 'Svalbard And Jan Mayen Islands', 'SJM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(212, 'Swaziland', 'SWZ', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(213, 'Sweden', 'SWE', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(214, 'Switzerland', 'CHE', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(215, 'Syria', 'SYR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(216, 'Taiwan', 'TWN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(217, 'Tajikistan', 'TJK', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(218, 'Tanzania', 'TZA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(219, 'Thailand', 'THA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(220, 'Togo', 'TGO', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(221, 'Tokelau', 'TKL', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(222, 'Tonga', 'TON', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(223, 'Trinidad And Tobago', 'TTO', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(224, 'Tunisia', 'TUN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(225, 'Turkey', 'TUR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(226, 'Turkmenistan', 'TKM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(227, 'Turks And Caicos Islands', 'TCA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(228, 'Tuvalu', 'TUV', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(229, 'Uganda', 'UGA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(230, 'Ukraine', 'UKR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(231, 'United Arab Emirates', 'ARE', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(232, 'United Kingdom', 'GBR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(233, 'United States', 'USA', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(234, 'United States Minor Outlying Islands', 'UMI', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(235, 'Uruguay', 'URY', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(236, 'Uzbekistan', 'UZB', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(237, 'Vanuatu', 'VUT', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(238, 'Vatican City State (Holy See)', 'VAT', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(239, 'Venezuela', 'VEN', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(240, 'Vietnam', 'VNM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(241, 'Virgin Islands (British)', 'VGB', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(242, 'Virgin Islands (US)', 'VIR', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(243, 'Wallis And Futuna Islands', 'WLF', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(244, 'Western Sahara', 'ESH', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(245, 'Yemen', 'YEM', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(246, 'Zambia', 'ZMB', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23'),
(247, 'Zimbabwe', 'ZWE', 1, '2019-10-09 17:15:23', '2019-10-09 17:15:23');

-- --------------------------------------------------------

--
-- Table structure for table `saf_logs`
--

CREATE TABLE `saf_logs` (
  `id` int(11) NOT NULL,
  `string` text,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `saf_questions`
--

CREATE TABLE `saf_questions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` text,
  `order` int(11) DEFAULT NULL,
  `multiple` tinyint(4) DEFAULT NULL,
  `options` text,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `saf_settings`
--

CREATE TABLE `saf_settings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `value` text,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_users`
--
ALTER TABLE `auth_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_auth_users_auth_user_types1_idx` (`auth_user_types_id`);

--
-- Indexes for table `auth_user_informations`
--
ALTER TABLE `auth_user_informations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_auth_user_informations_saf_contries1_idx` (`country_id`),
  ADD KEY `fk_auth_user_informations_auth_users1_idx` (`user_id`);

--
-- Indexes for table `auth_user_types`
--
ALTER TABLE `auth_user_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `cus_access_custom`
--
ALTER TABLE `cus_access_custom`
  ADD KEY `fk_cus_access_custom_cus_custom1_idx` (`custom_id`),
  ADD KEY `fk_cus_access_custom_auth_users1_idx` (`user_id`);

--
-- Indexes for table `cus_adjustments`
--
ALTER TABLE `cus_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_cus_adjustments_cus_custom1_idx` (`custom_id`),
  ADD KEY `fk_cus_adjustments_auth_users1_idx` (`user_id`);

--
-- Indexes for table `cus_adjustment_files`
--
ALTER TABLE `cus_adjustment_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_cus_adjustment_files_cus_adjustments1_idx` (`adjustment_id`);

--
-- Indexes for table `cus_custom`
--
ALTER TABLE `cus_custom`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `cus_custom_designs`
--
ALTER TABLE `cus_custom_designs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_cus_custom_designs_cus_custom1_idx` (`custom_id`);

--
-- Indexes for table `cus_custom_files`
--
ALTER TABLE `cus_custom_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_cus_custom_files_cus_custom1_idx` (`custom_id`);

--
-- Indexes for table `cus_custom_products`
--
ALTER TABLE `cus_custom_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_cus_custom_products_cus_custom1_idx` (`custom_id`),
  ADD KEY `fk_cus_custom_products_cus_products1_idx` (`products_id`);

--
-- Indexes for table `cus_custom_sizes`
--
ALTER TABLE `cus_custom_sizes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_cus_custom_sizes_cus_custom_products1_idx` (`custom_product_id`);

--
-- Indexes for table `cus_gartnets`
--
ALTER TABLE `cus_gartnets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `cus_genders`
--
ALTER TABLE `cus_genders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `cus_general_discounts`
--
ALTER TABLE `cus_general_discounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_cus_general_discounts_cus_products1_idx` (`product_id`);

--
-- Indexes for table `cus_payments`
--
ALTER TABLE `cus_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_cus_payments_cus_custom1_idx` (`custom_id`);

--
-- Indexes for table `cus_products`
--
ALTER TABLE `cus_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_cus_products_cus_genders_idx` (`genders_id`),
  ADD KEY `fk_cus_products_cus_sports1_idx` (`sports_id`),
  ADD KEY `fk_cus_products_cus_product_types1_idx` (`product_types_id`),
  ADD KEY `fk_cus_products_cus_gartnets1_idx` (`gartnets_id`);

--
-- Indexes for table `cus_products_assets`
--
ALTER TABLE `cus_products_assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_cus_products_assets_cus_products1_idx` (`product_id`);

--
-- Indexes for table `cus_product_types`
--
ALTER TABLE `cus_product_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `cus_sports`
--
ALTER TABLE `cus_sports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `saf_cms`
--
ALTER TABLE `saf_cms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_saf_cms_auth_users1_idx` (`user_id`);

--
-- Indexes for table `saf_countries`
--
ALTER TABLE `saf_countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `saf_logs`
--
ALTER TABLE `saf_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `saf_questions`
--
ALTER TABLE `saf_questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_saf_questions_auth_users1_idx` (`user_id`);

--
-- Indexes for table `saf_settings`
--
ALTER TABLE `saf_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_saf_settings_auth_users1_idx` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_users`
--
ALTER TABLE `auth_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_informations`
--
ALTER TABLE `auth_user_informations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_types`
--
ALTER TABLE `auth_user_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cus_adjustments`
--
ALTER TABLE `cus_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cus_adjustment_files`
--
ALTER TABLE `cus_adjustment_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cus_custom`
--
ALTER TABLE `cus_custom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cus_custom_designs`
--
ALTER TABLE `cus_custom_designs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cus_custom_files`
--
ALTER TABLE `cus_custom_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cus_custom_products`
--
ALTER TABLE `cus_custom_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cus_custom_sizes`
--
ALTER TABLE `cus_custom_sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cus_gartnets`
--
ALTER TABLE `cus_gartnets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cus_genders`
--
ALTER TABLE `cus_genders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cus_general_discounts`
--
ALTER TABLE `cus_general_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cus_payments`
--
ALTER TABLE `cus_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cus_products`
--
ALTER TABLE `cus_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cus_products_assets`
--
ALTER TABLE `cus_products_assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cus_product_types`
--
ALTER TABLE `cus_product_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cus_sports`
--
ALTER TABLE `cus_sports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saf_cms`
--
ALTER TABLE `saf_cms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saf_countries`
--
ALTER TABLE `saf_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT for table `saf_logs`
--
ALTER TABLE `saf_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saf_questions`
--
ALTER TABLE `saf_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saf_settings`
--
ALTER TABLE `saf_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_users`
--
ALTER TABLE `auth_users`
  ADD CONSTRAINT `fk_auth_users_auth_user_types1` FOREIGN KEY (`auth_user_types_id`) REFERENCES `auth_user_types` (`id`);

--
-- Constraints for table `auth_user_informations`
--
ALTER TABLE `auth_user_informations`
  ADD CONSTRAINT `fk_auth_user_informations_auth_users1` FOREIGN KEY (`user_id`) REFERENCES `auth_users` (`id`),
  ADD CONSTRAINT `fk_auth_user_informations_saf_contries1` FOREIGN KEY (`country_id`) REFERENCES `saf_countries` (`id`);

--
-- Constraints for table `cus_access_custom`
--
ALTER TABLE `cus_access_custom`
  ADD CONSTRAINT `fk_cus_access_custom_auth_users1` FOREIGN KEY (`user_id`) REFERENCES `auth_users` (`id`),
  ADD CONSTRAINT `fk_cus_access_custom_cus_custom1` FOREIGN KEY (`custom_id`) REFERENCES `cus_custom` (`id`);

--
-- Constraints for table `cus_adjustments`
--
ALTER TABLE `cus_adjustments`
  ADD CONSTRAINT `fk_cus_adjustments_auth_users1` FOREIGN KEY (`user_id`) REFERENCES `auth_users` (`id`),
  ADD CONSTRAINT `fk_cus_adjustments_cus_custom1` FOREIGN KEY (`custom_id`) REFERENCES `cus_custom` (`id`);

--
-- Constraints for table `cus_adjustment_files`
--
ALTER TABLE `cus_adjustment_files`
  ADD CONSTRAINT `fk_cus_adjustment_files_cus_adjustments1` FOREIGN KEY (`adjustment_id`) REFERENCES `cus_adjustments` (`id`);

--
-- Constraints for table `cus_custom_designs`
--
ALTER TABLE `cus_custom_designs`
  ADD CONSTRAINT `fk_cus_custom_designs_cus_custom1` FOREIGN KEY (`custom_id`) REFERENCES `cus_custom` (`id`);

--
-- Constraints for table `cus_custom_files`
--
ALTER TABLE `cus_custom_files`
  ADD CONSTRAINT `fk_cus_custom_files_cus_custom1` FOREIGN KEY (`custom_id`) REFERENCES `cus_custom` (`id`);

--
-- Constraints for table `cus_custom_products`
--
ALTER TABLE `cus_custom_products`
  ADD CONSTRAINT `fk_cus_custom_products_cus_custom1` FOREIGN KEY (`custom_id`) REFERENCES `cus_custom` (`id`),
  ADD CONSTRAINT `fk_cus_custom_products_cus_products1` FOREIGN KEY (`products_id`) REFERENCES `cus_products` (`id`);

--
-- Constraints for table `cus_custom_sizes`
--
ALTER TABLE `cus_custom_sizes`
  ADD CONSTRAINT `fk_cus_custom_sizes_cus_custom_products1` FOREIGN KEY (`custom_product_id`) REFERENCES `cus_custom_products` (`id`);

--
-- Constraints for table `cus_general_discounts`
--
ALTER TABLE `cus_general_discounts`
  ADD CONSTRAINT `fk_cus_general_discounts_cus_products1` FOREIGN KEY (`product_id`) REFERENCES `cus_products` (`id`);

--
-- Constraints for table `cus_payments`
--
ALTER TABLE `cus_payments`
  ADD CONSTRAINT `fk_cus_payments_cus_custom1` FOREIGN KEY (`custom_id`) REFERENCES `cus_custom` (`id`);

--
-- Constraints for table `cus_products`
--
ALTER TABLE `cus_products`
  ADD CONSTRAINT `fk_cus_products_cus_gartnets1` FOREIGN KEY (`gartnets_id`) REFERENCES `cus_gartnets` (`id`),
  ADD CONSTRAINT `fk_cus_products_cus_genders` FOREIGN KEY (`genders_id`) REFERENCES `cus_genders` (`id`),
  ADD CONSTRAINT `fk_cus_products_cus_product_types1` FOREIGN KEY (`product_types_id`) REFERENCES `cus_product_types` (`id`),
  ADD CONSTRAINT `fk_cus_products_cus_sports1` FOREIGN KEY (`sports_id`) REFERENCES `cus_sports` (`id`);

--
-- Constraints for table `cus_products_assets`
--
ALTER TABLE `cus_products_assets`
  ADD CONSTRAINT `fk_cus_products_assets_cus_products1` FOREIGN KEY (`product_id`) REFERENCES `cus_products` (`id`);

--
-- Constraints for table `saf_cms`
--
ALTER TABLE `saf_cms`
  ADD CONSTRAINT `fk_saf_cms_auth_users1` FOREIGN KEY (`user_id`) REFERENCES `auth_users` (`id`);

--
-- Constraints for table `saf_questions`
--
ALTER TABLE `saf_questions`
  ADD CONSTRAINT `fk_saf_questions_auth_users1` FOREIGN KEY (`user_id`) REFERENCES `auth_users` (`id`);

--
-- Constraints for table `saf_settings`
--
ALTER TABLE `saf_settings`
  ADD CONSTRAINT `fk_saf_settings_auth_users1` FOREIGN KEY (`user_id`) REFERENCES `auth_users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
