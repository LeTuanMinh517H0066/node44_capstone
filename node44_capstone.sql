-- -------------------------------------------------------------
-- TablePlus 6.1.8(574)
--
-- https://tableplus.com/
--
-- Database: node44_capstone
-- Generation Time: 2024-11-14 09:26:42.9730
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `image_id` int DEFAULT NULL,
  `comment` text,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` text,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `saved_images`;
CREATE TABLE `saved_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `image_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `saved_images_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `saved_images_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` text,
  `age` int DEFAULT NULL,
  `avatar` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refreshToken` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `comments` (`id`, `user_id`, `image_id`, `comment`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'This is an amazing image!', '2024-11-01', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(2, 2, 1, 'I love the colors in this one.', '2024-11-02', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(3, 3, 2, 'Great shot! Looks beautiful.', '2024-11-01', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(4, 4, 2, 'Really captures the moment.', '2024-11-03', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(5, 5, 3, 'Stunning view!', '2024-11-04', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(6, 1, 3, 'This reminds me of my vacation.', '2024-11-01', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(7, 2, 4, 'Breathtaking!', '2024-11-05', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(8, 3, 4, 'A masterpiece!', '2024-11-06', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(9, 4, 5, 'Incredible detail!', '2024-11-07', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(10, 5, 5, 'Absolutely love this!', '2024-11-08', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(11, 1, 6, 'This is so creative!', '2024-11-09', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(12, 2, 6, 'Fantastic work!', '2024-11-10', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(13, 3, 7, 'Very inspiring.', '2024-11-11', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(14, 4, 7, 'So much emotion in this!', '2024-11-12', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(15, 5, 8, 'This tells a great story.', '2024-11-13', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(16, 1, 8, 'Love the perspective.', '2024-11-14', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(17, 2, 9, 'Such a lovely capture!', '2024-11-15', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(18, 3, 9, 'You have a great eye for photography.', '2024-11-16', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(19, 4, 10, 'I could look at this all day!', '2024-11-17', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(20, 5, 10, 'This really speaks to me.', '2024-11-18', '2024-11-02 17:07:10', '2024-11-02 17:07:10'),
(21, 21, 5, 'haha', NULL, NULL, NULL);

INSERT INTO `images` (`id`, `name`, `url`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Sunset', 'https://example.com/images/sunset.jpg', 'A beautiful sunset over the mountains.', 1, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(2, 'Beach', 'https://example.com/images/beach.jpg', 'A serene beach with crystal clear waters.', 2, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(3, 'Forest', 'https://example.com/images/forest.jpg', 'A lush green forest in spring.', 3, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(4, 'City Skyline', 'https://example.com/images/city_skyline.jpg', 'A bustling city skyline at night.', 4, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(5, 'Desert', 'https://example.com/images/desert.jpg', 'Golden sands of the desert during sunset.', 5, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(6, 'Mountain', 'https://example.com/images/mountain.jpg', 'A majestic mountain range in winter.', 6, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(7, 'River', 'https://example.com/images/river.jpg', 'A tranquil river flowing through the valley.', 7, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(8, 'Starry Night', 'https://example.com/images/starry_night.jpg', 'A night sky filled with stars.', 8, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(9, 'Flower Field', 'https://example.com/images/flower_field.jpg', 'Vibrant flowers blooming in a field.', 9, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(10, 'Canyon', 'https://example.com/images/canyon.jpg', 'A breathtaking view of a canyon.', 10, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(11, 'Rainforest', 'https://example.com/images/rainforest.jpg', 'A dense rainforest with exotic plants.', 11, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(12, 'Waterfall', 'https://example.com/images/waterfall.jpg', 'A stunning waterfall surrounded by greenery.', 12, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(13, 'Snowy Landscape', 'https://example.com/images/snowy_landscape.jpg', 'A peaceful snowy landscape in winter.', 13, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(14, 'Lighthouse', 'https://example.com/images/lighthouse.jpg', 'A classic lighthouse by the sea.', 14, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(15, 'Autumn Leaves', 'https://example.com/images/autumn_leaves.jpg', 'Beautiful autumn leaves falling from trees.', 15, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(16, 'Night Market', 'https://example.com/images/night_market.jpg', 'A vibrant night market filled with lights.', 16, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(17, 'Hot Air Balloons', 'https://example.com/images/hot_air_balloons.jpg', 'Colorful hot air balloons in the sky.', 17, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(18, 'Wildlife', 'https://example.com/images/wildlife.jpg', 'Exotic wildlife in their natural habitat.', 18, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(19, 'Underwater', 'https://example.com/images/underwater.jpg', 'A captivating underwater scene with fish.', 19, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(20, 'Skydiving', 'https://example.com/images/skydiving.jpg', 'A thrilling view from a skydive.', 20, '2024-11-02 17:01:59', '2024-11-02 17:01:59'),
(21, NULL, '/public/imgs/1731339009940_csxd0sbqu55a1.png', NULL, 21, NULL, NULL),
(22, NULL, '/public/imgs/1731339191757_csxd0sbqu55a1.png', NULL, 21, NULL, NULL),
(23, 'hinh 2', '/public/imgs/1731339242079_csxd0sbqu55a1.png', 'content hinh 2', 21, NULL, NULL);

INSERT INTO `saved_images` (`id`, `user_id`, `image_id`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-11-01', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(2, 2, 1, '2024-11-02', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(3, 1, 2, '2024-11-03', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(4, 3, 2, '2024-11-04', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(5, 4, 3, '2024-11-05', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(6, 2, 3, '2024-11-06', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(7, 5, 4, '2024-11-07', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(8, 1, 4, '2024-11-08', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(9, 3, 5, '2024-11-09', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(10, 4, 5, '2024-11-10', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(11, 5, 6, '2024-11-11', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(12, 2, 6, '2024-11-12', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(13, 1, 7, '2024-11-13', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(14, 3, 7, '2024-11-14', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(15, 4, 8, '2024-11-15', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(16, 5, 8, '2024-11-16', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(17, 1, 9, '2024-11-17', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(18, 2, 9, '2024-11-18', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(19, 3, 10, '2024-11-19', '2024-11-02 17:20:22', '2024-11-02 17:20:22'),
(20, 4, 10, '2024-11-20', '2024-11-02 17:20:22', '2024-11-02 17:20:22');

INSERT INTO `users` (`id`, `name`, `email`, `password`, `age`, `avatar`, `created_at`, `updated_at`, `refreshToken`) VALUES
(1, 'Alice Smith', 'alice@example.com', 'password123', 28, 'avatar1.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token1'),
(2, 'Bob Johnson', 'bob@example.com', 'password123', 35, 'avatar2.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token2'),
(3, 'Charlie Brown', 'charlie@example.com', 'password123', 22, 'avatar3.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token3'),
(4, 'Diana Prince', 'diana@example.com', 'password123', 30, 'avatar4.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token4'),
(5, 'Ethan Hunt', 'ethan@example.com', 'password123', 33, 'avatar5.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token5'),
(6, 'Fiona Gallagher', 'fiona@example.com', 'password123', 26, 'avatar6.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token6'),
(7, 'George Lucas', 'george@example.com', 'password123', 42, 'avatar7.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token7'),
(8, 'Hannah Montana', 'hannah@example.com', 'password123', 29, 'avatar8.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token8'),
(9, 'Ian Malcolm', 'ian@example.com', 'password123', 45, 'avatar9.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token9'),
(10, 'Jasmine Chiswell', 'jasmine@example.com', 'password123', 24, 'avatar10.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token10'),
(11, 'Kyle Broflovski', 'kyle@example.com', 'password123', 20, 'avatar11.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token11'),
(12, 'Laura Croft', 'laura@example.com', 'password123', 31, 'avatar12.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token12'),
(13, 'Mike Wazowski', 'mike@example.com', 'password123', 38, 'avatar13.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token13'),
(14, 'Nina Simone', 'nina@example.com', 'password123', 27, 'avatar14.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token14'),
(15, 'Oliver Twist', 'oliver@example.com', 'password123', 19, 'avatar15.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token15'),
(16, 'Paula Patton', 'paula@example.com', 'password123', 34, 'avatar16.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token16'),
(17, 'Quentin Tarantino', 'quentin@example.com', 'password123', 50, 'avatar17.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token17'),
(18, 'Rita Hayworth', 'rita@example.com', 'password123', 36, 'avatar18.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token18'),
(19, 'Steve Jobs', 'steve@example.com', 'password123', 45, 'avatar19.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token19'),
(20, 'Tina Fey', 'tina@example.com', 'password123', 53, 'avatar20.png', '2024-11-02 17:01:51', '2024-11-02 17:01:51', 'token20'),
(21, 'Le Tuan Minh', '2018minh@gmail.com', '$2b$10$vICCXJFRIEus1csVA6heMereCPQtDzczMy0N45Bye51yt832K9lsK', 12, '/public/imgs/1731341024695_csxd0sbqu55a1.png', '2024-11-08 15:52:15', '2024-11-08 15:52:15', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7fSwiaWF0IjoxNzMxNTUwNDU3LCJleHAiOjE3MzIxNTUyNTd9.ke5Mo_bZzA0rttY4dnmwIQrgbWMzYm5HCkolkAw6e68');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;