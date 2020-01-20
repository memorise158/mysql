-- задание 1
-- условие
use lesson5;

DROP TABLE IF EXISTS `users`;
  
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  phone VARCHAR(120) NOT NULL UNIQUE,
  created_at DATETIME,
  updated_at DATETIME
);

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`) VALUES (1, 'Graciela', 'Rau', 'mckenna52@example.org', '821.795.8451');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`) VALUES (2, 'Alessandro', 'Upton', 'delfina.ruecker@example.org', '1-940-588-9866x262');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`) VALUES (3, 'Miller', 'Kuhic', 'russel.jose@example.org', '128.850.2407x98781');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`) VALUES (4, 'Levi', 'Turcotte', 'zelda58@example.net', '(484)023-1513');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`) VALUES (5, 'Roberta', 'Schroeder', 'gerald39@example.net', '08443475225');

-- решение≈

select * from users;
update users  set 
	created_at = now(),
	updated_at = now();
	
