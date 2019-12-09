-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 09, 2019 at 09:50 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `book_isbn` varchar(20) NOT NULL,
  `book_title` varchar(100) DEFAULT NULL,
  `book_author` varchar(100) DEFAULT NULL,
  `book_image` varchar(255) DEFAULT NULL,
  `book_descr` text NOT NULL,
  `book_price` decimal(6,2) NOT NULL,
  `publisherid` int(10) NOT NULL,
  PRIMARY KEY (`book_isbn`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_isbn`, `book_title`, `book_author`, `book_image`, `book_descr`, `book_price`, `publisherid`) VALUES
('978-0-321-94786-4', 'Learning mobile App Development', 'Ramses kumar', 'mobile_app.jpg', 'Now one book can help you to learn the mobile application development with all platform :Apple,Google and android', '450.00', 6),
('978-0-921-194786-4', 'Doing Good by Doing Good ', 'Sachin kumar', 'doing_good.jpg', 'Doing Good by Doing Good shows companies how to improve the bottom line by implementing an engaging, authentic, and business-enhancing program that helps staff and business thrive', '600.00', 2),
('978-1-123-94786-9', 'Learning Web Development', 'Larry Ullamn', 'web_app_dev.jpg', 'This book is all about the web development', '900.00', 8),
('978-1-1321-7860-4', 'C++ quick reference', 'Jon Doe Delhi', 'c_14_quick.jpg', 'This is a updated book of c++', '550.00', 3),
('978-3-4220-9999-8', 'Pro Hadoop', 'jason venor', 'hadoop.jpg', 'This book is all about the haddop ', '1500.00', 10),
('978-0-111-94786-4', 'Bigdata', 'Eenter curisesr', 'bigdata', 'Big data a revolution that will transform \r\nhow we live think and work.', '1800.00', 1),
('978-9-2222-0100-7', 'Blockchain dummies', 'Tina Kaurence', 'blockchain.jpg', 'Get to know the potential of the blockchain  and find how the blockchain improve your business .Get the tips of security and ebhancing the data of with the blockchain', '1111.00', 5),
('978-7-2020-7777-1', 'Android studio', 'Herbert schidite', 'android_studio.jpg', 'This book is all about the android studio.', '200.00', 4),
('978-0-321-94786-9', 'C# in a nutshell', 'Alabahari', 'c_sharp_6.jpg', 'its all about the c#', '300.00', 7),
('978-7-4444-7777-1', 'javascript', 'Nickolas zakas ', 'pro_js.jpg', 'its all about the javascript', '550.00', 9);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customerid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(30) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `country` varchar(60) NOT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerid`, `name`, `address`, `city`, `zipcode`, `country`) VALUES
(1, 'Dinesh', 'Delhi', 'Delhi', '110011', 'India'),
(2, 'Suresh', 'Mumbai', 'Bombay', '200220', 'India'),
(3, 'Jon', 'Usa ', 'usa ', '50001', 'usa');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orderid` int(10) NOT NULL AUTO_INCREMENT,
  `customerid` int(10) NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ship_name` char(60) NOT NULL,
  `ship_address` char(80) NOT NULL,
  `ship_city` char(30) NOT NULL,
  `ship_zip_code` char(10) NOT NULL,
  `ship_country` char(20) NOT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderid`, `customerid`, `amount`, `date`, `ship_name`, `ship_address`, `ship_city`, `ship_zip_code`, `ship_country`) VALUES
(1, 1, '1111.00', '2018-08-07 18:30:00', 'a', 'A', 'a', '110011', 'india');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `orderid` int(10) UNSIGNED NOT NULL,
  `book_isbn` varchar(30) NOT NULL,
  `item_price` decimal(6,2) NOT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
CREATE TABLE IF NOT EXISTS `publisher` (
  `publisherid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(60) NOT NULL,
  PRIMARY KEY (`publisherid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisherid`, `publisher_name`) VALUES
(1, 'Wrox'),
(2, 'xyz publisher'),
(3, 'abc publisher'),
(4, 'Tata mcgrahill'),
(5, 'pearson pulisher'),
(6, 's.chand & sons'),
(7, 'McGraw-Hill International'),
(8, 'New Delhi Book publishers'),
(9, 'Indian Publications'),
(10, 'Willy and sons');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
