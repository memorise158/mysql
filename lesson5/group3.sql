-- задание3
-- условие

use lesson5;

DROP TABLE IF EXISTS `users`;
  
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  value int NOT NULL
  
);

INSERT INTO `users` (`id`, `value`) VALUES (1, 1);
INSERT INTO `users` (`id`, `value`) VALUES (2, 2);
INSERT INTO `users` (`id`, `value`) VALUES (3, 3);
INSERT INTO `users` (`id`, `value`) VALUES (4, 4);
INSERT INTO `users` (`id`, `value`) VALUES (5, 5);

-- решение
select exp(sum(log(value))) as 'произведение' from users;

