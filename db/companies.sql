REATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255),
  `year_begin` int(11) NOT NULL DEFAULT '0',
  `year_end` int(11) NOT NULL DEFAULT '0',
  `short_desc` text,
  `long_desc` text,
  `url` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
