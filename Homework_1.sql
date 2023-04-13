use homework_1; -- подключаемся к базе

-- задание №2
select manufacturer, product_name, price from mobile_phones
where product_count > 2;  

-- задание №3
select * from mobile_phones
where manufacturer = "Samsung";

-- задание №4.1
select * from mobile_phones
where manufacturer regexp "Samsung";

select * from mobile_phones
where manufacturer like "%Samsung%";

-- задание №4.2
select * from mobile_phones
where product_name regexp "Iphone";

select * from mobile_phones
where product_name like "%Iphone%";

-- задание №4.4
select * from mobile_phones
where product_name like "%8%";

select * from mobile_phones
where product_name REGEXP '[0-9]';
