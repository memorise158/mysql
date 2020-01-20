-- задание3
-- условие

use lesson5;

DROP TABLE IF EXISTS `storehouses_products`;
  
CREATE TABLE storehouses_products(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  product_name VARCHAR(100) NOT NULL,
  product_count int NOT NULL
);

INSERT INTO `storehouses_products` (`id`, `product_name`, `product_count`) VALUES (1, 'notebooks', '1');
INSERT INTO `storehouses_products` (`id`, `product_name`, `product_count`) VALUES (2, 'SmartPhones', '0');
INSERT INTO `storehouses_products` (`id`, `product_name`, `product_count`) VALUES (3, 'Desktops', '2');
INSERT INTO `storehouses_products` (`id`, `product_name`, `product_count`) VALUES (4, 'Printers', '0');
INSERT INTO `storehouses_products` (`id`, `product_name`, `product_count`) VALUES (5, 'Scaners', '1');

-- решение
select * 
from storehouses_products 
order by if(product_count > 0,0,1), product_count ;
