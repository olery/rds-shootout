DROP TABLE IF EXISTS `review_comments`;

CREATE TABLE `review_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `review_ratings`;

CREATE TABLE `review_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) DEFAULT NULL,
  `rating_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `review_ratings_review_id_index` (`review_id`),
  KEY `review_ratings_rating_id_index` (`rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `hotel_id` int(11) NOT NULL,
  `connection_id` int(11) NOT NULL,
  `review_id` varchar(255) NOT NULL,
  `review_date` date DEFAULT NULL,
  `reviewer_name` varchar(255) DEFAULT NULL,
  `reviewer_location` varchar(255) DEFAULT NULL,
  `reviewer_contributions` int(11) DEFAULT NULL,
  `reviewer_travel_style` varchar(255) DEFAULT NULL,
  `reviewer_age` varchar(255) DEFAULT NULL,
  `reviewer_gender` varchar(255) DEFAULT NULL,
  `sentiment` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_review_id_index` (`review_id`),
  KEY `reviews_hotel_id_index` (`hotel_id`),
  KEY `reviews_connection_id_index` (`connection_id`),
  KEY `reviews_review_date_index` (`review_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `sequel_migrations`;

CREATE TABLE `sequel_migrations` (
  `version` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
