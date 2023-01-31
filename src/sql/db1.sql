CREATE TABLE hotel(
    room integer primary key
);

CREATE TABLE customers(
    id integer primary key,
    name varchar(25) not null,
    phone_number varchar(20) not null
);

CREATE TABLE hotel_history(
    id_customer integer not null references customers(id),
    room integer not null references hotel(room),
    start_date date not null,
    end_date date not null
);

insert into hotel values (101);
insert into hotel values (102);
insert into hotel values (103);
insert into hotel values (104);
insert into hotel values (105);
insert into hotel values (106);
insert into hotel values (107);
insert into hotel values (108);
insert into hotel values (109);
insert into hotel values (110);

insert into customers(id, name, phone_number) values (1, 'Arsen', '0501020202');
insert into customers(id, name, phone_number) values (2, 'Bob', '0502010101');
insert into customers(id, name, phone_number) values (3, 'Steven', '0503040404');
insert into customers(id, name, phone_number) values (4, 'Nancy', '0504050505');
insert into customers(id, name, phone_number) values (5, 'John', '0500060606');

insert into hotel_history values (1, 105, '2023-01-14', '2023-02-28');
insert into hotel_history values (1, 109, '2022-12-28', '2023-01-28');
insert into hotel_history values (4, 101, '2023-01-02', '2023-01-05');
insert into hotel_history values (3, 103, '2023-01-04', '2023-01-20');
insert into hotel_history values (2, 107, '2023-01-15', '2023-03-25');
insert into hotel_history values (5, 110, '2023-01-10', '2023-01-11');

select * from hotel;
select * from customers;
select * from hotel_history;

select * from hotel_history hh
join customers c on (hh.id_customer = c.id);