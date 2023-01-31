-- - Вывести всех клиентов из страны Canada
-- - Вывести все страны клиентов
-- - Вывести количество всех заказов
-- - Вывести максимальную стоимость заказа
-- - Найти сумму всех заказов
-- - Найти сумму всех заказов за 2014 год
-- - Найти среднюю стоимость всех заказов
-- - Найти среднюю стоимость всех заказов по каждому клиенту
-- - Найти всех клиентов, которые живут в Бразилии или Испании
-- - Найти все заказы между 2013ым и 2014ым годами, которые стоили меньше 100.00$

select * from orders;
select * from order_item;
select * from customer;
select * from product;
select * from supplier;

-- Tasks

select * from customer where country = 'Canada';

select country from customer group by country order by country;

select count(*) from orders;

select max(total_amount) from orders;

select sum(total_amount) from orders;

select sum(total_amount) from orders where order_date between '2014-01-01' and '2014-12-31';

select avg(total_amount) from orders;

select customer_id, avg(total_amount) from orders group by customer_id order by customer_id;

select * from customer where country in('Brazil', 'Spain') order by id;

select * from orders where order_date between '2013-01-01' and '2014-12-31' and total_amount < 100 order by total_amount;
