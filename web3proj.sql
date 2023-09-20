-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jul 13, 2023 at 10:42 AM
-- Server version: 10.10.2-MariaDB
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web3proj`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE IF NOT EXISTS `brand` (
  `brandid` int(11) NOT NULL,
  `brandname` varchar(255) NOT NULL,
  PRIMARY KEY (`brandname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brandid`, `brandname`) VALUES
(1, 'Adidas'),
(2, 'Boss'),
(3, 'CastDream'),
(4, 'Chanel'),
(5, 'Lacoste'),
(6, 'LOUIS'),
(7, 'Manscaped');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) DEFAULT NULL,
  `categoryname` varchar(255) NOT NULL,
  `categoryimage` varchar(255) NOT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryid`, `slug`, `categoryname`, `categoryimage`) VALUES
(1, 't-shirts', 't-shirts', 'https://cdn.pixabay.com/photo/2016/12/06/09/31/blank-1886008_640.png'),
(2, 'shoes', 'Shoes', 'https://cld.accentuate.io/5345143160989/1663073330430/Madrid_Grey_Feature-Float-1380.png?v=1669224113732&options=w_1600'),
(3, 'dresses', 'dresses', 'https://media.istockphoto.com/id/178851955/photo/flowery-evase-bateau-yellow-dress.jpg?s=612x612&w=0&k=20&c=EOJGCGC6dmFt0IQvbxq3PthCmNXO1flOpjYWC4KkcyQ='),
(5, 'hats', 'hats', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFu-fn5-pR6WISlcdpJ85z3ArRd9bFk3kNLg&usqp=CAU'),
(6, 'heels', 'heels', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMKinTGYdg8voQm-7AeznSEltPaLe--hsCuw&usqp=CAU'),
(7, 'pants', 'pants', 'https://www.helikon-tex.com/media/catalog/product/cache/6/image/9df78eab33525d08d6e5fb8d27136e95/s/p/sp-pgm-dc-11.jpg'),
(8, 'underwears', 'underwears', 'https://cdn.shopify.com/s/files/1/0058/7284/4871/products/boxers-white-limited.jpg?v=1624923591'),
(9, '', 'bras', 'http://localhost/products/bras/bras1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) DEFAULT NULL,
  `productimage` varchar(255) NOT NULL,
  `brandname` varchar(255) NOT NULL,
  `productname` varchar(255) NOT NULL,
  `productdesc` text DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  `quantity` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  PRIMARY KEY (`productid`),
  KEY `categoryid` (`categoryid`),
  KEY `brandname` (`brandname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productid`, `slug`, `productimage`, `brandname`, `productname`, `productdesc`, `price`, `quantity`, `categoryid`) VALUES
(1, 'Joy T-shirt', 'http://localhost/products/tshirts/f1.jpg', 'Adidas', 'Joy T-shirt', 'The one you always need', '70', 7, 1),
(2, 'huwai tshirt', 'http://localhost/products/tshirts/f2.jpg', 'Adidas', 'huwai t-shirt', 'black one', '60', 1, 1),
(3, 'roses', 'http://localhost/products/tshirts/f3.jpg', 'CastDream', 'roses', 'nice and chill', '70', 3, 1),
(4, 'SpiritBlossom', 'http://localhost/products/tshirts/f5.jpg', 'Adidas', 'Spirit Blossom tshirt', 'look good,feel good', '70', 5, 1),
(5, 'Fresh/Fit', 'http://localhost/products/tshirts/f6.jpg', 'Adidas', 'Fresh&Fit', 'Like a Boss', '60', 4, 1),
(6, 'black hat', 'http://localhost/products/hats/hat2.jpeg', 'Adidas', 'black hat', NULL, '35', 6, 5),
(7, 'blue shirt', 'http://localhost/products/tshirts/n1.jpg', 'LOUIS', 'Blue Shirt', 'classic blue shirt', '22', 20, 1),
(8, 'work', 'http://localhost/products/tshirts/n2.jpg', 'LOUIS', 'work', 'Always go to work elegant and ready ', '50', 10, 1),
(9, 'white shirt', 'http://localhost/products/tshirts/n3.jpg', 'LOUIS', 'White Shirt', 'your classic typical white shirt', '30', 4, 1),
(10, 'G.ST', 'http://localhost/products/tshirts/n4.jpg', 'Boss', 'G.ST', 'Your new favorite high quality t-shirt', '70', 5, 1),
(11, 'blue shirt2', 'http://localhost/products/tshirts/n5.jpg', 'LOUIS', 'blue shirt 2', 'another variation of the classic blue shirt', '40', 10, 1),
(12, 'brown shirt', 'http://localhost/products/tshirts/n7.jpg', 'LOUIS', 'Brown Shirt', 'convenient for work in the wild and forest', '30', 12, 1),
(13, 'black t-shirt', 'http://localhost/products/tshirts/n8.jpg', 'Adidas', 'black t-shirt', 'best fit for funerlas', '50', 5, 1),
(14, 'white sneakers', 'http://localhost/products/shoes/Shoe1.png', 'Adidas', 'White Sneakers', 'good for all the sports and daily activity', '70', 7, 2),
(15, 'Black Sneakers', 'http://localhost/products/shoes/Shoe2.png', 'Adidas', 'Black Sneakers', 'A black version of the original Sneakers', '70', 4, 2),
(16, 'Yellow Dress', 'http://localhost/products/dresses/Dress2.jpg', 'Chanel', 'Yellow Dress', '', '80', 7, 3),
(17, 'Pink sneakers', 'http://localhost/products/shoes/Shoe5.png', 'Adidas', 'Pink Sneakers', 'For all girls who\'s into sports', '40', 7, 2),
(18, 'green sneakers', 'http://localhost/products/shoes/Shoe4.webp', 'Adidas', 'Green Sneakers', 'An unusual and chaotic new color for the same sneakers', '50', 10, 2),
(19, 'Pink Dress', 'http://localhost/products/dresses/Dress3.jpg', 'Chanel', 'Pink Dress', '', '70', 4, 3),
(20, 'long yellow dress', 'http://localhost/products/dresses/Dress4.jpg', 'Chanel', 'Long yellow Dress', '', '80', 5, 3),
(21, 'orange flower dress', 'http://localhost/products/dresses/Dress5.jpg', 'Chanel', 'orange flower dress', 'Grey Dress', '60', 8, 3),
(22, 'clown hat', 'http://localhost/products/hats/hat5.jpg', 'LOUIS', 'clow hat', NULL, '20', 5, 5),
(23, 'brown pants', 'http://localhost/products/pants/pants2.jpg', 'Lacoste', 'brown pants ', NULL, '30', 12, 7),
(24, 'yellow brown pants', 'http://localhost/products/pants/pants3.jpg', 'Lacoste', 'yellow brown pants', NULL, '50', 6, 7),
(25, 'pink heel', 'http://localhost/products/heels/heel1.jpg', 'Chanel', 'pink heel', '', '70', 3, 6),
(26, 'white heel', 'http://localhost/products/heels/heel2.jpg', 'Chanel', 'white heel', '', '60', 2, 6),
(27, 'fancy heel', 'http://localhost/products/heels/heel4.jpg', 'Chanel', 'Fancy heel', '', '150', 2, 6),
(28, 'black underwear', 'http://localhost/products/underwears/underwear1.webp', 'Manscaped', 'Black underwear', 'Your Balls will thank you', '40', 6, 8),
(29, 'blue pants', 'http://localhost/products/pants/pants4.jpg', 'Adidas', 'blue pants', NULL, '50', 2, 7),
(30, 'black underwear', 'http://localhost/products/underwears/underwear2.jpg', 'CastDream', 'Black underwear ', 'keep the bois nice and warm', '20', 10, 8),
(31, 'tiger underwear', 'http://localhost/products/underwears/underwear4.jpg', 'Lacoste', 'Tiger underwear', 'you mess with the tiger u get bit by the tiger', '30', 7, 8),
(33, 'red%black pants', 'http://localhost/products/pants/pant5.jpg', 'Boss', 'red&black pants', NULL, '50', 4, 7),
(34, 'cowboy hat', 'http://localhost/products/hats/hat4.jpg', 'Lacoste', 'cowboy hat', NULL, '25', 9, 5),
(35, 'bras', 'http://localhost/products/bras/bras3.webp', 'Chanel', 'pink bra', NULL, '35', 4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

DROP TABLE IF EXISTS `userlogin`;
CREATE TABLE IF NOT EXISTS `userlogin` (
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(191) NOT NULL,
  `gender` varchar(191) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'user',
  `subject` varchar(191) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `cart` varchar(255) DEFAULT NULL,
  `wishlist` varchar(255) DEFAULT NULL,
  `accdate` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`firstname`, `lastname`, `email`, `username`, `password`, `gender`, `avatar`, `user_type`, `subject`, `message`, `cart`, `wishlist`, `accdate`) VALUES
('admin', 'admin', 'admin@hotmail.com', 'admin', 'ADMINadmin123', 'male', 'http://localhost/avatars/admin.png', 'admin', '', '', NULL, NULL, '2023-06-19'),
('ahmad', 'serhal', 'ahmadserhal@gmail.com', 'ahmad', '1282000As', 'male', 'http://localhost/avatars/me.png', 'user', 'Products', 'Add more products', 'Long yellow Dress,Yellow Dress,Pink Dress,Fancy heel', 'pink heel,blue pants,Long yellow Dress,huwai t-shirt,', '2023-06-19'),
('mhmd', 'serhal', 'm-serhal@hotmail.com', 'moe', '1411999Ms', 'male', 'http://localhost/avatars/2.png', 'user', 'categories', 'add bra categories\r\n', NULL, NULL, '2023-06-19');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `category` (`categoryid`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`brandname`) REFERENCES `brand` (`brandname`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
