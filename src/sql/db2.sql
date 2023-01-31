CREATE TABLE product(
    id integer primary key,
    name varchar(50) not null unique,
    price numeric not null
);

CREATE TABLE product_price_history(
    id integer not null references product(id),
    price numeric not null,
    date timestamp not null
);
insert into product values (1, 'Coca-cola', 55);
insert into product values (2, 'Merci', 600);
insert into product values (3, 'Nutella', 250);

insert into product_price_history
values (1, (select price from product where id = 1), current_timestamp);

update product set price = 60 where name = 'Coca-cola';

insert into product_price_history
values (1, (select price from product where id = 1), current_timestamp);

insert into product_price_history
values (2, (select price from product where id = 2), current_timestamp);

update product set price = 655 where name = 'Merci';

insert into product_price_history
values (2, (select price from product where id = 2), current_timestamp);

insert into product_price_history
values (3, (select price from product where id = 3), current_timestamp);

update product set price = 280 where name = 'Nutella';

insert into product_price_history
values (3, (select price from product where id = 3), current_timestamp);

select * from product;
select * from product_price_history;
select * from product_price_history ph join product p on (p.id = ph.id);
