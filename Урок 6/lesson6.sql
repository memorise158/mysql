-- задание 1
-- в запросах возможно использовать более простую интеграцию между таблицами: таблица.столбец

-- задание 2
-- допустим id нашего пользователя 54

	
select concat (first_name, " ", last_name) as FIO
	from users where id = (
	select DISTINCT  m.from_user_id
	from messages as m, friendship as f
		where f.user_id = m.to_user_id and f.friend_id = m.from_user_id 
		and f.user_id = 54 and f.status_id =
		(select id from friendship_statuses where name = "Confirmed")
		group by m.from_user_id 
		order by count(m.from_user_id) desc limit 1)
	;

-- задание 3

select sum(q) as summa from (select count(target_id) as q
	from likes
	where target_id in
		(select user_id
			from (select * from profiles
			order by timestampdiff(Year,profiles.birthday, now())  limit 10
			) as viborka)
	group by target_id) as totalcount;


-- задание 4
select profiles.sex,count(*) from profiles, likes
	where likes.user_id = profiles.user_id
	group by sex;
	
-- задание 5

-- под активностью пользователя понимаю все его действия в сети
select u,sum(q) as summa from(
		select user_id as u, count(*) as q from communities_users  -- находим активность пользователя в группах
		group by user_id
	union all
		select user_id as u, count(*) as q from friendship -- находим все запросы дружбы от пользователя 
		group by user_id
	union	all
		select friend_id as u, count(*) as q  from friendship -- находим все принятые и отклоненные пользователем запросы дружбы
			where status_id = 3 or status_id = 2
			group by friend_id
	union	all
		select user_id as u, count(*) as q from likes -- находим все лайки проставленный пользователем
		group by user_id
	union	all
		select user_id as u, count(*) as q  from media -- находим все загруженные пользователем медиафайлы
		group by user_id
	union	all
		select user_id as u, count(*) as q  from meetings_users -- находим активность пользователя в встречах
		group by user_id
	union	all
		select from_user_id as u, count(*) as q  from messages -- находим все отправленные пользователем сообщения
		group by from_user_id
	union	all
		select to_user_id as u, count(*) as q  from messages -- находим все принятые пользователем сообщения
			where is_delivered = 1
			group by to_user_id
	union all
		select user_id as u, count(*) as q from posts  -- находим все посты от пользователя, при этом в целях исключения дублирования исключаем те посты, где были загружены медиафайлы, т.к. они были учтены ранее
			where media_id not in(select id from media)
			group by user_id
	union all
		select user_id as u, count(*) as q from profiles -- находим все регистрации пользователя - первая активность пользователя
			group by user_id) as fs
		group by u
	order by summa limit 10;








