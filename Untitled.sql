CREATE TABLE `category` (
  `category_id` tinyint PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `film_category` (
  `film_id` smallint,
  `category_id` tinyint,
  PRIMARY KEY (`film_id`, `category_id`)
);

CREATE TABLE `language` (
  `language_id` tinyint PRIMARY KEY,
  `name` char
);

CREATE TABLE `film_actor` (
  `actor_id` smallint,
  `film_id` smallint,
  PRIMARY KEY (`actor_id`, `film_id`)
);

CREATE TABLE `actor` (
  `actor_id` smallint PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255)
);

CREATE TABLE `film` (
  `film_id` smallint PRIMARY KEY,
  `Title` varchar(255),
  `release_year` year,
  `language_id` tinyint,
  `original_language_id` tinyint
);

CREATE TABLE `film_text` (
  `film_id` smallint PRIMARY KEY
);

CREATE TABLE `inventory` (
  `inventory_id` mediumint PRIMARY KEY,
  `film_id` smallint,
  `store_id` tinyint
);

CREATE TABLE `rental` (
  `rental_id` int PRIMARY KEY,
  `rental_date` datetime,
  `inventory_id` mediumint,
  `customer_id` smallint,
  `staff_id` tinyint
);

CREATE TABLE `payment` (
  `payment_id` smallint PRIMARY KEY,
  `customer_id` smallint,
  `staff_id` tinyint,
  `rental_id` int
);

CREATE TABLE `staff` (
  `staff_id` tinyint PRIMARY KEY,
  `address_id` smallint,
  `store_id` tinyint
);

CREATE TABLE `store` (
  `store_id` tinyint PRIMARY KEY,
  `manager_staff_id` tinyint,
  `address_id` smallint
);

CREATE TABLE `customer` (
  `customer_id` smallint PRIMARY KEY,
  `store_id` tinyint,
  `address_id` smallint
);

CREATE TABLE `address` (
  `address_id` smallint PRIMARY KEY,
  `address` varchar(255),
  `city_id` smallint
);

CREATE TABLE `city` (
  `city_id` smallint PRIMARY KEY,
  `city` varchar(255),
  `country_id` smallint
);

CREATE TABLE `country` (
  `country_id` smallint PRIMARY KEY,
  `country` varchar(255)
);

ALTER TABLE `film_category` ADD FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

ALTER TABLE `film_category` ADD FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`);

ALTER TABLE `film` ADD FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`);

ALTER TABLE `film_actor` ADD FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`);

ALTER TABLE `film_actor` ADD FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`);

ALTER TABLE `film_text` ADD FOREIGN KEY (`film_id`) REFERENCES `inventory` (`film_id`);

ALTER TABLE `rental` ADD FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`);

ALTER TABLE `rental` ADD FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

ALTER TABLE `rental` ADD FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`rental_id`) REFERENCES `rental` (`rental_id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

ALTER TABLE `staff` ADD FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`);

ALTER TABLE `staff` ADD FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);

ALTER TABLE `inventory` ADD FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`);

ALTER TABLE `inventory` ADD FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`);

ALTER TABLE `store` ADD FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);

ALTER TABLE `city` ADD FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

ALTER TABLE `address` ADD FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);

ALTER TABLE `customer` ADD FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);
