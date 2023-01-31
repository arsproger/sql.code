select * from orders;
select * from order_item;
select * from customer;
select * from product;
select * from supplier;

-------------
-- Tasks 1 --
-------------

-- ������� ���� �������� �� ������ Canada
select * from customer where country = 'Canada';

-- ������� ��� ������ ��������
select country from customer group by country;

-- ������� ���������� ���� �������
select count(*) from orders;

-- ������� ������������ ��������� ������
select max(total_amount) from orders;

-- ����� ����� ���� �������
select sum(total_amount) from orders;

-- ����� ����� ���� ������� �� 2014 ���
select sum(total_amount) from orders where order_date between'2014-01-01' and '2014-12-31';

-- ����� ������� ��������� ���� �������
select avg(total_amount) from orders;

-- ����� ������� ��������� ���� ������� �� ������� �������
select customer_id, avg(total_amount) from orders group by customer_id order by customer_id;

-- ����� ���� ��������, ������� ����� � �������� ��� �������
select * from customer where country in('Brazil', 'Spain');

-- ����� ��� ������ ����� 2013�� � 2014�� ������, ������� ������ ������ 100.00$
select * from orders where order_date between '2013-01-01' and '2014-12-31' and total_amount < 100;


-------------
-- Tasks 2 --
-------------


-- - ����� ���� ��������, ������� � ����� �� �����: �������, ������, ��������, �������. ������������ �� �������
select * from customer where country in('Spain', 'Italy', 'Germany', 'France') order by country;

-- - ����� ��� ������ ��������, ������ ������� ����������� � ������� �����������
select supplier.country from customer
                                 join supplier on (customer.country = supplier.country) group by supplier.country;

-- - ����� ���� ��������, ����� ������� ���������� �� �Jo�
select * from customer where customer.first_name like('Jo%');

-- - ����� ���� ��������, ����� ������� ������������� �� �a� � ����� ����� ����� 4 �������
select * from customer where first_name like ('%a') and length(first_name) = 4;

-- - ����� ���������� �������� �� �������
select customer.country, count(*) from customer
group by customer.country order by customer.country;

-- - ����� ���������� �������� �� �������. ������� � ������� ��������
select customer.country, count(*) from customer
group by customer.country order by count(*) desc;

-- - ����� ����� ����� ��������� ������� � ���������� ������� �� ������� ������� (customer_id). ������������� �� �����
select customer_id, sum(total_amount), count(*) from orders group by orders.customer_id order by sum(total_amount);

-- - ����� ����� ����� ��������� ������� � ���������� ������� �� ������� ������� (customer_id),
-- � ������� ����� ���������� ������� ������ 20��
select customer_id, sum(total_amount), count(*) from orders group by orders.customer_id
having count(*) > 20;
