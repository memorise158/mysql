use vk;

create table likes (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	like_type_id INT UNSIGNED NOT NULL,
	from_user_id INT UNSIGNED NOT NULL,
	to_object_id INT UNSIGNED NOT NULL,
	like_status_id BOOLEAN
	);

create table like_types(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	object_Name VARCHAR(255) NOT NULL
	);

