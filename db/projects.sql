CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `title` varchar(255),
  `description` text,
  `repo_url` varchar(255),
  `website` varchar(255),
  `image_path` varchar(255),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
