use lesson_4;
DROP TABLE IF EXISTS cars;
CREATE TABLE cars (
id serial,
name varchar(20) not null,
cost int not null);

insert into cars(name, cost)
values
('Audi', 52642), ('Mercedes', 57127), ('Skoda', 9000), ('Volvo', 29000), ('Bentley', 350000), ('Citroen', 21000),
('Hummer', 41400),
('Volkswagen', 21600);

-- Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларовa
CREATE VIEW cars1 
AS
Select * from cars where cost < 25000;

-- Измените в существующем представлении порог для стоимости: пусть цена будет до 30000 долларов
alter view cars1
as select * from cars where  cost < 30000;

-- Создайте представление, в котором будут только автомобили марки "Шкода" и "Ауди"
CREATE VIEW cars2 
AS
Select * from cars where name in('Skoda', 'Audi');

create table analysis (
an_id serial primary key,
an_name varchar(50),
an_cost int,
an_price int,
an_group varchar(50));

create table groupss(
gr_id serial,
gr_name varchar(50),
gr_temp int
);
 create table orders(
 ord_id serial primary key,
 ord_datetime datetime,
 ord_an bigint unsigned,
 foreign key (ord_an) references analysis(an_id) on update cascade on delete set null
 );

insert into analysis(an_name, an_cost, an_price, an_group)
values
('Анализ крови', 500, 700, 'Медицинские анализы'),
('H1N1', 400, 550, 'Медицинские анализы'),
('COVID-19', 700, 900, 'Медицинские анализы'),
('МРТ', 1000, 2200, 'Медицинские анализы'),
('Биохимческий анализ крови', 700, 1200, 'Медицинские анализы');

insert into groupss(gr_name, gr_temp)
values ('Биохимический', 2), ('Цитологический', 2), ('Общеклинический', 3);

insert into orders(ord_datetime, ord_an)
values 
('2020-01-02 22:11:00', 1), ('2019-03-21 14:12:12', 2), ('2020-02-07 13:44:23', 3), ('2021-08-01 08:34:24', 4), ('2020-02-09 10:12:24', 5);

select an_name, an_price from analysis a
join orders o on a.an_id = o.ord_an and ord_datetime between '2020-02-05 00:00:00' and '2020-02-12 00:00:00';

create table rzd(
train_id int not null,
station varchar(30),
station_time time);

insert into rzd(train_id, station, station_time)
values
(110, 'San Francisco', '10:00:00'),
(110, 'Redwood City', '10:54:00'),
(110, 'Palo Alto', '11:02:00'),
(110, 'San Jose', '12:35:00'),
(120, 'San Francisco', '11:00:00'),
(120, 'Palo Alto', '12:49:00'),
(120, 'San Jose', '13:30:00');

-- Добавьте новый столбец под названием «время до следующей станции». 
-- Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. 
SELECT *,
       timediff(lead (station_time, 1) 
       over (partition by (train_id) order by train_id), station_time) as time_to_next_station
  FROM rzd;
