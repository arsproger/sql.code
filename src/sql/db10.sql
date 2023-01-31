select * from orders;
select * from order_item;
select * from customer;
select * from product;
select * from supplier;

-------------
-- Tasks 1 --
-------------

-- Вывести всех клиентов из страны Canada
select * from customer where country = 'Canada';

-- Вывести все страны клиентов
select country from customer group by country;

-- Вывести количество всех заказов
select count(*) from orders;

-- Вывести максимальную стоимость заказа
select max(total_amount) from orders;

-- Найти сумму всех заказов
select sum(total_amount) from orders;

-- Найти сумму всех заказов за 2014 год
select sum(total_amount) from orders where order_date between'2014-01-01' and '2014-12-31';

-- Найти среднюю стоимость всех заказов
select avg(total_amount) from orders;

-- Найти среднюю стоимость всех заказов по каждому клиенту
select customer_id, avg(total_amount) from orders group by customer_id order by customer_id;

-- Найти всех клиентов, которые живут в Бразилии или Испании
select * from customer where country in('Brazil', 'Spain');

-- Найти все заказы между 2013ым и 2014ым годами, которые стоили меньше 100.00$
select * from orders where order_date between '2013-01-01' and '2014-12-31' and total_amount < 100;


-------------
-- Tasks 2 --
-------------


-- - Найти всех клиентов, которые в одной из стран: Испания, Италия, Германия, Франция. Отсортируйте по странам
select * from customer where country in('Spain', 'Italy', 'Germany', 'France') order by country;

-- - Найти все страны клиентов, страны которых содержаться в таблице поставщиков
select supplier.country from customer
                                 join supplier on (customer.country = supplier.country) group by supplier.country;

-- - Найти всех клиентов, имена которых начинаются на ‘Jo’
select * from customer where customer.first_name like('Jo%');

-- - Найти всех клиентов, имена которых заканчиваются на ‘a’ и имеют длину ровно 4 символа
select * from customer where first_name like ('%a') and length(first_name) = 4;

-- - Найти количество клиентов по странам
select customer.country, count(*) from customer
group by customer.country order by customer.country;

-- - Найти количество клиентов по странам. Вывести в порядке убывания
select customer.country, count(*) from customer
group by customer.country order by count(*) desc;

-- - Найти общую сумму стоимости заказов и количество заказов по каждому клиенту (customer_id). Отсортировать по сумме
select customer_id, sum(total_amount), count(*) from orders group by orders.customer_id order by sum(total_amount);

-- - Найти общую сумму стоимости заказов и количество заказов по каждому клиенту (customer_id),
-- у которых общее количество заказов больше 20ти
select customer_id, sum(total_amount), count(*) from orders group by orders.customer_id
having count(*) > 20;
