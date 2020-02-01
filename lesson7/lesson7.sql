use lesson7;
-- Задача 1
select name from users where id in (
select user_id from orders as o join orders_products as op
on o.id = op.order_id);

-- Задача 2
select p.name, c.name from products as p
join  catalogs as c
on p.catalog_id = c.id;

-- Задача 3

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  from_name VARCHAR(255),
  to_name VARCHAR(255)
);

INSERT INTO flights (from_name, to_name) VALUES
  ('moscow', 'omsk'),
  ('novgorod', 'kazan'),
  ('irkutsk', 'moscow'),
  ('omsk', 'irkutsk'),
  ('moscow', 'kazan');
  
DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  label VARCHAR(255) PRIMARY KEY,
  name VARCHAR(255)
);

INSERT INTO cities VALUES
  ('moscow', 'Москва'),
  ('irkutsk', 'Иркутск'),
  ('novgorod', 'Новгород'),
  ('kazan', 'Казань'),
  ('omsk', 'Омск');
 

select f.id, c1.name,c2.name 
from flights as f
join cities as c1
on f.from_name = c1.label
join cities as c2
on f.to_name = c2.label;
