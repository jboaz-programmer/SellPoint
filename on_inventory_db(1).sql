-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 29, 2025 at 03:51 PM
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
-- Database: `on_inventory_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(11) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT '1',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `branch_name`, `location`, `status`, `created_at`) VALUES
(1, 'Main Branc', 'Dar Es Salaam', '1', '2025-07-15 14:08:02'),
(2, 'Manzese shop', 'Manzese', '1', '2025-07-15 14:08:34');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('hmk4r2681j2fj8jtulrcuk8gkqv8qe01', '127.0.0.1', 1755675604, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353637353630343b63757272656e63797c733a333a22545a53223b63757272656e63795f706c6163656d656e747c733a343a224c656674223b63757272656e63795f636f64657c733a333a22545a53223b766965775f646174657c733a31303a2264642d6d6d2d79797979223b766965775f74696d657c733a323a223132223b);

-- --------------------------------------------------------

--
-- Table structure for table `db_account_header`
--

CREATE TABLE `db_account_header` (
  `id` int(11) NOT NULL,
  `ac_code` varchar(255) NOT NULL,
  `ac_name` varchar(255) NOT NULL,
  `ac_memo` text NOT NULL,
  `opening_balance` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `derbit` int(11) NOT NULL,
  `new_balance` int(11) NOT NULL,
  `updated_at` date NOT NULL,
  `status` int(11) DEFAULT 1,
  `main_id` int(11) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `db_account_header`
--

INSERT INTO `db_account_header` (`id`, `ac_code`, `ac_name`, `ac_memo`, `opening_balance`, `credit`, `derbit`, `new_balance`, `updated_at`, `status`, `main_id`, `created_at`) VALUES
(5, 'SA01', 'SALES', '', 0, 0, 0, 0, '2021-02-18', 1, 5, '2021-02-18'),
(6, 'AR01', 'ACCOUNTS RECEIVABLE', '', 50000, 50000, 135500, -85500, '2021-02-18', 1, 4, '2021-02-18'),
(7, 'IN', 'INVENTORY', '', 120000, 120000, 0, 120000, '2021-02-18', 1, 5, '2021-02-18'),
(9, 'Ba01', 'Bank', '', 2000000, 0, 0, 2000000, '2021-02-18', 1, 5, '2021-02-18'),
(10, 'PA001', 'PURCHASES', '', 100000, 100000, 0, 100000, '2021-02-18', 1, 8, '2021-02-18');

-- --------------------------------------------------------

--
-- Table structure for table `db_account_main`
--

CREATE TABLE `db_account_main` (
  `id` int(11) NOT NULL,
  `ac_title` varchar(255) NOT NULL,
  `ac_code` varchar(255) NOT NULL,
  `ac_number` varchar(255) NOT NULL,
  `ac_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `db_account_main`
--

INSERT INTO `db_account_main` (`id`, `ac_title`, `ac_code`, `ac_number`, `ac_type`) VALUES
(4, 'NON- CURRENT ASSETS', '001', '001', 'Asset'),
(5, 'CURRENT ASSETS', '002', '002', 'Asset'),
(6, 'EQUITY', '003', '003', 'Equity'),
(7, 'NON - CURRENT LIABILITIES', '004', '004', 'Liability'),
(8, 'CURRENT LIABILITIES', '005', '005', 'Liability');

-- --------------------------------------------------------

--
-- Table structure for table `db_brands`
--

CREATE TABLE `db_brands` (
  `id` int(5) NOT NULL,
  `brand_code` varchar(50) DEFAULT NULL,
  `brand_name` varchar(100) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_brands`
--

INSERT INTO `db_brands` (`id`, `brand_code`, `brand_name`, `description`, `company_id`, `status`) VALUES
(24, NULL, 'AZANIA', '', NULL, 1),
(25, NULL, 'TOSS', '', NULL, 1),
(26, NULL, 'RUNGU', '', NULL, 1),
(27, NULL, 'HIT', '', NULL, 1),
(28, NULL, 'BROWN SUGAR', '', NULL, 1),
(29, NULL, 'IKRAAM', '', NULL, 1),
(30, NULL, 'NEEL', '', NULL, 1),
(31, NULL, 'PRESTIGE', '', NULL, 1),
(32, NULL, 'REDGOLD &amp; KING', '', NULL, 1),
(33, NULL, 'LACTOGEN', '', NULL, 1),
(34, NULL, 'NIDO', '', NULL, 1),
(35, NULL, 'AL MUDHISH', '', NULL, 1),
(36, NULL, 'AFRICAFE', '', NULL, 1),
(37, NULL, 'BLUE BAND', '', NULL, 1),
(38, NULL, 'KIMBO', '', NULL, 1),
(39, NULL, 'DETTOL', '', NULL, 1),
(40, NULL, 'REDGOLD', '', NULL, 1),
(41, NULL, 'GSM', '', NULL, 1),
(42, NULL, 'ROYCO', '', NULL, 1),
(43, NULL, 'HOBBY', '', NULL, 1),
(44, NULL, 'DEXI', '', NULL, 1),
(45, NULL, 'BIOX', '', NULL, 1),
(46, NULL, 'PRINGLES', '', NULL, 1),
(47, NULL, 'BEEF MASALA', '', NULL, 1),
(48, NULL, 'ALFA', '', NULL, 1),
(49, NULL, 'KORIE', '', NULL, 1),
(50, NULL, 'HALISI', '', NULL, 1),
(51, NULL, 'MINARA', '', NULL, 1),
(52, NULL, 'PARACHUTE', '', NULL, 1),
(53, NULL, 'BODY LUXE', '', NULL, 1),
(54, NULL, 'AZAM P.P.F', '', NULL, 1),
(55, NULL, 'AZAM FLOUR ', '', NULL, 1),
(56, NULL, 'TROPICAL HEAT', '', NULL, 1),
(57, NULL, 'NANDI', '', NULL, 1),
(58, NULL, 'CHAPA MANDASHI', '', NULL, 1),
(59, NULL, 'SKALA', '', NULL, 1),
(60, NULL, 'BABYCARE', '', NULL, 1),
(61, NULL, 'BOSS', '', NULL, 1),
(62, NULL, 'HERBAL', '', NULL, 1),
(63, NULL, 'VASELINE', '', NULL, 1),
(64, NULL, 'AFROCARE', '', NULL, 1),
(65, NULL, 'VESTLINE', '', NULL, 1),
(66, NULL, 'MAMA TIK TOK', '', NULL, 1),
(67, NULL, 'EET-SUM MORE', '', NULL, 1),
(68, NULL, 'LOYAL CREAM', '', NULL, 1),
(69, NULL, 'BOURBON', '', NULL, 1),
(70, NULL, 'ALPELLA', '', NULL, 1),
(71, NULL, 'BREAK DELIGHT', '', NULL, 1),
(72, NULL, 'SNIKKER', '', NULL, 1),
(73, NULL, 'RUBYS MAGIC', '', NULL, 1),
(74, NULL, 'FIORY', '', NULL, 1),
(75, NULL, 'GETFRESH', '', NULL, 1),
(76, NULL, 'KING', '', NULL, 1),
(77, NULL, 'BUBLISH', '', NULL, 1),
(78, NULL, 'CHAI BORA', '', NULL, 1),
(79, NULL, 'KILIMANJARO', '', NULL, 1),
(80, NULL, 'AFRCAN PRIDE', '', NULL, 1),
(81, NULL, 'GREEN LABEL', '', NULL, 1),
(82, NULL, 'MAQ', '', NULL, 1),
(83, NULL, 'HQ', '', NULL, 1),
(84, NULL, 'SOFTCARE', '', NULL, 1),
(85, NULL, 'BREEZE', '', NULL, 1),
(86, NULL, 'LAVY', '', NULL, 1),
(87, NULL, 'OMO', '', NULL, 1),
(88, NULL, 'ROYAL', '', NULL, 1),
(89, NULL, 'SLEEPS', '', NULL, 1),
(90, NULL, 'MINA', '', NULL, 1),
(91, NULL, 'SUPERSOFT', '', NULL, 1),
(92, NULL, 'NAPTKIN', '', NULL, 1),
(93, NULL, 'CATHY', '', NULL, 1),
(94, NULL, 'BABY CHICK', '', NULL, 1),
(95, NULL, 'MARAHABA', '', NULL, 1),
(96, NULL, 'DOFI', '', NULL, 1),
(97, NULL, 'ARIEL', '', NULL, 1),
(98, NULL, 'NICEONE', '', NULL, 1),
(99, NULL, 'JAMAA', '', NULL, 1),
(100, NULL, 'WHITE WASH', '', NULL, 1),
(101, NULL, 'MAGADI', '', NULL, 1),
(102, NULL, 'ALOVERA', '', NULL, 1),
(103, NULL, 'MO', '', NULL, 1),
(104, NULL, 'FAMILY', '', NULL, 1),
(105, NULL, 'DESTENI', '', NULL, 1),
(106, NULL, 'VIM', '', NULL, 1),
(107, NULL, 'TETMOSO', '', NULL, 1),
(108, NULL, 'PROTEX', '', NULL, 1),
(109, NULL, 'IMPERIAL', '', NULL, 1),
(110, NULL, 'PEARS', '', NULL, 1),
(111, NULL, 'LIFE BUOY', '', NULL, 1),
(112, NULL, 'DRS', '', NULL, 1),
(113, NULL, 'COLGATE', '', NULL, 1),
(114, NULL, 'WHITEDENT', '', NULL, 1),
(115, NULL, 'TOILET PAPER ', '', NULL, 1),
(116, NULL, 'DOVE', '', NULL, 1),
(117, NULL, 'JIK', '', NULL, 1),
(118, NULL, 'COVEX', '', NULL, 1),
(119, NULL, 'FRESH DOCTOR', '', NULL, 1),
(120, NULL, 'DENTAL FLOSS', '', NULL, 1),
(121, NULL, 'Brand 1', '', NULL, 1),
(122, NULL, 'Brand 2', '', NULL, 1),
(123, NULL, 'Brand 3', '', NULL, 1),
(124, NULL, 'Brand 4', '', NULL, 1),
(125, NULL, 'Brand 5', '', NULL, 1),
(126, NULL, 'Oil', '', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_category`
--

CREATE TABLE `db_category` (
  `id` int(5) NOT NULL,
  `category_code` varchar(50) DEFAULT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_category`
--

INSERT INTO `db_category` (`id`, `category_code`, `category_name`, `description`, `company_id`, `status`) VALUES
(15, 'CT0001', 'VINYWAJI', '', NULL, 1),
(16, 'CT0016', 'VIMIMINIKA', '', NULL, 1),
(17, 'CT0017', 'NAFAKA', '', NULL, 1),
(18, 'CT0018', 'SOAP', '', NULL, 1),
(19, 'CT0019', 'FOOD &amp; BEVARAGES', '', NULL, 1),
(20, 'CT0020', 'SNACKS', '', NULL, 1),
(21, 'CT0021', 'PERSONAL CARE', '', NULL, 1),
(22, 'CT0022', 'BABY CARE', '', NULL, 1),
(23, 'CT0023', 'Category 1', '', NULL, 1),
(24, 'CT0024', 'Category 2', '', NULL, 1),
(25, 'CT0025', 'Category 3', '', NULL, 1),
(26, 'CT0026', 'Category 4', '', NULL, 1),
(27, 'CT0027', 'Category 5', '', NULL, 1),
(28, 'CT0028', 'Sabuni', '', NULL, 1),
(29, 'CT0029', 'Oil', '', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_cobpayments`
--

CREATE TABLE `db_cobpayments` (
  `id` int(5) NOT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `payment` double(20,2) DEFAULT NULL,
  `payment_note` mediumtext DEFAULT NULL,
  `system_ip` varchar(50) DEFAULT NULL,
  `system_name` varchar(50) DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_company`
--

CREATE TABLE `db_company` (
  `id` int(5) DEFAULT NULL,
  `company_code` varchar(150) DEFAULT NULL,
  `company_name` varchar(150) DEFAULT NULL,
  `company_website` varchar(150) DEFAULT NULL,
  `mobile` varchar(150) DEFAULT NULL,
  `phone` varchar(150) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(250) DEFAULT NULL,
  `company_logo` text DEFAULT NULL,
  `logo` mediumtext DEFAULT NULL,
  `upi_id` varchar(50) DEFAULT NULL,
  `upi_code` text DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `state` varchar(150) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `postcode` varchar(50) DEFAULT NULL,
  `gst_no` varchar(50) DEFAULT NULL,
  `vat_no` varchar(50) DEFAULT NULL,
  `pan_no` varchar(50) DEFAULT NULL,
  `bank_details` mediumtext DEFAULT NULL,
  `cid` int(10) DEFAULT NULL,
  `category_init` varchar(5) DEFAULT NULL,
  `item_init` varchar(5) DEFAULT NULL COMMENT 'INITAL CODE',
  `supplier_init` varchar(5) DEFAULT NULL COMMENT 'INITAL CODE',
  `purchase_init` varchar(5) DEFAULT NULL COMMENT 'INITAL CODE',
  `purchase_return_init` varchar(5) DEFAULT NULL,
  `customer_init` varchar(5) DEFAULT NULL COMMENT 'INITAL CODE',
  `sales_init` varchar(5) DEFAULT NULL COMMENT 'INITAL CODE',
  `sales_return_init` varchar(5) DEFAULT NULL,
  `expense_init` varchar(5) DEFAULT NULL,
  `invoice_view` int(5) DEFAULT NULL COMMENT '1=Standard,2=Indian GST',
  `status` int(1) DEFAULT NULL,
  `sms_status` int(1) DEFAULT NULL COMMENT '1=Enable 0=Disable',
  `sales_terms_and_conditions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_company`
--

INSERT INTO `db_company` (`id`, `company_code`, `company_name`, `company_website`, `mobile`, `phone`, `email`, `website`, `company_logo`, `logo`, `upi_id`, `upi_code`, `country`, `state`, `city`, `address`, `postcode`, `gst_no`, `vat_no`, `pan_no`, `bank_details`, `cid`, `category_init`, `item_init`, `supplier_init`, `purchase_init`, `purchase_return_init`, `customer_init`, `sales_init`, `sales_return_init`, `expense_init`, `invoice_view`, `status`, `sms_status`, `sales_terms_and_conditions`) VALUES
(1, '', 'G&amp;F RETAIL STORE', NULL, '0747519075', '0747519075', 'rashidabdullah437@gmail.com', 'https://truenorthmarketing.co.tz/', 'inventory(1).jpg', 'logo-0.png', '', NULL, 'Tanzania', 'Tanzania', 'Dar es Salaam', 'Kijichi', '', '', '', '', '', 1, 'CT', 'IT', 'SP', 'PU', 'PR', 'CU', 'SL', 'PR', 'EX', 1, 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `db_country`
--

CREATE TABLE `db_country` (
  `id` int(5) NOT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `country` varchar(4050) DEFAULT NULL,
  `added_on` date DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_country`
--

INSERT INTO `db_country` (`id`, `country_code`, `country`, `added_on`, `company_id`, `status`) VALUES
(2, NULL, 'USA', NULL, NULL, 1),
(4, NULL, 'Tanzania', NULL, NULL, 1),
(5, NULL, 'Indonesia', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_currency`
--

CREATE TABLE `db_currency` (
  `id` int(5) NOT NULL,
  `currency_name` varchar(50) DEFAULT NULL,
  `currency_code` varchar(20) DEFAULT NULL,
  `currency` blob DEFAULT NULL,
  `symbol` mediumtext DEFAULT NULL,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_currency`
--

INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES
(1, 'Bulgaria-Bulgarian lev(BGN)', NULL, 0xd0bbd0b2, NULL, 1),
(2, 'Switzerland \r-Swiss franc (CHF)', NULL, 0x434846, NULL, 1),
(3, 'Czechia-Czech koruna(CZK))', NULL, 0x4bc48d20, NULL, 1),
(4, 'Denmark-Danish krone(DKK)', NULL, 0x6b7220, NULL, 1),
(5, 'Euro area countries -Euro(EUR)', NULL, 0xe282ac20, NULL, 1),
(6, 'United Kingdom-Pounds sterling (GBP)', NULL, 0xc2a3, NULL, 1),
(7, 'Croatia -Croatian Kuna (HRK)', NULL, 0x6b6e, NULL, 1),
(8, 'Georgia -Georgian lari (GEL)', NULL, 0x2623383338323b, NULL, 1),
(9, 'Hungary -Hungarian forint (HUF)', NULL, 0x6674, NULL, 1),
(10, 'Norway -Norwegian krone (NOK)', NULL, 0x6b72, NULL, 1),
(11, 'Poland -Polish zloty (PLN)', NULL, 0x7ac58220, NULL, 1),
(12, 'Russia -Russian ruble (RUB)', NULL, 0x2623383338313b20, NULL, 1),
(13, 'Romania -Romanian leu (RON)', NULL, 0x6c6569, NULL, 1),
(14, 'Sweden - Swedish krona (SEK)', NULL, 0x6b72, NULL, 1),
(15, 'Turkey -Turkish lira (TRY)', NULL, 0x2623383337383b20, NULL, 1),
(16, 'Ukraine - Ukrainian hryvna  (UAH)', NULL, 0xe282b420, NULL, 1),
(17, 'UAE -Emirati dirham (AED)', NULL, 0xd8af2ed8a520, NULL, 1),
(18, 'Israel - Israeli shekel (ILS)', NULL, 0x2623383336323b20, NULL, 1),
(19, 'Kenya - Kenyan shilling(KES)', NULL, 0x4b7368, NULL, 1),
(20, 'Morocco - Moroccan dirham (MAD)', NULL, 0x2ed8af2ed98520, NULL, 1),
(21, 'Nigeria - Nigerian naira (NGN)', NULL, 0xe282a620, NULL, 1),
(22, 'South Africa -South african rand** (ZAR)', NULL, 0x52, NULL, 1),
(23, 'Brazil- Brazilian real(BRL)', NULL, 0x5224, NULL, 1),
(24, 'Canada-Canadian dollars (CAD)', NULL, 0x24, NULL, 1),
(25, 'Chile -Chilean peso (CLP)', NULL, 0x24, NULL, 1),
(26, 'Colombia -Colombian peso (COP)', NULL, 0x24, NULL, 1),
(27, 'Mexico - Mexican peso (MXN)', NULL, 0x24, NULL, 1),
(28, 'Peru -Peruvian sol(PEN)', NULL, 0x532f2e20, NULL, 1),
(29, 'USA -US dollar (USD)', NULL, 0x24, NULL, 1),
(30, 'Australia -Australian dollars (AUD)', NULL, 0x24, NULL, 1),
(31, 'Bangladesh -Bangladeshi taka (BDT) ', NULL, 0x2623323534373b20, NULL, 1),
(32, 'China - Chinese yuan (CNY)', NULL, 0x262332303830333b20, NULL, 1),
(33, 'Hong Kong - Hong Kong dollar(HKD)', NULL, 0x262333363b20, NULL, 1),
(34, 'Indonesia - Indonesian rupiah (IDR)', NULL, 0x5270, NULL, 1),
(35, 'India - Indian rupee', 'INR', 0xe282b9, '?', 1),
(36, 'Japan - Japanese yen (JPY)', NULL, 0xc2a5, NULL, 1),
(37, 'Malaysia - Malaysian ringgit (MYR)', NULL, 0x524d, NULL, 1),
(38, 'New Zealand - New Zealand dollar (NZD)', NULL, 0x24, NULL, 1),
(39, 'Philippines- Philippine peso (PHP)', NULL, 0xe282b120, NULL, 1),
(40, 'Pakistan- Pakistani rupee (PKR)', NULL, 0x527320, NULL, 1),
(41, 'Singapore - Singapore dollar (SGD)', NULL, 0x24, NULL, 1),
(42, 'South Korea - South Korean won (KRW)', NULL, 0x2623383336313b20, NULL, 1),
(43, 'Sri Lanka - Sri Lankan rupee (LKR)', NULL, 0x5273, NULL, 1),
(44, 'Thailand- Thai baht (THB)', NULL, 0x2623333634373b20, NULL, 1),
(45, 'Vietnam - Vietnamese dong', 'VND', 0xe282ab, NULL, 1),
(46, 'Bitcoin - BTC or XBT', 'BTC ', 0xe282bf, NULL, 1),
(47, 'Ripples', 'XRP', 0x585250, NULL, 1),
(48, 'Monero', 'XMR', 0xc9b1, NULL, 1),
(49, 'Litecoin', 'LTC', 0xc581, NULL, 1),
(50, 'Ethereum', 'ETH', 0xce9e, NULL, 1),
(51, 'Euro', 'EUR', 0xe282ac, NULL, 1),
(52, 'Pounds sterling', 'GBP', 0xc2a3, NULL, 1),
(53, 'US dollar', 'USD', 0x24, NULL, 1),
(54, 'Japanese yen', 'JPY', 0xc2a5, NULL, 1),
(55, 'Omani rial', 'OMR', 0xd8b12ed8b92e, NULL, 1),
(56, 'Tanzania Shilings', 'TZS', 0x545a53, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_customers`
--

CREATE TABLE `db_customers` (
  `id` int(5) NOT NULL,
  `customer_code` varchar(20) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gstin` varchar(100) DEFAULT NULL,
  `tax_number` varchar(50) DEFAULT NULL,
  `vatin` varchar(100) DEFAULT NULL,
  `opening_balance` double(20,2) DEFAULT NULL,
  `sales_due` double(20,2) DEFAULT NULL,
  `sales_return_due` double(20,2) DEFAULT NULL,
  `country_id` varchar(50) DEFAULT NULL,
  `state_id` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `system_ip` varchar(50) DEFAULT NULL,
  `system_name` varchar(50) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(30) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_customers`
--

INSERT INTO `db_customers` (`id`, `customer_code`, `customer_name`, `mobile`, `phone`, `email`, `gstin`, `tax_number`, `vatin`, `opening_balance`, `sales_due`, `sales_return_due`, `country_id`, `state_id`, `city`, `postcode`, `address`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `company_id`, `status`) VALUES
(1, 'CU0001', 'Walk-in customer', '', '', '', '', '', NULL, NULL, 0.00, 0.00, '', '', NULL, '', '', NULL, NULL, '2019-01-01', '10:55:54 pm', 'admin', NULL, 1),
(75, 'CU0002', 'jimmy', '0755225522', '', '', '', '', NULL, 0.00, NULL, NULL, '4', NULL, '', '', '', '127.0.0.1', 'localhost', '2025-07-22', '05:03:39 pm', 'admin', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_customer_payments`
--

CREATE TABLE `db_customer_payments` (
  `id` int(5) NOT NULL,
  `salespayment_id` int(5) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `payment` double(20,2) DEFAULT NULL,
  `payment_note` text DEFAULT NULL,
  `system_ip` varchar(50) DEFAULT NULL,
  `system_name` varchar(50) DEFAULT NULL,
  `created_time` varchar(50) DEFAULT NULL,
  `created_date` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `db_customer_payments`
--

INSERT INTO `db_customer_payments` (`id`, `salespayment_id`, `customer_id`, `payment_date`, `payment_type`, `payment`, `payment_note`, `system_ip`, `system_name`, `created_time`, `created_date`, `created_by`, `status`) VALUES
(177, 26, 1, '2025-07-14', 'Cash', 100.00, '', '127.0.0.1', 'localhost', '02:12:25', '2025-07-14', 'admin', 1),
(178, 27, 1, '2025-07-24', 'Cash', 3500.00, '', '127.0.0.1', 'localhost', '05:13:16', '2025-07-24', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_expense`
--

CREATE TABLE `db_expense` (
  `id` int(5) NOT NULL,
  `expense_code` varchar(50) DEFAULT NULL,
  `category_id` int(5) DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `expense_for` varchar(100) DEFAULT NULL,
  `expense_amt` double(20,2) DEFAULT NULL,
  `note` mediumtext DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) DEFAULT NULL,
  `system_ip` varchar(50) DEFAULT NULL,
  `system_name` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_expense_category`
--

CREATE TABLE `db_expense_category` (
  `id` int(5) NOT NULL,
  `category_code` varchar(50) DEFAULT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `account_head` int(11) NOT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_expense_category`
--

INSERT INTO `db_expense_category` (`id`, `category_code`, `category_name`, `description`, `created_by`, `account_head`, `status`) VALUES
(2, 'EC0002', 'Supplier', 'Add cost for supplier', 'admin', 2, 1),
(3, 'EC0003', 'SALARIES &amp; WAGES', 'Kwaajili ya malipo ya wafanyakazi', 'admin', 1, 1),
(4, 'EC0004', 'parking expense', '', 'AHIL VELLANI', 0, 1),
(5, 'EC0005', 'fuel expenses', '', 'AHIL VELLANI', 0, 1),
(6, 'EC0006', 'lunch expenses', '', 'AHIL VELLANI', 0, 1),
(7, 'EC0007', 'vouchers', '', 'AHIL VELLANI', 0, 1),
(8, 'EC0008', 'TONY PERSONAL ( LOANS )', '', 'AHIL VELLANI', 0, 1),
(9, 'EC0009', 'salarys', '', 'AHIL VELLANI', 0, 1),
(10, 'EC0010', 'upcountry visits', '', 'AHIL VELLANI', 0, 1),
(11, 'EC0011', 'profit from 40 citrus', '', 'AHIL VELLANI', 0, 1),
(12, 'EC0012', 'Transportation allowances', '', 'ANISIA', 0, 1),
(13, 'EC0013', 'stationary', 'office expense', 'admin', 10, 1),
(14, 'EC0014', 'Toroli', 'Expenses', 'admin', 6, 1),
(15, 'EC0015', 'Sabasaba', 'Expenses', 'admin', 6, 1),
(16, 'EC0016', 'Luku', 'Electrical Bills', 'admin', 6, 1),
(17, 'EC0017', 'Food &amp; Beverage', '', 'admin', 6, 1),
(18, 'EC0018', 'Transporter', '', 'admin', 6, 1),
(19, 'EC0019', 'Government', '', 'admin', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_hold`
--

CREATE TABLE `db_hold` (
  `id` int(5) NOT NULL,
  `reference_id` varchar(50) DEFAULT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `sales_status` varchar(50) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,2) DEFAULT NULL,
  `discount_to_all_input` double(20,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,2) DEFAULT NULL,
  `subtotal` double(20,2) DEFAULT NULL,
  `round_off` double(20,2) DEFAULT NULL,
  `grand_total` double(20,2) DEFAULT NULL,
  `sales_note` text DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_holditems`
--

CREATE TABLE `db_holditems` (
  `id` int(5) NOT NULL,
  `hold_id` int(5) DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sales_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,2) DEFAULT NULL,
  `tax_type` varchar(50) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,2) DEFAULT NULL,
  `discount_type` varchar(50) DEFAULT NULL,
  `discount_input` double(20,2) DEFAULT NULL,
  `discount_amt` double(20,2) DEFAULT NULL,
  `unit_total_cost` double(20,2) DEFAULT NULL,
  `total_cost` double(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_items`
--

CREATE TABLE `db_items` (
  `id` int(5) NOT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `custom_barcode` varchar(100) DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `hsn` varbinary(50) DEFAULT NULL,
  `unit_id` int(10) DEFAULT NULL,
  `alert_qty` int(10) DEFAULT NULL,
  `brand_id` int(5) DEFAULT NULL,
  `lot_number` varchar(50) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `price` double(20,2) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `purchase_price` double(20,2) DEFAULT NULL,
  `tax_type` varchar(50) DEFAULT NULL,
  `profit_margin` double(20,2) DEFAULT NULL,
  `sales_price` double(20,2) DEFAULT NULL,
  `final_price` double(20,2) DEFAULT NULL,
  `stock` double(20,2) DEFAULT NULL,
  `item_image` mediumtext DEFAULT NULL,
  `system_ip` varchar(50) DEFAULT NULL,
  `system_name` varchar(50) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_items`
--

INSERT INTO `db_items` (`id`, `item_code`, `custom_barcode`, `item_name`, `description`, `category_id`, `sku`, `hsn`, `unit_id`, `alert_qty`, `brand_id`, `lot_number`, `expire_date`, `price`, `tax_id`, `purchase_price`, `tax_type`, `profit_margin`, `sales_price`, `final_price`, `stock`, `item_image`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `company_id`, `branch_id`, `status`) VALUES
(1, 'IT0001', '0', 'KING LIMAU', NULL, 18, '', '', 9, 5, 24, '', NULL, 3166.67, 3, 3166.67, 'Inclusive', NULL, 4500.00, 4500.00, 11.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(2, 'IT0002', '0', 'TOSS', NULL, 18, '', '', 9, 5, 25, '', NULL, 3666.67, 3, 3666.67, 'Inclusive', NULL, 5000.00, 5000.00, 11.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(3, 'IT0003', '0', 'RUNGU KUBWA', NULL, 16, '', '', 9, 5, 26, '', NULL, 7583.33, 3, 7583.33, 'Inclusive', NULL, 8500.00, 8500.00, 5.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(4, 'IT0004', '0', 'RUNGU NDOGO', NULL, 16, '', '', 9, 5, 26, '', NULL, 5083.33, 3, 5083.33, 'Inclusive', NULL, 6000.00, 6000.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(5, 'IT0005', '0', 'HIT NDOGO', NULL, 16, '', '', 9, 5, 27, '', NULL, 5083.33, 3, 5083.33, 'Inclusive', NULL, 6000.00, 6000.00, 5.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(6, 'IT0006', '0', 'SUKARI PACTI', NULL, 17, '', '', 9, 5, 28, '', NULL, 2700.00, 3, 2700.00, 'Inclusive', NULL, 3000.00, 3000.00, 20.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(7, 'IT0007', '0', 'ALIZETI OIL 3LT', NULL, 16, '', '', 9, 5, 29, '', NULL, 19166.67, 3, 19166.67, 'Inclusive', NULL, 21000.00, 21000.00, 5.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(8, 'IT0008', '0', 'CHUMVI KUBWA', NULL, 17, '', '', 9, 5, 30, '', NULL, 433.33, 3, 433.33, 'Inclusive', NULL, 500.00, 500.00, 29.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(9, 'IT0009', '0', 'CHUMVI NDOGO', NULL, 17, '', '', 9, 5, 30, '', NULL, 183.33, 3, 183.33, 'Inclusive', NULL, 200.00, 200.00, 23.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(10, 'IT0010', '0', 'PRESTIGE 1KG', NULL, 19, '', '', 9, 5, 31, '', NULL, 7500.00, 3, 7500.00, 'Inclusive', NULL, 8500.00, 8500.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(11, 'IT0011', '0', 'PRESTIGE 500GM', NULL, 19, '', '', 9, 5, 31, '', NULL, 3333.33, 3, 3333.33, 'Inclusive', NULL, 5500.00, 5500.00, 8.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(12, 'IT0012', '0', 'PRESTIGE 250GM', NULL, 19, '', '', 9, 5, 31, '', NULL, 2500.00, 3, 2500.00, 'Inclusive', NULL, 3500.00, 3500.00, 8.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(13, 'IT0013', '0', 'TOMATO DUMU', NULL, 19, '', '', 9, 4, 32, '', NULL, 4000.00, 3, 4000.00, 'Inclusive', NULL, 4500.00, 4500.00, 7.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(14, 'IT0014', '0', 'TOMATO &amp; CHILLI KOPO', NULL, 19, '', '', 9, 5, 32, '', NULL, 1250.00, 3, 1250.00, 'Inclusive', NULL, 1500.00, 1500.00, 7.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(15, 'IT0015', '0', 'MAZIWA YA KOPO', NULL, 19, '', '', 9, 9, 33, '', NULL, 13333.33, 3, 13333.33, 'Inclusive', NULL, 16000.00, 16000.00, 5.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(16, 'IT0016', '0', 'MAZIWA YA KOPO', NULL, 19, '', '', 9, 6, 34, '', NULL, 15000.00, 3, 15000.00, 'Inclusive', NULL, 17000.00, 17000.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(17, 'IT0017', '0', 'MAZIWA YA KOPO', NULL, 19, '', '', 9, 6, 35, '', NULL, 9166.67, 3, 9166.67, 'Inclusive', NULL, 12000.00, 12000.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(18, 'IT0018', '0', 'KAHAWA 100GM', NULL, 19, '', '', 9, 5, 36, '', NULL, 10583.33, 3, 10583.33, 'Inclusive', NULL, 11500.00, 11500.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(19, 'IT0019', '0', 'KAHAWA 50GM', NULL, 19, '', '', 9, 5, 36, '', NULL, 6083.33, 3, 6083.33, 'Inclusive', NULL, 7000.00, 7000.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(20, 'IT0020', '0', 'BLUE BAND 500GM', NULL, 19, '', '', 9, 6, 37, '', NULL, 5666.67, 3, 5666.67, 'Inclusive', NULL, 6500.00, 6500.00, 4.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(21, 'IT0021', '0', 'BLUE BAND 250GM', NULL, 19, '', '', 9, 12, 37, '', NULL, 3166.67, 3, 3166.67, 'Inclusive', NULL, 3500.00, 3500.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(22, 'IT0022', '0', 'BLUE BAND 100GM', NULL, 19, '', '', 9, 12, 37, '', NULL, 1000.00, 3, 1000.00, 'Inclusive', NULL, 1500.00, 1500.00, 29.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(23, 'IT0023', '0', 'KIMBO', NULL, 19, '', '', 9, 12, 38, '', NULL, 3750.00, 3, 3750.00, 'Inclusive', NULL, 4000.00, 4000.00, 11.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(24, 'IT0024', '0', 'DETTOL 500ML', NULL, 18, '', '', 9, 5, 39, '', NULL, 7916.67, 3, 7916.67, 'Inclusive', NULL, 8500.00, 8500.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(25, 'IT0025', '0', 'DETTOL 250ML', NULL, 18, '', '', 9, 5, 39, '', NULL, 5333.33, 3, 5333.33, 'Inclusive', NULL, 6000.00, 6000.00, 4.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(26, 'IT0026', '0', 'TOMATO PACTI', NULL, 19, '', '', 9, 5, 40, '', NULL, 266.67, 3, 266.67, 'Inclusive', NULL, 500.00, 500.00, 24.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(27, 'IT0027', '0', 'NAZI PACTI', NULL, 16, '', '', 9, 5, 41, '', NULL, 833.33, 3, 833.33, 'Inclusive', NULL, 1000.00, 1000.00, 32.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(28, 'IT0028', '0', 'ROYCO KOPO', NULL, 19, '', '', 9, 5, 42, '', NULL, 2266.67, 3, 2266.67, 'Inclusive', NULL, 2500.00, 2500.00, 22.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(29, 'IT0029', '0', 'HAND WASH', NULL, 16, '', '', 9, 5, 43, '', NULL, 2708.33, 3, 2708.33, 'Inclusive', NULL, 3500.00, 3500.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(30, 'IT0030', '0', 'HAND WASH', NULL, 16, '', '', 9, 5, 44, '', NULL, 1875.00, 3, 1875.00, 'Inclusive', NULL, 2500.00, 2500.00, 7.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(31, 'IT0031', '0', 'HAND WASH', NULL, 16, '', '', 9, 5, 45, '', NULL, 1875.00, 3, 1875.00, 'Inclusive', NULL, 2500.00, 2500.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(32, 'IT0032', '0', 'PRINGLES', NULL, 17, '', '', 9, 5, 46, '', NULL, 2583.33, 3, 2583.33, 'Inclusive', NULL, 3500.00, 3500.00, 9.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(33, 'IT0033', '0', 'JAM', NULL, 19, '', '', 9, 5, 40, '', NULL, 2750.00, 3, 2750.00, 'Inclusive', NULL, 3500.00, 3500.00, 11.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(34, 'IT0034', '0', 'BEEF &amp; FISH MASALA', NULL, 17, '', '', 9, 5, 47, '', NULL, 2500.00, 3, 2500.00, 'Inclusive', NULL, 3000.00, 3000.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(35, 'IT0035', '0', 'MAYONNAISE', NULL, 16, '', '', 9, 5, 48, '', NULL, 5000.00, 3, 5000.00, 'Inclusive', NULL, 6000.00, 6000.00, 5.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(36, 'IT0036', '0', 'MAFUTA 5L', NULL, 16, '', '', 9, 5, 49, '', NULL, 24250.00, 3, 24250.00, 'Inclusive', NULL, 28000.00, 28000.00, 4.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(37, 'IT0037', '0', 'MAFUTA 3L', NULL, 16, '', '', 9, 5, 49, '', NULL, 16333.33, 3, 16333.33, 'Inclusive', NULL, 18000.00, 18000.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(38, 'IT0038', '0', 'MAFUTA 1L', NULL, 16, '', '', 9, 5, 49, '', NULL, 5166.67, 3, 5166.67, 'Inclusive', NULL, 5500.00, 5500.00, 10.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(39, 'IT0039', '0', 'MAFUTA NAZI 150ML', NULL, 16, '', '', 9, 5, 50, '', NULL, 1333.33, 3, 1333.33, 'Inclusive', NULL, 1500.00, 1500.00, 20.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(40, 'IT0040', '0', 'MAFUTA NAZI 150ML', NULL, 16, '', '', 9, 5, 51, '', NULL, 1416.67, 3, 1416.67, 'Inclusive', NULL, 2000.00, 2000.00, 11.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(41, 'IT0041', '0', 'MAFUTA NAZI 70ML', NULL, 16, '', '', 9, 5, 50, '', NULL, 583.33, 3, 583.33, 'Inclusive', NULL, 1000.00, 1000.00, 22.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(42, 'IT0042', '0', 'MAFUTA NAZI 500ML', NULL, 16, '', '', 9, 5, 52, '', NULL, 7083.33, 3, 7083.33, 'Inclusive', NULL, 9000.00, 9000.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(43, 'IT0043', '0', 'MAFUTA NAZI 200ML', NULL, 16, '', '', 9, 5, 52, '', NULL, 3000.00, 3, 3000.00, 'Inclusive', NULL, 3500.00, 3500.00, 9.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(44, 'IT0044', '0', 'MAFUTA NAZI 100ML', NULL, 16, '', '', 9, 5, 52, '', NULL, 2166.67, 3, 2166.67, 'Inclusive', NULL, 2500.00, 2500.00, 14.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(45, 'IT0045', '0', 'MAFUTANAZI 50ML', NULL, 16, '', '', 9, 5, 52, '', NULL, 1500.00, 3, 1500.00, 'Inclusive', NULL, 2000.00, 2000.00, 21.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(46, 'IT0046', '0', 'MAFUTA NYWELE 50ML', NULL, 16, '', '', 9, 5, 53, '', NULL, 666.67, 3, 666.67, 'Inclusive', NULL, 1000.00, 1000.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(47, 'IT0047', '0', 'NGANO', NULL, 17, '', '', 9, 5, 54, '', NULL, 1916.67, 3, 1916.67, 'Inclusive', NULL, 2800.00, 2800.00, 19.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(48, 'IT0048', '0', 'NGANO', NULL, 17, '', '', 9, 5, 55, '', NULL, 1500.00, 3, 1500.00, 'Inclusive', NULL, 2000.00, 2000.00, 14.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(49, 'IT0049', '0', 'TEA MASALA KOPO', NULL, 17, '', '', 9, 5, 56, '', NULL, 5666.67, 3, 5666.67, 'Inclusive', NULL, 7000.00, 7000.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(50, 'IT0050', '0', 'VANILLA', NULL, 16, '', '', 9, 5, 57, '', NULL, 1250.00, 3, 1250.00, 'Inclusive', NULL, 2000.00, 2000.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(51, 'IT0051', '0', 'BAKING POWDER', NULL, 17, '', '', 9, 5, 58, '', NULL, 750.00, 3, 750.00, 'Inclusive', NULL, 1000.00, 1000.00, 11.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(52, 'IT0052', '0', 'TEA MASALA PACTI', NULL, 17, '', '', 9, 5, 56, '', NULL, 750.00, 3, 750.00, 'Inclusive', NULL, 1000.00, 1000.00, 23.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(53, 'IT0053', '0', 'MAFUTA KUPAKA 100G', NULL, 16, '', '', 9, 5, 59, '', NULL, 916.67, 3, 916.67, 'Inclusive', NULL, 1000.00, 1000.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(54, 'IT0054', '0', 'MAFUTA KUPAKA 50G', NULL, 16, '', '', 9, 5, 59, '', NULL, 541.67, 3, 541.67, 'Inclusive', NULL, 700.00, 700.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(55, 'IT0055', '0', 'MAFUTA KUPAKA 100G', NULL, 16, '', '', 9, 5, 60, '', NULL, 916.67, 3, 916.67, 'Inclusive', NULL, 1000.00, 1000.00, 11.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(56, 'IT0056', '0', 'MAFUTA KUPAKA 25G', NULL, 16, '', '', 9, 5, 60, '', NULL, 200.00, 3, 200.00, 'Inclusive', NULL, 300.00, 300.00, 10.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(57, 'IT0057', '0', 'MAFUTA KUPAKA 100G', NULL, 16, '', '', 9, 5, 61, '', NULL, 916.67, 3, 916.67, 'Inclusive', NULL, 1000.00, 1000.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(58, 'IT0058', '0', 'MAFUTA KUPAKA 100G', NULL, 16, '', '', 9, 5, 62, '', NULL, 916.67, 3, 916.67, 'Inclusive', NULL, 1000.00, 1000.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(59, 'IT0059', '0', 'MAFUTA KUPAKA 50G', NULL, 16, '', '', 9, 5, 62, '', NULL, 541.67, 3, 541.67, 'Inclusive', NULL, 700.00, 700.00, 10.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(60, 'IT0060', '0', 'MAFUTA KUPAKA 25G', NULL, 16, '', '', 9, 5, 62, '', NULL, 200.00, 3, 200.00, 'Inclusive', NULL, 300.00, 300.00, 24.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(61, 'IT0061', '0', 'MAFUTA KUPAKA 95ML', NULL, 16, '', '', 9, 5, 63, '', NULL, 2500.00, 3, 2500.00, 'Inclusive', NULL, 3000.00, 3000.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(62, 'IT0062', '0', 'MAFUTA KUPAKA 45ML', NULL, 16, '', '', 9, 5, 63, '', NULL, 1666.67, 3, 1666.67, 'Inclusive', NULL, 2000.00, 2000.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(63, 'IT0063', '0', 'MAFUTA KUPAKA 25ML', NULL, 16, '', '', 9, 5, 63, '', NULL, 750.00, 3, 750.00, 'Inclusive', NULL, 1000.00, 1000.00, 23.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(64, 'IT0064', '0', 'MAFUTA KUPAKA 25G', NULL, 16, '', '', 9, 5, 64, '', NULL, 200.00, 3, 200.00, 'Inclusive', NULL, 300.00, 300.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(65, 'IT0065', '0', 'MAFUTA KUPAKA 25G', NULL, 16, '', '', 9, 5, 65, '', NULL, 200.00, 3, 200.00, 'Inclusive', NULL, 300.00, 300.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(66, 'IT0066', '0', 'BISCUIT TIK TOK', NULL, 20, '', '', 7, 5, 66, '', NULL, 1791.67, 3, 1791.67, 'Inclusive', NULL, 3000.00, 3000.00, 23.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(67, 'IT0067', '0', 'BISCUIT EETSUM', NULL, 20, '', '', 7, 5, 67, '', NULL, 3916.67, 3, 3916.67, 'Inclusive', NULL, 5500.00, 5500.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(68, 'IT0068', '0', 'BISCUIT LOYAL CREAM', NULL, 20, '', '', 7, 5, 68, '', NULL, 500.00, 3, 500.00, 'Inclusive', NULL, 600.00, 600.00, 14.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(69, 'IT0069', '0', 'CHOCKLATE ALPELLA', NULL, 20, '', '', 9, 5, 70, '', NULL, 555.56, 3, 555.56, 'Inclusive', NULL, 1000.00, 1000.00, 14.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(70, 'IT0070', '0', 'CHOCKLATE BREAK', NULL, 20, '', '', 9, 5, 71, '', NULL, 777.78, 3, 777.78, 'Inclusive', NULL, 1000.00, 1000.00, 9.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(71, 'IT0071', '0', 'CHOCKLATE YUNKERS', NULL, 20, '', '', 9, 5, 72, '', NULL, 833.33, 3, 833.33, 'Inclusive', NULL, 1000.00, 1000.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(72, 'IT0072', '0', 'CHOCKLATE SNIKKERS ', NULL, 20, '', '', 9, 5, 72, '', NULL, 916.67, 3, 916.67, 'Inclusive', NULL, 1500.00, 1500.00, 19.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(73, 'IT0073', '0', 'CHOCKLATE RUBYS', NULL, 20, '', '', 9, 5, 73, '', NULL, 1458.33, 3, 1458.33, 'Inclusive', NULL, 1800.00, 1800.00, 24.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(74, 'IT0074', '0', 'CHOCKLATE FIORY', NULL, 20, '', '', 9, 5, 74, '', NULL, 833.33, 3, 833.33, 'Inclusive', NULL, 1000.00, 1000.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(75, 'IT0075', '0', 'KARANGA GET FRESH', NULL, 20, '', '', 9, 5, 75, '', NULL, 800.00, 3, 800.00, 'Inclusive', NULL, 1300.00, 1300.00, 18.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(76, 'IT0076', '0', 'TOMATO KINGS DUMU 5LIT', NULL, 16, '', '', 9, 5, 76, '', NULL, 4500.00, 3, 4500.00, 'Inclusive', NULL, 4500.00, 4500.00, 8.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(77, 'IT0077', '0', 'BUBLISH PK', NULL, 20, '', '', 9, 5, 77, '', NULL, 500.00, 3, 500.00, 'Inclusive', NULL, 1000.00, 1000.00, 60.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(78, 'IT0078', '0', 'BUBLISH PK NDOGO', NULL, 20, '', '', 9, 5, 77, '', NULL, 170.00, 3, 170.00, 'Inclusive', NULL, 250.00, 250.00, 0.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(79, 'IT0079', '0', 'KAHAWA 1.6G', NULL, 19, '', '', 9, 5, 36, '', NULL, 180.00, 3, 180.00, 'Inclusive', NULL, 200.00, 200.00, 98.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(80, 'IT0080', '0', 'MAJANI CHAI BORA 100GM', NULL, 19, '', '', 9, 5, 78, '', NULL, 2916.67, 3, 2916.67, 'Inclusive', NULL, 3500.00, 3500.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(81, 'IT0081', '0', 'MAJANI CHAI KILIMANJARO 100GM', NULL, 19, '', '', 9, 5, 79, '', NULL, 2750.00, 3, 2750.00, 'Inclusive', NULL, 3200.00, 3200.00, 5.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(82, 'IT0082', '0', 'MAJANI A PRIDE 100GM', NULL, 19, '', '', 9, 5, 80, '', NULL, 3000.00, 3, 3000.00, 'Inclusive', NULL, 3500.00, 3500.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(83, 'IT0083', '0', 'MAJANI GREEN LABEL 100GM', NULL, 19, '', '', 9, 5, 81, '', NULL, 1125.00, 3, 1125.00, 'Inclusive', NULL, 1500.00, 1500.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(84, 'IT0084', '0', 'MAJANI GREEN LABEL 50GM', NULL, 19, '', '', 9, 5, 81, '', NULL, 535.71, 3, 535.71, 'Inclusive', NULL, 800.00, 800.00, 28.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(85, 'IT0085', '0', 'SABUNI MAQ 250gm', NULL, 18, '', '', 9, 5, 82, '', NULL, 1875.00, 3, 1875.00, 'Inclusive', NULL, 2300.00, 2300.00, 25.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(86, 'IT0086', '0', 'PADS HQ', NULL, 21, '', '', 9, 5, 83, '', NULL, 3333.33, 3, 3333.33, 'Inclusive', NULL, 3500.00, 3500.00, 17.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(87, 'IT0087', '0', 'BABY WIPES SOFTCARE', NULL, 22, '', '', 9, 5, 84, '', NULL, 2666.67, 3, 2666.67, 'Inclusive', NULL, 3500.00, 3500.00, 13.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(88, 'IT0088', '0', 'BABY WIPES BREEZE', NULL, 22, '', '', 9, 5, 85, '', NULL, 2500.00, 3, 2500.00, 'Inclusive', NULL, 3500.00, 3500.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(89, 'IT0089', '0', 'PADS LAVY', NULL, 21, '', '', 9, 5, 86, '', NULL, 2708.33, 3, 2708.33, 'Inclusive', NULL, 4000.00, 4000.00, 24.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(90, 'IT0090', '0', 'OMO 1KG', NULL, 18, '', '', 9, 5, 87, '', NULL, 6250.00, 3, 6250.00, 'Inclusive', NULL, 7500.00, 7500.00, 5.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(91, 'IT0091', '0', 'PADS SOFTCARE ', NULL, 21, '', '', 9, 5, 84, '', NULL, 1500.00, 3, 1500.00, 'Inclusive', NULL, 2000.00, 2000.00, 43.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(92, 'IT0092', '0', 'BABY WIPES ROYAL', NULL, 22, '', '', 9, 5, 88, '', NULL, 3750.00, 3, 3750.00, 'Inclusive', NULL, 5000.00, 5000.00, 23.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(93, 'IT0093', '0', 'BABY WIPES SLEEPS', NULL, 22, '', '', 9, 5, 89, '', NULL, 3750.00, 3, 3750.00, 'Inclusive', NULL, 5000.00, 5000.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(94, 'IT0094', '0', 'BABY WIPES MIMA', NULL, 22, '', '', 9, 5, 90, '', NULL, 3750.00, 3, 3750.00, 'Inclusive', NULL, 5000.00, 5000.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(95, 'IT0095', '0', 'TISUE VIVA', NULL, 21, '', '', 9, 5, 91, '', NULL, 875.00, 3, 875.00, 'Inclusive', NULL, 1500.00, 1500.00, 29.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(96, 'IT0096', '0', 'TISUE NAPTKIN', NULL, 21, '', '', 9, 5, 92, '', NULL, 875.00, 3, 875.00, 'Inclusive', NULL, 1500.00, 1500.00, 9.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(97, 'IT0097', '0', 'PADS CATHY', NULL, 21, '', '', 9, 5, 93, '', NULL, 3333.33, 3, 3333.33, 'Inclusive', NULL, 5000.00, 5000.00, 21.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(98, 'IT0098', '0', 'PAMPAS SLEEP', NULL, 22, '', '', 9, 5, 89, '', NULL, 14400.00, 3, 14400.00, 'Inclusive', NULL, 15500.00, 15500.00, 5.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(99, 'IT0099', '0', 'PAMPAS BABY CHICK', NULL, 22, '', '', 9, 5, 94, '', NULL, 3333.33, 3, 3333.33, 'Inclusive', NULL, 4500.00, 4500.00, 9.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(100, 'IT0100', '0', 'PAPAS BABY CHICK LARGE', NULL, 22, '', '', 9, 5, 94, '', NULL, 12500.00, 3, 12500.00, 'Inclusive', NULL, 14000.00, 14000.00, 4.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(101, 'IT0101', '0', 'PAMPAS SOFTCARE SMALL', NULL, 22, '', '', 9, 5, 84, '', NULL, 3750.00, 3, 3750.00, 'Inclusive', NULL, 4500.00, 4500.00, 9.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(102, 'IT0102', '0', 'PAMPAS SOFTCARE MEDIUM', NULL, 22, '', '', 9, 5, 84, '', NULL, 13666.67, 3, 13666.67, 'Inclusive', NULL, 15000.00, 15000.00, 14.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(103, 'IT0103', '0', 'PAMPAS SOFTCARE LARGE', NULL, 22, '', '', 9, 5, 84, '', NULL, 20000.00, 3, 20000.00, 'Inclusive', NULL, 24000.00, 24000.00, 5.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(104, 'IT0104', '0', 'OMO 40g', NULL, 18, '', '', 9, 5, 87, '', NULL, 328.57, 3, 328.57, 'Inclusive', NULL, 600.00, 600.00, 69.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(105, 'IT0105', '0', 'SABUNI MARAHABA 500g', NULL, 18, '', '', 9, 5, 95, '', NULL, 1033.33, 3, 1033.33, 'Inclusive', NULL, 1200.00, 1200.00, 23.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(106, 'IT0106', '0', 'SABUNI DOFI 500g', NULL, 18, '', '', 9, 5, 96, '', NULL, 1033.33, 3, 1033.33, 'Inclusive', NULL, 1200.00, 1200.00, 27.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(107, 'IT0107', '0', 'OMO 500g', NULL, 18, '', '', 9, 5, 87, '', NULL, 4083.33, 3, 4083.33, 'Inclusive', NULL, 5000.00, 5000.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(108, 'IT0108', '0', 'ARIEL 500g', NULL, 18, '', '', 9, 5, 97, '', NULL, 4083.33, 3, 4083.33, 'Inclusive', NULL, 5000.00, 5000.00, 5.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(109, 'IT0109', '0', 'SABUNI MARAHABA180g', NULL, 18, '', '', 9, 5, 95, '', NULL, 425.00, 3, 425.00, 'Inclusive', NULL, 500.00, 500.00, 36.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(110, 'IT0110', '0', 'OMO 200g', NULL, 18, '', '', 9, 5, 87, '', NULL, 1562.50, 3, 1562.50, 'Inclusive', NULL, 1562.50, 1562.50, 24.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(111, 'IT0111', '0', 'SABUNI DOLPHY 180g', NULL, 18, '', '', 9, 5, 98, '', NULL, 450.00, 3, 450.00, 'Inclusive', NULL, 500.00, 500.00, 40.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(112, 'IT0112', '0', 'SABUNI NICEONE 400g', NULL, 18, '', '', 9, 5, 98, '', NULL, 708.33, 3, 708.33, 'Inclusive', NULL, 1000.00, 1000.00, 21.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(113, 'IT0113', '0', 'SABUNI NICEONE 180g', NULL, 18, '', '', 9, 5, 98, '', NULL, 450.00, 3, 450.00, 'Inclusive', NULL, 500.00, 500.00, 32.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(114, 'IT0114', '0', 'SABUNI JAMAA &amp; WHITE WASH', NULL, 18, '', '', 9, 5, 99, '', NULL, 3041.67, 3, 3041.67, 'Inclusive', NULL, 3500.00, 3500.00, 16.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(115, 'IT0115', '0', 'SABUNI MAGADI', NULL, 18, '', '', 9, 5, 101, '', NULL, 2583.33, 3, 2583.33, 'Inclusive', NULL, 3000.00, 3000.00, 10.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(116, 'IT0116', '0', 'SABUNI ALOVERA', NULL, 18, '', '', 9, 5, 102, '', NULL, 1166.67, 3, 1166.67, 'Inclusive', NULL, 1500.00, 1500.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(117, 'IT0117', '0', 'SABUNI TETMOSO wakubwa', NULL, 18, '', '', 9, 5, 107, '', NULL, 1833.33, 3, 1833.33, 'Inclusive', NULL, 2500.00, 2500.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(118, 'IT0118', '0', 'SABUNI TETMOSO watoto', NULL, 18, '', '', 9, 5, 107, '', NULL, 1833.33, 3, 1833.33, 'Inclusive', NULL, 2500.00, 2500.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(119, 'IT0119', '0', 'SABUNI PROTEX herbal', NULL, 18, '', '', 9, 5, 108, '', NULL, 2083.33, 3, 2083.33, 'Inclusive', NULL, 2500.00, 2500.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(120, 'IT0120', '0', 'SABUNI PROTEX herbal ndogo', NULL, 18, '', '', 9, 5, 108, '', NULL, 1500.00, 3, 1500.00, 'Inclusive', NULL, 2000.00, 2000.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(121, 'IT0121', '0', 'SABUNI IMPERIAL ndogo', NULL, 18, '', '', 9, 5, 109, '', NULL, 1333.33, 3, 1333.33, 'Inclusive', NULL, 2500.00, 2500.00, 22.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(122, 'IT0122', '0', 'SABUNI IMPERIAL kubwa', NULL, 18, '', '', 9, 5, 109, '', NULL, 1916.67, 3, 1916.67, 'Inclusive', NULL, 3000.00, 3000.00, 22.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(123, 'IT0123', '0', 'SABUNI DETOL ORIGINAL 175g', NULL, 18, '', '', 9, 5, 39, '', NULL, 2083.33, 3, 2083.33, 'Inclusive', NULL, 3000.00, 3000.00, 10.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(124, 'IT0124', '0', 'SABUNI DETOL ORIGINAL ndogo', NULL, 18, '', '', 9, 5, 39, '', NULL, 1250.00, 3, 1250.00, 'Inclusive', NULL, 1500.00, 1500.00, 10.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(125, 'IT0125', '0', 'SABUNI Pears', NULL, 18, '', '', 9, 5, 110, '', NULL, 2833.33, 3, 2833.33, 'Inclusive', NULL, 3500.00, 3500.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(126, 'IT0126', '0', 'SABUNI Life buoy', NULL, 18, '', '', 9, 5, 111, '', NULL, 2166.67, 3, 2166.67, 'Inclusive', NULL, 3000.00, 3000.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(127, 'IT0127', '0', 'SABUNI Junior 100g', NULL, 18, '', '', 9, 5, 39, '', NULL, 1333.33, 3, 1333.33, 'Inclusive', NULL, 2000.00, 2000.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(128, 'IT0128', '0', 'SABUNI DETOL SKIN CARE 100mg', NULL, 18, '', '', 9, 5, 39, '', NULL, 1333.33, 3, 1333.33, 'Inclusive', NULL, 2000.00, 2000.00, 4.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(129, 'IT0129', '0', 'SABUNI DETOL COOL 100g', NULL, 18, '', '', 9, 5, 39, '', NULL, 1333.33, 3, 1333.33, 'Inclusive', NULL, 2000.00, 2000.00, 5.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(130, 'IT0130', '0', 'SABUNI DRS 80g', NULL, 18, '', '', 9, 5, 112, '', NULL, 364.58, 3, 364.58, 'Inclusive', NULL, 500.00, 500.00, 42.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(131, 'IT0131', '0', 'SABUNI MO BEAUTY', NULL, 18, '', '', 9, 5, 103, '', NULL, 364.58, 3, 364.58, 'Inclusive', NULL, 500.00, 500.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(132, 'IT0132', '0', 'SABUNI FAMILY', NULL, 18, '', '', 9, 5, 104, '', NULL, 364.58, 3, 364.58, 'Inclusive', NULL, 500.00, 500.00, 7.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(133, 'IT0133', '0', 'SABUNI RUNGU ', NULL, 18, '', '', 9, 5, 26, '', NULL, 364.58, 3, 364.58, 'Inclusive', NULL, 500.00, 500.00, 9.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(134, 'IT0134', '0', 'SABUNN MAGADI vipande', NULL, 18, '', '', 9, 5, 101, '', NULL, 31.67, 3, 31.67, 'Inclusive', NULL, 100.00, 100.00, 131.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(135, 'IT0135', '0', 'COLGATE HERBAL 175g', NULL, 21, '', '', 9, 5, 113, '', NULL, 4583.33, 3, 4583.33, 'Inclusive', NULL, 5500.00, 5500.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(136, 'IT0136', '0', 'colgate protection 140g', NULL, 21, '', '', 9, 5, 113, '', NULL, 3166.67, 3, 3166.67, 'Inclusive', NULL, 5000.00, 5000.00, 18.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(137, 'IT0137', '0', 'COLGATE 35g', NULL, 21, '', '', 9, 5, 113, '', NULL, 1250.00, 3, 1250.00, 'Inclusive', NULL, 1500.00, 1500.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(138, 'IT0138', '0', 'COLGATE HERBAL 70g', NULL, 21, '', '', 9, 5, 113, '', NULL, 2250.00, 3, 2250.00, 'Inclusive', NULL, 3000.00, 3000.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(139, 'IT0139', '0', 'COLGATE PROTECTION 15g', NULL, 21, '', '', 9, 5, 113, '', NULL, 625.00, 3, 625.00, 'Inclusive', NULL, 1000.00, 1000.00, 24.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(140, 'IT0140', '0', 'COLGATE PROTECTION 70g', NULL, 21, '', '', 9, 5, 113, '', NULL, 2250.00, 3, 2250.00, 'Inclusive', NULL, 3000.00, 3000.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(141, 'IT0141', '0', 'COLGATE MAX FRESH 125g', NULL, 21, '', '', 9, 5, 113, '', NULL, 3166.67, 3, 3166.67, 'Inclusive', NULL, 4000.00, 4000.00, 11.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(142, 'IT0142', '0', 'COLGATE CHARCOL 120g', NULL, 21, '', '', 9, 5, 113, '', NULL, 3916.67, 3, 3916.67, 'Inclusive', NULL, 5500.00, 5500.00, 10.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(143, 'IT0143', '0', 'COLGATE CHARCOL 35g', NULL, 21, '', '', 9, 5, 113, '', NULL, 1250.00, 3, 1250.00, 'Inclusive', NULL, 1500.00, 1500.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(144, 'IT0144', '0', 'WHITEDENT 250g', NULL, 21, '', '', 9, 5, 114, '', NULL, 4166.67, 3, 4166.67, 'Inclusive', NULL, 4500.00, 4500.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(145, 'IT0145', '0', 'WHITEDENT 70g', NULL, 21, '', '', 9, 5, 114, '', NULL, 1500.00, 3, 1500.00, 'Inclusive', NULL, 2000.00, 2000.00, 23.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(146, 'IT0146', '0', 'WHITEDENT 80g', NULL, 21, '', '', 9, 5, 114, '', NULL, 1666.67, 3, 1666.67, 'Inclusive', NULL, 2000.00, 2000.00, 24.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(147, 'IT0147', '0', 'WHITEDENT 20g', NULL, 21, '', '', 9, 5, 114, '', NULL, 500.00, 3, 500.00, 'Inclusive', NULL, 700.00, 700.00, 33.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(148, 'IT0148', '0', 'WHITEDENT CHARCOL 70g', NULL, 21, '', '', 9, 5, 114, '', NULL, 2083.33, 3, 2083.33, 'Inclusive', NULL, 2500.00, 2500.00, 10.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(149, 'IT0149', '0', 'TOILET PAPER ', NULL, 21, '', '', 9, 5, 115, '', NULL, 800.00, 3, 800.00, 'Inclusive', NULL, 1000.00, 1000.00, 18.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(150, 'IT0150', '0', 'SABUNI DOVE SHOWER 1200ml', NULL, 21, '', '', 9, 5, 116, '', NULL, 10000.00, 3, 10000.00, 'Inclusive', NULL, 11500.00, 11500.00, 5.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(151, 'IT0151', '0', 'DETOL SHOWER 1200ml', NULL, 21, '', '', 9, 5, 39, '', NULL, 10000.00, 3, 10000.00, 'Inclusive', NULL, 11500.00, 11500.00, 2.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(152, 'IT0152', '0', 'OMO BLEACH LEMON', NULL, 21, '', '', 9, 5, 87, '', NULL, 4750.00, 3, 4750.00, 'Inclusive', NULL, 6000.00, 6000.00, 3.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(153, 'IT0153', '0', 'JIK 750 ml', NULL, 21, '', '', 9, 5, 117, '', NULL, 4666.67, 3, 4666.67, 'Inclusive', NULL, 6000.00, 6000.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(154, 'IT0154', '0', 'UNGA LISHE DESTENI angels 3kg', NULL, 19, '', '', 9, 5, 105, '', NULL, 17500.00, 3, 17500.00, 'Inclusive', NULL, 21000.00, 21000.00, 1.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(155, 'IT0155', '0', 'UNGA LISHE DESTENI wonders 1kg', NULL, 19, '', '', 9, 5, 105, '', NULL, 12000.00, 3, 12000.00, 'Inclusive', NULL, 13000.00, 13000.00, 4.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(156, 'IT0156', '0', 'UNGA LISHE DESTENI miracles 1kg', NULL, 19, '', '', 9, 5, 105, '', NULL, 9000.00, 3, 9000.00, 'Inclusive', NULL, 11000.00, 11000.00, 3.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(157, 'IT0157', '0', 'UNGA LISHE DESTENI familia 1kg', NULL, 19, '', '', 9, 5, 105, '', NULL, 6000.00, 3, 6000.00, 'Inclusive', NULL, 8000.00, 8000.00, 3.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(158, 'IT0158', '0', 'SABUNI COVEX 115g', NULL, 21, '', '', 9, 5, 118, '', NULL, 1083.33, 3, 1083.33, 'Inclusive', NULL, 1500.00, 1500.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(159, 'IT0159', '0', 'MSWAKI COLGATE', NULL, 21, '', '', 9, 5, 113, '', NULL, 1333.33, 3, 1333.33, 'Inclusive', NULL, 1500.00, 1500.00, 4.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(160, 'IT0160', '0', 'MSWAKI FRESH DOCTOR', NULL, 21, '', '', 9, 5, 119, '', NULL, 1000.00, 3, 1000.00, 'Inclusive', NULL, 1500.00, 1500.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(161, 'IT0161', '0', 'MSWAKI WHITEDENT', NULL, 21, '', '', 9, 5, 114, '', NULL, 375.00, 3, 375.00, 'Inclusive', NULL, 500.00, 500.00, 31.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(162, 'IT0162', '0', 'TOOTH PICK DENTAL FLOSS', NULL, 21, '', '', 9, 5, 120, '', NULL, 1000.00, 3, 1000.00, 'Inclusive', NULL, 1500.00, 1500.00, 12.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(163, 'IT0163', '0', 'PAMBA NDOGO', NULL, 21, '', '', 9, 5, NULL, '', NULL, 583.33, 3, 583.33, 'Inclusive', NULL, 700.00, 700.00, 10.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(164, 'IT0164', '0', 'PAMBA KUBWA', NULL, 21, '', '', 9, 5, NULL, '', NULL, 1083.33, 3, 1083.33, 'Inclusive', NULL, 1500.00, 1500.00, 8.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(165, 'IT0165', '0', 'TOOTH PICK ndogo', NULL, 21, '', '', 9, 5, NULL, '', NULL, 250.00, 3, 250.00, 'Inclusive', NULL, 500.00, 500.00, 38.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(166, 'IT0166', '0', 'TOOTH PICK kubwa', NULL, 21, '', '', 9, 5, NULL, '', NULL, 750.00, 3, 750.00, 'Inclusive', NULL, 1000.00, 1000.00, 35.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(167, 'IT0167', '0', 'WHITEDENT 190g', NULL, 21, '', '', 9, 5, NULL, '', NULL, 3333.33, 3, 3333.33, 'Inclusive', NULL, 4000.00, 4000.00, 6.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(168, 'IT0168', '0', 'VIM ALL PURPOSE CLEANER', NULL, 18, '', '', 9, 5, 106, '', NULL, 2250.00, 3, 2250.00, 'Inclusive', NULL, 3000.00, 3000.00, 5.00, NULL, '41.222.180.63', '41.222.180.63', '2025-05-30', '02:22:38 pm', 'admin', NULL, NULL, 1),
(169, 'IT0169', '', 'radio 2123', 'descr', 15, '44', 0x3334, 9, 2, 25, '1', NULL, 2000.00, 1, 2000.00, 'Inclusive', NULL, 2000.00, 2000.00, 90.00, NULL, '127.0.0.1', 'localhost', '2025-07-25', '02:00:09 pm', 'admin', NULL, 1, 1),
(170, 'IT0170', '0', 'Sabuni Omo', NULL, 28, '1111', 0x48534e31, 7, 5, 87, '11', '2019-01-01', 4000.00, 4, 4000.00, 'Inclusive', NULL, 5000.00, 5000.00, 10.00, NULL, '127.0.0.1', 'localhost', '2025-07-25', '02:15:23 pm', 'admin', NULL, 1, 1),
(171, 'IT0171', '0', 'Mafuta Losheni', NULL, 29, '2222', 0x48534e32, 9, 5, 126, '22', '2019-01-01', 5000.00, 4, 5000.00, 'Inclusive', NULL, 6000.00, 6000.00, 10.00, NULL, '127.0.0.1', 'localhost', '2025-07-25', '02:15:23 pm', 'admin', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_languages`
--

CREATE TABLE `db_languages` (
  `id` int(5) NOT NULL,
  `language` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_languages`
--

INSERT INTO `db_languages` (`id`, `language`, `status`) VALUES
(1, 'English', 1),
(2, 'Hindi', 1),
(3, 'Kannada', 1),
(4, 'Indonesian', 1),
(5, 'Chinese', 1),
(6, 'Russian', 1),
(7, 'Spanish', 1),
(8, 'Arabic', 1),
(9, 'Albanian', 1),
(10, 'Dutch', 1),
(11, 'Bangla', 1),
(12, 'Urdu', 1),
(13, 'Italian', 1),
(14, 'Marathi', 1),
(15, 'Khmer', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_paymenttypes`
--

CREATE TABLE `db_paymenttypes` (
  `id` int(5) NOT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_paymenttypes`
--

INSERT INTO `db_paymenttypes` (`id`, `payment_type`, `status`) VALUES
(1, 'Cash', 1),
(2, 'Card', 1),
(3, 'Paytm', 1),
(4, 'Finance', 1),
(5, 'M-pesa', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_permissions`
--

CREATE TABLE `db_permissions` (
  `id` int(5) NOT NULL,
  `role_id` int(5) DEFAULT NULL,
  `permissions` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_permissions`
--

INSERT INTO `db_permissions` (`id`, `role_id`, `permissions`) VALUES
(10, 3, 'users_add'),
(11, 3, 'users_edit'),
(12, 3, 'users_delete'),
(13, 3, 'users_view'),
(14, 3, 'tax_add'),
(15, 3, 'tax_edit'),
(16, 3, 'tax_delete'),
(17, 3, 'tax_view'),
(18, 3, 'currency_add'),
(19, 3, 'currency_edit'),
(20, 3, 'currency_delete'),
(21, 3, 'currency_view'),
(22, 3, 'company_edit'),
(23, 3, 'units_add'),
(24, 3, 'units_edit'),
(25, 3, 'units_delete'),
(26, 3, 'units_view'),
(27, 3, 'roles_add'),
(28, 3, 'roles_edit'),
(29, 3, 'roles_delete'),
(30, 3, 'roles_view'),
(31, 3, 'places_add'),
(32, 3, 'places_edit'),
(33, 3, 'places_delete'),
(34, 3, 'places_view'),
(35, 3, 'expense_add'),
(36, 3, 'expense_edit'),
(37, 3, 'expense_delete'),
(38, 3, 'expense_view'),
(39, 3, 'items_add'),
(40, 3, 'items_edit'),
(41, 3, 'items_delete'),
(42, 3, 'items_view'),
(43, 3, 'brand_add'),
(44, 3, 'brand_edit'),
(45, 3, 'brand_delete'),
(46, 3, 'brand_view'),
(47, 3, 'suppliers_add'),
(48, 3, 'suppliers_edit'),
(49, 3, 'suppliers_delete'),
(50, 3, 'suppliers_view'),
(51, 3, 'customers_add'),
(52, 3, 'customers_edit'),
(53, 3, 'customers_delete'),
(54, 3, 'customers_view'),
(55, 3, 'purchase_add'),
(56, 3, 'purchase_edit'),
(57, 3, 'purchase_delete'),
(58, 3, 'purchase_view'),
(59, 3, 'sales_add'),
(60, 3, 'sales_edit'),
(61, 3, 'sales_delete'),
(62, 3, 'sales_view'),
(63, 3, 'sales_payment_view'),
(64, 3, 'sales_payment_add'),
(65, 3, 'sales_payment_delete'),
(66, 3, 'sales_report'),
(67, 3, 'purchase_report'),
(68, 3, 'expense_report'),
(69, 3, 'profit_report'),
(70, 3, 'stock_report'),
(71, 3, 'item_sales_report'),
(72, 3, 'purchase_payments_report'),
(73, 3, 'sales_payments_report'),
(74, 3, 'expired_items_report'),
(75, 3, 'items_category_add'),
(76, 3, 'items_category_edit'),
(77, 3, 'items_category_delete'),
(78, 3, 'items_category_view'),
(79, 3, 'print_labels'),
(80, 3, 'import_items'),
(81, 3, 'expense_category_add'),
(82, 3, 'expense_category_edit'),
(83, 3, 'expense_category_delete'),
(84, 3, 'expense_category_view'),
(85, 3, 'dashboard_view'),
(86, 3, 'send_sms'),
(87, 3, 'sms_template_edit'),
(88, 3, 'sms_template_view'),
(89, 3, 'sms_api_view'),
(90, 3, 'sms_api_edit'),
(91, 3, 'purchase_return_add'),
(92, 3, 'purchase_return_edit'),
(93, 3, 'purchase_return_delete'),
(94, 3, 'purchase_return_view'),
(95, 3, 'purchase_return_report'),
(96, 3, 'sales_return_add'),
(97, 3, 'sales_return_edit'),
(98, 3, 'sales_return_delete'),
(99, 3, 'sales_return_view'),
(100, 3, 'sales_return_report'),
(101, 3, 'sales_return_payment_view'),
(102, 3, 'sales_return_payment_add'),
(103, 3, 'sales_return_payment_delete'),
(104, 3, 'purchase_return_payment_view'),
(105, 3, 'purchase_return_payment_add'),
(106, 3, 'purchase_return_payment_delete'),
(107, 3, 'purchase_payment_view'),
(108, 3, 'purchase_payment_add'),
(109, 3, 'purchase_payment_delete'),
(110, 3, 'payment_types_add'),
(111, 3, 'payment_types_edit'),
(112, 3, 'payment_types_delete'),
(113, 3, 'payment_types_view'),
(114, 3, 'import_customers'),
(115, 3, 'import_suppliers'),
(116, 3, 'item_purchase_report'),
(191, 4, 'tax_add'),
(192, 4, 'tax_view'),
(193, 4, 'currency_add'),
(194, 4, 'currency_view'),
(195, 4, 'expense_add'),
(196, 4, 'expense_view'),
(197, 4, 'items_view'),
(198, 4, 'suppliers_view'),
(199, 4, 'customers_add'),
(200, 4, 'customers_view'),
(201, 4, 'purchase_add'),
(202, 4, 'purchase_view'),
(203, 4, 'sales_add'),
(204, 4, 'sales_view'),
(205, 4, 'sales_payment_view'),
(206, 4, 'sales_payment_add'),
(207, 4, 'sales_report'),
(208, 4, 'purchase_report'),
(209, 4, 'expense_report'),
(210, 4, 'profit_report'),
(211, 4, 'stock_report'),
(212, 4, 'item_sales_report'),
(213, 4, 'purchase_payments_report'),
(214, 4, 'sales_payments_report'),
(215, 4, 'expired_items_report'),
(216, 4, 'items_category_view'),
(217, 4, 'print_labels'),
(218, 4, 'expense_category_add'),
(219, 4, 'expense_category_view'),
(220, 4, 'send_sms'),
(221, 4, 'sms_template_view'),
(222, 4, 'purchase_return_add'),
(223, 4, 'purchase_return_view'),
(224, 4, 'purchase_return_report'),
(225, 4, 'sales_return_add'),
(226, 4, 'sales_return_view'),
(227, 4, 'sales_return_report'),
(228, 4, 'sales_return_payment_view'),
(229, 4, 'purchase_return_payment_view'),
(230, 4, 'purchase_return_payment_add'),
(231, 4, 'purchase_payment_view'),
(232, 4, 'purchase_payment_add'),
(233, 4, 'payment_types_add'),
(234, 4, 'payment_types_view'),
(235, 4, 'item_purchase_report'),
(236, 2, 'expense_view'),
(237, 2, 'items_view'),
(238, 2, 'customers_add'),
(239, 2, 'customers_view'),
(240, 2, 'sales_add'),
(241, 2, 'sales_view'),
(242, 2, 'items_category_view'),
(243, 2, 'print_labels'),
(244, 2, 'sales_return_view');

-- --------------------------------------------------------

--
-- Table structure for table `db_purchase`
--

CREATE TABLE `db_purchase` (
  `id` int(5) NOT NULL,
  `purchase_code` varchar(50) DEFAULT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_status` varchar(50) DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,2) DEFAULT NULL,
  `discount_to_all_input` double(20,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,2) DEFAULT NULL,
  `subtotal` double(20,2) DEFAULT NULL COMMENT 'Purchased qty',
  `round_off` double(20,2) DEFAULT NULL COMMENT 'Pending Qty',
  `grand_total` double(20,2) DEFAULT NULL,
  `purchase_note` mediumtext DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `paid_amount` double(20,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `system_ip` varchar(100) DEFAULT NULL,
  `system_name` varchar(100) DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'Purchase return raised'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_purchaseitems`
--

CREATE TABLE `db_purchaseitems` (
  `id` int(5) NOT NULL,
  `purchase_id` int(5) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `purchase_status` varchar(50) DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `purchase_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,2) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,2) DEFAULT NULL,
  `tax_type` varchar(50) DEFAULT NULL,
  `unit_discount_per` double(20,2) DEFAULT NULL,
  `discount_amt` double(20,2) DEFAULT NULL,
  `unit_total_cost` double(20,2) DEFAULT NULL,
  `total_cost` double(20,2) DEFAULT NULL,
  `profit_margin_per` double(20,2) DEFAULT NULL,
  `unit_sales_price` double(20,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_purchaseitemsreturn`
--

CREATE TABLE `db_purchaseitemsreturn` (
  `id` int(5) NOT NULL,
  `purchase_id` int(5) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `return_status` varchar(50) DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `return_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,2) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,2) DEFAULT NULL,
  `tax_type` varchar(50) DEFAULT NULL,
  `unit_discount_per` double(20,2) DEFAULT NULL,
  `discount_amt` double(20,2) DEFAULT NULL,
  `unit_total_cost` double(20,2) DEFAULT NULL,
  `total_cost` double(20,2) DEFAULT NULL,
  `profit_margin_per` double(20,2) DEFAULT NULL,
  `unit_sales_price` double(20,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_purchasepayments`
--

CREATE TABLE `db_purchasepayments` (
  `id` int(5) NOT NULL,
  `purchase_id` int(5) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `payment` double(20,2) DEFAULT NULL,
  `payment_note` mediumtext DEFAULT NULL,
  `system_ip` varchar(50) DEFAULT NULL,
  `system_name` varchar(50) DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_purchasepaymentsreturn`
--

CREATE TABLE `db_purchasepaymentsreturn` (
  `id` int(5) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `payment` double(20,2) DEFAULT NULL,
  `payment_note` mediumtext DEFAULT NULL,
  `system_ip` varchar(50) DEFAULT NULL,
  `system_name` varchar(50) DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_purchasereturn`
--

CREATE TABLE `db_purchasereturn` (
  `id` int(5) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `return_code` varchar(50) DEFAULT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `return_status` varchar(50) DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,2) DEFAULT NULL,
  `discount_to_all_input` double(20,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,2) DEFAULT NULL,
  `subtotal` double(20,2) DEFAULT NULL COMMENT 'Purchased qty',
  `round_off` double(20,2) DEFAULT NULL COMMENT 'Pending Qty',
  `grand_total` double(20,2) DEFAULT NULL,
  `return_note` mediumtext DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `paid_amount` double(20,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `system_ip` varchar(100) DEFAULT NULL,
  `system_name` varchar(100) DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_roles`
--

CREATE TABLE `db_roles` (
  `id` int(5) NOT NULL,
  `role_name` varchar(50) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_roles`
--

INSERT INTO `db_roles` (`id`, `role_name`, `description`, `status`) VALUES
(1, 'Admin', 'All Rights Permitted.', 1),
(2, 'STAFF', '', 1),
(3, 'MANAGER', '', 1),
(4, 'ACCOUNT &amp; PROCUREMENT', 'Accountant', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_sales`
--

CREATE TABLE `db_sales` (
  `id` int(5) NOT NULL,
  `sales_code` varchar(50) DEFAULT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `sales_status` varchar(50) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,2) DEFAULT NULL,
  `discount_to_all_input` double(20,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,2) DEFAULT NULL,
  `subtotal` double(20,2) DEFAULT NULL,
  `round_off` double(20,2) DEFAULT NULL,
  `grand_total` double(20,2) DEFAULT NULL,
  `sales_note` mediumtext DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `paid_amount` double(20,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` time DEFAULT current_timestamp(),
  `created_by` varchar(50) DEFAULT NULL,
  `system_ip` varchar(100) DEFAULT NULL,
  `system_name` varchar(100) DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no',
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'sales return raised'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_sales`
--

INSERT INTO `db_sales` (`id`, `sales_code`, `reference_no`, `sales_date`, `sales_status`, `customer_id`, `warehouse_id`, `other_charges_input`, `other_charges_tax_id`, `other_charges_amt`, `discount_to_all_input`, `discount_to_all_type`, `tot_discount_to_all_amt`, `subtotal`, `round_off`, `grand_total`, `sales_note`, `payment_status`, `paid_amount`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `company_id`, `branch_id`, `pos`, `status`, `return_bit`) VALUES
(27, 'SL0001', NULL, '2025-07-14', 'Final', 1, NULL, 0.00, NULL, 0.00, 0.00, 'in_percentage', 0.00, 100.00, 0.00, 100.00, NULL, 'Paid', 100.00, '2025-07-14', '02:12:25', 'admin', '127.0.0.1', 'localhost', NULL, NULL, 1, 1, NULL),
(28, 'SL0028', NULL, '2025-07-24', 'Final', 1, NULL, 0.00, NULL, 0.00, 0.00, 'in_percentage', 0.00, 3500.00, 0.00, 3500.00, NULL, 'Paid', 3500.00, '2025-07-24', '05:13:16', 'admin', '127.0.0.1', 'localhost', NULL, NULL, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_salesitems`
--

CREATE TABLE `db_salesitems` (
  `id` int(5) NOT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `sales_status` varchar(50) DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sales_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,2) DEFAULT NULL,
  `tax_type` varchar(50) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,2) DEFAULT NULL,
  `discount_type` varchar(50) DEFAULT NULL,
  `discount_input` double(20,2) DEFAULT NULL,
  `discount_amt` double(20,2) DEFAULT NULL,
  `unit_total_cost` double(20,2) DEFAULT NULL,
  `total_cost` double(20,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_salesitems`
--

INSERT INTO `db_salesitems` (`id`, `sales_id`, `branch_id`, `sales_status`, `item_id`, `description`, `sales_qty`, `price_per_unit`, `tax_type`, `tax_id`, `tax_amt`, `discount_type`, `discount_input`, `discount_amt`, `unit_total_cost`, `total_cost`, `status`) VALUES
(23, 17, NULL, 'Final', 134, '', 1.00, 100.00, 'Inclusive', 3, 15.25, 'Percentage', 0.00, 0.00, 100.00, 100.00, 1),
(24, 18, NULL, 'Final', 134, '', 1.00, 100.00, 'Inclusive', 3, 15.25, 'Percentage', 0.00, 0.00, 100.00, 100.00, 1),
(25, 19, NULL, 'Final', 79, '', 1.00, 200.00, 'Inclusive', 3, 30.51, 'Percentage', 0.00, 0.00, 200.00, 200.00, 1),
(26, 20, NULL, 'Final', 165, '', 1.00, 500.00, 'Inclusive', 3, 76.27, 'Percentage', 0.00, 0.00, 500.00, 500.00, 1),
(27, 21, NULL, 'Final', 134, '', 1.00, 100.00, 'Inclusive', 3, 15.25, 'Percentage', 0.00, 0.00, 100.00, 100.00, 1),
(28, 22, NULL, 'Final', 147, '', 1.00, 700.00, 'Inclusive', 3, 106.78, 'Percentage', 0.00, 0.00, 700.00, 700.00, 1),
(29, 23, NULL, 'Final', 134, '', 1.00, 100.00, 'Inclusive', 3, 15.25, 'Percentage', 0.00, 0.00, 100.00, 100.00, 1),
(30, 24, NULL, 'Final', 79, '', 1.00, 200.00, 'Inclusive', 3, 30.51, 'Percentage', 0.00, 0.00, 200.00, 200.00, 1),
(31, 26, NULL, 'Final', 104, '', 1.00, 600.00, 'Inclusive', 3, 91.53, 'Percentage', 0.00, 0.00, 600.00, 600.00, 1),
(32, 27, NULL, 'Final', 134, '', 1.00, 100.00, 'Inclusive', 3, 15.25, 'Percentage', 0.00, 0.00, 100.00, 100.00, 1),
(33, 28, NULL, 'Final', 91, '', 1.00, 2000.00, 'Inclusive', 3, 305.08, 'Percentage', 0.00, 0.00, 2000.00, 2000.00, 1),
(34, 28, NULL, 'Final', 109, '', 1.00, 500.00, 'Inclusive', 3, 76.27, 'Percentage', 0.00, 0.00, 500.00, 500.00, 1),
(35, 28, NULL, 'Final', 130, '', 1.00, 500.00, 'Inclusive', 3, 76.27, 'Percentage', 0.00, 0.00, 500.00, 500.00, 1),
(36, 28, NULL, 'Final', 113, '', 1.00, 500.00, 'Inclusive', 3, 76.27, 'Percentage', 0.00, 0.00, 500.00, 500.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_salesitemsreturn`
--

CREATE TABLE `db_salesitemsreturn` (
  `id` int(5) NOT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `return_status` varchar(50) DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `return_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,2) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,2) DEFAULT NULL,
  `tax_type` varchar(50) DEFAULT NULL,
  `discount_input` double(20,2) DEFAULT NULL,
  `discount_amt` double(20,2) DEFAULT NULL,
  `discount_type` varchar(50) DEFAULT NULL,
  `unit_total_cost` double(20,2) DEFAULT NULL,
  `total_cost` double(20,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_salespayments`
--

CREATE TABLE `db_salespayments` (
  `id` int(5) NOT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `payment` double(20,2) DEFAULT NULL,
  `payment_note` mediumtext DEFAULT NULL,
  `change_return` double(20,2) DEFAULT NULL COMMENT 'Refunding the greater amount',
  `system_ip` varchar(50) DEFAULT NULL,
  `system_name` varchar(50) DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_salespayments`
--

INSERT INTO `db_salespayments` (`id`, `sales_id`, `branch_id`, `payment_date`, `payment_type`, `payment`, `payment_note`, `change_return`, `system_ip`, `system_name`, `created_time`, `created_date`, `created_by`, `status`) VALUES
(26, 27, NULL, '2025-07-14', 'Cash', 100.00, '', 3900.00, '127.0.0.1', 'localhost', '02:12:25', '2025-07-14', 'admin', 1),
(27, 28, NULL, '2025-07-24', 'Cash', 3500.00, '', 1500.00, '127.0.0.1', 'localhost', '05:13:16', '2025-07-24', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_salespaymentsreturn`
--

CREATE TABLE `db_salespaymentsreturn` (
  `id` int(5) NOT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `payment` double(20,2) DEFAULT NULL,
  `payment_note` mediumtext DEFAULT NULL,
  `change_return` double(20,2) DEFAULT NULL COMMENT 'Refunding the greater amount',
  `system_ip` varchar(50) DEFAULT NULL,
  `system_name` varchar(50) DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_salesreturn`
--

CREATE TABLE `db_salesreturn` (
  `id` int(5) NOT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `return_code` varchar(50) DEFAULT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `return_status` varchar(50) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,2) DEFAULT NULL,
  `discount_to_all_input` double(20,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,2) DEFAULT NULL,
  `subtotal` double(20,2) DEFAULT NULL,
  `round_off` double(20,2) DEFAULT NULL,
  `grand_total` double(20,2) DEFAULT NULL,
  `return_note` mediumtext DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `paid_amount` double(20,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `system_ip` varchar(100) DEFAULT NULL,
  `system_name` varchar(100) DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no',
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'Return raised or not 1 or null'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_sitesettings`
--

CREATE TABLE `db_sitesettings` (
  `id` int(5) NOT NULL,
  `version` varchar(10) DEFAULT NULL,
  `site_name` varchar(100) DEFAULT NULL,
  `logo` mediumtext DEFAULT NULL COMMENT 'path',
  `language_id` int(5) DEFAULT NULL,
  `currency_id` int(5) DEFAULT NULL,
  `currency_placement` varchar(50) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `date_format` varchar(30) DEFAULT NULL,
  `time_format` int(5) DEFAULT NULL,
  `sales_discount` double(20,2) DEFAULT NULL,
  `site_url` varchar(100) DEFAULT NULL,
  `site_title` varchar(50) DEFAULT NULL,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_desc` mediumtext DEFAULT NULL,
  `meta_keywords` mediumtext DEFAULT NULL,
  `currencysymbol_id` int(5) DEFAULT NULL,
  `regno_key` varchar(6) DEFAULT NULL,
  `copyright` mediumtext DEFAULT NULL,
  `facebook_url` mediumtext DEFAULT NULL,
  `twitter_url` mediumtext DEFAULT NULL,
  `youtube_url` mediumtext DEFAULT NULL,
  `analytic_code` mediumtext DEFAULT NULL,
  `fav_icon` mediumtext DEFAULT NULL COMMENT 'path',
  `footer_logo` mediumtext DEFAULT NULL COMMENT 'path',
  `company_id` int(1) DEFAULT NULL,
  `purchase_code` mediumtext DEFAULT NULL,
  `change_return` int(1) DEFAULT NULL COMMENT 'show in pos',
  `sales_invoice_format_id` int(5) DEFAULT NULL,
  `sales_invoice_footer_text` text DEFAULT NULL,
  `round_off` int(1) DEFAULT NULL COMMENT '1=Enble, 0=Disable',
  `machine_id` text DEFAULT NULL,
  `domain` text DEFAULT NULL,
  `show_upi_code` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_sitesettings`
--

INSERT INTO `db_sitesettings` (`id`, `version`, `site_name`, `logo`, `language_id`, `currency_id`, `currency_placement`, `timezone`, `date_format`, `time_format`, `sales_discount`, `site_url`, `site_title`, `meta_title`, `meta_desc`, `meta_keywords`, `currencysymbol_id`, `regno_key`, `copyright`, `facebook_url`, `twitter_url`, `youtube_url`, `analytic_code`, `fav_icon`, `footer_logo`, `company_id`, `purchase_code`, `change_return`, `sales_invoice_format_id`, `sales_invoice_footer_text`, `round_off`, `machine_id`, `domain`, `show_upi_code`) VALUES
(1, '1.7.7', 'Inventory Management System', 'inventory(1).jpg', 1, 56, 'Left', 'Asia/Kolkata\r\n', 'dd-mm-yyyy', 12, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, ' This is footer text. You can set it from Site Settings.', 1, '74be16979710d4c4e7c6647856088456', 'localhost', 0);

-- --------------------------------------------------------

--
-- Table structure for table `db_smsapi`
--

CREATE TABLE `db_smsapi` (
  `id` int(5) NOT NULL,
  `info` varchar(150) DEFAULT NULL,
  `key` varchar(600) DEFAULT NULL,
  `key_value` varchar(600) DEFAULT NULL,
  `delete_bit` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_smsapi`
--

INSERT INTO `db_smsapi` (`id`, `info`, `key`, `key_value`, `delete_bit`) VALUES
(150, 'url', 'weblink', 'http://www.example.in/api/sendhttp.php', NULL),
(151, 'mobile', 'mobiles', '', NULL),
(152, 'message', 'message', '', NULL),
(153, '', 'authkey', 'xxxxxxxxxxxxxxxxxxxx', NULL),
(154, '', 'sender', 'ULTPOS', NULL),
(155, '', 'route', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_smstemplates`
--

CREATE TABLE `db_smstemplates` (
  `id` int(5) NOT NULL,
  `template_name` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `variables` text DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `undelete_bit` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_smstemplates`
--

INSERT INTO `db_smstemplates` (`id`, `template_name`, `content`, `variables`, `company_id`, `status`, `undelete_bit`) VALUES
(1, 'GREETING TO CUSTOMER ON SALES', 'Hi {{customer_name}},\r\nYour sales Id is {{sales_id}},\r\nSales Date {{sales_date}},\r\nTotal amount  {{sales_amount}},\r\nYou have paid  {{paid_amt}},\r\nand due amount is  {{due_amt}}\r\nThank you Visit Again', '{{customer_name}}<br>                          \r\n{{sales_id}}<br>\r\n{{sales_date}}<br>\r\n{{sales_amount}}<br>\r\n{{paid_amt}}<br>\r\n{{due_amt}}<br>\r\n{{company_name}}<br>\r\n{{company_mobile}}<br>\r\n{{company_address}}<br>\r\n{{company_website}}<br>\r\n{{company_email}}<br>', NULL, 1, 1),
(2, 'GREETING TO CUSTOMER ON SALES RETURN', 'Hi {{customer_name}},\r\nYour sales return Id is {{return_id}},\r\nReturn Date {{return_date}},\r\nTotal amount  {{return_amount}},\r\nWe paid  {{paid_amt}},\r\nand due amount is  {{due_amt}}\r\nThank you Visit Again', '{{customer_name}}<br>                          \r\n{{return_id}}<br>\r\n{{return_date}}<br>\r\n{{return_amount}}<br>\r\n{{paid_amt}}<br>\r\n{{due_amt}}<br>\r\n{{company_name}}<br>\r\n{{company_mobile}}<br>\r\n{{company_address}}<br>\r\n{{company_website}}<br>\r\n{{company_email}}<br>', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_sobpayments`
--

CREATE TABLE `db_sobpayments` (
  `id` int(5) NOT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `payment` double(20,2) DEFAULT NULL,
  `payment_note` mediumtext DEFAULT NULL,
  `system_ip` varchar(50) DEFAULT NULL,
  `system_name` varchar(50) DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_states`
--

CREATE TABLE `db_states` (
  `id` int(5) NOT NULL,
  `state_code` varchar(10) DEFAULT NULL,
  `state` varchar(4050) DEFAULT NULL,
  `country_code` varchar(15) DEFAULT NULL,
  `country_id` int(5) DEFAULT NULL,
  `country` varchar(15) DEFAULT NULL,
  `added_on` date DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_states`
--

INSERT INTO `db_states` (`id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES
(23, 'ST0001', 'Karnataka', 'CNT0001', NULL, 'India', '2017-07-10', 1, 1),
(24, 'ST0024', 'Maharashtra', 'CNT0001', NULL, 'India', '2018-04-13', 1, 1),
(25, 'ST0025', 'Andhra Pradesh', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(26, 'ST0026', 'Arunachal Pradesh', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(27, 'ST0027', 'Assam', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(28, 'ST0028', 'Bihar', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(29, 'ST0029', 'Chhattisgarh', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(30, 'ST0030', 'Goa', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(31, 'ST0031', 'Gujarat', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(32, 'ST0032', 'Haryana', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(33, 'ST0033', 'Himachal Pradesh', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(34, 'ST0034', 'Jammu and Kashmir', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(35, 'ST0035', 'Jharkhand', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(36, 'ST0036', 'Kerala', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(37, 'ST0037', 'Madhya Pradesh', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(38, 'ST0038', 'Manipur', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(39, 'ST0039', 'Meghalaya', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(40, 'ST0040', 'Mizoram', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(41, 'ST0041', 'Nagaland', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(42, 'ST0042', 'Odisha', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(43, 'ST0043', 'Punjab', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(44, 'ST0044', 'Rajasthan', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(45, 'ST0045', 'Sikkim', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(46, 'ST0046', 'Tamil Nadu', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(47, 'ST0047', 'Telangana', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(48, 'ST0048', 'Tripura', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(49, 'ST0049', 'Uttar Pradesh', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(50, 'ST0050', 'Uttarakhand', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(51, 'ST0051', 'West Bengal', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(52, NULL, 'New York', NULL, NULL, 'USA', NULL, NULL, 1),
(53, NULL, 'Delhi', NULL, NULL, 'India', NULL, NULL, 1),
(54, NULL, 'Tanzania', NULL, NULL, 'Tanzania', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_stockentry`
--

CREATE TABLE `db_stockentry` (
  `id` int(5) NOT NULL,
  `entry_date` date DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `qty` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_stockentry`
--

INSERT INTO `db_stockentry` (`id`, `entry_date`, `item_id`, `qty`, `status`) VALUES
(2056, '2025-05-30', 1, 11, 1),
(2057, '2025-05-30', 1, 0, 1),
(2058, '2025-05-30', 2, 11, 1),
(2059, '2025-05-30', 2, 0, 1),
(2060, '2025-05-30', 3, 5, 1),
(2061, '2025-05-30', 3, 0, 1),
(2062, '2025-05-30', 4, 6, 1),
(2063, '2025-05-30', 4, 0, 1),
(2064, '2025-05-30', 5, 5, 1),
(2065, '2025-05-30', 5, 0, 1),
(2066, '2025-05-30', 6, 20, 1),
(2067, '2025-05-30', 6, 0, 1),
(2068, '2025-05-30', 7, 5, 1),
(2069, '2025-05-30', 7, 0, 1),
(2070, '2025-05-30', 8, 29, 1),
(2071, '2025-05-30', 8, 0, 1),
(2072, '2025-05-30', 9, 23, 1),
(2073, '2025-05-30', 9, 0, 1),
(2074, '2025-05-30', 10, 6, 1),
(2075, '2025-05-30', 10, 0, 1),
(2076, '2025-05-30', 11, 8, 1),
(2077, '2025-05-30', 11, 0, 1),
(2078, '2025-05-30', 12, 8, 1),
(2079, '2025-05-30', 12, 0, 1),
(2080, '2025-05-30', 13, 7, 1),
(2081, '2025-05-30', 13, 0, 1),
(2082, '2025-05-30', 14, 7, 1),
(2083, '2025-05-30', 14, 0, 1),
(2084, '2025-05-30', 15, 5, 1),
(2085, '2025-05-30', 15, 0, 1),
(2086, '2025-05-30', 16, 6, 1),
(2087, '2025-05-30', 16, 0, 1),
(2088, '2025-05-30', 17, 6, 1),
(2089, '2025-05-30', 17, 0, 1),
(2090, '2025-05-30', 18, 6, 1),
(2091, '2025-05-30', 18, 0, 1),
(2092, '2025-05-30', 19, 6, 1),
(2093, '2025-05-30', 19, 0, 1),
(2094, '2025-05-30', 20, 4, 1),
(2095, '2025-05-30', 20, 0, 1),
(2096, '2025-05-30', 21, 12, 1),
(2097, '2025-05-30', 21, 0, 1),
(2098, '2025-05-30', 22, 29, 1),
(2099, '2025-05-30', 22, 0, 1),
(2100, '2025-05-30', 23, 11, 1),
(2101, '2025-05-30', 23, 0, 1),
(2102, '2025-05-30', 24, 6, 1),
(2103, '2025-05-30', 24, 0, 1),
(2104, '2025-05-30', 25, 4, 1),
(2105, '2025-05-30', 25, 0, 1),
(2106, '2025-05-30', 26, 24, 1),
(2107, '2025-05-30', 26, 0, 1),
(2108, '2025-05-30', 27, 32, 1),
(2109, '2025-05-30', 27, 0, 1),
(2110, '2025-05-30', 28, 22, 1),
(2111, '2025-05-30', 28, 0, 1),
(2112, '2025-05-30', 29, 12, 1),
(2113, '2025-05-30', 29, 0, 1),
(2114, '2025-05-30', 30, 7, 1),
(2115, '2025-05-30', 30, 0, 1),
(2116, '2025-05-30', 31, 6, 1),
(2117, '2025-05-30', 31, 0, 1),
(2118, '2025-05-30', 32, 9, 1),
(2119, '2025-05-30', 32, 0, 1),
(2120, '2025-05-30', 33, 11, 1),
(2121, '2025-05-30', 33, 0, 1),
(2122, '2025-05-30', 34, 12, 1),
(2123, '2025-05-30', 34, 0, 1),
(2124, '2025-05-30', 35, 5, 1),
(2125, '2025-05-30', 35, 0, 1),
(2126, '2025-05-30', 36, 4, 1),
(2127, '2025-05-30', 36, 0, 1),
(2128, '2025-05-30', 37, 6, 1),
(2129, '2025-05-30', 37, 0, 1),
(2130, '2025-05-30', 38, 10, 1),
(2131, '2025-05-30', 38, 0, 1),
(2132, '2025-05-30', 39, 20, 1),
(2133, '2025-05-30', 39, 0, 1),
(2134, '2025-05-30', 40, 11, 1),
(2135, '2025-05-30', 40, 0, 1),
(2136, '2025-05-30', 41, 22, 1),
(2137, '2025-05-30', 41, 0, 1),
(2138, '2025-05-30', 42, 6, 1),
(2139, '2025-05-30', 42, 0, 1),
(2140, '2025-05-30', 43, 9, 1),
(2141, '2025-05-30', 43, 0, 1),
(2142, '2025-05-30', 44, 14, 1),
(2143, '2025-05-30', 44, 0, 1),
(2144, '2025-05-30', 45, 21, 1),
(2145, '2025-05-30', 45, 0, 1),
(2146, '2025-05-30', 46, 12, 1),
(2147, '2025-05-30', 46, 0, 1),
(2148, '2025-05-30', 47, 19, 1),
(2149, '2025-05-30', 47, 0, 1),
(2150, '2025-05-30', 48, 14, 1),
(2151, '2025-05-30', 48, 0, 1),
(2152, '2025-05-30', 49, 6, 1),
(2153, '2025-05-30', 49, 0, 1),
(2154, '2025-05-30', 50, 12, 1),
(2155, '2025-05-30', 50, 0, 1),
(2156, '2025-05-30', 51, 11, 1),
(2157, '2025-05-30', 51, 0, 1),
(2158, '2025-05-30', 52, 23, 1),
(2159, '2025-05-30', 52, 0, 1),
(2160, '2025-05-30', 53, 12, 1),
(2161, '2025-05-30', 53, 0, 1),
(2162, '2025-05-30', 54, 12, 1),
(2163, '2025-05-30', 54, 0, 1),
(2164, '2025-05-30', 55, 11, 1),
(2165, '2025-05-30', 55, 0, 1),
(2166, '2025-05-30', 56, 10, 1),
(2167, '2025-05-30', 56, 0, 1),
(2168, '2025-05-30', 57, 6, 1),
(2169, '2025-05-30', 57, 0, 1),
(2170, '2025-05-30', 58, 12, 1),
(2171, '2025-05-30', 58, 0, 1),
(2172, '2025-05-30', 59, 10, 1),
(2173, '2025-05-30', 59, 0, 1),
(2174, '2025-05-30', 60, 24, 1),
(2175, '2025-05-30', 60, 0, 1),
(2176, '2025-05-30', 61, 12, 1),
(2177, '2025-05-30', 61, 0, 1),
(2178, '2025-05-30', 62, 12, 1),
(2179, '2025-05-30', 62, 0, 1),
(2180, '2025-05-30', 63, 23, 1),
(2181, '2025-05-30', 63, 0, 1),
(2182, '2025-05-30', 64, 12, 1),
(2183, '2025-05-30', 64, 0, 1),
(2184, '2025-05-30', 65, 12, 1),
(2185, '2025-05-30', 65, 0, 1),
(2186, '2025-05-30', 66, 23, 1),
(2187, '2025-05-30', 66, 0, 1),
(2188, '2025-05-30', 67, 12, 1),
(2189, '2025-05-30', 67, 0, 1),
(2190, '2025-05-30', 68, 14, 1),
(2191, '2025-05-30', 68, 0, 1),
(2192, '2025-05-30', 69, 14, 1),
(2193, '2025-05-30', 69, 0, 1),
(2194, '2025-05-30', 70, 9, 1),
(2195, '2025-05-30', 70, 0, 1),
(2196, '2025-05-30', 71, 12, 1),
(2197, '2025-05-30', 71, 0, 1),
(2198, '2025-05-30', 72, 19, 1),
(2199, '2025-05-30', 72, 0, 1),
(2200, '2025-05-30', 73, 24, 1),
(2201, '2025-05-30', 73, 0, 1),
(2202, '2025-05-30', 74, 12, 1),
(2203, '2025-05-30', 74, 0, 1),
(2204, '2025-05-30', 75, 18, 1),
(2205, '2025-05-30', 75, 0, 1),
(2206, '2025-05-30', 76, 8, 1),
(2207, '2025-05-30', 76, 0, 1),
(2208, '2025-05-30', 77, 60, 1),
(2209, '2025-05-30', 77, 0, 1),
(2210, '2025-05-30', 78, 0, 1),
(2211, '2025-05-30', 79, 100, 1),
(2212, '2025-05-30', 79, 0, 1),
(2213, '2025-05-30', 80, 12, 1),
(2214, '2025-05-30', 80, 0, 1),
(2215, '2025-05-30', 81, 5, 1),
(2216, '2025-05-30', 81, 0, 1),
(2217, '2025-05-30', 82, 6, 1),
(2218, '2025-05-30', 82, 0, 1),
(2219, '2025-05-30', 83, 12, 1),
(2220, '2025-05-30', 83, 0, 1),
(2221, '2025-05-30', 84, 28, 1),
(2222, '2025-05-30', 84, 0, 1),
(2223, '2025-05-30', 85, 25, 1),
(2224, '2025-05-30', 85, 0, 1),
(2225, '2025-05-30', 86, 17, 1),
(2226, '2025-05-30', 86, 0, 1),
(2227, '2025-05-30', 87, 13, 1),
(2228, '2025-05-30', 87, 0, 1),
(2229, '2025-05-30', 88, 12, 1),
(2230, '2025-05-30', 88, 0, 1),
(2231, '2025-05-30', 89, 24, 1),
(2232, '2025-05-30', 89, 0, 1),
(2233, '2025-05-30', 90, 5, 1),
(2234, '2025-05-30', 90, 0, 1),
(2235, '2025-05-30', 91, 44, 1),
(2236, '2025-05-30', 91, 0, 1),
(2237, '2025-05-30', 92, 23, 1),
(2238, '2025-05-30', 92, 0, 1),
(2239, '2025-05-30', 93, 12, 1),
(2240, '2025-05-30', 93, 0, 1),
(2241, '2025-05-30', 94, 12, 1),
(2242, '2025-05-30', 94, 0, 1),
(2243, '2025-05-30', 95, 29, 1),
(2244, '2025-05-30', 95, 0, 1),
(2245, '2025-05-30', 96, 9, 1),
(2246, '2025-05-30', 96, 0, 1),
(2247, '2025-05-30', 97, 21, 1),
(2248, '2025-05-30', 97, 0, 1),
(2249, '2025-05-30', 98, 5, 1),
(2250, '2025-05-30', 98, 0, 1),
(2251, '2025-05-30', 99, 9, 1),
(2252, '2025-05-30', 99, 0, 1),
(2253, '2025-05-30', 100, 4, 1),
(2254, '2025-05-30', 100, 0, 1),
(2255, '2025-05-30', 101, 9, 1),
(2256, '2025-05-30', 101, 0, 1),
(2257, '2025-05-30', 102, 14, 1),
(2258, '2025-05-30', 102, 0, 1),
(2259, '2025-05-30', 103, 5, 1),
(2260, '2025-05-30', 103, 0, 1),
(2261, '2025-05-30', 104, 70, 1),
(2262, '2025-05-30', 104, 0, 1),
(2263, '2025-05-30', 105, 23, 1),
(2264, '2025-05-30', 105, 0, 1),
(2265, '2025-05-30', 106, 27, 1),
(2266, '2025-05-30', 106, 0, 1),
(2267, '2025-05-30', 107, 6, 1),
(2268, '2025-05-30', 107, 0, 1),
(2269, '2025-05-30', 108, 5, 1),
(2270, '2025-05-30', 108, 0, 1),
(2271, '2025-05-30', 109, 37, 1),
(2272, '2025-05-30', 109, 0, 1),
(2273, '2025-05-30', 110, 24, 1),
(2274, '2025-05-30', 110, 0, 1),
(2275, '2025-05-30', 111, 40, 1),
(2276, '2025-05-30', 111, 0, 1),
(2277, '2025-05-30', 112, 21, 1),
(2278, '2025-05-30', 112, 0, 1),
(2279, '2025-05-30', 113, 33, 1),
(2280, '2025-05-30', 113, 0, 1),
(2281, '2025-05-30', 114, 16, 1),
(2282, '2025-05-30', 114, 0, 1),
(2283, '2025-05-30', 115, 10, 1),
(2284, '2025-05-30', 115, 0, 1),
(2285, '2025-05-30', 116, 12, 1),
(2286, '2025-05-30', 116, 0, 1),
(2287, '2025-05-30', 117, 12, 1),
(2288, '2025-05-30', 117, 0, 1),
(2289, '2025-05-30', 118, 12, 1),
(2290, '2025-05-30', 118, 0, 1),
(2291, '2025-05-30', 119, 12, 1),
(2292, '2025-05-30', 119, 0, 1),
(2293, '2025-05-30', 120, 12, 1),
(2294, '2025-05-30', 120, 0, 1),
(2295, '2025-05-30', 121, 22, 1),
(2296, '2025-05-30', 121, 0, 1),
(2297, '2025-05-30', 122, 22, 1),
(2298, '2025-05-30', 122, 0, 1),
(2299, '2025-05-30', 123, 10, 1),
(2300, '2025-05-30', 123, 0, 1),
(2301, '2025-05-30', 124, 10, 1),
(2302, '2025-05-30', 124, 0, 1),
(2303, '2025-05-30', 125, 12, 1),
(2304, '2025-05-30', 125, 0, 1),
(2305, '2025-05-30', 126, 12, 1),
(2306, '2025-05-30', 126, 0, 1),
(2307, '2025-05-30', 127, 12, 1),
(2308, '2025-05-30', 127, 0, 1),
(2309, '2025-05-30', 128, 4, 1),
(2310, '2025-05-30', 128, 0, 1),
(2311, '2025-05-30', 129, 5, 1),
(2312, '2025-05-30', 129, 0, 1),
(2313, '2025-05-30', 130, 43, 1),
(2314, '2025-05-30', 130, 0, 1),
(2315, '2025-05-30', 131, 12, 1),
(2316, '2025-05-30', 131, 0, 1),
(2317, '2025-05-30', 132, 7, 1),
(2318, '2025-05-30', 132, 0, 1),
(2319, '2025-05-30', 133, 9, 1),
(2320, '2025-05-30', 133, 0, 1),
(2321, '2025-05-30', 134, 136, 1),
(2322, '2025-05-30', 134, 0, 1),
(2323, '2025-05-30', 135, 6, 1),
(2324, '2025-05-30', 135, 0, 1),
(2325, '2025-05-30', 136, 18, 1),
(2326, '2025-05-30', 136, 0, 1),
(2327, '2025-05-30', 137, 12, 1),
(2328, '2025-05-30', 137, 0, 1),
(2329, '2025-05-30', 138, 12, 1),
(2330, '2025-05-30', 138, 0, 1),
(2331, '2025-05-30', 139, 24, 1),
(2332, '2025-05-30', 139, 0, 1),
(2333, '2025-05-30', 140, 12, 1),
(2334, '2025-05-30', 140, 0, 1),
(2335, '2025-05-30', 141, 11, 1),
(2336, '2025-05-30', 141, 0, 1),
(2337, '2025-05-30', 142, 10, 1),
(2338, '2025-05-30', 142, 0, 1),
(2339, '2025-05-30', 143, 12, 1),
(2340, '2025-05-30', 143, 0, 1),
(2341, '2025-05-30', 144, 6, 1),
(2342, '2025-05-30', 144, 0, 1),
(2343, '2025-05-30', 145, 23, 1),
(2344, '2025-05-30', 145, 0, 1),
(2345, '2025-05-30', 146, 24, 1),
(2346, '2025-05-30', 146, 0, 1),
(2347, '2025-05-30', 147, 34, 1),
(2348, '2025-05-30', 147, 0, 1),
(2349, '2025-05-30', 148, 10, 1),
(2350, '2025-05-30', 148, 0, 1),
(2351, '2025-05-30', 149, 18, 1),
(2352, '2025-05-30', 149, 0, 1),
(2353, '2025-05-30', 150, 5, 1),
(2354, '2025-05-30', 150, 0, 1),
(2355, '2025-05-30', 151, 2, 1),
(2356, '2025-05-30', 151, 0, 1),
(2357, '2025-05-30', 152, 3, 1),
(2358, '2025-05-30', 152, 0, 1),
(2359, '2025-05-30', 153, 6, 1),
(2360, '2025-05-30', 153, 0, 1),
(2361, '2025-05-30', 154, 1, 1),
(2362, '2025-05-30', 154, 0, 1),
(2363, '2025-05-30', 155, 4, 1),
(2364, '2025-05-30', 155, 0, 1),
(2365, '2025-05-30', 156, 3, 1),
(2366, '2025-05-30', 156, 0, 1),
(2367, '2025-05-30', 157, 3, 1),
(2368, '2025-05-30', 157, 0, 1),
(2369, '2025-05-30', 158, 12, 1),
(2370, '2025-05-30', 158, 0, 1),
(2371, '2025-05-30', 159, 4, 1),
(2372, '2025-05-30', 159, 0, 1),
(2373, '2025-05-30', 160, 6, 1),
(2374, '2025-05-30', 160, 0, 1),
(2375, '2025-05-30', 161, 31, 1),
(2376, '2025-05-30', 161, 0, 1),
(2377, '2025-05-30', 162, 12, 1),
(2378, '2025-05-30', 162, 0, 1),
(2379, '2025-05-30', 163, 10, 1),
(2380, '2025-05-30', 163, 0, 1),
(2381, '2025-05-30', 164, 8, 1),
(2382, '2025-05-30', 164, 0, 1),
(2383, '2025-05-30', 165, 39, 1),
(2384, '2025-05-30', 165, 0, 1),
(2385, '2025-05-30', 166, 35, 1),
(2386, '2025-05-30', 166, 0, 1),
(2387, '2025-05-30', 167, 6, 1),
(2388, '2025-05-30', 167, 0, 1),
(2389, '2025-05-30', 168, 5, 1),
(2390, '2025-05-30', 168, 0, 1),
(2391, '2025-07-25', 169, 90, 1),
(2392, '2025-07-25', 170, 10, 1),
(2393, '2025-07-25', 170, 0, 1),
(2394, '2025-07-25', 171, 10, 1),
(2395, '2025-07-25', 171, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_suppliers`
--

CREATE TABLE `db_suppliers` (
  `id` int(5) NOT NULL,
  `supplier_code` varchar(20) DEFAULT NULL,
  `supplier_name` varchar(50) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gstin` varchar(100) DEFAULT NULL,
  `tax_number` varchar(50) DEFAULT NULL,
  `vatin` varchar(100) DEFAULT NULL,
  `opening_balance` double(20,2) DEFAULT NULL,
  `purchase_due` double(20,2) DEFAULT NULL,
  `purchase_return_due` double(20,2) DEFAULT NULL,
  `country_id` int(5) DEFAULT NULL,
  `state_id` int(5) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `system_ip` varchar(50) DEFAULT NULL,
  `system_name` varchar(50) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(30) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_supplier_payments`
--

CREATE TABLE `db_supplier_payments` (
  `id` int(5) NOT NULL,
  `purchasepayment_id` int(5) DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `payment` double(20,2) DEFAULT NULL,
  `payment_note` text DEFAULT NULL,
  `system_ip` varchar(50) DEFAULT NULL,
  `system_name` varchar(50) DEFAULT NULL,
  `created_time` varchar(50) DEFAULT NULL,
  `created_date` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_tax`
--

CREATE TABLE `db_tax` (
  `id` int(5) NOT NULL,
  `tax_name` varchar(50) DEFAULT NULL,
  `tax` double(20,2) DEFAULT NULL,
  `group_bit` int(1) DEFAULT NULL COMMENT '1=Yes, 0=No',
  `subtax_ids` varchar(10) DEFAULT NULL COMMENT 'Tax groups IDs',
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_tax`
--

INSERT INTO `db_tax` (`id`, `tax_name`, `tax`, `group_bit`, `subtax_ids`, `status`) VALUES
(1, 'TRA', 18.00, NULL, NULL, 1),
(2, 'Govt', 18.00, 1, '1', 1),
(3, 'Tax 18%', 18.00, NULL, NULL, 1),
(4, 'Tax 5%', 5.00, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_timezone`
--

CREATE TABLE `db_timezone` (
  `id` int(5) NOT NULL,
  `timezone` varchar(100) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_timezone`
--

INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES
(1, 'Africa/Abidjan\r', 1),
(2, 'Africa/Accra\r', 1),
(3, 'Africa/Addis_Ababa\r', 1),
(4, 'Africa/Algiers\r', 1),
(5, 'Africa/Asmara\r', 1),
(6, 'Africa/Asmera\r', 1),
(7, 'Africa/Bamako\r', 1),
(8, 'Africa/Bangui\r', 1),
(9, 'Africa/Banjul\r', 1),
(10, 'Africa/Bissau\r', 1),
(11, 'Africa/Blantyre\r', 1),
(12, 'Africa/Brazzaville\r', 1),
(13, 'Africa/Bujumbura\r', 1),
(14, 'Africa/Cairo\r', 1),
(15, 'Africa/Casablanca\r', 1),
(16, 'Africa/Ceuta\r', 1),
(17, 'Africa/Conakry\r', 1),
(18, 'Africa/Dakar\r', 1),
(19, 'Africa/Dar_es_Salaam\r', 1),
(20, 'Africa/Djibouti\r', 1),
(21, 'Africa/Douala\r', 1),
(22, 'Africa/El_Aaiun\r', 1),
(23, 'Africa/Freetown\r', 1),
(24, 'Africa/Gaborone\r', 1),
(25, 'Africa/Harare\r', 1),
(26, 'Africa/Johannesburg\r', 1),
(27, 'Africa/Juba\r', 1),
(28, 'Africa/Kampala\r', 1),
(29, 'Africa/Khartoum\r', 1),
(30, 'Africa/Kigali\r', 1),
(31, 'Africa/Kinshasa\r', 1),
(32, 'Africa/Lagos\r', 1),
(33, 'Africa/Libreville\r', 1),
(34, 'Africa/Lome\r', 1),
(35, 'Africa/Luanda\r', 1),
(36, 'Africa/Lubumbashi\r', 1),
(37, 'Africa/Lusaka\r', 1),
(38, 'Africa/Malabo\r', 1),
(39, 'Africa/Maputo\r', 1),
(40, 'Africa/Maseru\r', 1),
(41, 'Africa/Mbabane\r', 1),
(42, 'Africa/Mogadishu\r', 1),
(43, 'Africa/Monrovia\r', 1),
(44, 'Africa/Nairobi\r', 1),
(45, 'Africa/Ndjamena\r', 1),
(46, 'Africa/Niamey\r', 1),
(47, 'Africa/Nouakchott\r', 1),
(48, 'Africa/Ouagadougou\r', 1),
(49, 'Africa/Porto-Novo\r', 1),
(50, 'Africa/Sao_Tome\r', 1),
(51, 'Africa/Timbuktu\r', 1),
(52, 'Africa/Tripoli\r', 1),
(53, 'Africa/Tunis\r', 1),
(54, 'Africa/Windhoek\r', 1),
(55, 'AKST9AKDT\r', 1),
(56, 'America/Adak\r', 1),
(57, 'America/Anchorage\r', 1),
(58, 'America/Anguilla\r', 1),
(59, 'America/Antigua\r', 1),
(60, 'America/Araguaina\r', 1),
(61, 'America/Argentina/Buenos_Aires\r', 1),
(62, 'America/Argentina/Catamarca\r', 1),
(63, 'America/Argentina/ComodRivadavia\r', 1),
(64, 'America/Argentina/Cordoba\r', 1),
(65, 'America/Argentina/Jujuy\r', 1),
(66, 'America/Argentina/La_Rioja\r', 1),
(67, 'America/Argentina/Mendoza\r', 1),
(68, 'America/Argentina/Rio_Gallegos\r', 1),
(69, 'America/Argentina/Salta\r', 1),
(70, 'America/Argentina/San_Juan\r', 1),
(71, 'America/Argentina/San_Luis\r', 1),
(72, 'America/Argentina/Tucuman\r', 1),
(73, 'America/Argentina/Ushuaia\r', 1),
(74, 'America/Aruba\r', 1),
(75, 'America/Asuncion\r', 1),
(76, 'America/Atikokan\r', 1),
(77, 'America/Atka\r', 1),
(78, 'America/Bahia\r', 1),
(79, 'America/Bahia_Banderas\r', 1),
(80, 'America/Barbados\r', 1),
(81, 'America/Belem\r', 1),
(82, 'America/Belize\r', 1),
(83, 'America/Blanc-Sablon\r', 1),
(84, 'America/Boa_Vista\r', 1),
(85, 'America/Bogota\r', 1),
(86, 'America/Boise\r', 1),
(87, 'America/Buenos_Aires\r', 1),
(88, 'America/Cambridge_Bay\r', 1),
(89, 'America/Campo_Grande\r', 1),
(90, 'America/Cancun\r', 1),
(91, 'America/Caracas\r', 1),
(92, 'America/Catamarca\r', 1),
(93, 'America/Cayenne\r', 1),
(94, 'America/Cayman\r', 1),
(95, 'America/Chicago\r', 1),
(96, 'America/Chihuahua\r', 1),
(97, 'America/Coral_Harbour\r', 1),
(98, 'America/Cordoba\r', 1),
(99, 'America/Costa_Rica\r', 1),
(100, 'America/Creston\r', 1),
(101, 'America/Cuiaba\r', 1),
(102, 'America/Curacao\r', 1),
(103, 'America/Danmarkshavn\r', 1),
(104, 'America/Dawson\r', 1),
(105, 'America/Dawson_Creek\r', 1),
(106, 'America/Denver\r', 1),
(107, 'America/Detroit\r', 1),
(108, 'America/Dominica\r', 1),
(109, 'America/Edmonton\r', 1),
(110, 'America/Eirunepe\r', 1),
(111, 'America/El_Salvador\r', 1),
(112, 'America/Ensenada\r', 1),
(113, 'America/Fort_Wayne\r', 1),
(114, 'America/Fortaleza\r', 1),
(115, 'America/Glace_Bay\r', 1),
(116, 'America/Godthab\r', 1),
(117, 'America/Goose_Bay\r', 1),
(118, 'America/Grand_Turk\r', 1),
(119, 'America/Grenada\r', 1),
(120, 'America/Guadeloupe\r', 1),
(121, 'America/Guatemala\r', 1),
(122, 'America/Guayaquil\r', 1),
(123, 'America/Guyana\r', 1),
(124, 'America/Halifax\r', 1),
(125, 'America/Havana\r', 1),
(126, 'America/Hermosillo\r', 1),
(127, 'America/Indiana/Indianapolis\r', 1),
(128, 'America/Indiana/Knox\r', 1),
(129, 'America/Indiana/Marengo\r', 1),
(130, 'America/Indiana/Petersburg\r', 1),
(131, 'America/Indiana/Tell_City\r', 1),
(132, 'America/Indiana/Vevay\r', 1),
(133, 'America/Indiana/Vincennes\r', 1),
(134, 'America/Indiana/Winamac\r', 1),
(135, 'America/Indianapolis\r', 1),
(136, 'America/Inuvik\r', 1),
(137, 'America/Iqaluit\r', 1),
(138, 'America/Jamaica\r', 1),
(139, 'America/Jujuy\r', 1),
(140, 'America/Juneau\r', 1),
(141, 'America/Kentucky/Louisville\r', 1),
(142, 'America/Kentucky/Monticello\r', 1),
(143, 'America/Knox_IN\r', 1),
(144, 'America/Kralendijk\r', 1),
(145, 'America/La_Paz\r', 1),
(146, 'America/Lima\r', 1),
(147, 'America/Los_Angeles\r', 1),
(148, 'America/Louisville\r', 1),
(149, 'America/Lower_Princes\r', 1),
(150, 'America/Maceio\r', 1),
(151, 'America/Managua\r', 1),
(152, 'America/Manaus\r', 1),
(153, 'America/Marigot\r', 1),
(154, 'America/Martinique\r', 1),
(155, 'America/Matamoros\r', 1),
(156, 'America/Mazatlan\r', 1),
(157, 'America/Mendoza\r', 1),
(158, 'America/Menominee\r', 1),
(159, 'America/Merida\r', 1),
(160, 'America/Metlakatla\r', 1),
(161, 'America/Mexico_City\r', 1),
(162, 'America/Miquelon\r', 1),
(163, 'America/Moncton\r', 1),
(164, 'America/Monterrey\r', 1),
(165, 'America/Montevideo\r', 1),
(166, 'America/Montreal\r', 1),
(167, 'America/Montserrat\r', 1),
(168, 'America/Nassau\r', 1),
(169, 'America/New_York\r', 1),
(170, 'America/Nipigon\r', 1),
(171, 'America/Nome\r', 1),
(172, 'America/Noronha\r', 1),
(173, 'America/North_Dakota/Beulah\r', 1),
(174, 'America/North_Dakota/Center\r', 1),
(175, 'America/North_Dakota/New_Salem\r', 1),
(176, 'America/Ojinaga\r', 1),
(177, 'America/Panama\r', 1),
(178, 'America/Pangnirtung\r', 1),
(179, 'America/Paramaribo\r', 1),
(180, 'America/Phoenix\r', 1),
(181, 'America/Port_of_Spain\r', 1),
(182, 'America/Port-au-Prince\r', 1),
(183, 'America/Porto_Acre\r', 1),
(184, 'America/Porto_Velho\r', 1),
(185, 'America/Puerto_Rico\r', 1),
(186, 'America/Rainy_River\r', 1),
(187, 'America/Rankin_Inlet\r', 1),
(188, 'America/Recife\r', 1),
(189, 'America/Regina\r', 1),
(190, 'America/Resolute\r', 1),
(191, 'America/Rio_Branco\r', 1),
(192, 'America/Rosario\r', 1),
(193, 'America/Santa_Isabel\r', 1),
(194, 'America/Santarem\r', 1),
(195, 'America/Santiago\r', 1),
(196, 'America/Santo_Domingo\r', 1),
(197, 'America/Sao_Paulo\r', 1),
(198, 'America/Scoresbysund\r', 1),
(199, 'America/Shiprock\r', 1),
(200, 'America/Sitka\r', 1),
(201, 'America/St_Barthelemy\r', 1),
(202, 'America/St_Johns\r', 1),
(203, 'America/St_Kitts\r', 1),
(204, 'America/St_Lucia\r', 1),
(205, 'America/St_Thomas\r', 1),
(206, 'America/St_Vincent\r', 1),
(207, 'America/Swift_Current\r', 1),
(208, 'America/Tegucigalpa\r', 1),
(209, 'America/Thule\r', 1),
(210, 'America/Thunder_Bay\r', 1),
(211, 'America/Tijuana\r', 1),
(212, 'America/Toronto\r', 1),
(213, 'America/Tortola\r', 1),
(214, 'America/Vancouver\r', 1),
(215, 'America/Virgin\r', 1),
(216, 'America/Whitehorse\r', 1),
(217, 'America/Winnipeg\r', 1),
(218, 'America/Yakutat\r', 1),
(219, 'America/Yellowknife\r', 1),
(220, 'Antarctica/Casey\r', 1),
(221, 'Antarctica/Davis\r', 1),
(222, 'Antarctica/DumontDUrville\r', 1),
(223, 'Antarctica/Macquarie\r', 1),
(224, 'Antarctica/Mawson\r', 1),
(225, 'Antarctica/McMurdo\r', 1),
(226, 'Antarctica/Palmer\r', 1),
(227, 'Antarctica/Rothera\r', 1),
(228, 'Antarctica/South_Pole\r', 1),
(229, 'Antarctica/Syowa\r', 1),
(230, 'Antarctica/Vostok\r', 1),
(231, 'Arctic/Longyearbyen\r', 1),
(232, 'Asia/Aden\r', 1),
(233, 'Asia/Almaty\r', 1),
(234, 'Asia/Amman\r', 1),
(235, 'Asia/Anadyr\r', 1),
(236, 'Asia/Aqtau\r', 1),
(237, 'Asia/Aqtobe\r', 1),
(238, 'Asia/Ashgabat\r', 1),
(239, 'Asia/Ashkhabad\r', 1),
(240, 'Asia/Baghdad\r', 1),
(241, 'Asia/Bahrain\r', 1),
(242, 'Asia/Baku\r', 1),
(243, 'Asia/Bangkok\r', 1),
(244, 'Asia/Beirut\r', 1),
(245, 'Asia/Bishkek\r', 1),
(246, 'Asia/Brunei\r', 1),
(247, 'Asia/Calcutta\r', 1),
(248, 'Asia/Choibalsan\r', 1),
(249, 'Asia/Chongqing\r', 1),
(250, 'Asia/Chungking\r', 1),
(251, 'Asia/Colombo\r', 1),
(252, 'Asia/Dacca\r', 1),
(253, 'Asia/Damascus\r', 1),
(254, 'Asia/Dhaka\r', 1),
(255, 'Asia/Dili\r', 1),
(256, 'Asia/Dubai\r', 1),
(257, 'Asia/Dushanbe\r', 1),
(258, 'Asia/Gaza\r', 1),
(259, 'Asia/Harbin\r', 1),
(260, 'Asia/Hebron\r', 1),
(261, 'Asia/Ho_Chi_Minh\r', 1),
(262, 'Asia/Hong_Kong\r', 1),
(263, 'Asia/Hovd\r', 1),
(264, 'Asia/Irkutsk\r', 1),
(265, 'Asia/Istanbul\r', 1),
(266, 'Asia/Jakarta\r', 1),
(267, 'Asia/Jayapura\r', 1),
(268, 'Asia/Jerusalem\r', 1),
(269, 'Asia/Kabul\r', 1),
(270, 'Asia/Kamchatka\r', 1),
(271, 'Asia/Karachi\r', 1),
(272, 'Asia/Kashgar\r', 1),
(273, 'Asia/Kathmandu\r', 1),
(274, 'Asia/Katmandu\r', 1),
(275, 'Asia/Kolkata\r', 1),
(276, 'Asia/Krasnoyarsk\r', 1),
(277, 'Asia/Kuala_Lumpur\r', 1),
(278, 'Asia/Kuching\r', 1),
(279, 'Asia/Kuwait\r', 1),
(280, 'Asia/Macao\r', 1),
(281, 'Asia/Macau\r', 1),
(282, 'Asia/Magadan\r', 1),
(283, 'Asia/Makassar\r', 1),
(284, 'Asia/Manila\r', 1),
(285, 'Asia/Muscat\r', 1),
(286, 'Asia/Nicosia\r', 1),
(287, 'Asia/Novokuznetsk\r', 1),
(288, 'Asia/Novosibirsk\r', 1),
(289, 'Asia/Omsk\r', 1),
(290, 'Asia/Oral\r', 1),
(291, 'Asia/Phnom_Penh\r', 1),
(292, 'Asia/Pontianak\r', 1),
(293, 'Asia/Pyongyang\r', 1),
(294, 'Asia/Qatar\r', 1),
(295, 'Asia/Qyzylorda\r', 1),
(296, 'Asia/Rangoon\r', 1),
(297, 'Asia/Riyadh\r', 1),
(298, 'Asia/Saigon\r', 1),
(299, 'Asia/Sakhalin\r', 1),
(300, 'Asia/Samarkand\r', 1),
(301, 'Asia/Seoul\r', 1),
(302, 'Asia/Shanghai\r', 1),
(303, 'Asia/Singapore\r', 1),
(304, 'Asia/Taipei\r', 1),
(305, 'Asia/Tashkent\r', 1),
(306, 'Asia/Tbilisi\r', 1),
(307, 'Asia/Tehran\r', 1),
(308, 'Asia/Tel_Aviv\r', 1),
(309, 'Asia/Thimbu\r', 1),
(310, 'Asia/Thimphu\r', 1),
(311, 'Asia/Tokyo\r', 1),
(312, 'Asia/Ujung_Pandang\r', 1),
(313, 'Asia/Ulaanbaatar\r', 1),
(314, 'Asia/Ulan_Bator\r', 1),
(315, 'Asia/Urumqi\r', 1),
(316, 'Asia/Vientiane\r', 1),
(317, 'Asia/Vladivostok\r', 1),
(318, 'Asia/Yakutsk\r', 1),
(319, 'Asia/Yekaterinburg\r', 1),
(320, 'Asia/Yerevan\r', 1),
(321, 'Atlantic/Azores\r', 1),
(322, 'Atlantic/Bermuda\r', 1),
(323, 'Atlantic/Canary\r', 1),
(324, 'Atlantic/Cape_Verde\r', 1),
(325, 'Atlantic/Faeroe\r', 1),
(326, 'Atlantic/Faroe\r', 1),
(327, 'Atlantic/Jan_Mayen\r', 1),
(328, 'Atlantic/Madeira\r', 1),
(329, 'Atlantic/Reykjavik\r', 1),
(330, 'Atlantic/South_Georgia\r', 1),
(331, 'Atlantic/St_Helena\r', 1),
(332, 'Atlantic/Stanley\r', 1),
(333, 'Australia/ACT\r', 1),
(334, 'Australia/Adelaide\r', 1),
(335, 'Australia/Brisbane\r', 1),
(336, 'Australia/Broken_Hill\r', 1),
(337, 'Australia/Canberra\r', 1),
(338, 'Australia/Currie\r', 1),
(339, 'Australia/Darwin\r', 1),
(340, 'Australia/Eucla\r', 1),
(341, 'Australia/Hobart\r', 1),
(342, 'Australia/LHI\r', 1),
(343, 'Australia/Lindeman\r', 1),
(344, 'Australia/Lord_Howe\r', 1),
(345, 'Australia/Melbourne\r', 1),
(346, 'Australia/North\r', 1),
(347, 'Australia/NSW\r', 1),
(348, 'Australia/Perth\r', 1),
(349, 'Australia/Queensland\r', 1),
(350, 'Australia/South\r', 1),
(351, 'Australia/Sydney\r', 1),
(352, 'Australia/Tasmania\r', 1),
(353, 'Australia/Victoria\r', 1),
(354, 'Australia/West\r', 1),
(355, 'Australia/Yancowinna\r', 1),
(356, 'Brazil/Acre\r', 1),
(357, 'Brazil/DeNoronha\r', 1),
(358, 'Brazil/East\r', 1),
(359, 'Brazil/West\r', 1),
(360, 'Canada/Atlantic\r', 1),
(361, 'Canada/Central\r', 1),
(362, 'Canada/Eastern\r', 1),
(363, 'Canada/East-Saskatchewan\r', 1),
(364, 'Canada/Mountain\r', 1),
(365, 'Canada/Newfoundland\r', 1),
(366, 'Canada/Pacific\r', 1),
(367, 'Canada/Saskatchewan\r', 1),
(368, 'Canada/Yukon\r', 1),
(369, 'CET\r', 1),
(370, 'Chile/Continental\r', 1),
(371, 'Chile/EasterIsland\r', 1),
(372, 'CST6CDT\r', 1),
(373, 'Cuba\r', 1),
(374, 'EET\r', 1),
(375, 'Egypt\r', 1),
(376, 'Eire\r', 1),
(377, 'EST\r', 1),
(378, 'EST5EDT\r', 1),
(379, 'Etc./GMT\r', 1),
(380, 'Etc./GMT+0\r', 1),
(381, 'Etc./UCT\r', 1),
(382, 'Etc./Universal\r', 1),
(383, 'Etc./UTC\r', 1),
(384, 'Etc./Zulu\r', 1),
(385, 'Europe/Amsterdam\r', 1),
(386, 'Europe/Andorra\r', 1),
(387, 'Europe/Athens\r', 1),
(388, 'Europe/Belfast\r', 1),
(389, 'Europe/Belgrade\r', 1),
(390, 'Europe/Berlin\r', 1),
(391, 'Europe/Bratislava\r', 1),
(392, 'Europe/Brussels\r', 1),
(393, 'Europe/Bucharest\r', 1),
(394, 'Europe/Budapest\r', 1),
(395, 'Europe/Chisinau\r', 1),
(396, 'Europe/Copenhagen\r', 1),
(397, 'Europe/Dublin\r', 1),
(398, 'Europe/Gibraltar\r', 1),
(399, 'Europe/Guernsey\r', 1),
(400, 'Europe/Helsinki\r', 1),
(401, 'Europe/Isle_of_Man\r', 1),
(402, 'Europe/Istanbul\r', 1),
(403, 'Europe/Jersey\r', 1),
(404, 'Europe/Kaliningrad\r', 1),
(405, 'Europe/Kiev\r', 1),
(406, 'Europe/Lisbon\r', 1),
(407, 'Europe/Ljubljana\r', 1),
(408, 'Europe/London\r', 1),
(409, 'Europe/Luxembourg\r', 1),
(410, 'Europe/Madrid\r', 1),
(411, 'Europe/Malta\r', 1),
(412, 'Europe/Mariehamn\r', 1),
(413, 'Europe/Minsk\r', 1),
(414, 'Europe/Monaco\r', 1),
(415, 'Europe/Moscow\r', 1),
(416, 'Europe/Nicosia\r', 1),
(417, 'Europe/Oslo\r', 1),
(418, 'Europe/Paris\r', 1),
(419, 'Europe/Podgorica\r', 1),
(420, 'Europe/Prague\r', 1),
(421, 'Europe/Riga\r', 1),
(422, 'Europe/Rome\r', 1),
(423, 'Europe/Samara\r', 1),
(424, 'Europe/San_Marino\r', 1),
(425, 'Europe/Sarajevo\r', 1),
(426, 'Europe/Simferopol\r', 1),
(427, 'Europe/Skopje\r', 1),
(428, 'Europe/Sofia\r', 1),
(429, 'Europe/Stockholm\r', 1),
(430, 'Europe/Tallinn\r', 1),
(431, 'Europe/Tirane\r', 1),
(432, 'Europe/Tiraspol\r', 1),
(433, 'Europe/Uzhgorod\r', 1),
(434, 'Europe/Vaduz\r', 1),
(435, 'Europe/Vatican\r', 1),
(436, 'Europe/Vienna\r', 1),
(437, 'Europe/Vilnius\r', 1),
(438, 'Europe/Volgograd\r', 1),
(439, 'Europe/Warsaw\r', 1),
(440, 'Europe/Zagreb\r', 1),
(441, 'Europe/Zaporozhye\r', 1),
(442, 'Europe/Zurich\r', 1),
(443, 'GB\r', 1),
(444, 'GB-Eire\r', 1),
(445, 'GMT\r', 1),
(446, 'GMT+0\r', 1),
(447, 'GMT0\r', 1),
(448, 'GMT-0\r', 1),
(449, 'Greenwich\r', 1),
(450, 'Hong Kong\r', 1),
(451, 'HST\r', 1),
(452, 'Iceland\r', 1),
(453, 'Indian/Antananarivo\r', 1),
(454, 'Indian/Chagos\r', 1),
(455, 'Indian/Christmas\r', 1),
(456, 'Indian/Cocos\r', 1),
(457, 'Indian/Comoro\r', 1),
(458, 'Indian/Kerguelen\r', 1),
(459, 'Indian/Mahe\r', 1),
(460, 'Indian/Maldives\r', 1),
(461, 'Indian/Mauritius\r', 1),
(462, 'Indian/Mayotte\r', 1),
(463, 'Indian/Reunion\r', 1),
(464, 'Iran\r', 1),
(465, 'Israel\r', 1),
(466, 'Jamaica\r', 1),
(467, 'Japan\r', 1),
(468, 'JST-9\r', 1),
(469, 'Kwajalein\r', 1),
(470, 'Libya\r', 1),
(471, 'MET\r', 1),
(472, 'Mexico/BajaNorte\r', 1),
(473, 'Mexico/BajaSur\r', 1),
(474, 'Mexico/General\r', 1),
(475, 'MST\r', 1),
(476, 'MST7MDT\r', 1),
(477, 'Navajo\r', 1),
(478, 'NZ\r', 1),
(479, 'NZ-CHAT\r', 1),
(480, 'Pacific/Apia\r', 1),
(481, 'Pacific/Auckland\r', 1),
(482, 'Pacific/Chatham\r', 1),
(483, 'Pacific/Chuuk\r', 1),
(484, 'Pacific/Easter\r', 1),
(485, 'Pacific/Efate\r', 1),
(486, 'Pacific/Enderbury\r', 1),
(487, 'Pacific/Fakaofo\r', 1),
(488, 'Pacific/Fiji\r', 1),
(489, 'Pacific/Funafuti\r', 1),
(490, 'Pacific/Galapagos\r', 1),
(491, 'Pacific/Gambier\r', 1),
(492, 'Pacific/Guadalcanal\r', 1),
(493, 'Pacific/Guam\r', 1),
(494, 'Pacific/Honolulu\r', 1),
(495, 'Pacific/Johnston\r', 1),
(496, 'Pacific/Kiritimati\r', 1),
(497, 'Pacific/Kosrae\r', 1),
(498, 'Pacific/Kwajalein\r', 1),
(499, 'Pacific/Majuro\r', 1),
(500, 'Pacific/Marquesas\r', 1),
(501, 'Pacific/Midway\r', 1),
(502, 'Pacific/Nauru\r', 1),
(503, 'Pacific/Niue\r', 1),
(504, 'Pacific/Norfolk\r', 1),
(505, 'Pacific/Noumea\r', 1),
(506, 'Pacific/Pago_Pago\r', 1),
(507, 'Pacific/Palau\r', 1),
(508, 'Pacific/Pitcairn\r', 1),
(509, 'Pacific/Pohnpei\r', 1),
(510, 'Pacific/Ponape\r', 1),
(511, 'Pacific/Port_Moresby\r', 1),
(512, 'Pacific/Rarotonga\r', 1),
(513, 'Pacific/Saipan\r', 1),
(514, 'Pacific/Samoa\r', 1),
(515, 'Pacific/Tahiti\r', 1),
(516, 'Pacific/Tarawa\r', 1),
(517, 'Pacific/Tongatapu\r', 1),
(518, 'Pacific/Truk\r', 1),
(519, 'Pacific/Wake\r', 1),
(520, 'Pacific/Wallis\r', 1),
(521, 'Pacific/Yap\r', 1),
(522, 'Poland\r', 1),
(523, 'Portugal\r', 1),
(524, 'PRC\r', 1),
(525, 'PST8PDT\r', 1),
(526, 'ROC\r', 1),
(527, 'ROK\r', 1),
(528, 'Singapore\r', 1),
(529, 'Turkey\r', 1),
(530, 'UCT\r', 1),
(531, 'Universal\r', 1),
(532, 'US/Alaska\r', 1),
(533, 'US/Aleutian\r', 1),
(534, 'US/Arizona\r', 1),
(535, 'US/Central\r', 1),
(536, 'US/Eastern\r', 1),
(537, 'US/East-Indiana\r', 1),
(538, 'US/Hawaii\r', 1),
(539, 'US/Indiana-Starke\r', 1),
(540, 'US/Michigan\r', 1),
(541, 'US/Mountain\r', 1),
(542, 'US/Pacific\r', 1),
(543, 'US/Pacific-New\r', 1),
(544, 'US/Samoa\r', 1),
(545, 'UTC\r', 1),
(546, 'WET\r', 1),
(547, 'W-SU\r', 1),
(548, 'Zulu\r', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_units`
--

CREATE TABLE `db_units` (
  `id` int(5) NOT NULL,
  `unit_name` varchar(50) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_units`
--

INSERT INTO `db_units` (`id`, `unit_name`, `description`, `company_id`, `status`) VALUES
(7, 'Box', 'Box Information', NULL, 1),
(8, 'CARTON', 'Drums Information', NULL, 1),
(9, 'Pieces', 'Pieces Information', NULL, 1),
(10, 'Grams', 'Grams Description', NULL, 1),
(11, 'Packets', 'Packets information', NULL, 1),
(12, 'LITRES', 'Unit Description', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_users`
--

CREATE TABLE `db_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `member_of` varchar(50) DEFAULT NULL,
  `firstname` varchar(1350) DEFAULT NULL,
  `lastname` varchar(1350) DEFAULT NULL,
  `mobile` varchar(405) DEFAULT NULL,
  `email` varchar(1350) DEFAULT NULL,
  `photo` blob DEFAULT NULL,
  `gender` varchar(1350) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `country` varchar(1620) DEFAULT NULL,
  `state` varchar(1350) DEFAULT NULL,
  `city` varchar(1620) DEFAULT NULL,
  `address` blob DEFAULT NULL,
  `branch_id` int(70) DEFAULT NULL,
  `postcode` varchar(270) DEFAULT NULL,
  `role_name` varchar(1350) DEFAULT NULL,
  `role_id` int(5) DEFAULT NULL,
  `profile_picture` text DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `system_ip` varchar(100) DEFAULT NULL,
  `system_name` varchar(100) DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_users`
--

INSERT INTO `db_users` (`id`, `username`, `password`, `member_of`, `firstname`, `lastname`, `mobile`, `email`, `photo`, `gender`, `dob`, `country`, `state`, `city`, `address`, `branch_id`, `postcode`, `role_name`, `role_id`, `profile_picture`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `company_id`, `status`) VALUES
(1, 'admin', '7ece99e593ff5dd200e2b9233d9ba654', '', NULL, NULL, '0765558805', 'info@jtechsolution.co.tz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 'uploads/users/inventory(1).jpg', '2018-11-27', '::1', NULL, NULL, NULL, 1, 1),
(6, 'sales', 'd043caf4ce3f60e28d2b828a14dc8326', NULL, NULL, NULL, '0767636943', 'sales@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '', '2025-05-11', '07:08:21 pm', 'admin', '197.250.227.164', '197.250.227.164', NULL, 1),
(7, 'user 1', '25d55ad283aa400af464c76d713c07ad', NULL, NULL, NULL, '0755288000', 'user1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '', '2025-07-24', '05:49:31 pm', 'admin', '127.0.0.1', 'localhost', NULL, 1),
(8, 'mwasimba', '25d55ad283aa400af464c76d713c07ad', NULL, NULL, NULL, '0767636944', 'mwas@mail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, '', '2025-07-24', '05:52:08 pm', 'admin', '127.0.0.1', 'localhost', NULL, 1),
(10, 'user3', 'bad670f05ad869901d90a37aef62572c', NULL, NULL, NULL, '0711223343', 'user3@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 3, '', '2025-07-24', '06:11:17 pm', 'admin', '127.0.0.1', 'localhost', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_warehouse`
--

CREATE TABLE `db_warehouse` (
  `id` int(5) NOT NULL,
  `warehouse_name` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_branch_access`
--

CREATE TABLE `user_branch_access` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `db_account_header`
--
ALTER TABLE `db_account_header`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_account_main`
--
ALTER TABLE `db_account_main`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_brands`
--
ALTER TABLE `db_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_category`
--
ALTER TABLE `db_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_cobpayments`
--
ALTER TABLE `db_cobpayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_country`
--
ALTER TABLE `db_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_currency`
--
ALTER TABLE `db_currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_customers`
--
ALTER TABLE `db_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_customer_payments`
--
ALTER TABLE `db_customer_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `salespayment_id` (`salespayment_id`);

--
-- Indexes for table `db_expense`
--
ALTER TABLE `db_expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_expense_category`
--
ALTER TABLE `db_expense_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_hold`
--
ALTER TABLE `db_hold`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `db_holditems`
--
ALTER TABLE `db_holditems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_id` (`hold_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `db_items`
--
ALTER TABLE `db_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_languages`
--
ALTER TABLE `db_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_paymenttypes`
--
ALTER TABLE `db_paymenttypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_permissions`
--
ALTER TABLE `db_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_purchase`
--
ALTER TABLE `db_purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_purchaseitems`
--
ALTER TABLE `db_purchaseitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_purchaseitemsreturn`
--
ALTER TABLE `db_purchaseitemsreturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_purchasepayments`
--
ALTER TABLE `db_purchasepayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_purchasepaymentsreturn`
--
ALTER TABLE `db_purchasepaymentsreturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_purchasereturn`
--
ALTER TABLE `db_purchasereturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_roles`
--
ALTER TABLE `db_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_sales`
--
ALTER TABLE `db_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_salesitems`
--
ALTER TABLE `db_salesitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_salesitemsreturn`
--
ALTER TABLE `db_salesitemsreturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_salespayments`
--
ALTER TABLE `db_salespayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_salespaymentsreturn`
--
ALTER TABLE `db_salespaymentsreturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_salesreturn`
--
ALTER TABLE `db_salesreturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_sitesettings`
--
ALTER TABLE `db_sitesettings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currencysymbol_id` (`currencysymbol_id`);

--
-- Indexes for table `db_smsapi`
--
ALTER TABLE `db_smsapi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_smstemplates`
--
ALTER TABLE `db_smstemplates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_sobpayments`
--
ALTER TABLE `db_sobpayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_states`
--
ALTER TABLE `db_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_stockentry`
--
ALTER TABLE `db_stockentry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_suppliers`
--
ALTER TABLE `db_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_supplier_payments`
--
ALTER TABLE `db_supplier_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `purchasepayment_id` (`purchasepayment_id`);

--
-- Indexes for table `db_tax`
--
ALTER TABLE `db_tax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_timezone`
--
ALTER TABLE `db_timezone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_units`
--
ALTER TABLE `db_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_users`
--
ALTER TABLE `db_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_warehouse`
--
ALTER TABLE `db_warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_branch_access`
--
ALTER TABLE `user_branch_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_account_header`
--
ALTER TABLE `db_account_header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `db_account_main`
--
ALTER TABLE `db_account_main`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `db_brands`
--
ALTER TABLE `db_brands`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `db_category`
--
ALTER TABLE `db_category`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `db_cobpayments`
--
ALTER TABLE `db_cobpayments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_country`
--
ALTER TABLE `db_country`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `db_currency`
--
ALTER TABLE `db_currency`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `db_customers`
--
ALTER TABLE `db_customers`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `db_customer_payments`
--
ALTER TABLE `db_customer_payments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `db_expense`
--
ALTER TABLE `db_expense`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `db_expense_category`
--
ALTER TABLE `db_expense_category`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `db_hold`
--
ALTER TABLE `db_hold`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_holditems`
--
ALTER TABLE `db_holditems`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_items`
--
ALTER TABLE `db_items`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `db_languages`
--
ALTER TABLE `db_languages`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `db_paymenttypes`
--
ALTER TABLE `db_paymenttypes`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `db_permissions`
--
ALTER TABLE `db_permissions`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `db_purchase`
--
ALTER TABLE `db_purchase`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `db_purchaseitems`
--
ALTER TABLE `db_purchaseitems`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_purchaseitemsreturn`
--
ALTER TABLE `db_purchaseitemsreturn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_purchasepayments`
--
ALTER TABLE `db_purchasepayments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `db_purchasepaymentsreturn`
--
ALTER TABLE `db_purchasepaymentsreturn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_purchasereturn`
--
ALTER TABLE `db_purchasereturn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_roles`
--
ALTER TABLE `db_roles`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `db_sales`
--
ALTER TABLE `db_sales`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `db_salesitems`
--
ALTER TABLE `db_salesitems`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `db_salesitemsreturn`
--
ALTER TABLE `db_salesitemsreturn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_salespayments`
--
ALTER TABLE `db_salespayments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `db_salespaymentsreturn`
--
ALTER TABLE `db_salespaymentsreturn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_salesreturn`
--
ALTER TABLE `db_salesreturn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_sitesettings`
--
ALTER TABLE `db_sitesettings`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_smsapi`
--
ALTER TABLE `db_smsapi`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `db_smstemplates`
--
ALTER TABLE `db_smstemplates`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_sobpayments`
--
ALTER TABLE `db_sobpayments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_states`
--
ALTER TABLE `db_states`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `db_stockentry`
--
ALTER TABLE `db_stockentry`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2396;

--
-- AUTO_INCREMENT for table `db_suppliers`
--
ALTER TABLE `db_suppliers`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_supplier_payments`
--
ALTER TABLE `db_supplier_payments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `db_tax`
--
ALTER TABLE `db_tax`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `db_timezone`
--
ALTER TABLE `db_timezone`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=549;

--
-- AUTO_INCREMENT for table `db_units`
--
ALTER TABLE `db_units`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `db_users`
--
ALTER TABLE `db_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `db_warehouse`
--
ALTER TABLE `db_warehouse`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_branch_access`
--
ALTER TABLE `user_branch_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `db_customer_payments`
--
ALTER TABLE `db_customer_payments`
  ADD CONSTRAINT `db_customer_payments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_customer_payments_ibfk_2` FOREIGN KEY (`salespayment_id`) REFERENCES `db_salespayments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_hold`
--
ALTER TABLE `db_hold`
  ADD CONSTRAINT `db_hold_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_holditems`
--
ALTER TABLE `db_holditems`
  ADD CONSTRAINT `db_holditems_ibfk_2` FOREIGN KEY (`hold_id`) REFERENCES `db_hold` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_holditems_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `db_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_supplier_payments`
--
ALTER TABLE `db_supplier_payments`
  ADD CONSTRAINT `db_supplier_payments_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_supplier_payments_ibfk_2` FOREIGN KEY (`purchasepayment_id`) REFERENCES `db_purchasepayments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_branch_access`
--
ALTER TABLE `user_branch_access`
  ADD CONSTRAINT `user_branch_access_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_branch_access_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
