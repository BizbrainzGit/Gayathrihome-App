-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2021 at 07:03 AM
-- Server version: 10.4.10-MariaDB
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
-- Database: `gayathrihome-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(28) NOT NULL,
  `permissions` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `forgot_password_code` varchar(255) DEFAULT NULL,
  `fcm_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `email`, `role`, `permissions`, `created_by`, `forgot_password_code`, `fcm_id`, `date_created`) VALUES
(1, 'gayathrihome', 'e6e061838856bf47e1de730719fb2609', 'support@gayathrihomeappliances.com', 'super admin', '{\"orders\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"categories\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"sellers\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"subcategories\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"products\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"products_order\":{\"read\":\"1\",\"update\":\"1\"},\"featured\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"customers\":{\"read\":\"1\"},\"payment\":{\"read\":\"1\",\"update\":\"1\"},\"notifications\":{\"create\":\"1\",\"read\":\"1\",\"delete\":\"1\"},\"transactions\":{\"read\":\"1\"},\"settings\":{\"read\":\"1\",\"update\":\"1\"},\"locations\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"reports\":{\"create\":\"1\",\"read\":\"1\"},\"faqs\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"home_sliders\":{\"create\":\"1\",\"read\":\"1\",\"delete\":\"1\"},\"new_offers\":{\"create\":\"1\",\"read\":\"1\",\"delete\":\"1\"},\"promo_codes\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"delivery_boys\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"return_requests\":{\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"}}', 0, '', 'cv7qKEjDS-uhwHzhFxCiwq:APA91bFzCRjuBWXM3lEM5rlxVrkXRMfAgPM4E6PTa7Q79bFgP9yMj5OI6eIG2O4koStpX97hHE8GyTN-453Fd4s9cDKtb6TiVj5103ORdAQlwPgyAIazDiUcYu-FS6COuRF0YIzJWQu0', '2020-06-22 16:48:25');

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT 0,
  `pincode_id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `minimum_free_delivery_order_amount` int(11) NOT NULL DEFAULT 0,
  `delivery_charges` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `name` varchar(60) NOT NULL,
  `subtitle` text NOT NULL,
  `image` text NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `product_rating` tinyint(4) NOT NULL DEFAULT 0,
  `web_image` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `row_order`, `name`, `subtitle`, `image`, `status`, `product_rating`, `web_image`) VALUES
(1, 0, 'Prestige', 'Prestige', 'upload/images/2904-2021-09-07.png', 1, 0, ''),
(2, 0, 'Preethi', 'Preethi', 'upload/images/8477-2021-09-07.png', 1, 0, ''),
(3, 0, 'Ultra', 'Ultra', 'upload/images/1554-2021-09-07.png', 1, 0, ''),
(4, 0, 'Butterfly', 'Butterfly', 'upload/images/7347-2021-09-07.png', 1, 0, ''),
(5, 0, 'Samsung', 'Samsung', 'upload/images/5313-2021-09-07.png', 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fcm_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `seller_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `status` char(1) DEFAULT '1',
  `seller_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fund_transfers`
--

CREATE TABLE `fund_transfers` (
  `id` int(11) NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `type` varchar(8) NOT NULL COMMENT 'credit | debit',
  `opening_balance` double NOT NULL,
  `closing_balance` double NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(28) NOT NULL,
  `message` varchar(512) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `invoice_date` date NOT NULL,
  `order_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `order_date` datetime NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `order_list` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `discount` varchar(6) NOT NULL,
  `total_sale` varchar(10) NOT NULL,
  `shipping_charge` varchar(100) NOT NULL,
  `payment` text NOT NULL,
  `order_item_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `message` varchar(512) NOT NULL,
  `type` varchar(12) NOT NULL,
  `type_id` int(11) NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `otp` int(11) DEFAULT NULL,
  `mobile` varchar(15) NOT NULL,
  `order_note` text DEFAULT NULL,
  `total` float NOT NULL,
  `delivery_charge` float NOT NULL,
  `tax_amount` float NOT NULL DEFAULT 0,
  `tax_percentage` float NOT NULL DEFAULT 0,
  `wallet_balance` float NOT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `promo_code` varchar(28) DEFAULT NULL,
  `promo_discount` float NOT NULL DEFAULT 0,
  `final_total` float DEFAULT NULL,
  `payment_method` varchar(16) NOT NULL,
  `address` text NOT NULL,
  `latitude` varchar(256) NOT NULL,
  `longitude` varchar(256) NOT NULL,
  `delivery_time` varchar(128) NOT NULL,
  `status` varchar(1024) NOT NULL,
  `active_status` varchar(16) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_from` int(11) DEFAULT 0,
  `pincode_id` int(11) DEFAULT 0,
  `area_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_name` text CHARACTER SET utf8 DEFAULT NULL,
  `variant_name` text CHARACTER SET utf8 DEFAULT NULL,
  `product_variant_id` int(11) NOT NULL,
  `delivery_boy_id` int(11) DEFAULT 0,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `discounted_price` double NOT NULL,
  `tax_amount` float DEFAULT 0,
  `tax_percentage` float DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `sub_total` float NOT NULL,
  `status` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `active_status` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `seller_id` int(11) DEFAULT NULL,
  `is_credited` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `txnid` varchar(20) NOT NULL,
  `payment_amount` decimal(7,2) NOT NULL,
  `payment_status` varchar(25) NOT NULL,
  `itemid` varchar(25) NOT NULL,
  `createdtime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_requests`
--

CREATE TABLE `payment_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_type` varchar(56) NOT NULL,
  `payment_address` varchar(1024) NOT NULL,
  `amount_requested` int(11) NOT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pincodes`
--

CREATE TABLE `pincodes` (
  `id` int(11) NOT NULL,
  `pincode` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pincodes`
--

INSERT INTO `pincodes` (`id`, `pincode`, `status`, `date_created`) VALUES
(1, '500040', 1, '2021-07-08 17:17:21'),
(2, '500016', 1, '2021-07-21 13:04:14'),
(3, '500052', 1, '2021-07-21 13:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `name` varchar(500) NOT NULL,
  `tax_id` tinyint(4) DEFAULT 0,
  `slug` varchar(120) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `indicator` tinyint(4) DEFAULT 0 COMMENT '0 - none | 1 - veg | 2 - non-veg',
  `manufacturer` varchar(512) DEFAULT NULL,
  `made_in` varchar(512) DEFAULT NULL,
  `return_status` tinyint(4) DEFAULT NULL,
  `cancelable_status` tinyint(4) DEFAULT NULL,
  `till_status` varchar(28) DEFAULT NULL,
  `image` text NOT NULL,
  `other_images` varchar(512) DEFAULT NULL,
  `description` text NOT NULL,
  `status` int(11) DEFAULT 1,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_approved` int(11) DEFAULT NULL,
  `return_days` int(11) DEFAULT 0,
  `type` text DEFAULT NULL,
  `pincodes` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `seller_id`, `row_order`, `name`, `tax_id`, `slug`, `category_id`, `subcategory_id`, `indicator`, `manufacturer`, `made_in`, `return_status`, `cancelable_status`, `till_status`, `image`, `other_images`, `description`, `status`, `date_added`, `is_approved`, `return_days`, `type`, `pincodes`) VALUES
(1, 1, 0, 'Samsung Microwave Oven', 0, 'samsung-microwave-oven', 5, 1, 0, '', '', 0, 0, '', 'upload/images/9443-2021-09-08.jpg', '', '<ul>\r\n	<li>Warranty: 1 Year Complete + 4 Years additional warranty on Magnetron</li>\r\n	<li>Masala, tadka, and sun-dry, hot blast</li>\r\n	<li>Dough, roti/naan, high/low rack, touch and dial control</li>\r\n	<li>340 auto cook menu/200 Indian menu, slim fry, curd making, crusty plate, smart sensor</li>\r\n	<li>Country of Origin: India</li>\r\n</ul>', 1, '2021-09-08 06:26:21', 1, 0, 'all', ''),
(2, 1, 0, 'Prestige Pressure Cooker', 0, 'prestige-pressure-cooker', 1, 2, 0, '', '', 0, 0, '', 'upload/images/1961-2021-09-08.jpg', '', '<ul>\r\n	<li>Materia Type: Aluminium; Base type: Non-induction base; Capacity: 5 L; Lid Type: Outer Lid; Base thickness (in mm): 3.5 mm; Weight: 1.49 kg; Colour Silver. Dishwasher Safe: Yes. Lid Locking Mechanism: Knob Lock System</li>\r\n	<li>METALLIC SAFETY PLUG: It is the 3rd level of safety feature top fitted to the lid, to release excess pressure, when it rises beyond a safety level. Thus making it extremely safe to use.</li>\r\n	<li>BASE: Prestige Popular comes with an Aluminium base which is thick and machine pressed. The slight concave bottom ensures shape is retained for longer.</li>\r\n	<li>BODY: Prestige Popular is an outer lid pressure cooker made from virgin aluminium which is light in weight and long-lasting. The outer lid feature is suitable for both separator cooking and direct vessel cooking.</li>\r\n	<li>PRECISION WEIGHT VALVE: It is the first level of safety feature to release pressure above 1kg/cm2, which makes the cooking safe and time saving for you. It is made up of brass with steel coating on it for durability</li>\r\n	<li>GASKET RELEASE SYSTEM: This is the 2nd level of safety provide in the Prestige pressure cooker, in case there is any blockage of the vent tube, the gasket will bulge and steam will release through the slot. Thus making it extremely safe for usage.</li>\r\n	<li>For any issues, contact_us on: [1800-123-334414]. Warranty: 5 years. Country of Origin: India</li>\r\n</ul>', 1, '2021-09-08 06:46:05', 1, 0, 'all', ''),
(3, 1, 0, 'Ultra Pressure Cooker', 0, 'ultra-pressure-cooker', 3, 3, 0, '', '', 0, 0, '', 'upload/images/1417-2021-09-08.jpg', '', '<ul>\r\n	<li>The heat-resistant and heavy solid bakelite handles with twin screws ensures that handles do not become loose</li>\r\n	<li>Material Type - Stainless Steel</li>\r\n	<li>Durable and Long-lasting</li>\r\n</ul>', 1, '2021-09-08 06:54:19', 1, 0, 'all', ''),
(4, 1, 0, 'Butterfly Pressure Cooker', 0, 'butterfly-pressure-cooker', 4, 4, 0, '', '', 0, 0, '', 'upload/images/6076-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Ergonomically designed, made through food-grade virgin aluminium for better hygiene and long life</li>\r\n	<li>Aesthetically designed handle, easy grip and stay-cool handle, lock arrangement in handles ensure uni-directional rotation</li>\r\n	<li>Precisely designed weight set to regulate cooking steam pressure</li>\r\n	<li>Specially formulated food grade rubber with longer life does not impart colour, taste or odour to the food</li>\r\n	<li>Suitable for induction stove and LPG stove</li>\r\n	<li>Colour: Silver, Material: Aluminium</li>\r\n	<li>Package Contents: 1-Piece Pressure Cooker (5 Litres) and User Manual with Warranty card</li>\r\n	<li>Warranty: 5 years on product</li>\r\n</ul>', 1, '2021-09-08 06:59:19', 1, 0, 'all', ''),
(5, 1, 0, 'Prestige Gas Stove', 0, 'prestige-gas-stove', 1, 5, 0, '', '', 0, 0, '', 'upload/images/2770-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Gas stove type: Manual; Burner material: Brass; Size of the burner: 1 Small, 1 Medium, 1 Big; Material of the body: Powder Coated Body; Material of the top: Toughened Glass-Top; Size of the gas stove (in cm): 58.5*57*13; Colour: Black</li>\r\n	<li>Warranty: 2 years; Covered in warranty: Manufacturing defect and others mentioned in the user manual; Not covered in warranty: Mentioned in the manual</li>\r\n	<li>For any issues, contact_us on: [1800-123-334437]</li>\r\n	<li>A Smart and Compact Glass top Gas table for a modern kitchen!</li>\r\n	<li>The specialty of this Glass Top Gas Stove from Prestige is that it is compact in size and thoughtfully designed to consume less countertop space.</li>\r\n	<li>These gas tables come with shatterproof toughened glass top for longer life and convenient cleaning</li>\r\n	<li>It has highly efficient tri pin burners, which helps you to cook faster and more efficiently.</li>\r\n</ul>', 1, '2021-09-08 07:15:10', 1, 0, 'all', ''),
(6, 1, 0, 'Preethi Gas Stove', 0, 'preethi-gas-stove', 2, 6, 0, '', '', 0, 0, '', 'upload/images/3601-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>India’s only ISI approved glass top</li>\r\n	<li>Thermally toughened glass (gas dimension: 740mm x 360mm) with maximum leg height 40 mm</li>\r\n	<li>Heavy brass burners make cooking faster. Wear Resistant: No</li>\r\n	<li>High efficiency tri-pin burners</li>\r\n	<li>Spill proof design, manual ignition model, two burner glass top</li>\r\n	<li>Triad nozzle design: On request it can be installed with a minimal fee (call preethi care: 9940000005)</li>\r\n	<li>Gas stove with the highest efficiency 69 percent+</li>\r\n</ul>', 1, '2021-09-08 07:17:57', 1, 0, 'all', ''),
(7, 1, 0, 'Ultra Gas Stove', 0, 'ultra-gas-stove', 3, 7, 0, '', '', 0, 0, '', 'upload/images/7144-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Fastener free spill tray for ease of cleaning</li>\r\n	<li>Ergonomic Knob for better grip</li>\r\n	<li>360-degree revolving gas inlet nozzle</li>\r\n	<li>Service friendly assembly</li>\r\n	<li>ISI certified gas stove</li>\r\n	<li>Color: Black, Material: Glass</li>\r\n	<li>Package Contents: 1-Gas Stove</li>\r\n	<li>Warranty: 2 Years Manufacturer Warranty</li>\r\n</ul>', 1, '2021-09-08 07:21:40', 1, 0, 'all', ''),
(8, 1, 0, 'Butterfly Gas Stove', 0, 'butterfly-gas-stove', 4, 8, 0, '', '', 0, 0, '', 'upload/images/4936-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Superior quality brass burners</li>\r\n	<li>Spill-proof design, ABS Knob for durability and long life</li>\r\n	<li>High thermal efficiency</li>\r\n	<li>Unique pan support for better balance</li>\r\n	<li>360-degree revolving nozzle</li>\r\n	<li>Easy cleaning</li>\r\n	<li>Color: Silver, Material: Stainless Steel, Shape: Rectangle</li>\r\n</ul>', 1, '2021-09-08 07:23:11', 1, 0, 'all', ''),
(9, 1, 0, 'Prestige Induction Cook-Top', 0, 'prestige-induction-cook-top', 1, 9, 0, '', '', 0, 0, '', 'upload/images/0805-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Concealed and feather touch buttons</li>\r\n	<li>Anti-magnetic wall, Push Button Controls</li>\r\n	<li>Body Material - Full Glass</li>\r\n	<li>Automatic voltage regulator. Indian menu option</li>\r\n	<li>Unique design for protection against insects</li>\r\n	<li>Warranty: 1 year on product</li>\r\n	<li>Power: 1900 watts; Operating Voltage: 230 volts</li>\r\n	<li>Includes: Induction cooktop</li>\r\n</ul>', 1, '2021-09-08 08:26:04', 1, 0, 'all', ''),
(10, 1, 0, 'Preethi Induction Cook-Top', 0, 'preethi-induction-cook-top', 2, 10, 0, '', '', 0, 0, '', 'upload/images/2583-2021-09-08.jpg', '', '<ul>\r\n	<li>8 Preset Menus With Timer Functions, Auto Switch off Features, One Year Warranty.</li>\r\n	<li>Pause &amp; Temperature Control, Indian Menus: Gravy, Roti/Dosa, Fry, Idli , Boil, Slow Cook &amp; Milk/Tea</li>\r\n</ul>', 1, '2021-09-08 08:33:37', 1, 0, 'all', ''),
(11, 1, 0, 'Butterfly Induction Cook-Top', 0, 'butterfly-induction-cook-top', 4, 11, 0, '', '', 0, 0, '', 'upload/images/0609-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Aesthetic and Compact Design</li>\r\n	<li>2000 Watts for faster cooking</li>\r\n	<li>4 Digit Digital Display</li>\r\n	<li>Auto Shut OFF without Pot, 7 Menus for Easy Cooking</li>\r\n	<li>Over Heat Protection, Energy Efficient for Power Saving</li>\r\n</ul>', 1, '2021-09-08 08:38:12', 1, 0, 'all', ''),
(12, 1, 0, 'Prestige Roti Maker', 0, 'prestige-roti-maker', 1, 12, 0, '', '', 0, 0, '', 'upload/images/0935-2021-09-08.jpg', '', '<p>This <strong>Roti Maker</strong> allows you to serve up perfectly round chapatti, it is a must-have appliance.</p>\r\n\r\n<p>Interested in this product?</p>', 1, '2021-09-08 08:43:00', 1, 0, 'all', ''),
(13, 1, 0, 'Butterfly Mixer Grinder', 0, 'butterfly-mixer-grinder', 4, 16, 0, '', '', 0, 0, '', 'upload/images/1081-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Wattage: 500 W; Voltage: 220-240V, 50-60Hz ; Revolution: 17000</li>\r\n	<li>No of Jars: 3; Jar Size: 0.4,0.75,1 in Ltr; Jar Material: Stainless Steel; Body Material: ABS body; Cord Material: 180 CM; Blade Material: Stainless Steel; Speed Control: 3 Speed Control</li>\r\n	<li>Do not worry if you experience some burning smell when you run your mixer grinder for the 1st time .This is due to the motor varnish getting heated for the 1st time. The problem should not recur in subsequent uses. If it does, please contact Brand Service Centre</li>\r\n	<li>Read Manual Before Use</li>\r\n	<li>High performance motor, with motor overload protector; Aesthetically designed</li>\r\n	<li>Special rubber shoes for extra firm grip; Easy to handle and clean</li>\r\n	<li>Includes: 1 No. of Main Unit, 3 Jars, 1 No. of Spatula, 1 No. of User Manual with Warranty Card</li>\r\n</ul>', 1, '2021-09-08 08:52:23', 1, 0, 'all', ''),
(14, 1, 0, 'Preethi Mixer Grinders', 0, 'preethi-mixer-grinders', 2, 14, 0, '', '', 0, 0, '', 'upload/images/2514-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Country of Origin: India. Warranty: 2 years on product</li>\r\n	<li>Operating voltage: 230 volts, High Grade Nylon Couplers for smooth trouble free usage. Flex Cord: PVC insulated 3 Core</li>\r\n	<li>This product does not require installation. please contact brand customer care for any product related queires.</li>\r\n	<li>Since your mixer grinder runs on a powerful motor, there will be some noise. Product Operating Noise Level : 80 Db(Mixer Grinder industry wide acceptable levels: 80-90 DB) ; human voice as a reference(50-60 db). If noise level seems to be higher than this, please contact Brand Service Centre</li>\r\n	<li>Includes: Jar (1.5 litres), Chutney jar (0.5 litre), Chutney jar (0.4 litre), Dome 1.5 popular, 0.5 Dome, 0.4 CG Lid , Flexi lid (1.5 litres), Stirrer, Instructional manual, Customer care list and Warranty card</li>\r\n	<li>India&#39;s No 1 Mixer-Grinder Brand(as per Francis Kanoi), Suitable for Wet Grinding, Liquidizing</li>\r\n	<li>Blades are machine-ground, polished to give you that quick and superior grinding performance. Adapt your jar to suit your various grinding needs, 100 percent stainless steel jars and blades</li>\r\n</ul>', 1, '2021-09-08 08:58:23', 1, 0, 'all', ''),
(15, 1, 0, 'Prestige Mixer Grinders', 0, 'prestige-mixer-grinders', 1, 13, 0, '', '', 0, 0, '', 'upload/images/0214-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Motor Warranty: 2; Product Warranty: 2;</li>\r\n	<li>Operating noise levels between 80-90 dB; Initial burning smell is to be expected due to evaporating varnish</li>\r\n	<li>i) Jar safety lock to ensure safety - product won&#39;t start if not locked correctly ii) Do not run the mixer grinder for more than 5 minutes continuously, give a gap of 2 minutes if you need to use for more time</li>\r\n	<li>Wattage: 750 W; Voltage: 230 V; Revolution: 20000 RPM</li>\r\n	<li>4 Super efficient blades and Stainless Steel jars along With Polycarbonate Jar.</li>\r\n	<li>The grinder features an overload protection switch that cuts off power supply to the appliance to prevent the motor from overheating</li>\r\n	<li>No of Jars: 4; Jar Size: Wet grinding jar (1.5L), Juicer Jar(1.5) LDry grinding jar (1 L), Chutney Jar (300ml); Jar Material: Stainless Steel + Juice Jar( Polycarobonate); Body Material: ABS Plastic; Cord Material: PVC with copper wire; Blade Material: Stainless Steel; Speed Control: 3 speed control</li>\r\n	<li>Powerful 750w motor</li>\r\n</ul>', 1, '2021-09-08 09:00:33', 1, 0, 'all', ''),
(16, 1, 0, 'Ultra Mixer Grinders', 0, 'ultra-mixer-grinders', 3, 15, 0, '', '', 0, 0, '', 'upload/images/5841-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>5 YEAR WARRANTY on MOTOR</li>\r\n	<li>Colour : Baby Blue</li>\r\n	<li>It scores high on the aspect of functionality</li>\r\n</ul>', 1, '2021-09-08 09:06:26', 1, 0, 'all', ''),
(17, 1, 0, 'Prestige Wet Grinders', 0, 'prestige-wet-grinders', 1, 17, 0, '', '', 0, 0, '', 'upload/images/7279-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>High Quality Grinding Stones, Stainless Steel Drum</li>\r\n	<li>Compact table top design</li>\r\n	<li>Fast and consistent grinding,Attractive designer body</li>\r\n	<li>2 litre capacity and 200 watts.</li>\r\n	<li>Warranty: 1 Year On product, 5 Year on Motor</li>\r\n</ul>', 1, '2021-09-08 09:47:19', 1, 0, 'all', ''),
(18, 1, 0, 'Preethi Wet Grinders', 0, 'preethi-wet-grinders', 2, 18, 0, '', '', 0, 0, '', 'upload/images/8597-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>High Torque motor for superior grinding performance ,Cylindrical grooved stone for effective grinding 900 RPM motor speed</li>\r\n	<li>Stainless Steel Drum for easy operation, Aesthetically designed compact body for modern kitchen ,Transparent drum lid for easy viewing</li>\r\n	<li>2 Year Warranty Life long free service</li>\r\n	<li>Safety: Shook proof ABS Body 3 core PVC insulated plugtop &amp; earthing</li>\r\n</ul>', 1, '2021-09-08 09:50:53', 1, 0, 'all', ''),
(19, 1, 0, 'Ultra Wet Grinders', 0, 'ultra-wet-grinders', 3, 19, 0, '', '', 0, 0, '', 'upload/images/3636-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Do not worry if you experience some burning smell when you run your mixer grinder for the 1st time .This is due to the motor varnish getting heated for the 1st time. The problem should not recur in subsequent uses. If it does, please contact Brand Service Centre</li>\r\n	<li>Since your mixer grinder runs on a powerful motor, there will be some noise. If the noise level seems abnormal, please contact Brand Service Centre</li>\r\n	<li>Conical grind stones,Fitted with sturdy and durable motor</li>\r\n	<li>Noiseless and vibration free operation. Rice grinding time-30 min. Dal grinding time-30 min</li>\r\n	<li>Patented Conical grinding stones- which results in better batter and less wear and tear of the stone</li>\r\n	<li>Capacity: 2 liters Material: food grade plastic</li>\r\n	<li>SS304 stainless steel drum and rust proof materials</li>\r\n</ul>', 1, '2021-09-08 09:53:28', 1, 0, 'all', ''),
(20, 1, 0, 'Butterfly Wet Grinders', 0, 'butterfly-wet-grinders', 4, 20, 0, '', '', 0, 0, '', 'upload/images/7620-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Wattage: 150 W; Voltage: 220-240V, 50-60Hz ; Revolution: 1300</li>\r\n	<li>No of Jars: 1; Jar Size: 2 Liters; Jar Material: Stainless Steel; Body Material: ABS body; Cord Material: 180 CM; Speed Control: 1 Speed Control</li>\r\n	<li>Read Manual Before Use</li>\r\n	<li>Powerful motor; Product Dimensions: 47.5 x 30.5 x 28 cm; Uniform grinding pressure and 4 Way grinding system</li>\r\n	<li>Shock proof ABS body, Feature: Detachable Stainless Steel drum &amp; roller stones</li>\r\n	<li>Sturdy single phase high torque motor; Unbreakable and transparent lids made of polycarbonate material; Includes: Main Unit, 2 stones, lid, Warranty card with user manual</li>\r\n</ul>', 1, '2021-09-08 09:55:33', 1, 0, 'all', ''),
(21, 1, 0, 'Prestige Electric Chimney', 0, 'prestige-electric-chimney', 1, 21, 0, '', '', 0, 0, '', 'upload/images/1255-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Type:Curved Glass,Wall Mounted | Colour: Steel &amp; Grey</li>\r\n	<li>Size: 60 cm (2-4 burner stove for wall mounted chimneys), Suction Capacity: 860 m3/hr (For kitchen size &gt;200 sqft &amp; heavy frying/grilling)</li>\r\n	<li>Baffle Filter is suitable for Indian kitchens &amp; requires cleaning every 6 months, Control Type: Gesture Control | Max noise(dB): 72</li>\r\n	<li>Thermal auto clean feature</li>\r\n</ul>', 1, '2021-09-08 10:05:48', 1, 0, 'all', ''),
(22, 1, 0, 'Butterfly Electric Chimneys', 0, 'butterfly-electric-chimneys', 4, 22, 0, '', '', 0, 0, '', 'upload/images/6105-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Type:Curved Glass,Wall Mounted | Colour: Steel &amp; Grey</li>\r\n	<li>Size: 60 cm (2-4 burner stove for wall mounted chimneys), Suction Capacity: 860 m3/hr (For kitchen size &gt;200 sqft &amp; heavy frying/grilling)</li>\r\n	<li>Baffle Filter is suitable for Indian kitchens &amp; requires cleaning every 6 months, Control Type: Gesture Control | Max noise(dB): 72</li>\r\n	<li>Thermal auto clean feature</li>\r\n</ul>', 1, '2021-09-08 10:07:52', 1, 0, 'all', ''),
(23, 1, 0, 'Butterfly Non Stick Cookware', 0, 'butterfly-non-stick-cookware', 4, 23, 0, '', '', 0, 0, '', 'upload/images/7401-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Induction compatible base</li>\r\n	<li>Heat resistant handle for better grip</li>\r\n	<li>Sturdy and impact resistant design</li>\r\n	<li>Five layer teflon infinity granite non-sticks coating</li>\r\n	<li>PFOA free</li>\r\n	<li>Color: Black and White, Material: Aluminium</li>\r\n	<li>Package Contents: 1-Piece Omni Tawa (28cm) and 1-Piece User Manual with Warranty Card</li>\r\n	<li>Warranty: 2 year maufacturer Warranty</li>\r\n</ul>', 1, '2021-09-08 10:13:00', 1, 0, 'all', ''),
(24, 1, 0, 'Butterfly Electric Rice Cooker', 0, 'butterfly-electric-rice-cooker', 4, 26, 0, '', '', 0, 0, '', 'upload/images/6564-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>MS outer Body</li>\r\n	<li>Aluminum inner cooking pot</li>\r\n	<li>User Friendly Control Panel</li>\r\n	<li>Auto Switching to warm mode</li>\r\n	<li>2 Year Warranty</li>\r\n	<li>Accessories: Additional Cooking Bowl, Rice Paddle, Measuring Cup</li>\r\n</ul>', 1, '2021-09-08 10:18:30', 1, 0, 'all', ''),
(25, 1, 0, 'Preethi Electric Rice Cookers', 0, 'preethi-electric-rice-cookers', 2, 25, 0, '', '', 0, 0, '', 'upload/images/2465-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Capacity: 2.2 liters</li>\r\n	<li>Heavy duty anodized cooking pan</li>\r\n	<li>Includes: Electric Cooker, Cooking Plate, Measuring Cup and Ladle</li>\r\n	<li>Warranty: 1 year on product and 5 years on heating coil</li>\r\n	<li>Overlapped heating coil for uniform cooking performance</li>\r\n	<li>Umbrella housing for heating coil make it fail proof and shock proof</li>\r\n	<li>Power: 750 watts; Operating Voltage: 230 volts</li>\r\n</ul>', 1, '2021-09-08 10:19:38', 1, 0, 'all', ''),
(26, 1, 0, 'Prestige Electric Rice Cookers', 0, 'prestige-electric-rice-cookers', 1, 24, 0, '', '', 0, 0, '', 'upload/images/8244-2021-09-08.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Has Auto Keep Warm Function Has Water Level Indicator</li>\r\n</ul>', 1, '2021-09-08 10:20:56', 1, 0, 'all', ''),
(27, 1, 0, 'Prestige Electric Toasters', 0, 'prestige-electric-toasters', 1, 27, 0, '', '', 0, 0, '', 'upload/images/5590-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>New designs, Durable die-cast aluminum grill plates</li>\r\n	<li>Heat Resistant, Bakelite body, User Friendly.Cord length 1.5 m</li>\r\n	<li>German Technology Greblon Nonstick coating for oil-free toasting</li>\r\n	<li>Power Indicators for ease of use</li>\r\n	<li>800 watts power, Voltage(V): 230 Volts</li>\r\n	<li>Easy to clean</li>\r\n	<li>Warranty: 1-year warranty provided by the manufacturer from date of purchase</li>\r\n	<li>Includes: 1 unit of PGMFD</li>\r\n</ul>', 1, '2021-09-11 05:26:15', 1, 0, 'all', ''),
(28, 1, 0, 'Butterfly Electric Toasters', 0, 'butterfly-electric-toasters', 4, 28, 0, '', '', 0, 0, '', 'upload/images/5122-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Two slice fixed sandwich maker</li>\r\n	<li>Indication lights for power on and off</li>\r\n	<li>Non-stick coating plate</li>\r\n	<li>Thermostat controlled</li>\r\n	<li>Fuse for over heat protection</li>\r\n	<li>Cool touch handle</li>\r\n	<li>Warranty: 1 year warranty provided by the manufacturer from date of purchase</li>\r\n</ul>', 1, '2021-09-11 05:28:27', 1, 0, 'all', ''),
(29, 1, 0, 'Prestige Sandwich Makers', 0, 'prestige-sandwich-makers', 1, 29, 0, '', '', 0, 0, '', 'upload/images/9057-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>New designs, Durable die cast aluminum grill plates</li>\r\n	<li>Heat Resistant, Bakelite body, User Friendly.Cord length 1.5 m</li>\r\n	<li>German Technology Greblon Non stick coating for oil free toasting</li>\r\n	<li>Power Indicators for easy of use</li>\r\n	<li>800 watts power, Voltage(V): 230 Volts</li>\r\n	<li>Easy to clean</li>\r\n	<li>Warranty: 1 year warranty provided by the manufacturer from date of purchase</li>\r\n	<li>Includes: 1 unit of PGMFD</li>\r\n</ul>', 1, '2021-09-11 05:30:56', 1, 0, 'all', ''),
(30, 1, 0, 'Butterfly Sandwich Makers', 0, 'butterfly-sandwich-makers', 4, 30, 0, '', '', 0, 0, '', 'upload/images/5197-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Two slice fixed sandwich maker</li>\r\n	<li>Indication lights for power on and off</li>\r\n	<li>Non-stick coating plate</li>\r\n	<li>Thermostat controlled</li>\r\n	<li>Fuse for over heat protection</li>\r\n	<li>Cool touch handle</li>\r\n	<li>Warranty: 1 year warranty provided by the manufacturer from date of purchase</li>\r\n</ul>', 1, '2021-09-11 05:32:35', 1, 0, 'all', ''),
(31, 1, 0, 'Prestige Electric Grills', 0, 'prestige-electric-grills', 1, 31, 0, '', '', 0, 0, '', 'upload/images/2156-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Content: Prestige Oven Toaster Griller 9L -Potg 9 Pc ; Have a great tea time! — With your Prestige Oven Toaster Griller you can prepare lip-smacking delicacies such as roast papad, cheese toasts, bread toast, baked vegetables, and much more</li>\r\n	<li>Heat-resistant handle : Yes,Maximum Timer Limit : 60 min , Net Quantity: 1 Unit.Auto Thermostat:Yes</li>\r\n	<li>Voltage: 230V; Wattage: 800W</li>\r\n	<li>Capacity: 9 litres, Suitable for 2-3 people</li>\r\n	<li>Cooking capability: Baking, Grilling, toasting</li>\r\n	<li>Warranty: 1 year</li>\r\n	<li>Includes Oven toaster grill, Instruction manual and Warranty card</li>\r\n</ul>', 1, '2021-09-11 05:54:40', 1, 0, 'all', ''),
(32, 1, 0, 'Prestige Hand Blender', 0, 'prestige-hand-blender', 1, 32, 0, '', '', 0, 0, '', 'upload/images/5734-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Stainless steel blades grinds and blends every particle perfectly, assuring amazing results in every use</li>\r\n	<li>Durable for daily use</li>\r\n	<li>Ergonomically designed hand blender gives you the perfect grip.</li>\r\n	<li>Slim body</li>\r\n</ul>', 1, '2021-09-11 06:05:13', 1, 0, 'all', ''),
(33, 1, 0, 'Butterfly Hand Blender', 0, 'butterfly-hand-blender', 4, 33, 0, '', '', 0, 0, '', 'upload/images/8344-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>✓The wavy blades mechanism is made of high quality stainless steel meaning hot liquids are not a problem, and the durable blades will withstand years of frequent use and ABS plastic body is lifelong durable</li>\r\n	<li>✓MADE IN INDIA :- Material &amp; Content: The wavy blades mechanism is made of high quality stainless steel meaning hot liquids are not a problem, and the durable blades will withstand years of frequent use and ABS plastic body is lifelong durable</li>\r\n	<li>✓Easy to grip, Extra durability, Heavy duty gear system, Quick to clean, Easy to store, Multi-purpose blades, high speed operation, Multi colors.</li>\r\n	<li>✓Material &amp; Content: The wavy blades mechanism is made of high quality stainless steel meaning hot liquids are not a problem, and the durable blades will withstand years of frequent use and ABS plastic body is lifelong durable</li>\r\n	<li>✓Stainless Steel Blade,Poly plstic material for extra durability,heavy duty gear system,easy to grip,convinient to use,Quick to clean</li>\r\n</ul>', 1, '2021-09-11 06:26:51', 1, 0, 'all', ''),
(34, 1, 0, 'Prestige Juicer', 0, 'prestige-juicer', 1, 34, 0, '', '', 0, 0, '', 'upload/images/7874-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Content: Prestige centrifugal Juicer- Pcj 7.0</li>\r\n	<li>Net quantity: 1 Unit</li>\r\n	<li>Voltage: 230V; Wattage: 500W</li>\r\n	<li>Warranty: 1 year</li>\r\n	<li>Dual locking system for safety</li>\r\n	<li>500 watts heavy duty motor</li>\r\n	<li>Note : This is a Slow juicer for Concentrated pulp</li>\r\n</ul>', 1, '2021-09-11 06:30:12', 1, 0, 'all', ''),
(35, 1, 0, 'Preethi Juicers', 0, 'preethi-juicers', 2, 35, 0, '', '', 0, 0, '', 'upload/images/2146-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Long lasting metal sieve</li>\r\n	<li>Removable pulp chamber</li>\r\n	<li>Tough vegetables and fruits juicer</li>\r\n	<li>Leak proof even when juicing soft fruits like watermelon</li>\r\n	<li>Extracts maximum juice</li>\r\n	<li>Easy to use</li>\r\n	<li>Easy to maintain</li>\r\n</ul>', 1, '2021-09-11 06:31:32', 1, 0, 'all', ''),
(36, 1, 0, 'Butterfly Juicers', 0, 'butterfly-juicers', 4, 36, 0, '', '', 0, 0, '', 'upload/images/5974-2021-09-11.jpg', '', '<ul>\r\n	<li>Super fine mesh for high juicing efficiency</li>\r\n	<li>Unbreakable ABS body</li>\r\n	<li>Overload protection for motor safety</li>\r\n	<li>Specially designed razor sharp blades</li>\r\n	<li>2 speed control with Pulse function</li>\r\n	<li>2 Multipurpose jar</li>\r\n	<li>Polycarbonate Juicing/Liquidizing jar 1.5 litre, Dry / Wet and Grinding Jar</li>\r\n</ul>', 1, '2021-09-11 06:32:47', 1, 0, 'all', ''),
(37, 1, 0, 'Butterfly Electric Kettle', 0, 'butterfly-electric-kettle', 4, 39, 0, '', '', 0, 0, '', 'upload/images/8979-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Superior quality Stainless Steel body. Filter Type : Spout</li>\r\n	<li>Auto cut off facility, Dry Boil Protection: Yes</li>\r\n	<li>360 degree swirl base. Power: 1500 watts; Operating Voltage: 220 - 230 volts, 50-60Hz</li>\r\n	<li>Convenient grip</li>\r\n	<li>High quality thermostat control</li>\r\n	<li>Capacity: 1.5 liters , Cord Length : 1 meter</li>\r\n	<li>Warranty: 1 year on product</li>\r\n	<li>Includes: Water kettle, User manual and Warranty card</li>\r\n</ul>', 1, '2021-09-11 06:33:55', 1, 0, 'all', ''),
(38, 1, 0, 'Preethi Electric Kettle', 0, 'preethi-electric-kettle', 2, 38, 0, '', '', 0, 0, '', 'upload/images/7266-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Capacity: 1 liter</li>\r\n	<li>Auto shutoff when water reaches boiling point</li>\r\n	<li>Water level gauge</li>\r\n	<li>Power: 1350 watts; Operating Voltage: 240 volts</li>\r\n	<li>Warranty: 1 year on product</li>\r\n	<li>Kettle lifts off the corded base for safe, easy use</li>\r\n	<li>Power on light and locking lid for safety</li>\r\n</ul>', 1, '2021-09-11 06:35:37', 1, 0, 'all', ''),
(39, 1, 0, 'Prestige Electric Kettle', 0, 'prestige-electric-kettle', 1, 37, 0, '', '', 0, 0, '', 'upload/images/3367-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Max 3 differentiators Great Features - i)Automatic Cutoff ii) 360 Degree Swivel Base iii)Single Touch lid locking</li>\r\n	<li>Voltage: 230V; Wattage: 1500W. Heating Element:Yes</li>\r\n	<li>Warranty: 1 Year, BSNL/MTNL</li>\r\n	<li>i) Power - 1500 watts ii) Capacity - 1.5L iii) Material- Stainless Steel iv) Concealed Element</li>\r\n	<li>Troubleshooting guidelines: i)Never operate the appliance empty ii) Never lift the kettle from the base when the unit is in operation.</li>\r\n	<li>The large opening in the top allows easy access to the smooth, seamless Stainless Steel interior for easy cleaning of mineral deposits</li>\r\n	<li>Features : Power indicator light that lights up as it begins to boil water and automatic shut-off after boiling ; Its water level indicator enables you to easily measure the amount of water you need</li>\r\n</ul>', 1, '2021-09-11 06:38:55', 1, 0, 'all', ''),
(40, 1, 0, 'Prestige Air Fryer', 0, 'prestige-air-fryer', 1, 40, 0, '', '', 0, 0, '', 'upload/images/7539-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Fry, Grill, Roast , bake and More,Frying basket capacity – 2.0 liter</li>\r\n	<li>Temperature range from 80 to 200 deg Celsius, Timer upto 30 mins</li>\r\n	<li>Smoke vent for absorbing unwanted odour and smoke</li>\r\n	<li>Even heat distribution,1200 watts power</li>\r\n	<li>Warranty : 1 Year</li>\r\n</ul>', 1, '2021-09-11 06:45:48', 1, 0, 'all', ''),
(41, 1, 0, 'Prestige Electric Chopper', 0, 'prestige-electric-chopper', 1, 41, 0, '', '', 0, 0, '', 'upload/images/1368-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Product Dimensions: 13.5 x 13.5 x 25 cm , Net Quantity: 1 Unit</li>\r\n	<li>Can chop coarse, medium or fine, Plastic container can be used to store and refrigerate food</li>\r\n	<li>Suitable for cutting soft and hard vegetables, fruits, fresh herbs, spices, cooked meat and fish, nuts and cheese</li>\r\n	<li>Content: Prestige Electric Chopper-Pec 3.0</li>\r\n	<li>Unique ring handle design for effortless chopping and cutting</li>\r\n	<li>Extra-sharp stainless-steel blade for efficient performance</li>\r\n	<li>Voltage: 230V; Wattage: 250W</li>\r\n	<li>Warranty: 1 Year Product Warranty</li>\r\n</ul>', 1, '2021-09-11 06:48:48', 1, 0, 'all', ''),
(42, 1, 0, 'Butterfly Electric Chopper', 0, 'butterfly-electric-chopper', 4, 42, 0, '', '', 0, 0, '', 'upload/images/4669-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>=&gt; * Material: Made of PP material, food-grade cup body, non-toxic plastic, safe for containing food. Good product for mom, wife, professional chefs.</li>\r\n	<li>=&gt; * Multifunction: About 250ml, with 2 sharp blades, it can chop garlic, ginger, peppers, vegetables, fruits, meats and more. Small chopper is also easy for you to store.</li>\r\n	<li>=&gt; * USB Rechargeable: Electric food chopper, powered by 1 x 3.7V rechargeable battery(Built-in), USB rechargeable.Press the button to automatically stir the food, save your time and release your hands.</li>\r\n	<li>=&gt; * Safety Design: The cup is aligned with the main body position and rotated to a safe locked position to start using, suitable for small kitchens.</li>\r\n	<li>=&gt; * Easy Clean: Waterproof design. The whole body is waterproof and easy to clean.</li>\r\n</ul>', 1, '2021-09-11 06:57:22', 1, 0, 'all', ''),
(43, 1, 0, 'Prestige Milk Boiler', 0, 'prestige-milk-boiler', 1, 43, 0, '', '', 0, 0, '', 'upload/images/7989-2021-09-11.jpg', '', '<ul>\r\n	<li>ONE TOUCH OPERATION The automatic milk boiler allows you to have complete control over the milk boiler with just one touch, thus saving energy and time.</li>\r\n	<li>WIDE MOUTH It comes with wide mouth and a spout which is very convenient to use, and designed for easy cleaning. Just use liquid soap and rinse with water. Thus making it extremely easy to maintain.</li>\r\n	<li>SEE THROUGH GLASS LID WITH HEAT RESISTANT HANDLE The transparent glass lid makes the appliance easier to use by letting you monitor the process. The sturdy handle on the lid makes it safer to use.</li>\r\n	<li>INTELLIGENT BUILT IN SENSOR WITH AUTO CUT OFF</li>\r\n	<li>WATER PROTECTIVE CAP This cap should be fitted to the bottom of the SS container connector while washing. It prevents water entering the connector and makes it safe to use.</li>\r\n	<li>DETACHABLE BASE UNIT Since it comes with a detachable base unit, water entry to the Electronic components completely eliminated. Also detachable power cord makes it extremely convenient for daily use.</li>\r\n	<li>Warranty: 1 Year warranty</li>\r\n</ul>', 1, '2021-09-11 07:01:01', 1, 0, 'all', ''),
(44, 1, 0, 'Prestige Coffee Maker', 0, 'prestige-coffee-maker', 1, 44, 0, '', '', 0, 0, '', 'upload/images/9851-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>This Certified Refurbished product is tested to work and look like new with minimal to no signs of wear &amp; tear; the product comes with relevant accessories and is backed by a minimum six month supplier backed warranty; box may be generic</li>\r\n	<li>Content: Prestige Electric Drip Coffer Maker- Pcmd 1.0</li>\r\n	<li>Net Quantity: 1 Unit</li>\r\n	<li>Voltage: 230V; Wattage: 650W</li>\r\n	<li>3.5 bar working pressure</li>\r\n</ul>', 1, '2021-09-11 07:04:07', 1, 0, 'all', ''),
(45, 1, 0, 'Preethi Coffee Maker', 0, 'preethi-coffee-maker', 2, 45, 0, '', '', 0, 0, '', 'upload/images/2101-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Concealed 450W heating element for faster brewing</li>\r\n	<li>Heat resistant high grade plastic</li>\r\n	<li>Microfine filter for fine decoction</li>\r\n	<li>Accurate temperature control</li>\r\n	<li>Heat sensitive thermal fuse</li>\r\n	<li>Warranty: 1 year on product</li>\r\n	<li>Power: 450 watts; Operating Voltage: 230 volts</li>\r\n</ul>', 1, '2021-09-11 07:07:35', 1, 0, 'all', ''),
(46, 1, 0, 'Prestige Iron Box', 0, 'prestige-iron-box', 1, 46, 0, '', '', 0, 0, '', 'upload/images/5360-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Net Quantity: 1 Unit</li>\r\n	<li>Warranty: 2 years on product</li>\r\n	<li>Content: Prestige Dry Iron - Pdi - 04</li>\r\n	<li>Voltage: 230V; Wattage: 750W</li>\r\n</ul>', 1, '2021-09-11 09:07:31', 1, 0, 'all', ''),
(47, 1, 0, 'Preethi Iron Box', 0, 'preethi-iron-box', 2, 47, 0, '', '', 0, 0, '', 'upload/images/4444-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Fast and easy</li>\r\n	<li>Swivel action</li>\r\n	<li>Cord winder</li>\r\n	<li>Linished soleplate</li>\r\n	<li>Auto-off pilot lamp</li>\r\n	<li>Warranty: 1 year</li>\r\n	<li>Includes: 1 Steam iron</li>\r\n</ul>', 1, '2021-09-11 09:09:08', 1, 0, 'all', ''),
(48, 1, 0, 'Butterfly Iron Box', 0, 'butterfly-iron-box', 4, 48, 0, '', '', 0, 0, '', 'upload/images/7028-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Light weight</li>\r\n	<li>Indicator light for operational safety</li>\r\n	<li>Non stick coated plate</li>\r\n	<li>Temperature control dial</li>\r\n	<li>Perfect ironing for all fabrics</li>\r\n	<li>Warranty: 2 years on product</li>\r\n	<li>Power: 750 watts; Operating Voltage: 220 - 240 volts</li>\r\n	<li>Includes: Dry Iron, User Manual with Warranty card</li>\r\n</ul>', 1, '2021-09-11 09:12:36', 1, 0, 'all', ''),
(49, 1, 0, 'Prestige Barbecue', 0, 'prestige-barbecue', 1, 49, 0, '', '', 0, 0, '', 'upload/images/9291-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Content: Prestige Charcoal Barbecue -Ppbw-04</li>\r\n	<li>Net Quantity: 1 Unit</li>\r\n	<li>Quick to assemble</li>\r\n	<li>Coal based cooking</li>\r\n	<li>Detachable legs</li>\r\n	<li>Portable case</li>\r\n	<li>Easy to clean</li>\r\n</ul>', 1, '2021-09-11 09:20:17', 1, 0, 'all', ''),
(50, 1, 0, 'Butterfly SS Vacuum Flasks', 0, 'butterfly-ss-vacuum-flasks', 4, 50, 0, '', '', 0, 0, '', 'upload/images/8578-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Inner and outer body made of premium quality stainless steel</li>\r\n	<li>Unbreakable and leak proof</li>\r\n	<li>Hygienic and odour free</li>\r\n	<li>Suitable for both hot and cold liquids</li>\r\n	<li>Specially designed silicone O ring</li>\r\n	<li>Easy to clean</li>\r\n	<li>Available in 900 ml, 600 ml, 500 ml and 300 ml</li>\r\n</ul>', 1, '2021-09-11 09:22:16', 1, 0, 'all', ''),
(51, 1, 0, 'Butterfly Water Bottles', 0, 'butterfly-water-bottles', 4, 51, 0, '', '', 0, 0, '', 'upload/images/6833-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>High Quality Stainless Steel</li>\r\n	<li>Leak Proof and easy to Pour</li>\r\n	<li>Strong and wider gauge for high durability</li>\r\n	<li>Hassle-free maintenance, remains clean and rust proof</li>\r\n	<li>Convenient size fits in the side pocket of school, trekking or office bag</li>\r\n</ul>', 1, '2021-09-11 09:23:34', 1, 0, 'all', ''),
(52, 1, 0, 'Butterfly Tower Fans', 0, 'butterfly-tower-fans', 4, 52, 0, '', '', 0, 0, '', 'upload/images/7344-2021-09-11.png', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Power : 150W, Air Delivery : 42CMM</li>\r\n	<li>Sturdy Indigenous design : Stabilized thermoplastic for aesthetic and corrosion-resistant life.Remote : No</li>\r\n	<li>Ergonomic Control Panel : speed and swing controls designed for ease of use</li>\r\n	<li>Tough Blower : to ensure optimum air throw efficiency, with 3-speed selection</li>\r\n	<li>Light Weight &amp; Portable</li>\r\n	<li>Tough Blower: 3 Speed Selection for optimum air throw efficiency</li>\r\n	<li>Warranty: 1 year on product</li>\r\n</ul>', 1, '2021-09-11 09:24:56', 1, 0, 'all', ''),
(53, 1, 0, 'Butterfly Air Coolers', 0, 'butterfly-air-coolers', 4, 52, 0, '', '', 0, 0, '', 'upload/images/5663-2021-09-11.png', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Capacity: 12 liters; Coverage Area: Ideal for room size up to 12 square meters</li>\r\n	<li>Cooling Media: Highly-effective honeycomb cooling pads, powerful blower and cool flow dispenser ensures superior cooling</li>\r\n	<li>Technology: Powered by i-pure technology with multistage air purification filters such as allergy filter, bacteria filter, smell filter, PM 2.5 wash filter, and dust filter that delivers fresh and filtered cool air</li>\r\n	<li>Powerful Pump: The exclusive dura-pump of Diet 12T ensures the longevity of the pump</li>\r\n	<li>Control Panel: Easy to use dial knob controls for fan speed, cooling, and swing settings</li>\r\n	<li>Product Dimensions L x B x H: 30.0 cm x 33.0 cm x 84.5 cm or 300mm x 330 mm x 845 mm</li>\r\n	<li>Power Consumption: 170 watts also works on inverter power; Operating voltage: 230 V/50 Hz runs on operating cost of a fan</li>\r\n</ul>', 1, '2021-09-11 09:47:11', 1, 0, 'all', ''),
(54, 1, 0, 'Butterfly Washing Machines', 0, 'butterfly-washing-machines', 4, 54, 0, '', '', 0, 0, '', 'upload/images/1782-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Semi-automatic washing Machine: Economical, Low water and energy consumption; Has both washing and drying functions</li>\r\n	<li>Capacity 6.5 Kg: Suitable for families with 3 to 4 members ; 1350 RPM: Higher the Spin speed,lower the drying time</li>\r\n	<li>Manufacturer Warranty: 2 years on product and 5 years on Motor</li>\r\n	<li>Wash Programs: 2</li>\r\n	<li>Also Included in the box: 1 Washer unit, 1 User Manual, 1 Warranty Card</li>\r\n	<li>Aqua Spin Rinse : Powerful shower over a wide area effectively washes away foam to ensure thorough rinsing without leaving any dirt/detergent residue</li>\r\n	<li>Lint Filter: Cassette-type filter traps lint effectively at any water level and won’t tear. Thorough lint removal even when water level is low</li>\r\n	<li>Powerful Motor: The heavy motors used in Panasonic Semi Automatic washing machine makes it easy to wash heavy laundry like curtains , linens etc. as well as everyday clothes</li>\r\n</ul>', 1, '2021-09-11 09:54:40', 1, 0, 'all', ''),
(55, 1, 0, 'Butterfly Hand Mixers', 0, 'butterfly-hand-mixers', 4, 55, 0, '', '', 0, 0, '', 'upload/images/3248-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Ergonomic Handle for Better Grip</li>\r\n	<li>Air Vents to Avoid Clogging From Batters and Other Mixtures, 1 Meter Long 2 Pin Power Cord for Flexible Usage</li>\r\n	<li>2 Stainless Steel Hooks For Mixing and Kneading. Beater for Mixing, Blending and Whisking Needs, Kneader for All Kneading Requirements</li>\r\n	<li>Package Includes: 1 x Hand Mixer , 2 x Chrome Beater, 2 x Dough Hook, 1 x Spatula &amp; 1x Oil Brus</li>\r\n</ul>', 1, '2021-09-11 09:56:25', 1, 0, 'all', ''),
(56, 1, 0, 'Prestige Gas Stove Accessories', 0, 'prestige-gas-stove-accessories', 1, 56, 0, '', '', 0, 0, '', 'upload/images/7840-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Best Quality in Market</li>\r\n	<li>Rust Proof Stainless Steel Mirror Polished</li>\r\n</ul>\r\n\r\n<hr />\r\n<p> </p>', 1, '2021-09-11 09:59:47', 1, 0, 'all', ''),
(57, 1, 0, 'Prestige Grain Grinders', 0, 'prestige-grain-grinders', 1, 57, 0, '', '', 0, 0, '', 'upload/images/1435-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Useful for grinding wheat, rice, pulses,oats,ragi,jowar,bajra,corn, spice,sprouts and many more</li>\r\n	<li>Preserve nutrition and grind to the level desired right at home</li>\r\n	<li>The powerful grinder can process 3 to 5kgs of grain per hour</li>\r\n	<li>Quick and easy to use</li>\r\n	<li>Adjustable grinding settings from fine to coarse</li>\r\n	<li>Classic wooden finish – food grade material</li>\r\n	<li>Traditional way of grinding with granite grinding stones instead of blades</li>\r\n</ul>', 1, '2021-09-11 10:01:24', 1, 0, 'all', ''),
(58, 1, 0, 'Preethi Electric Pressure Cooker', 0, 'preethi-electric-pressure-cooker', 2, 58, 0, '', '', 0, 0, '', 'upload/images/8383-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>5-in-1 multifunctional cooker-pressure cooker, rice cooker, steamer, saute pan and warmer</li>\r\n	<li>Built with latest nutri++ technology for healthier cooking for increased nutrient bioavailability in the Food</li>\r\n	<li>Ensures uniform cooking of ingredients every time, Has Water Level Indicator</li>\r\n	<li>Features 15 pre-programmed smart Indian recipes: Rice, khichdi, veg biryani, dal, rajma, soup, idli steam veg, cake pav bhaji, gajar halwa, veg curry, chicken, meat and saute</li>\r\n	<li>9 safety levels to control and limit temperature, pressure and power</li>\r\n	<li>Allows both open and closed mode cooking</li>\r\n	<li>Delay timer: 30min to 8hrs of pre-defined time to start the cooking process</li>\r\n</ul>', 1, '2021-09-11 10:03:10', 1, 0, 'all', ''),
(59, 1, 0, 'Ultra Wet Grinder Accessories', 0, 'ultra-wet-grinder-accessories', 3, 59, 0, '', '', 0, 0, '', 'upload/images/6665-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>This product has been made for Ultra Perfect+ model</li>\r\n	<li>Made in India</li>\r\n	<li>Easy to attach and remove</li>\r\n	<li>Atta kneader attachment only</li>\r\n	<li>Original from Elgi Ultra</li>\r\n</ul>', 1, '2021-09-11 10:04:59', 1, 0, 'all', ''),
(60, 1, 0, 'Ultra Coconut Scraper', 0, 'ultra-coconut-scraper', 3, 60, 0, '', '', 0, 0, '', 'upload/images/3322-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Scrape coconuts quicker and with ease</li>\r\n	<li>The sturdy handle and smart design keep your hands and fingers safe from cuts</li>\r\n	<li>Stainless steel blades are corrosion and rust-resistant and highly durable</li>\r\n	<li>Stainless steel blades are corrosion and rust-resistant and highly durable</li>\r\n	<li>Colour: Silver, Material: Stainless Steel. Product Weight: 580 Gram</li>\r\n</ul>', 1, '2021-09-11 10:07:12', 1, 0, 'all', ''),
(61, 1, 0, 'Ultra Diet Cooker', 0, 'ultra-diet-cooker', 3, 61, 0, '', '', 0, 0, '', 'upload/images/2743-2021-09-11.jpg', '', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Rust - resistant</li>\r\n	<li>Makes healthy \"Vaditha Soru\" by removing excess starch from pressure cooked rice</li>\r\n	<li>Bakelite Handles-Very poor conductor of heat</li>\r\n	<li>Directs the excess liquid that oozes out of the pressure regulator to the sides and away from the handle</li>\r\n	<li>High impact bonded 3 layered composite base (2 stainless steel outer layers with an aluminum layer in the middle) bonded at very high impact load to avoid hot spots created by air bubbles</li>\r\n</ul>', 1, '2021-09-11 10:09:39', 1, 0, 'all', '');

-- --------------------------------------------------------

--
-- Table structure for table `product_variant`
--

CREATE TABLE `product_variant` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` varchar(16) NOT NULL DEFAULT 'packet',
  `measurement` float NOT NULL DEFAULT 0,
  `measurement_unit_id` int(11) NOT NULL DEFAULT 0,
  `price` float NOT NULL,
  `discounted_price` float NOT NULL,
  `serve_for` varchar(16) NOT NULL,
  `stock` float NOT NULL DEFAULT 0,
  `stock_unit_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_variant`
--

INSERT INTO `product_variant` (`id`, `product_id`, `type`, `measurement`, `measurement_unit_id`, `price`, `discounted_price`, `serve_for`, `stock`, `stock_unit_id`) VALUES
(1, 1, 'packet', 0, 0, 17999, 0, 'Available', 0, 0),
(2, 2, 'packet', 0, 0, 1550, 0, 'Available', 0, 0),
(3, 3, 'packet', 0, 0, 2989, 0, 'Available', 0, 0),
(4, 4, 'packet', 0, 0, 1089, 0, 'Available', 0, 0),
(5, 5, 'packet', 0, 0, 5631, 0, 'Available', 0, 0),
(6, 6, 'packet', 0, 0, 3789, 0, 'Available', 0, 0),
(7, 7, 'packet', 0, 0, 3999, 0, 'Available', 0, 0),
(8, 8, 'packet', 0, 0, 2155, 0, 'Available', 0, 0),
(9, 9, 'packet', 0, 0, 2690, 0, 'Available', 0, 0),
(10, 10, 'packet', 0, 0, 3347, 0, 'Available', 0, 0),
(11, 11, 'packet', 0, 0, 2599, 0, 'Available', 0, 0),
(12, 12, 'packet', 0, 0, 2695, 0, 'Available', 0, 0),
(13, 13, 'packet', 0, 0, 2019, 0, 'Available', 0, 0),
(14, 14, 'packet', 0, 0, 3999, 0, 'Available', 0, 0),
(15, 15, 'packet', 0, 0, 3299, 0, 'Available', 0, 0),
(16, 16, 'packet', 0, 0, 4945, 0, 'Available', 0, 0),
(17, 17, 'packet', 0, 0, 3200, 0, 'Available', 0, 0),
(18, 18, 'packet', 0, 0, 3999, 0, 'Available', 0, 0),
(19, 19, 'packet', 0, 0, 7290, 0, 'Available', 0, 0),
(20, 20, 'packet', 0, 0, 3246, 0, 'Available', 0, 0),
(21, 21, 'packet', 0, 0, 10710, 0, 'Available', 0, 0),
(22, 22, 'packet', 0, 0, 13999, 0, 'Available', 0, 0),
(23, 23, 'packet', 0, 0, 1199, 0, 'Available', 0, 0),
(24, 24, 'packet', 0, 0, 1506, 0, 'Available', 0, 0),
(25, 25, 'packet', 0, 0, 2949, 0, 'Available', 0, 0),
(26, 26, 'packet', 0, 0, 2205, 0, 'Available', 0, 0),
(27, 27, 'packet', 0, 0, 1249, 0, 'Available', 0, 0),
(28, 28, 'packet', 0, 0, 1799, 0, 'Available', 0, 0),
(29, 29, 'packet', 0, 0, 1250, 0, 'Available', 0, 0),
(30, 30, 'packet', 0, 0, 1800, 0, 'Available', 0, 0),
(31, 31, 'packet', 0, 0, 2049, 0, 'Available', 0, 0),
(32, 32, 'packet', 0, 0, 899, 0, 'Available', 0, 0),
(33, 33, 'packet', 0, 0, 2650, 0, 'Available', 0, 0),
(34, 34, 'packet', 0, 0, 3499, 0, 'Available', 0, 0),
(35, 35, 'packet', 0, 0, 3699, 0, 'Available', 0, 0),
(36, 36, 'packet', 0, 0, 2899, 0, 'Available', 0, 0),
(37, 37, 'packet', 0, 0, 699, 0, 'Available', 0, 0),
(38, 38, 'packet', 0, 0, 1759, 0, 'Available', 0, 0),
(39, 39, 'packet', 0, 0, 799, 0, 'Available', 0, 0),
(40, 40, 'packet', 0, 0, 4299, 0, 'Available', 0, 0),
(41, 41, 'packet', 0, 0, 1347, 0, 'Available', 0, 0),
(42, 42, 'packet', 0, 0, 799, 0, 'Available', 0, 0),
(43, 43, 'packet', 0, 0, 1854, 0, 'Available', 0, 0),
(44, 44, 'packet', 0, 0, 2998, 0, 'Available', 0, 0),
(45, 45, 'packet', 0, 0, 2595, 0, 'Available', 0, 0),
(46, 46, 'packet', 0, 0, 799, 0, 'Available', 0, 0),
(47, 47, 'packet', 0, 0, 899, 0, 'Available', 0, 0),
(48, 48, 'packet', 0, 0, 699, 0, 'Available', 0, 0),
(49, 49, 'packet', 0, 0, 1767, 0, 'Available', 0, 0),
(50, 50, 'packet', 0, 0, 699, 0, 'Available', 0, 0),
(51, 51, 'packet', 0, 0, 389, 0, 'Available', 0, 0),
(52, 52, 'packet', 0, 0, 3999, 0, 'Available', 0, 0),
(53, 53, 'packet', 0, 0, 3599, 0, 'Available', 0, 0),
(54, 54, 'packet', 0, 0, 11999, 0, 'Available', 0, 0),
(55, 55, 'packet', 0, 0, 899, 0, 'Available', 0, 0),
(56, 56, 'packet', 0, 0, 599, 0, 'Available', 0, 0),
(57, 57, 'packet', 0, 0, 6999, 0, 'Available', 0, 0),
(58, 58, 'packet', 0, 0, 6550, 0, 'Available', 0, 0),
(59, 59, 'packet', 0, 0, 4999, 0, 'Available', 0, 0),
(60, 60, 'packet', 0, 0, 397, 0, 'Available', 0, 0),
(61, 61, 'packet', 0, 0, 3259, 0, 'Available', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `title` varchar(64) CHARACTER SET utf8 NOT NULL,
  `short_description` varchar(64) CHARACTER SET utf8 NOT NULL,
  `style` varchar(16) NOT NULL,
  `product_ids` varchar(1024) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `store_name` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `mobile` text DEFAULT NULL,
  `password` text NOT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `store_url` text DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `store_description` text DEFAULT NULL,
  `street` text DEFAULT NULL,
  `pincode_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `state` text DEFAULT NULL,
  `categories` text DEFAULT NULL,
  `account_number` text DEFAULT NULL,
  `bank_ifsc_code` text DEFAULT NULL,
  `account_name` text DEFAULT NULL,
  `bank_name` text DEFAULT NULL,
  `commission` int(11) DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `last_updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `require_products_approval` tinyint(4) NOT NULL DEFAULT 0,
  `fcm_id` text DEFAULT NULL,
  `national_identity_card` text DEFAULT NULL,
  `address_proof` text DEFAULT NULL,
  `pan_number` text DEFAULT NULL,
  `tax_name` text DEFAULT NULL,
  `tax_number` text DEFAULT NULL,
  `customer_privacy` tinyint(4) DEFAULT 0,
  `latitude` varchar(256) DEFAULT NULL,
  `longitude` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`id`, `name`, `store_name`, `email`, `mobile`, `password`, `balance`, `store_url`, `logo`, `store_description`, `street`, `pincode_id`, `city_id`, `state`, `categories`, `account_number`, `bank_ifsc_code`, `account_name`, `bank_name`, `commission`, `status`, `last_updated`, `date_created`, `require_products_approval`, `fcm_id`, `national_identity_card`, `address_proof`, `pan_number`, `tax_name`, `tax_number`, `customer_privacy`, `latitude`, `longitude`) VALUES
(1, 'Gayathri Home Appliances', 'Gayathri Home Appliances', 'gayathrihomeappliances@gmail.com', '+91 9849133533', '1e4970ada8c054474cda889490de3421', 0, '', '1624167044.3513.jpg', '', 'httty', 0, 0, '', '1', '', '', '9951202301', '', 2, 1, '2021-09-07 05:50:57', '2021-06-20 05:30:44', 0, NULL, '1624167044.3533.jpg', '1624167044.357.jpg', 'hte8775', 'gst', 'ytrv678999', 1, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `variable` text NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `variable`, `value`) VALUES
(6, 'logo', ''),
(9, 'privacy_policy', '<p><strong>Privacy Policy</strong></p>\r\n\r\n<p> \r\n<p>built the Athidi app as a Free app. This SERVICE is provided by at no cost and is intended for use as is.</p>\r\n</p>\r\n\r\n<p>This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.</p>\r\n\r\n<p>If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.</p>\r\n\r\n<p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at eCart unless otherwise defined in this Privacy Policy.</p>\r\n\r\n<p><strong>Information Collection and Use</strong></p>\r\n\r\n<p>For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way.</p>\r\n\r\n<p>The app does use third party services that may collect information used to identify you.</p>\r\n\r\n<p>Link to privacy policy of third party service providers used by the app</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://www.google.com/policies/privacy/\" target=\"_blank\">Google Play Services</a></li>\r\n	<li><a href=\"https://firebase.google.com/policies/analytics\" target=\"_blank\">Google Analytics for Firebase</a></li>\r\n	<li><a href=\"https://firebase.google.com/support/privacy/\" target=\"_blank\">Firebase Crashlytics</a></li>\r\n</ul>\r\n\r\n<p><strong>Log Data</strong></p>\r\n\r\n<p>I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.</p>\r\n\r\n<p><strong>Cookies</strong></p>\r\n\r\n<p>Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device&#39;s internal memory.</p>\r\n\r\n<p>This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.</p>\r\n\r\n<p><strong>Service Providers</strong></p>\r\n\r\n<p>I may employ third-party companies and individuals due to the following reasons:</p>\r\n\r\n<ul>\r\n	<li>To facilitate our Service;</li>\r\n	<li>To provide the Service on our behalf;</li>\r\n	<li>To perform Service-related services; or</li>\r\n	<li>To assist us in analyzing how our Service is used.</li>\r\n</ul>\r\n\r\n<p>I want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.</p>\r\n\r\n<p><strong>Security</strong></p>\r\n\r\n<p>I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.</p>\r\n\r\n<p><strong>Links to Other Sites</strong></p>\r\n\r\n<p>This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>\r\n\r\n<p><strong>Children’s Privacy</strong></p>\r\n\r\n<p>These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do necessary actions.</p>\r\n\r\n<p><strong>Changes to This Privacy Policy</strong></p>\r\n\r\n<p>I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.</p>\r\n\r\n<p>This policy is effective as of 2021-01-04</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at info@wrteam.in.</p>\r\n\r\n<p>This privacy policy page was created at <a href=\"https://privacypolicytemplate.net\" target=\"_blank\">privacypolicytemplate.net </a>and modified/generated by <a href=\"https://app-privacy-policy-generator.nisrulz.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>'),
(10, 'terms_conditions', '<p><strong>Terms &amp; Conditions</strong></p>\r\n\r\n<p> \r\n<p>By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to .</p>\r\n</p>\r\n\r\n<p>is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.</p>\r\n\r\n<p>The eCart app stores and processes personal data that you have provided to us, in order to provide my Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the eCart app won’t work properly or at all.</p>\r\n\r\n<p>The app does use third party services that declare their own Terms and Conditions.</p>\r\n\r\n<p>Link to Terms and Conditions of third party service providers used by the app</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://policies.google.com/terms\" target=\"_blank\">Google Play Services</a></li>\r\n	<li><a href=\"https://firebase.google.com/terms/analytics\" target=\"_blank\">Google Analytics for Firebase</a></li>\r\n	<li><a href=\"https://firebase.google.com/terms/crashlytics\" target=\"_blank\">Firebase Crashlytics</a></li>\r\n</ul>\r\n\r\n<p>You should be aware that there are certain things that will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.</p>\r\n\r\n<p> </p>\r\n\r\n<p>If you’re using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.</p>\r\n\r\n<p>Along the same lines, cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, cannot accept responsibility.</p>\r\n\r\n<p>With respect to ’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.</p>\r\n\r\n<p>At some point, we may wish to update the app. The app is currently available on Android – the requirements for system(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. does not promise that it will always update the app so that it is relevant to you and/or works with the Android version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.</p>\r\n\r\n<p><strong>Changes to This Terms and Conditions</strong></p>\r\n\r\n<p>I may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Terms and Conditions on this page.</p>\r\n\r\n<p>These terms and conditions are effective as of 2021-01-04</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions or suggestions about my Terms and Conditions, do not hesitate to contact me at info@wrteam.in.</p>\r\n\r\n<p>This Terms and Conditions page was generated by <a href=\"https://app-privacy-policy-generator.nisrulz.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>'),
(11, 'fcm_server_key', 'AAAAUnWSmKU:APA91bG3zJNHAsuSsSkVxaCkEe9NPTPV2byx6XEms3q9DUTnYKHIG9OjzckGs53iR-Naqo_sSRofqYE5mflpCIQjDCPYnaBQjbq5LuvN8AI83QVk9II5z0HPk7s2A-CHXbpapess7sdf'),
(12, 'contact_us', '<h2>E-commerce </h2>\r\n\r\n<p>For any kind of queries related to products, orders or services feel free to contact us on our official email address or phone number as given below :</p>\r\n\r\n<p><strong>Areas we deliver : </strong></p>\r\n\r\n<p><strong>Delivery Timings :</strong></p>\r\n\r\n<ol>\r\n	<li><strong>  8:00 AM To 10:30 AM</strong></li>\r\n	<li><strong> 10:30 AM To 12:30 PM</strong></li>\r\n	<li><strong>  4:00 PM To  7:00 PM</strong></li>\r\n</ol>\r\n\r\n<p><strong>Note : </strong>You can order for maximum 2days in advance. i.e., Today &amp; Tomorrow only.</p>\r\n\r\n<h3> </h3>\r\n'),
(13, 'system_timezone', '{\"system_configurations\":\"1\",\"system_timezone_gmt\":\"+05:30\",\"system_configurations_id\":\"13\",\"app_name\":\"Gayathri Home\",\"support_number\":\"+91 9876543210\",\"support_email\":\"support@ekart.com\",\"current_version\":\"1.0.0\",\"minimum_version_required\":\"1.0.0\",\"is-version-system-on\":\"0\",\"store_address\":\"#262-263, Time Square Empire SH 42, highway, Goa, 643987\",\"map_latitude\":\"23.23305215147397\",\"map_longitude\":\"69.64400665873588\",\"currency\":\"u20b9\",\"delivery_charge\":\"100\",\"system_timezone\":\"Asia/Kolkata\",\"min_amount\":\"0\",\"min_order_amount\":\"10\",\"max_cart_items_count\":\"10\",\"area-wise-delivery-charge\":\"1\",\"is-refer-earn-on\":\"1\",\"min-refer-earn-order-amount\":\"100\",\"refer-earn-bonus\":\"2\",\"refer-earn-method\":\"percentage\",\"max-refer-earn-amount\":\"5000\",\"minimum-withdrawal-amount\":\"100\",\"max-product-return-days\":\"10\",\"delivery-boy-bonus-percentage\":\"10\",\"low-stock-limit\":\"10\",\"user-wallet-refill-limit\":\"10000\",\"from_mail\":\"info@ecart.com\",\"reply_to\":\"info@ecart.com\",\"generate-otp\":\"1\",\"smtp-from-mail\":\"noreply@wrteam.in\",\"smtp-reply-to\":\"noreply@wrteam.in\",\"smtp-email-password\":\"wrteam@0124\",\"smtp-host\":\"mail.wrteam.in\",\"smtp-port\":\"465\",\"smtp-content-type\":\"html\",\"smtp-encryption-type\":\"ssl\"}'),
(15, 'about_us', '<h2>About Us</h2>\r\n\r\n<p>Athidi is one of the most selling and trending Food Delivery App, Full Android eCommerce &amp; Website. which is helps to create your own app and web with your brand name.</p>\r\n\r\n<p>Athidi has creative and dedicated group of developers who are mastered in Apps Developments and Web Development with a nice in delivering quality solutions to customers across the globe.</p>\r\n\r\n<p>Everything there including code, doc, amazing support, and most important developed by WRTeam.</p>'),
(80, 'currency', '₹'),
(81, 'delivery_boy_privacy_policy', '<p><strong>Privacy Policy</strong></p>\r\n\r\n<p> \r\n<p>built the Delivery Boy - eCart app as a Free app. This SERVICE is provided by at no cost and is intended for use as is.</p>\r\n</p>\r\n\r\n<p>This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.</p>\r\n\r\n<p>If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.</p>\r\n\r\n<p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Delivery Boy - eCart unless otherwise defined in this Privacy Policy.</p>\r\n\r\n<p><strong>Information Collection and Use</strong></p>\r\n\r\n<p>For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way.</p>\r\n\r\n<p>The app does use third party services that may collect information used to identify you.</p>\r\n\r\n<p>Link to privacy policy of third party service providers used by the app</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://www.google.com/policies/privacy/\" target=\"_blank\">Google Play Services</a></li>\r\n	<li><a href=\"https://firebase.google.com/policies/analytics\" target=\"_blank\">Google Analytics for Firebase</a></li>\r\n	<li><a href=\"https://firebase.google.com/support/privacy/\" target=\"_blank\">Firebase Crashlytics</a></li>\r\n</ul>\r\n\r\n<p><strong>Log Data</strong></p>\r\n\r\n<p>I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.</p>\r\n\r\n<p><strong>Cookies</strong></p>\r\n\r\n<p>Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device&#39;s internal memory.</p>\r\n\r\n<p>This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.</p>\r\n\r\n<p><strong>Service Providers</strong></p>\r\n\r\n<p>I may employ third-party companies and individuals due to the following reasons:</p>\r\n\r\n<ul>\r\n	<li>To facilitate our Service;</li>\r\n	<li>To provide the Service on our behalf;</li>\r\n	<li>To perform Service-related services; or</li>\r\n	<li>To assist us in analyzing how our Service is used.</li>\r\n</ul>\r\n\r\n<p>I want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.</p>\r\n\r\n<p><strong>Security</strong></p>\r\n\r\n<p>I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.</p>\r\n\r\n<p><strong>Links to Other Sites</strong></p>\r\n\r\n<p>This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>\r\n\r\n<p><strong>Children’s Privacy</strong></p>\r\n\r\n<p>These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do necessary actions.</p>\r\n\r\n<p><strong>Changes to This Privacy Policy</strong></p>\r\n\r\n<p>I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.</p>\r\n\r\n<p>This policy is effective as of 2021-01-04</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at info@wrteam.in.</p>\r\n\r\n<p>This privacy policy page was created at <a href=\"https://privacypolicytemplate.net\" target=\"_blank\">privacypolicytemplate.net </a>and modified/generated by <a href=\"https://app-privacy-policy-generator.nisrulz.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>'),
(82, 'delivery_boy_terms_conditions', '<p><strong>Terms &amp; Conditions</strong></p>\r\n\r\n<p> \r\n<p>By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to .</p>\r\n</p>\r\n\r\n<p>is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.</p>\r\n\r\n<p>The Delivery Boy - eCart app stores and processes personal data that you have provided to us, in order to provide my Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the Delivery Boy - eCart app won’t work properly or at all.</p>\r\n\r\n<p>The app does use third party services that declare their own Terms and Conditions.</p>\r\n\r\n<p>Link to Terms and Conditions of third party service providers used by the app</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://policies.google.com/terms\" target=\"_blank\">Google Play Services</a></li>\r\n	<li><a href=\"https://firebase.google.com/terms/analytics\" target=\"_blank\">Google Analytics for Firebase</a></li>\r\n	<li><a href=\"https://firebase.google.com/terms/crashlytics\" target=\"_blank\">Firebase Crashlytics</a></li>\r\n</ul>\r\n\r\n<p>You should be aware that there are certain things that will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.</p>\r\n\r\n<p> </p>\r\n\r\n<p>If you’re using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.</p>\r\n\r\n<p>Along the same lines, cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, cannot accept responsibility.</p>\r\n\r\n<p>With respect to ’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.</p>\r\n\r\n<p>At some point, we may wish to update the app. The app is currently available on Android – the requirements for system(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. does not promise that it will always update the app so that it is relevant to you and/or works with the Android version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.</p>\r\n\r\n<p><strong>Changes to This Terms and Conditions</strong></p>\r\n\r\n<p>I may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Terms and Conditions on this page.</p>\r\n\r\n<p>These terms and conditions are effective as of 2021-01-04</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions or suggestions about my Terms and Conditions, do not hesitate to contact me at info@wrteam.in.</p>\r\n\r\n<p>This Terms and Conditions page was generated by <a href=\"https://app-privacy-policy-generator.nisrulz.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>'),
(92, 'payment_methods', '{\"payment_method_settings\":\"1\",\"cod_payment_method\":\"0\",\"paypal_payment_method\":\"1\",\"paypal_mode\":\"sandbox\",\"paypal_currency_code\":\"USD\",\"paypal_business_email\":\"seller@somedomain.com\",\"payumoney_payment_method\":\"1\",\"payumoney_mode\":\"sandbox\",\"payumoney_merchant_key\":\"FGCWtd8L\",\"payumoney_merchant_id\":\"6934786\",\"payumoney_salt\":\"40QIgAPghj\",\"razorpay_payment_method\":\"1\",\"razorpay_key\":\"rzp_test_PeH2Z44Chsfg5h\",\"razorpay_secret_key\":\"JlFiUHYoRKZc5LwR6GGc5t6y\",\"paystack_payment_method\":\"1\",\"paystack_public_key\":\"pk_test_fd8f8d9c548cbd143c78a4bdf6cee5c11f8e6c12\",\"paystack_secret_key\":\"sk_test_dcc02e93456783bb933b6d4c0dec928f1f7e0118\",\"flutterwave_payment_method\":\"1\",\"flutterwave_public_key\":\"FLWPUBK_TEST-1ffbaed6ee3788cd2bcbb234d3b90c59-X\",\"flutterwave_secret_key\":\"FLWSECK_TEST-c659ffd76304hhh67fc4b67ae735b126-X\",\"flutterwave_encryption_key\":\"FLWSECK_TEST25c36edcfvbb\",\"flutterwave_currency_code\":\"KES\",\"midtrans_payment_method\":\"1\",\"is_production\":\"0\",\"midtrans_merchant_id\":\"G213016789\",\"midtrans_client_key\":\"SB-Mid-client-gv4vPZ5utTTClO7u\",\"midtrans_server_key\":\"SB-Mid-server-PHtT70awwC_GsfIR_8TzIVyh\",\"stripe_payment_method\":\"1\",\"stripe_publishable_key\":\"pk_test_51Hh90WLYfObhNTTwooBHwynrlfiPo2uwxyCVqGNNCWGmpdOHuaW4rYS9cDldKJ1hxV5ik52UXUDSYgEM66OX45534565US7tRX\",\"stripe_secret_key\":\"sk_test_51Hh90WLYfObhNTTwO8kCsbdnMdmLxiGHEpiQPGBkYlafghjQ3RnXPIKGn3YsGIEMoIQ5bNfxye4kzE6wfLiINzNk00xOYprnZt\",\"stripe_webhook_secret_key\":\"whsec_mPs10vgbh0QDZPiH3drKBe7fOpMSRppX\",\"stripe_currency_code\":\"INR\",\"paytm_payment_method\":\"1\",\"paytm_mode\":\"sandbox\",\"paytm_merchant_key\":\"eIcrB!DTfgth5DN8\",\"paytm_merchant_id\":\"PpGeMd36789525540215\"}'),
(83, 'time_slot_config', '{\"time_slot_config\":\"1\",\"is_time_slots_enabled\":\"1\",\"delivery_starts_from\":\"1\",\"allowed_days\":\"1\"}'),
(95, 'manager_app_privacy_policy', '<p><strong>Privacy Policy</strong></p>\r\n\r\n<p> \r\n<p>built the eCart Manager App app as a Free app. This SERVICE is provided by at no cost and is intended for use as is.</p>\r\n</p>\r\n\r\n<p>This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.</p>\r\n\r\n<p>If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.</p>\r\n\r\n<p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at eCart Manager App unless otherwise defined in this Privacy Policy.</p>\r\n\r\n<p><strong>Information Collection and Use</strong></p>\r\n\r\n<p>For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way.</p>\r\n\r\n<p>The app does use third party services that may collect information used to identify you.</p>\r\n\r\n<p>Link to privacy policy of third party service providers used by the app</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://www.google.com/policies/privacy/\" target=\"_blank\">Google Play Services</a></li>\r\n</ul>\r\n\r\n<p><strong>Log Data</strong></p>\r\n\r\n<p>I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.</p>\r\n\r\n<p><strong>Cookies</strong></p>\r\n\r\n<p>Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device&#39;s internal memory.</p>\r\n\r\n<p>This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.</p>\r\n\r\n<p><strong>Service Providers</strong></p>\r\n\r\n<p>I may employ third-party companies and individuals due to the following reasons:</p>\r\n\r\n<ul>\r\n	<li>To facilitate our Service;</li>\r\n	<li>To provide the Service on our behalf;</li>\r\n	<li>To perform Service-related services; or</li>\r\n	<li>To assist us in analyzing how our Service is used.</li>\r\n</ul>\r\n\r\n<p>I want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.</p>\r\n\r\n<p><strong>Security</strong></p>\r\n\r\n<p>I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.</p>\r\n\r\n<p><strong>Links to Other Sites</strong></p>\r\n\r\n<p>This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>\r\n\r\n<p><strong>Children’s Privacy</strong></p>\r\n\r\n<p>These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do necessary actions.</p>\r\n\r\n<p><strong>Changes to This Privacy Policy</strong></p>\r\n\r\n<p>I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.</p>\r\n\r\n<p>This policy is effective as of 2021-01-04</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at info@wrteam.in.</p>\r\n\r\n<p>This privacy policy page was created at <a href=\"https://privacypolicytemplate.net\" target=\"_blank\">privacypolicytemplate.net </a>and modified/generated by <a href=\"https://app-privacy-policy-generator.nisrulz.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>'),
(96, 'manager_app_terms_conditions', '<p><strong>Terms &amp; Conditions</strong></p>\r\n\r\n<p> \r\n<p>By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to .</p>\r\n</p>\r\n\r\n<p>is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.</p>\r\n\r\n<p>The eCart Manager App app stores and processes personal data that you have provided to us, in order to provide my Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the eCart Manager App app won’t work properly or at all.</p>\r\n\r\n<p>The app does use third party services that declare their own Terms and Conditions.</p>\r\n\r\n<p>Link to Terms and Conditions of third party service providers used by the app</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://policies.google.com/terms\" target=\"_blank\">Google Play Services</a></li>\r\n</ul>\r\n\r\n<p>You should be aware that there are certain things that will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.</p>\r\n\r\n<p> </p>\r\n\r\n<p>If you’re using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.</p>\r\n\r\n<p>Along the same lines, cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, cannot accept responsibility.</p>\r\n\r\n<p>With respect to ’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.</p>\r\n\r\n<p>At some point, we may wish to update the app. The app is currently available on Android – the requirements for system(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. does not promise that it will always update the app so that it is relevant to you and/or works with the Android version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.</p>\r\n\r\n<p><strong>Changes to This Terms and Conditions</strong></p>\r\n\r\n<p>I may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Terms and Conditions on this page.</p>\r\n\r\n<p>These terms and conditions are effective as of 2021-01-04</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions or suggestions about my Terms and Conditions, do not hesitate to contact me at info@wrteam.in.</p>\r\n\r\n<p>This Terms and Conditions page was generated by <a href=\"https://app-privacy-policy-generator.nisrulz.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>'),
(99, 'categories_settings', '{\"add_category_settings\":\"1\",\"cat_style\":\"style_1\",\"max_visible_categories\":\"1\",\"max_col_in_single_row\":\"2\"}'),
(97, 'front_end_settings', '{\"front_end_settings\":\"1\",\"android_app_url\":\"https://play.google.com\",\"call_back_url\":\"http://ekart.local:8000/\",\"common_meta_keywords\":\"eCart,WebeCart,eCart Front,eCart Web,eCart Front End\",\"common_meta_description\":\"eCart Front End is Web Version of eCart - Grocery, Food Delivery, Fruits & Vegetable store, Web Version.\",\"favicon\":\"1609822161.5542.png\",\"web_logo\":\"1610961661.239.png\",\"screenshots\":\"1608552564.1753.png\",\"google_play\":\"1608552564.1758.png\"}'),
(100, 'seller_privacy_policy', '<p>seller privacy &amp; policy</p>'),
(101, 'seller_terms_conditions', '<p>seller terms &amp; condition</p>'),
(102, 'doctor_brown', '{\"code_bravo\":\"f1970532-55cc-481f-86a2-a6082f62ae26\",\"time_check\":\"3c52f62dcad0a8a9d97253ef2658c78a3a5700ed61ed4319fdf9967c98e32996\",\"code_adam\":\"Ramuch\",\"dr_firestone\":\"31977632\",\"add_dr_gold\":\"1\"} ');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `type` varchar(16) NOT NULL,
  `type_id` varchar(16) NOT NULL,
  `image` varchar(256) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `subtitle` text NOT NULL,
  `image` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `category_id`, `name`, `slug`, `subtitle`, `image`) VALUES
(1, 5, 'Microwaves Ovens', 'microwaves-ovens', 'Microwaves Ovens', 'upload/images/3979-2021-09-07.jpg'),
(2, 1, 'Pressure Cookers', 'pressure-cookers', 'Pressure Cookers', 'upload/images/1435-2021-09-07.jpg'),
(3, 3, 'Pressure Cookers', 'pressure-cookers-1', 'Pressure Cookers', 'upload/images/0546-2021-09-07.jpg'),
(4, 4, 'Pressure Cookers', 'pressure-cookers-1-2', 'Pressure Cookers', 'upload/images/5281-2021-09-07.jpg'),
(5, 1, 'Gas Stoves', 'gas-stoves', 'Gas Stoves', 'upload/images/6634-2021-09-08.jpg'),
(6, 2, 'Gas Stoves', 'gas-stoves-1', 'Gas Stoves', 'upload/images/2520-2021-09-08.jpg'),
(7, 3, 'Gas Stoves', 'gas-stoves-1-2', 'Gas Stoves', 'upload/images/2264-2021-09-08.jpg'),
(8, 4, 'Gas Stoves', 'gas-stoves-1-2-3', 'Gas Stoves', 'upload/images/6389-2021-09-08.jpg'),
(9, 1, 'Induction Cook-Top', 'induction-cook-top', 'Induction Cook-Top', 'upload/images/7864-2021-09-08.jpg'),
(10, 2, 'Induction Cook-Top', 'induction-cook-top-1', 'Induction Cook-Top', 'upload/images/8934-2021-09-08.jpg'),
(11, 4, 'Induction Cook-Top', 'induction-cook-top-1-2', 'Induction Cook-Top', 'upload/images/1706-2021-09-08.jpg'),
(12, 1, 'Roti Makers', 'roti-makers', 'Roti Makers', 'upload/images/0713-2021-09-08.jpg'),
(13, 1, 'Mixer Grinders', 'mixer-grinders', 'Mixer Grinders', 'upload/images/7478-2021-09-08.jpg'),
(14, 2, 'Mixer Grinders', 'mixer-grinders-1', 'Mixer Grinders', 'upload/images/8641-2021-09-08.jpg'),
(15, 3, 'Mixer Grinders', 'mixer-grinders-1-2', 'Mixer Grinders', 'upload/images/9201-2021-09-08.jpg'),
(16, 4, 'Mixer Grinders', 'mixer-grinders-1-2-3', 'Mixer Grinders', 'upload/images/3368-2021-09-08.jpg'),
(17, 1, 'Wet Grinders', 'wet-grinders', 'Wet Grinders', 'upload/images/1474-2021-09-08.jpg'),
(18, 2, 'Wet Grinders', 'wet-grinders-1', 'Wet Grinders', 'upload/images/1563-2021-09-08.jpg'),
(19, 3, 'Wet Grinders', 'wet-grinders-1-2', 'Wet Grinders', 'upload/images/4032-2021-09-08.jpg'),
(20, 4, 'Wet Grinders', 'wet-grinders-1-2-3', 'Wet Grinders', 'upload/images/5785-2021-09-08.jpg'),
(21, 1, 'Electric Chimneys', 'electric-chimneys', 'Electric Chimneys', 'upload/images/7295-2021-09-08.jpg'),
(22, 4, 'Electric Chimneys', 'electric-chimneys-1', 'Electric Chimneys', 'upload/images/5649-2021-09-08.jpg'),
(23, 4, 'Non - Stick Cookware', 'non-stick-cookware', 'Non - Stick Cookware', 'upload/images/1953-2021-09-08.jpg'),
(24, 1, 'Electric Rice Cookers', 'electric-rice-cookers', 'Electric Rice Cookers', 'upload/images/3557-2021-09-08.jpg'),
(25, 2, 'Electric Rice Cookers', 'electric-rice-cookers-1', 'Electric Rice Cookers', 'upload/images/4906-2021-09-08.jpg'),
(26, 4, 'Electric Rice Cookers', 'electric-rice-cookers-1-2', 'Electric Rice Cookers', 'upload/images/0567-2021-09-08.jpg'),
(27, 1, 'Electric Toasters', 'electric-toasters', 'Electric Toasters', 'upload/images/5484-2021-09-08.jpg'),
(28, 4, 'Electric Toasters', 'electric-toasters-1', 'Electric Toasters', 'upload/images/2396-2021-09-08.jpg'),
(29, 1, 'Sandwich Makers', 'sandwich-makers', 'Sandwich Makers', 'upload/images/4463-2021-09-08.jpg'),
(30, 4, 'Sandwich Makers', 'sandwich-makers-1', 'Sandwich Makers', 'upload/images/0289-2021-09-08.jpg'),
(31, 1, 'Electric Grills', 'electric-grills', 'Electric Grills', 'upload/images/7171-2021-09-08.jpg'),
(32, 1, 'Hand Blender', 'hand-blender', 'Hand Blender', 'upload/images/1316-2021-09-08.jpg'),
(33, 4, 'Hand Blender', 'hand-blender-1', 'Hand Blender', 'upload/images/7109-2021-09-08.jpg'),
(34, 1, 'Juicers', 'juicers', 'Juicers', 'upload/images/0453-2021-09-08.jpg'),
(35, 2, 'Juicers', 'juicers-1', 'Juicers', 'upload/images/1478-2021-09-08.jpg'),
(36, 4, 'Juicers', 'juicers-1-2', 'Juicers', 'upload/images/3378-2021-09-08.jpg'),
(37, 1, 'Electric Kettle', 'electric-kettle', 'Electric Kettle', 'upload/images/8535-2021-09-08.jpg'),
(38, 2, 'Electric Kettle', 'electric-kettle-1', 'Electric Kettle', 'upload/images/5327-2021-09-08.jpg'),
(39, 4, 'Electric Kettle', 'electric-kettle-1-2', 'Electric Kettle', 'upload/images/5419-2021-09-08.jpg'),
(40, 1, 'Air Fryer', 'air-fryer', 'Air Fryer', 'upload/images/1093-2021-09-08.jpg'),
(41, 1, 'Electric Chopper', 'electric-chopper', 'Electric Chopper', 'upload/images/9765-2021-09-08.jpg'),
(42, 4, 'Electric Chopper', 'electric-chopper', 'Electric Chopper', 'upload/images/9221-2021-09-11.jpg'),
(43, 1, 'Milk Boiler', 'milk-boiler', 'Milk Boiler', 'upload/images/0779-2021-09-08.jpg'),
(44, 1, 'Coffee Maker', 'coffee-maker', 'Coffee Maker', 'upload/images/5115-2021-09-08.jpg'),
(45, 2, 'Coffee Maker', 'coffee-maker-1', 'Coffee Maker', 'upload/images/8693-2021-09-08.jpg'),
(46, 1, 'Iron Box', 'iron-box', 'Iron Box', 'upload/images/1982-2021-09-08.jpg'),
(47, 2, 'Iron Box', 'iron-box-1', 'Iron Box', 'upload/images/8042-2021-09-08.jpg'),
(48, 4, 'Iron Box', 'iron-box-1-2', 'Iron Box', 'upload/images/0987-2021-09-08.jpg'),
(49, 1, 'Barbecue', 'barbecue', 'Barbecue', 'upload/images/5483-2021-09-08.jpg'),
(50, 4, 'SS Vacuum Flasks', 'ss-vacuum-flasks', 'SS Vacuum Flasks', 'upload/images/0095-2021-09-08.jpg'),
(51, 4, 'Water Bottles', 'water-bottles', 'Water Bottles', 'upload/images/0774-2021-09-08.jpg'),
(52, 4, 'Tower Fans', 'tower-fans', 'Tower Fans', 'upload/images/5882-2021-09-08.jpg'),
(53, 4, 'Air Coolers', 'air-coolers', 'Air Coolers', 'upload/images/3428-2021-09-08.jpg'),
(54, 4, 'Washing Machines', 'washing-machines', 'Washing Machines', 'upload/images/3944-2021-09-08.jpg'),
(55, 4, 'Hand Mixers', 'hand-mixers', 'Hand Mixers', 'upload/images/7545-2021-09-08.jpg'),
(56, 1, 'Gas Stove Accessories', 'gas-stove-accessories', 'Gas Stove Accessories', 'upload/images/4707-2021-09-08.jpg'),
(57, 1, 'Grain Grinders', 'grain-grinders', 'Grain Grinders', 'upload/images/2567-2021-09-08.jpg'),
(58, 2, 'Electric Pressure Cooker', 'electric-pressure-cooker', 'Electric Pressure Cooker', 'upload/images/3346-2021-09-08.jpg'),
(59, 3, 'Wet Grinder Accessories', 'wet-grinder-accessories', 'Wet Grinder Accessories', 'upload/images/1428-2021-09-08.jpg'),
(60, 3, 'Coconut Scraper', 'coconut-scraper', 'Coconut Scraper', 'upload/images/3207-2021-09-08.jpg'),
(61, 3, 'Diet Cooker', 'diet-cooker', 'Diet Cooker', 'upload/images/0526-2021-09-08.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 DEFAULT NULL,
  `percentage` double(10,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `title`, `percentage`, `status`) VALUES
(1, 'C.GST', 1.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  `last_order_time` time NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `type` varchar(12) NOT NULL,
  `txn_id` varchar(256) NOT NULL,
  `payu_txn_id` varchar(512) DEFAULT NULL,
  `amount` double NOT NULL,
  `status` varchar(8) NOT NULL,
  `message` varchar(128) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `short_code` varchar(55) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `conversion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `name`, `short_code`, `parent_id`, `conversion`) VALUES
(1, 'Kilo Gram', 'Kg', NULL, NULL),
(2, 'Gram', 'Gm', NULL, NULL),
(3, 'Liter', 'Ltr', NULL, NULL),
(4, 'Milliliter', 'Ml', NULL, NULL),
(5, 'Pack', 'Pack', NULL, NULL),
(6, 'Piece', 'Pc', NULL, NULL),
(7, 'Meter', 'M', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(11) NOT NULL,
  `version` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `version`) VALUES
(1, 'v1.0.0'),
(2, 'v1.0.1'),
(3, 'v1.0.2'),
(4, 'v1.0.2.1'),
(5, 'v1.0.2.2');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `email` varchar(250) CHARACTER SET utf8 NOT NULL,
  `profile` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '91',
  `mobile` varchar(14) CHARACTER SET utf8 NOT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `referral_code` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `friends_code` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fcm_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8 NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `alternate_mobile` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8_unicode_ci NOT NULL,
  `area_id` int(11) NOT NULL,
  `pincode_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `state` varchar(56) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(56) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` int(11) NOT NULL,
  `order_id` varchar(32) NOT NULL DEFAULT '0',
  `order_item_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(8) NOT NULL COMMENT 'credit | debit',
  `amount` double NOT NULL,
  `message` varchar(512) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_requests`
--
ALTER TABLE `payment_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pincodes`
--
ALTER TABLE `pincodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variant`
--
ALTER TABLE `product_variant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_requests`
--
ALTER TABLE `payment_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pincodes`
--
ALTER TABLE `pincodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `product_variant`
--
ALTER TABLE `product_variant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
