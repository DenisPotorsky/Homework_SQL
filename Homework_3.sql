use lesson_3;

-- Создаем таблицу salespeople
drop table if exists salespeople;
create table salespeople (
	snum int,
	sname varchar(45),
	city varchar(45)
);

-- Создаем таблицу customers
drop table if exists customers;
create table customers (
  cnum int,
  cname varchar(45),
  city varchar(45),
  rating int,
  snum int
  );

-- Создаем таблицу orders
drop table if exists orders;
create table orders (
  onum int,
  amt float,
  odate date not null,
  cnum int not null,
  snum int not null
);

-- Заполняем таблицу salespeople
insert into salespeople(snum, sname, city)
values
(1001, 'Peel', 'London'),
(1002, 'Serres', 'San Jose'),    
(1004, 'Motika', 'London'),
(1007, 'Rifkin', 'Barcelona');

-- Заполняем таблицу customers
insert into customers(cnum, cname, city, rating, snum)
values
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'San Jose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2007, 'Pereira', 'Rome', 100, 1004); 

-- Заполняем таблицу orders
insert into orders(onum, amt, odate, cnum, snum)
values
(3001, 18.69, '1990-10-03', 2008, 007),
(3003, 767.19, '1990-10-03', 001, 001),
(3002, 1900.10, '1990-10-03', 2007, 1004),
(3005, 5160.45, '1990-10-03', 2003, 1002),
(3006, 1098.16, '1990-10-03', 2008, 1007),
(3009, 1713.23, '1990-10-04', 2002, 1003),
(3007, 75.7, '1990-10-04', 2004, 1002),
(3008, 4723.00, '1990-10-05', 2006, 1001),
(3010, 1309.95, '1990-10-06', 2004, 1002),
(3011, 9891.88, '1990-10-06', 2006, 1001);


-- Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum. 
select city, sname, snum from salespeople;

select city, cname, cnum from customers;

-- Напишите команду SELECT, которая вывела бы оценку(rating),
-- сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
select cname, rating from customers where city = 'San Jose';

-- Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. 
-- (уникальные значения в  “snum“ “Продавцы”)
select distinct snum from salespeople;

-- Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”) 
select * from customers where cname like '%G%';

-- Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)
select * from orders where amt > 1000;

-- Напишите запрос который выбрал бы наименьшую сумму заказа.
-- (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
select min(amt) from orders;

-- Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, 
-- у которых рейтинг больше 100 и они находятся не в Риме.
select * from customers 
where rating > 100 and city != 'Rome';


-- Персонал
DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	firstname VARCHAR(45),
	lastname VARCHAR(45),
	post VARCHAR(100),
	seniority INT, 
	salary INT, 
	age INT
);

-- Наполнение данными
INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 19),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);


-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания

select * from staff order by salary asc;
select * from staff;
  
--  Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)

select * from staff limit 5;

-- Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
SELECT 
	CASE post
			WHEN 'Начальник' THEN 'Начальник'
			WHEN 'Инженер' THEN 'Инженер'
			WHEN 'Рабочий' THEN 'Рабочий'
            WHEN 'Уборщик' THEN 'Уборщик'
			ELSE 'Не определено'
	END AS post,
    sum(salary)
FROM staff
GROUP BY post
having sum(salary) > 100000;








  
  