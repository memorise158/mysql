use vk;

update posts set media_id = floor(1 + (rand() * 50));


ALTER TABLE profiles MODIFY COLUMN photo_id INT(10) UNSIGNED;
ALTER TABLE posts MODIFY COLUMN media_id INT(10) UNSIGNED;
ALTER TABLE messages MODIFY COLUMN from_user_id INT(10) UNSIGNED;
ALTER TABLE messages MODIFY COLUMN to_user_id INT(10) UNSIGNED;
ALTER TABLE communities MODIFY COLUMN photo_id INT(10) UNSIGNED;

ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE cascade,
  ADD CONSTRAINT profiles_photo_id_fk
    FOREIGN KEY (photo_id) REFERENCES media(id)
    ON DELETE SET NULL; -- при удалении фото из медиа указываем пустое значение

ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE cascade, -- при удалении юзера удаляем его и в сообществе
  ADD CONSTRAINT communities_users_communities_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id)
    ON DELETE Cascade; -- при удалении сообщества удаляем все данные об участниках   

ALTER TABLE friendship
  ADD CONSTRAINT friendship_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE cascade, -- при удалении пользователя удаляем дружбу
  ADD CONSTRAINT friendship_friend_id_fk 
    FOREIGN KEY (friend_id) REFERENCES users(id)
    ON DELETE cascade, -- при удалении пользователя удаляем дружбу
   ADD CONSTRAINT friendship_statuses_status_id_fk 
    FOREIGN KEY (status_id) REFERENCES friendship_statuses(id)
    ON DELETE No Action;   -- при удалении статуса дружбы, то ничего не изменяем

ALTER TABLE likes
  ADD CONSTRAINT likes_user_id_fk     
  FOREIGN KEY (user_id) REFERENCES users(id)
  ON DELETE cascade, -- при удалении пользователя удаляем лайк
  ADD CONSTRAINT likes_target_type_id_fk     
  FOREIGN KEY (target_type_id) REFERENCES target_types(id)
  ON DELETE no action; -- при удалении типа лайка, не меняем информацию в бд. Оставляем для истории
  
 Alter table media
 	ADD CONSTRAINT media_user_id_fk
 	FOREIGN KEY (user_id) REFERENCES users(id) 
 	ON DELETE cascade, -- при удалении юзера удаляем и медиафайл
 	ADD CONSTRAINT media_types_id_fk
 	FOREIGN KEY (media_type_id) REFERENCES media_types(id) 
 	ON DELETE no action; -- при удалении типа медиафайла оставляем остальные медиафайлы для истории
 	
 Alter table posts
 	ADD CONSTRAINT posts_user_id_fk
 	FOREIGN KEY (user_id) REFERENCES users(id) 
 	ON DELETE cascade, -- при удалении юзера удаляем и его пост
 	ADD CONSTRAINT posts_media_id_fk
 	FOREIGN KEY (media_id) REFERENCES media(id) -- при удалении медиафайла ставим null в посте
 	ON DELETE set Null; 

 Alter table messages
 	ADD CONSTRAINT messages_from_user_id_fk
 	FOREIGN KEY (from_user_id) REFERENCES users(id) 
 	ON DELETE set null, -- при удалении юзера оставляем его сообщение в переписке
 	ADD CONSTRAINT messages_to_user_id_fk
 	FOREIGN KEY (to_user_id) REFERENCES users(id) -- при удалении медиафайла ставим null в посте
 	ON DELETE set Null;   

 
  Alter table meetings_users
 	ADD CONSTRAINT meetings_users_user_id_fk
 	FOREIGN KEY (user_id) REFERENCES users(id) 
 	ON DELETE no action, -- при удалении юзера со встречей ничего не происходит
  	ADD CONSTRAINT meetings_users_meeting_id_fk
 	FOREIGN KEY (meeting_id) REFERENCES meetings(id) 
 	ON DELETE cascade; -- при удалении встречи удаляем и взаимосвязи

  Alter table communities
 	ADD CONSTRAINT communities_photo_id_fk
 	FOREIGN KEY (photo_id) REFERENCES media(id) 
 	ON DELETE set null;
    