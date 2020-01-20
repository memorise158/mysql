-- задача 5
-- условие
use lesson5;

DROP TABLE IF EXISTS `catalogs`;


CREATE TABLE `catalogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
);

INSERT INTO `catalogs` (`id`, `name`) VALUES (4, ' game');
INSERT INTO `catalogs` (`id`, `name`) VALUES (3, ' music');
INSERT INTO `catalogs` (`id`, `name`) VALUES (1, ' video');
INSERT INTO `catalogs` (`id`, `name`) VALUES (2, 'photo');
INSERT INTO `catalogs` (`id`, `name`) VALUES (5, 'flash');

-- решение

select * from catalogs;

SELECT * FROM catalogs 
	WHERE id IN (5, 1, 2) 
	order by CASE
				when id = 5 THEN 1
				when id = 1 THEN 2
				when id = 2 then 3
				end
				;