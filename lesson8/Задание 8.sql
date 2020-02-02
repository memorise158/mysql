
-- задание 2
-- допустим id нашего пользователя 54
-- решаем через join
use vk;
	


select concat (first_name, " ", last_name) as FIO from
		(select from_user_id as fuid from messages as m
		join friendship as f
		on m.from_user_id = f.friend_id
		join users as u
		on f.user_id = u.id and u.id = 54
		join friendship_statuses as fs 
		ON f.status_id = fs.id and fs.name = "Confirmed"
	union all
		select to_user_id as fuid from messages as m
		join friendship as f
		on m.to_user_id = f.friend_id
		join users as u
		on f.user_id = u.id and u.id = 54
		join friendship_statuses as fs 
		ON f.status_id = fs.id and fs.name = "Confirmed") as viborka
join users as u1
on u1.id = viborka.fuid
group by FIO
order by count(*) desc limit 1
;
-- задание 3

select sum(viborka.q) as suuma from
	(select p.user_id, count(*) as q from profiles as p 
	join likes as l
	on l.target_id = p.user_id
	join target_types as tt
	on tt.id = l.target_type_id and tt.name = 'users'
	group by p.user_id 
	order by timestampdiff(Year,p.birthday, now()) limit 10) as viborka
	;


-- задание 4
select p.sex,count(*) from profiles as p
join likes as l
on l.user_id = p.user_id
group by sex;
	
-- задание 5
-- к сожалению не знаю как данный запрос можно переделать под join( 
-- запрос оставил таким же как и для урока 6

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








