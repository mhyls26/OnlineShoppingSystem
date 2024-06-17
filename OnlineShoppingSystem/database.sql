CREATE SCHEMA IF NOT EXISTS `shopping-cart` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `shopping-cart`;

-- Table: product
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` VARCHAR(45) NOT NULL,
  `pname` VARCHAR(100) NULL,
  `ptype` VARCHAR(20) NULL,
  `pinfo` VARCHAR(350) NULL,
  `pprice` DECIMAL(12,2) NULL,
  `pquantity` INT NULL,
  `image` LONGBLOB NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table: orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderid` VARCHAR(45) NOT NULL,
  `prodid` VARCHAR(45) NOT NULL,
  `quantity` INT NULL,
  `amount` DECIMAL(10,2) NULL,
  `shipped` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`orderid`, `prodid`),
  INDEX `productid_idx` (`prodid`),
  CONSTRAINT `productid` FOREIGN KEY (`prodid`) REFERENCES `product` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table: user
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `email` VARCHAR(60) NOT NULL,
  `name` VARCHAR(30) NULL,
  `mobile` BIGINT NULL,
  `address` VARCHAR(250) NULL,
  `pincode` INT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table: transactions
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `transid` VARCHAR(45) NOT NULL,
  `username` VARCHAR(60) NULL,
  `time` DATETIME NULL,
  `amount` DECIMAL(10,2) NULL,
  PRIMARY KEY (`transid`),
  INDEX `truserid_idx` (`username`),
  CONSTRAINT `truserid` FOREIGN KEY (`username`) REFERENCES `user` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transorderid` FOREIGN KEY (`transid`) REFERENCES `orders` (`orderid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table: user_demand
DROP TABLE IF EXISTS `user_demand`;
CREATE TABLE `user_demand` (
  `username` VARCHAR(60) NOT NULL,
  `prodid` VARCHAR(45) NOT NULL,
  `quantity` INT NULL,
  PRIMARY KEY (`username`, `prodid`),
  INDEX `prodid_idx` (`prodid`),
  CONSTRAINT `userdemailemail` FOREIGN KEY (`username`) REFERENCES `user` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prodid` FOREIGN KEY (`prodid`) REFERENCES `product` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table: usercart
DROP TABLE IF EXISTS `usercart`;
CREATE TABLE `usercart` (
  `username` VARCHAR(60) NULL,
  `prodid` VARCHAR(45) NULL,
  `quantity` INT NULL,
  INDEX `useremail_idx` (`username`),
  INDEX `prodidcart_idx` (`prodid`),
  CONSTRAINT `useremail` FOREIGN KEY (`username`) REFERENCES `user` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prodidcart` FOREIGN KEY (`prodid`) REFERENCES `product` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Data for table `shopping-cart`.`product`
-- -----------------------------------------------------
START TRANSACTION;
USE `shopping-cart`;

-- Category 1: T-Shirts
INSERT INTO `product` (`pid`, `pname`, `ptype`, `pinfo`, `pprice`, `pquantity`, `image`) VALUES
('P1', 'Cotton T-Shirt', 'T-Shirt', 'Comfortable cotton t-shirt', 250.00, 100, NULL),
('P2', 'Graphic Print T-Shirt', 'T-Shirt', 'T-shirt with cool graphic print', 300.00, 80, NULL),
('P3', 'Polo Shirt', 'T-Shirt', 'Classic polo shirt', 350.00, 70, NULL),
('P4', 'Striped T-Shirt', 'T-Shirt', 'T-shirt with striped pattern', 280.00, 90, NULL),
('P5', 'V-Neck T-Shirt', 'T-Shirt', 'Casual v-neck t-shirt', 270.00, 85, NULL),
('P6', 'Long Sleeve T-Shirt', 'T-Shirt', 'Long sleeve t-shirt', 320.00, 75, NULL),
('P7', 'Henley Shirt', 'T-Shirt', 'Henley style shirt', 300.00, 80, NULL),
('P8', 'Sports T-Shirt', 'T-Shirt', 'Performance sports t-shirt', 380.00, 65, NULL),
('P9', 'Plain White T-Shirt', 'T-Shirt', 'Basic plain white t-shirt', 230.00, 110, NULL),
('P10', 'Printed T-Shirt', 'T-Shirt', 'T-shirt with printed design', 290.00, 95, NULL),

-- Category 2: Pants
('P11', 'Jeans', 'Pants', 'Classic denim jeans', 600.00, 60, NULL),
('P12', 'Chinos', 'Pants', 'Stylish chino pants', 550.00, 70, NULL),
('P13', 'Cargo Pants', 'Pants', 'Cargo style pants', 480.00, 80, NULL),
('P14', 'Slim Fit Trousers', 'Pants', 'Slim fit trousers', 520.00, 75, NULL),
('P15', 'Jogger Pants', 'Pants', 'Comfortable jogger pants', 450.00, 90, NULL),
('P16', 'Track Pants', 'Pants', 'Sporty track pants', 420.00, 100, NULL),
('P17', 'Cropped Pants', 'Pants', 'Cropped style pants', 490.00, 85, NULL),
('P18', 'Corduroy Pants', 'Pants', 'Warm corduroy pants', 580.00, 65, NULL),
('P19', 'Formal Trousers', 'Pants', 'Formal trousers', 630.00, 55, NULL),
('P20', 'Stretch Pants', 'Pants', 'Stretchable pants', 510.00, 80, NULL),

-- Category 3: Dresses
('P21', 'Casual Dress', 'Dress', 'Casual summer dress', 700.00, 50, NULL),
('P22', 'Maxi Dress', 'Dress', 'Long maxi dress', 850.00, 40, NULL),
('P23', 'Party Dress', 'Dress', 'Party wear dress', 900.00, 35, NULL),
('P24', 'Midi Dress', 'Dress', 'Midi length dress', 780.00, 45, NULL),
('P25', 'Sundress', 'Dress', 'Light sundress', 670.00, 55, NULL),
('P26', 'Wrap Dress', 'Dress', 'Wrap style dress', 720.00, 48, NULL),
('P27', 'Bodycon Dress', 'Dress', 'Bodycon fit dress', 790.00, 42, NULL),
('P28', 'Floral Print Dress', 'Dress', 'Dress with floral print', 760.00, 47, NULL),
('P29', 'Shift Dress', 'Dress', 'Shift style dress', 740.00, 49, NULL),
('P30', 'Off Shoulder Dress', 'Dress', 'Off shoulder dress', 830.00, 38, NULL),

-- Category 4: Jackets
('P31', 'Leather Jacket', 'Jacket', 'Classic leather jacket', 1200.00, 30, NULL),
('P32', 'Denim Jacket', 'Jacket', 'Stylish denim jacket', 1100.00, 35, NULL),
('P33', 'Bomber Jacket', 'Jacket', 'Trendy bomber jacket', 1150.00, 32, NULL),
('P34', 'Windbreaker Jacket', 'Jacket', 'Windbreaker jacket', 1050.00, 38, NULL),
('P35', 'Parka', 'Jacket', 'Warm parka', 1250.00, 28, NULL),
('P36', 'Puffer Jacket', 'Jacket', 'Puffer style jacket', 1300.00, 25, NULL),
('P37', 'Blazer', 'Jacket', 'Formal blazer', 1180.00, 33, NULL),
('P38', 'Rain Jacket', 'Jacket', 'Waterproof rain jacket', 1080.00, 40, NULL),
('P39', 'Fleece Jacket', 'Jacket', 'Soft fleece jacket', 1120.00, 36, NULL),
('P40', 'Motorcycle Jacket', 'Jacket', 'Motorcycle style jacket', 1230.00, 31, NULL),

-- Category 5: Accessories
('P41', 'Sunglasses', 'Accessory', 'Stylish sunglasses', 300.00, 100, NULL),
('P42', 'Belt', 'Accessory', 'Leather belt', 250.00, 120, NULL),
('P43', 'Scarf', 'Accessory', 'Warm scarf', 280.00, 110, NULL),
('P44', 'Hat', 'Accessory', 'Fashionable hat', 270.00, 115, NULL),
('P45', 'Gloves', 'Accessory', 'Winter gloves', 260.00, 125, NULL),
('P46', 'Backpack', 'Accessory', 'Casual backpack', 350.00, 90, NULL),
('P47', 'Watch', 'Accessory', 'Classic wristwatch', 400.00, 80, NULL),
('P48', 'Earrings', 'Accessory', 'Stylish earrings', 320.00, 95, NULL),
('P49', 'Necklace', 'Accessory', 'Fashion necklace', 310.00, 98, NULL),
('P50', 'Bracelet', 'Accessory', 'Chic bracelet', 330.00, 93, NULL);

COMMIT;

-- Insert initial data into orders table
INSERT INTO `orders` (`orderid`, `prodid`, `quantity`, `amount`, `shipped`) VALUES ('TR10001', 'P1', 1, 125999.00, 0);

-- Insert initial data into user table
INSERT INTO `user` (`email`, `name`, `mobile`, `address`, `pincode`, `password`) VALUES 
('guest@gmail.com', 'Guest User', 99912345678, '64 Xavier Street, Greenhills, San Juan, Metro Manila 1500 Philippines', 123456, 'guest'),
('admin@gmail.com', 'Admin User', 98745612301, 'East Avenue Corner Nia Road, Quezon City', 654321, 'admin');

-- Insert initial data into transactions table
INSERT INTO `transactions` (`transid`, `username`, `time`, `amount`) VALUES ('TR10001', 'guest@gmail.com', '2023-04-23 09:26:56', 280.00);

-- Insert initial data into user_demand table
INSERT INTO `user_demand` (`username`, `prodid`, `quantity`) VALUES ('guest@gmail.com', 'P1', 3);

-- Insert initial data into usercart table
INSERT INTO `usercart` (`username`, `prodid`, `quantity`) VALUES ('guest@gmail.com', 'P1', 2);