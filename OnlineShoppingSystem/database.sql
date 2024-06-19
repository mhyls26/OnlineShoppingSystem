DROP DATABASE IF EXISTS `shopping-cart`;
CREATE DATABASE IF NOT EXISTS `shopping-cart`;
USE `shopping-cart`;

-- Table: Users
CREATE TABLE IF NOT EXISTS `users` (
    `user_id` INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `birthdate` DATE NOT NULL,
    `gender` ENUM('Female', 'Male', 'Prefer not to say') NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `zip_code` VARCHAR(10) NOT NULL,
    `phone_number` VARCHAR(15) NOT NULL,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL
);

-- Table: Products
CREATE TABLE IF NOT EXISTS `product` (
    `pid` VARCHAR(10) PRIMARY KEY,
    `pname` VARCHAR(100) NOT NULL,
    `ptype` VARCHAR(50) NOT NULL,
    `pinfo` TEXT,
    `pprice` DECIMAL(10, 2) NOT NULL,
    `pquantity` INT NOT NULL,
    `image` VARCHAR(255)
);

-- Table: Orders
CREATE TABLE IF NOT EXISTS `orders` (
    `order_id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT NOT NULL,
    `order_date` DATETIME NOT NULL,
    `status` ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`)
);

-- Table: Order Details
CREATE TABLE IF NOT EXISTS `order_details` (
    `order_detail_id` INT AUTO_INCREMENT PRIMARY KEY,
    `order_id` INT NOT NULL,
    `pid` VARCHAR(10) NOT NULL,
    `quantity` INT NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`),
    FOREIGN KEY (`pid`) REFERENCES `product`(`pid`)
);

-- Table: Cart
CREATE TABLE IF NOT EXISTS `cart` (
    `cart_id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT NOT NULL,
    `pid` VARCHAR(10) NOT NULL,
    `quantity` INT NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY (`pid`) REFERENCES `product`(`pid`)
);

-- Table: Payments
CREATE TABLE IF NOT EXISTS `payments` (
    `payment_id` INT AUTO_INCREMENT PRIMARY KEY,
    `order_id` INT NOT NULL,
    `payment_date` DATETIME NOT NULL,
    `amount` DECIMAL(10, 2) NOT NULL,
    `payment_method` VARCHAR(50) NOT NULL,
    FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`)
);

-- Table: User Demand
CREATE TABLE IF NOT EXISTS `user_demand` (
    `user_demand_id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT NOT NULL,
    `pid` VARCHAR(10) NOT NULL,
    `quantity` INT NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY (`pid`) REFERENCES `product`(`pid`)
);

-- Insert initial data into `users` table
INSERT INTO `users` (`first_name`, `last_name`, `birthdate`, `gender`, `address`, `zip_code`, `phone_number`, `email`, `password`)
VALUES 
('Guest', 'User', '2000-01-01', 'Prefer not to say', '64 Xavier Street, Greenhills, San Juan, Metro Manila 1500 Philippines', '123456', '99912345678', 'guest@gmail.com', 'guest'),
('Admin', 'User', '2000-01-01', 'Prefer not to say', 'East Avenue Corner Nia Road, Quezon City', '654321', '98745612301', 'admin@gmail.com', 'admin')
ON DUPLICATE KEY UPDATE
    first_name = VALUES(first_name),
    last_name = VALUES(last_name),
    birthdate = VALUES(birthdate),
    gender = VALUES(gender),
    address = VALUES(address),
    zip_code = VALUES(zip_code),
    phone_number = VALUES(phone_number),
    password = VALUES(password);

-- Insert initial data into `product` table
INSERT INTO `product` (`pid`, `pname`, `ptype`, `pinfo`, `pprice`, `pquantity`, `image`) VALUES 
('P1', 'Cotton T-Shirt', 'T-Shirt', 'Comfortable cotton t-shirt', 250.00, 100, NULL),
('P2', 'Graphic Print T-Shirt', 'T-Shirt', 'T-shirt with cool graphic print', 300.00, 80, NULL),
('P3', 'Polo Shirt', 'T-Shirt', 'Classic polo shirt', 350.00, 70, NULL),
('P4', 'Striped T-Shirt', 'T-Shirt', 'T-shirt with striped pattern', 280.00, 90, NULL),
('P5', 'V-Neck T-Shirt', 'T-Shirt', 'Casual v-neck t-shirt', 270.00, 85, NULL),
('P6', 'Long Sleeve T-Shirt', 'T-Shirt', 'Long sleeve t-shirt', 320.00, 75, NULL),
('P7', 'Sports T-Shirt', 'T-Shirt', 'Performance sports t-shirt', 380.00, 65, NULL),
('P8', 'Plain White T-Shirt', 'T-Shirt', 'Basic plain white t-shirt', 230.00, 110, NULL),
('P9', 'Printed T-Shirt', 'T-Shirt', 'T-shirt with printed design', 290.00, 95, NULL),
('P10', 'Jeans', 'Pants', 'Classic denim jeans', 600.00, 60, NULL),
('P11', 'Chinos', 'Pants', 'Stylish chino pants', 550.00, 70, NULL),
('P12', 'Cargo Pants', 'Pants', 'Cargo style pants', 480.00, 80, NULL),
('P13', 'Slim Fit Trousers', 'Pants', 'Slim fit trousers', 520.00, 75, NULL),
('P14', 'Jogger Pants', 'Pants', 'Comfortable jogger pants', 450.00, 90, NULL),
('P15', 'Track Pants', 'Pants', 'Sporty track pants', 420.00, 100, NULL),
('P16', 'Cropped Pants', 'Pants', 'Cropped style pants', 490.00, 85, NULL),
('P17', 'Corduroy Pants', 'Pants', 'Warm corduroy pants', 580.00, 65, NULL),
('P18', 'Formal Trousers', 'Pants', 'Formal trousers', 630.00, 55, NULL),
('P19', 'Stretch Pants', 'Pants', 'Stretchable pants', 510.00, 80, NULL),
('P20', 'Casual Dress', 'Dress', 'Casual summer dress', 700.00, 50, NULL),
('P21', 'Maxi Dress', 'Dress', 'Long maxi dress', 850.00, 40, NULL),
('P22', 'Party Dress', 'Dress', 'Party wear dress', 900.00, 35, NULL),
('P23', 'Midi Dress', 'Dress', 'Midi length dress', 780.00, 45, NULL),
('P24', 'Sundress', 'Dress', 'Light sundress', 670.00, 55, NULL),
('P25', 'Wrap Dress', 'Dress', 'Wrap style dress', 720.00, 48, NULL),
('P26', 'Bodycon Dress', 'Dress', 'Bodycon fit dress', 790.00, 42, NULL),
('P27', 'Floral Print Dress', 'Dress', 'Dress with floral print', 760.00, 47, NULL),
('P28', 'Shift Dress', 'Dress', 'Shift style dress', 740.00, 49, NULL),
('P29', 'Off Shoulder Dress', 'Dress', 'Off shoulder dress', 830.00, 38, NULL),
('P30', 'Leather Jacket', 'Jacket', 'Classic leather jacket', 1200.00, 30, NULL),
('P31', 'Denim Jacket', 'Jacket', 'Stylish denim jacket', 1100.00, 35, NULL),
('P32', 'Bomber Jacket', 'Jacket', 'Trendy bomber jacket', 1150.00, 32, NULL),
('P33', 'Windbreaker Jacket', 'Jacket', 'Windbreaker jacket', 1050.00, 38, NULL),
('P34', 'Parka', 'Jacket', 'Warm parka', 1250.00, 28, NULL),
('P35', 'Puffer Jacket', 'Jacket', 'Puffer style jacket', 1300.00, 25, NULL),
('P36', 'Blazer', 'Jacket', 'Formal blazer', 1180.00, 33, NULL),
('P37', 'Rain Jacket', 'Jacket', 'Waterproof rain jacket', 1080.00, 40, NULL),
('P38', 'Fleece Jacket', 'Jacket', 'Soft fleece jacket', 1120.00, 36, NULL),
('P39', 'Motorcycle Jacket', 'Jacket', 'Motorcycle style jacket', 1230.00, 31, NULL),
('P40', 'Sunglasses', 'Accessory', 'Stylish sunglasses', 300.00, 100, NULL),
('P41', 'Belt', 'Accessory', 'Leather belt', 250.00, 120, NULL),
('P42', 'Scarf', 'Accessory', 'Warm scarf', 280.00, 110, NULL),
('P43', 'Hat', 'Accessory', 'Fashionable hat', 270.00, 115, NULL),
('P44', 'Gloves', 'Accessory', 'Winter gloves', 260.00, 125, NULL),
('P45', 'Backpack', 'Accessory', 'Casual backpack', 350.00, 90, NULL),
('P46', 'Watch', 'Accessory', 'Classic wristwatch', 400.00, 80, NULL),
('P47', 'Earrings', 'Accessory', 'Stylish earrings', 320.00, 95, NULL),
('P48', 'Necklace', 'Accessory', 'Fashion necklace', 310.00, 98, NULL),
('P49', 'Bracelet', 'Accessory', 'Chic bracelet', 330.00, 93, NULL);

-- Insert initial data into `orders` table
INSERT INTO `orders` (`user_id`, `order_date`, `status`)
VALUES (1, '2023-06-19 10:00:00', 'Pending');

-- Insert initial data into `order_details` table
INSERT INTO `order_details` (`order_id`, `pid`, `quantity`, `price`) 
VALUES (1, 'P1', 1, 250.00);

-- Insert initial data into `cart` table
INSERT INTO `cart` (`user_id`, `pid`, `quantity`)
VALUES (1, 'P1', 2);

-- Insert initial data into `payments` table
INSERT INTO `payments` (`order_id`, `payment_date`, `amount`, `payment_method`)
VALUES (1, '2023-06-19 10:05:00', 250.00, 'Credit Card');

-- Insert initial data into `user_demand` table
INSERT INTO `user_demand` (`user_id`, `pid`, `quantity`)
VALUES (1, 'P1', 3);
