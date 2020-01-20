-- задание2
-- условие

use lesson5;

DROP TABLE IF EXISTS `users`;
  
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  phone VARCHAR(120) NOT NULL UNIQUE,
  created_at VARCHAR(120),
  updated_at VARCHAR(120)
);

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (1, 'Graciela', 'Rau', 'mckenna52@example.org', '821.795.8451', '2006-07-11 16:14:40', '1993-02-02 14:13:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (2, 'Alessandro', 'Upton', 'delfina.ruecker@example.org', '1-940-588-9866x262', '1994-05-27 10:36:32', '1979-11-05 04:21:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (3, 'Miller', 'Kuhic', 'russel.jose@example.org', '128.850.2407x98781', '1986-10-11 04:50:37', '1977-03-04 19:33:23');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (4, 'Levi', 'Turcotte', 'zelda58@example.net', '(484)023-1513', '1978-06-29 10:33:58', '2012-08-30 06:34:10');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (5, 'Roberta', 'Schroeder', 'gerald39@example.net', '08443475225', '2019-10-06 09:44:52', '2002-02-11 00:12:46');

-- решение

desc users;
alter table users modify column created_at datetime not null;
alter table users modify column updated_at datetime not null;

select * from users;
desc users;

