
use homework_1;

-- Создаем таблицу sales
drop table if exists sales;
create table sales (
  id serial primary key,
  order_date date not null,
  count_product int not null
  );
  
  -- Заполняем таблицу sales данными
  insert into sales (order_date, count_product)
  values
  ('2022-01-01', 154),
  ('2022-01-02', 180),
  ('2022-01-03', 21),
  ('2022-01-04', 124),
  ('2022-01-05', 341);
  
-- группируем значения
select 
id as 'id заказа',
if(count_product < 100, 'Маленький заказ',
if(count_product between 100 and 300, 'Средний заказ',
if(count_product > 300, 'Большой заказ', 'Не определено')
)
) as 'Тип заказа'
from sales;


-- создаем таблицу orders
drop table if exists orders;
create table orders (
  id serial primary key,
  employee_id varchar(20) not null,
  amount float not null,
  order_status text not null
  );
  
  
  -- заполняем таблицу данными 
  insert into orders (employee_id, amount, order_status)
  values
  ('e03', 15.00, 'OPEN'),
  ('e01', 25.50, 'OPEN'),
  ('e05', 100.70, 'CLOSED'),
  ('e02', 22.18, 'OPEN'),
  ('e04', 9.50, 'CANCELLED');


-- делаем выборку 
select 
id as 'id заказа',
employee_id as 'employee_id', 
amount as 'amount',
case order_status
when 'OPEN' then 'Order is in open state'
when 'CLOSED' then 'Order is closed' 
when 'CANCELLED' then 'Order is cancelled'
else 'Не определено'
end as 'full_order_status'
from orders;



  





