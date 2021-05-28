-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2021 at 02:48 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cook`
--

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `dishID` bigint(20) NOT NULL,
  `dishName` varchar(255) NOT NULL,
  `dishDescription` varchar(510) NOT NULL,
  `dishMenu` enum('Breakfast','Lunch','Dinner') NOT NULL,
  `dishPic` varchar(255) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`dishID`, `dishName`, `dishDescription`, `dishMenu`, `dishPic`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'Chicken Adobo', 'In a large kettle combine the chicken, the vinegar, the garlic, the bay leaves, the peppercorns, and 1 cup water, bring the mixture to a boil, and simmer it, covered, for 20 minutes. Add the soy sauce and simmer the mixture, covered, for 20 minutes. Trans', 'Dinner', 'ChickenAdobo.jpg', NULL, '2021-05-28 03:18:24', NULL),
(2, 'Bicol Express', 'Bicol Express is pure comfort food! With pork cubes cooked in coconut milk and chili peppers, it’s rich, creamy, spicy and delicious! Serve with steamed rice for a hearty and big flavored meal!', 'Lunch', 'BicolExpress.jpg', NULL, NULL, NULL),
(3, 'Banana Fritter', 'Banana Fritter is a type of Filipino snack. It is a fried concoction made from ripe  “Saba” banana or plantains. The bananas can either be sliced or mashed. It is then mixed with a batter composed of flour, sugar, vanilla, and egg. A fritter is defines as a mixture (such as a batter) that includes either fruit or meat. Maruya obviously falls under the category.', 'Breakfast', 'BananaFritter.jpg', '2021-05-26 15:16:05', '2021-05-26 15:16:05', NULL),
(4, 'Sinigang', 'Sinigang na Hipon is a type of Filipino sour soup, wherein shrimp is used as the main ingredient. This dish also includes a variety of vegetables such as daikon radish, snake beans, okra, and eggplant. This dish is best served during cold weather. It is b', 'Lunch', 'Sinigang.jpg', '2021-05-14 06:42:56', '2021-05-14 06:42:56', NULL),
(5, 'Arroz Caldo', 'Arroz Caldo literally means warm rice. This congee that closely resembles risotto has been a favorite Filipino snack. What goes with arroz caldo? I enjoy pairing it with tokwat baboy, which is a combination of boiled pork slices and fried tofu soaked in a vinegar mixture.', 'Breakfast', 'ArrozCaldo.jpg', '2021-05-27 05:43:36', '2021-05-27 05:43:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dish_ingredients`
--

CREATE TABLE `dish_ingredients` (
  `dishIngID` int(11) NOT NULL,
  `dishID` bigint(20) NOT NULL,
  `ingredientID` bigint(20) NOT NULL,
  `amount` float NOT NULL,
  `measurement` enum('teaspoon','cup','whole','part','pound','piece','teaspoons','pieces','tablespoon','tablespoons','cups','pounds','knob','knobs') NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dish_ingredients`
--

INSERT INTO `dish_ingredients` (`dishIngID`, `dishID`, `ingredientID`, `amount`, `measurement`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 1, 1, 8, 'whole', NULL, '2021-05-28 05:48:27', NULL),
(2, 1, 2, 2, 'whole', NULL, '2021-05-28 05:48:27', NULL),
(3, 1, 3, 3, 'whole', NULL, '2021-05-28 05:48:27', NULL),
(4, 1, 4, 2, 'whole', NULL, '2021-05-28 05:48:27', NULL),
(5, 1, 5, 2, 'whole', NULL, '2021-05-28 05:48:28', NULL),
(6, 1, 6, 0.75, '', NULL, '2021-05-28 07:21:30', NULL),
(7, 1, 7, 9, 'whole', NULL, '2021-05-28 05:48:28', NULL),
(8, 2, 8, 3, 'teaspoon', NULL, NULL, NULL),
(9, 2, 9, 1, 'whole', NULL, NULL, NULL),
(10, 2, 10, 2, 'pound', NULL, NULL, NULL),
(11, 2, 11, 6, 'teaspoon', NULL, NULL, NULL),
(12, 2, 12, 1, 'cup', NULL, NULL, NULL),
(13, 2, 13, 1, 'cup', NULL, NULL, NULL),
(14, 2, 14, 14, 'whole', NULL, NULL, NULL),
(15, 2, 15, 2, 'cup', NULL, NULL, NULL),
(16, 2, 16, 1, 'cup', NULL, NULL, NULL),
(17, 2, 17, 1, 'part', NULL, NULL, NULL),
(18, 2, 5, 1, 'part', NULL, NULL, NULL),
(19, 4, 19, 1, 'pound', '2021-05-14 07:14:44', NULL, NULL),
(20, 4, 20, 1, 'whole', '2021-05-14 07:14:44', NULL, NULL),
(21, 4, 22, 15, 'whole', '2021-05-14 07:16:04', NULL, NULL),
(22, 4, 21, 0.25, 'pound', '2021-05-14 07:16:04', NULL, NULL),
(23, 4, 23, 5, 'whole', '2021-05-14 07:17:17', NULL, NULL),
(24, 4, 24, 1, 'whole', '2021-05-14 07:17:17', NULL, NULL),
(25, 4, 25, 1, 'cup', '2021-05-14 07:17:47', NULL, NULL),
(26, 4, 26, 1, 'whole', '2021-05-14 07:17:47', NULL, NULL),
(27, 4, 15, 3, 'whole', '2021-05-14 07:18:23', NULL, NULL),
(28, 4, 9, 1, 'whole', '2021-05-14 07:18:23', NULL, NULL),
(29, 4, 13, 8, 'cup', '2021-05-14 07:19:23', NULL, NULL),
(30, 4, 28, 1, 'part', '2021-05-14 07:19:23', NULL, NULL),
(31, 4, 5, 1, 'part', '2021-05-14 07:19:53', NULL, NULL),
(32, 3, 29, 6, 'pieces', '2021-05-26 16:13:57', '2021-05-26 16:13:57', NULL),
(33, 3, 32, 1, 'cup', '2021-05-26 16:19:14', '2021-05-26 16:19:14', NULL),
(34, 3, 33, 1.5, 'teaspoon', '2021-05-26 16:19:14', '2021-05-26 16:19:14', NULL),
(35, 3, 34, 1, 'piece', '2021-05-26 16:22:18', '2021-05-26 16:22:18', NULL),
(36, 3, 35, 1, 'teaspoon', '2021-05-26 16:22:18', '2021-05-26 16:22:18', NULL),
(37, 3, 36, 0.75, 'cup', '2021-05-26 16:26:05', '2021-05-26 16:26:05', NULL),
(38, 3, 37, 1, 'cup', '2021-05-26 16:26:38', '2021-05-26 16:26:38', NULL),
(39, 3, 38, 0.75, 'cup', '2021-05-26 16:27:10', '2021-05-26 16:27:10', NULL),
(40, 3, 17, 0.5, 'teaspoon', '2021-05-26 16:27:10', '2021-05-26 16:27:10', NULL),
(60, 1, 23, 1, 'part', '1970-01-01 00:00:00', '2021-05-28 07:46:45', '2021-05-28 08:01:17'),
(61, 1, 16, 1, 'teaspoon', '1970-01-01 00:00:00', '2021-05-28 08:01:45', '2021-05-28 08:01:53');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `ingredientID` bigint(20) NOT NULL,
  `ingredientName` varchar(255) NOT NULL,
  `ingredientDescription` varchar(510) NOT NULL,
  `ingredientType` enum('Spice/Seasoning','Meat','Vegetable/Fruit','Basic') NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`ingredientID`, `ingredientName`, `ingredientDescription`, `ingredientType`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'Chicken Legs', 'A meat part of a chicken.', 'Meat', NULL, '2021-05-28 02:16:57', NULL),
(2, 'White Vinegar', 'White vinegar is a solution typically consisting of 4–7% acetic acid and 93–96% water, though types with higher acetic acid content are available for agricultural or cleaning purposes. It\'s most commonly made via the fermentation of grain alcohol.', 'Spice/Seasoning', NULL, NULL, NULL),
(3, 'Garlic', 'Garlic is an herb that is grown around the world. It is related to onion, leeks, and chives. It is thought that garlic is native to Siberia, but spread to other parts of the world over 5000 years ago.', 'Spice/Seasoning', NULL, NULL, NULL),
(4, 'Bay Leaves', 'The bay leaf is an aromatic leaf commonly used in cooking. It can be used whole or in a dried or ground form.', 'Spice/Seasoning', NULL, NULL, NULL),
(5, 'Black Pepper', 'Black pepper is a flowering vine in the family Piperaceae, cultivated for its fruit, known as a peppercorn, which is usually dried and used as a spice and seasoning.', 'Spice/Seasoning', NULL, NULL, NULL),
(6, 'Soy Sauce', 'Soy sauce is a liquid condiment of Chinese origin, traditionally made from a fermented paste of soybeans, roasted grain, brine, and Aspergillus oryzae or Aspergillus sojae molds. It is considered to contain a strong umami flavor.', 'Spice/Seasoning', NULL, NULL, NULL),
(7, 'Vegetable Oil', 'Vegetable oils, or vegetable fats, are oils extracted from seeds or from other parts of fruits. Like animal fats, vegetable fats are mixtures of triglycerides.', 'Basic', NULL, NULL, NULL),
(8, 'Canola Oil', 'Canola oil is a vegetable oil derived from a variety of rapeseed that is low in erucic acid, as opposed to colza oil.', 'Basic', NULL, NULL, NULL),
(9, 'Onion', 'The onion also known as the bulb onion or common onion, is a vegetable that is the most widely cultivated species of the genus Allium.', 'Spice/Seasoning', NULL, NULL, NULL),
(10, 'Pork Belly', 'Belly part of a Pig.', 'Meat', NULL, NULL, NULL),
(11, 'Shrimp Paste', 'Shrimp paste or prawn sauce is a fermented condiment commonly used in Southeast Asian and Southern Chinese cuisines.', 'Spice/Seasoning', NULL, NULL, NULL),
(12, 'Coconut Milk', 'The juice of a coconut fruit.', 'Spice/Seasoning', NULL, NULL, NULL),
(13, 'Water', 'Basic ingredient for cooking.', 'Basic', NULL, NULL, NULL),
(14, 'Thai Chili Peppers', 'Thai chili is a chili pepper, a variety from the species Capsicum annuum, commonly found in Ethiopia and across Southeast Asia. It is used extensively in many Asian cuisines.', 'Spice/Seasoning', NULL, NULL, NULL),
(15, 'Long Pepper', 'Finger chili or long pepper, is one of two kinds of chili common to the Philippines and Filipino cuisine, the other being siling labuyo.', 'Spice/Seasoning', NULL, NULL, NULL),
(16, 'Coconut Cream', 'A processed product made from a coconut fruit.', 'Spice/Seasoning', NULL, NULL, NULL),
(17, 'Salt', 'Basic ingredient for cooking', 'Basic', NULL, NULL, NULL),
(19, 'Shrimp', 'Shrimp and prawn are types of seafood that are consumed worldwide. Although shrimp and prawns belong to different suborders of Decapoda, they are very similar in appearance and the terms are often used interchangeably in commercial farming and wild fisher', 'Meat', '2021-05-14 06:57:01', NULL, NULL),
(20, 'Knorr Sinigang', 'A seasoning for sour flavor.', 'Spice/Seasoning', '2021-05-14 06:57:01', NULL, NULL),
(21, 'Kangkong', 'Kangkong or water spinach is one of the very familiar green leafy vegetables used in the South and South-East Asian cuisine. Its gently sweet, mucilaginous, succulent leaves and stems are very much sought-after in the salads, braised and stir-fries.', 'Vegetable/Fruit', '2021-05-14 07:01:42', NULL, NULL),
(22, 'Asparagus beans', 'The asparagus bean is a legume cultivated for its edible green pods containing immature seeds, like the green bean. It is also known as the yardlong bean, long-podded cowpea, Chinese long bean, bodi/bora, snake bean, or pea bean.', 'Vegetable/Fruit', '2021-05-14 07:02:23', NULL, NULL),
(23, 'Okra', 'Okra or Okro, Abelmoschus esculentus, known in many English-speaking countries as ladies\' fingers or ochro, is a flowering plant in the mallow family. It is valued for its edible green seed pods. It is a good source of minerals, vitamins, antioxidants, and fiber.', 'Vegetable/Fruit', '2021-05-14 07:02:23', NULL, NULL),
(24, 'Eggplant', 'Eggplant, aubergine or brinjal is a plant species in the nightshade family Solanaceae. Solanum melongena is grown worldwide for its edible fruit. Most commonly purple, the spongy, absorbent fruit is used in several cuisines.', 'Vegetable/Fruit', '2021-05-14 07:03:46', NULL, NULL),
(25, 'Daikon Radish', 'Daikon or mooli, Raphanus sativus var. longipinnatus, is a mild-flavored winter radish usually characterized by fast-growing leaves and a long, white, napiform root.', 'Vegetable/Fruit', '2021-05-14 07:03:46', NULL, NULL),
(26, 'Tomato', 'The tomato is the edible berry of the plant Solanum lycopersicum, commonly known as a tomato plant. The species originated in western South America and Central America.', 'Vegetable/Fruit', '2021-05-14 07:04:52', NULL, NULL),
(28, 'Fish Sauce', 'Fish sauce is a liquid condiment made from fish or krill that have been coated in salt and fermented for up to two years.', 'Spice/Seasoning', '2021-05-14 07:09:13', NULL, NULL),
(29, 'Banana', 'A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa.', 'Vegetable/Fruit', '2021-05-26 15:44:13', '2021-05-26 15:44:13', NULL),
(32, 'All-Purpose Flour', 'All-purpose flour is a versatile and general use wheat flour.', 'Basic', '2021-05-26 15:48:16', '2021-05-26 15:48:16', NULL),
(33, 'Vanilla Extract', 'Vanilla extract is a solution made by macerating and percolating vanilla pods in a solution of ethanol and water. It is considered an essential ingredient in many Western desserts, especially baked goods like cakes, cookies, brownies, and cupcakes, as well as custards, ice creams, and puddings.', 'Basic', '2021-05-26 15:49:30', '2021-05-26 15:49:30', NULL),
(34, 'Egg', 'Eggs have a hard shell of calcium carbonate enclosing a liquid white, a single yolk (or an occasional double yolk)and an air cell.', 'Basic', '2021-05-26 15:51:00', '2021-05-26 15:51:00', NULL),
(35, 'Baking Powder', 'Baking powder is used to increase the volume and lighten the texture of baked goods.', 'Basic', '2021-05-26 16:06:27', '2021-05-26 16:06:27', NULL),
(36, 'White Sugar', 'White sugar, also called table sugar, granulated sugar or regular sugar, is a commonly used type of sugar, made either of beet sugar or cane sugar, which has undergone a refining process.', 'Basic', '2021-05-26 16:07:47', '2021-05-26 16:07:47', NULL),
(37, 'Fresh Milk', 'Fresh milk means milk offered for sale to the public which has not been dehydrated, rehydrated or reconstituted in whole or in part and shall not contain caseins, casein products, or caseinates other than those caseins, casein products, or caseinates which occur naturally.', 'Basic', '2021-05-26 16:10:04', '2021-05-26 16:10:04', NULL),
(38, 'Cooking Oil', 'Cooking oil is plant, animal, or synthetic fat used in frying, baking, and other types of cooking. It is also used in food preparation and flavoring not involving heat, such as salad dressings and bread dippings like bread dips, and may be called edible oil.', 'Basic', '2021-05-26 16:12:15', '2021-05-26 16:12:15', NULL),
(39, 'olok', 'baho', 'Spice/Seasoning', '2021-05-28 02:10:38', '2021-05-28 02:10:38', '2021-05-28 02:10:44');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20210514030611-create_dishes_table.js'),
('20210514032029-create_ingredients_table.js'),
('20210514033700-create_dish_ingredients_table.js'),
('20210524152506-create_users_table.js'),
('20210524153509-create_users_table.js'),
('20210524153720-create_userDish_table.js'),
('20210524174722-create_users_table.js'),
('20210524175136-create_users_table.js');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` bigint(20) NOT NULL,
  `userImage` varchar(255) NOT NULL DEFAULT 'ppholder.png',
  `userName` varchar(255) NOT NULL,
  `userFullName` varchar(255) NOT NULL,
  `userUID` varchar(255) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `userType` bigint(20) NOT NULL,
  `userBio` varchar(510) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `userImage`, `userName`, `userFullName`, `userUID`, `userEmail`, `userPassword`, `userType`, `userBio`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(14, 'rui_tachibana_pouting__domestic_na_kanojo__by_jlaone_dd2fhvp-fullview.png', 'rayleigh', 'Rayl Xylem', 'HBxi7bnQ', 'rayl@gmail.com', '$2b$10$7nRFrsOUsxIlShOAzEOpWugqcMTgU4c0we.QAD43lTiIkGk.RKbu2', 1, 'kaumay mabuhay', '2021-05-26 07:40:59', '2021-05-27 14:04:33', NULL),
(17, 'ppholder.png', 'ralphkintana', 'Ralph Kintana', 'Vx1F9Srr', 'rk@test.com', '$2b$10$CrJN6pZvoCDSpU7gIQHPxu2aZaEbRAydA1w84j77JFa58MS.ySRzK', 0, ' ', '2021-05-28 12:44:42', '2021-05-28 12:44:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usersdish`
--

CREATE TABLE `usersdish` (
  `udID` bigint(20) NOT NULL,
  `userUID` varchar(255) NOT NULL,
  `dishID` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `washdish`
--

CREATE TABLE `washdish` (
  `dishID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `washdish`
--

INSERT INTO `washdish` (`dishID`) VALUES
(1),
(2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`dishID`);

--
-- Indexes for table `dish_ingredients`
--
ALTER TABLE `dish_ingredients`
  ADD PRIMARY KEY (`dishIngID`),
  ADD KEY `dishID` (`dishID`),
  ADD KEY `ingredientID` (`ingredientID`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ingredientID`),
  ADD UNIQUE KEY `ingredientName` (`ingredientName`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `washdish`
--
ALTER TABLE `washdish`
  ADD PRIMARY KEY (`dishID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `dishID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `dish_ingredients`
--
ALTER TABLE `dish_ingredients`
  MODIFY `dishIngID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `ingredientID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `washdish`
--
ALTER TABLE `washdish`
  MODIFY `dishID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dish_ingredients`
--
ALTER TABLE `dish_ingredients`
  ADD CONSTRAINT `dish_ingredients_ibfk_1` FOREIGN KEY (`dishID`) REFERENCES `dishes` (`dishID`),
  ADD CONSTRAINT `dish_ingredients_ibfk_2` FOREIGN KEY (`ingredientID`) REFERENCES `ingredients` (`ingredientID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
