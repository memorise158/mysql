-- задание1
-- условие

use lesson5;

DROP TABLE IF EXISTS `users`;
  
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  phone VARCHAR(120) NOT NULL UNIQUE,
  birthday datetime NOT NULL,
  created_at datetime DEFAULT current_timestamp(),
  updated_at datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`,`birthday`, `created_at`, `updated_at`) VALUES (1, 'Graciela', 'Rau', 'mckenna52@example.org', '821.795.8451', '1996-04-11 16:14:40', '2006-07-11 16:14:40', '1993-02-02 14:13:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `birthday`,`created_at`, `updated_at`) VALUES (2, 'Alessandro', 'Upton', 'delfina.ruecker@example.org', '1-940-588-9866x262', '1984-05-27 10:36:32', '1994-05-27 10:36:32', '1979-11-05 04:21:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `birthday`,`created_at`, `updated_at`) VALUES (3, 'Miller', 'Kuhic', 'russel.jose@example.org', '128.850.2407x98781','1981-08-11 04:50:37', '1986-10-11 04:50:37', '1977-03-04 19:33:23');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`,`birthday`, `created_at`, `updated_at`) VALUES (4, 'Levi', 'Turcotte', 'zelda58@example.net', '(484)023-1513','1968-05-29 10:33:58', '1978-06-29 10:33:58', '2012-08-30 06:34:10');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `birthday`,`created_at`, `updated_at`) VALUES (5, 'Roberta', 'Schroeder', 'gerald39@example.net', '08443475225', '2001-06-06 09:44:52', '2019-10-06 09:44:52', '2002-02-11 00:12:46');


-- решение

select avg(timestampdiff(Year,birthday, now())) as 'Средний возраст' from users;
