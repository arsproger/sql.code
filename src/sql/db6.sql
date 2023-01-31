CREATE TABLE sport_type (
id integer primary key,
sport_type varchar(50) not null,
salary numeric not null default 0
);

CREATE TABLE trainer(
id integer primary key,
name varchar(25) not null,
id_sport_type integer not null references sport_type(id),
phone_number varchar(50),
inn integer unique not null
);


insert into sport_type values
                           (1, '���������', 550),
                           (2, '�������', 390),
                           (3, '����', 700),
                           (4, '�����', 450),
                           (5, '��������', 600),
                           (6, '������', 470),
                           (7, '������', 500),
                           (8, '�����', 350),
                           (9, '�����', 300),
                           (10, '������', 800);

CREATE SEQUENCE inn_seq start with 1000 increment by 777;

insert into trainer values
                        (1, '����� ������', 1, '001', nextval('inn_seq')),
                        (2, '����� �������', 5, '002', nextval('inn_seq')),
                        (3, '������� �����', 7, '003', nextval('inn_seq')),
                        (4, '������� ������', 10, '004', nextval('inn_seq')),
                        (5, '������� �����', 2, '005', nextval('inn_seq')),
                        (6, '���� ��������', 6, '006', nextval('inn_seq')),
                        (7, '��� �������', 4, '007', nextval('inn_seq')),
                        (8, '�������� �����', 9, '008', nextval('inn_seq')),
                        (9, '������ ���������', 8, '009', nextval('inn_seq')),
                        (10, '���� ��', 3, '010', nextval('inn_seq'));

select * from sport_type;
select * from trainer;

-- Tasks

select * from trainer join sport_type on(trainer.id_sport_type = sport_type.id) where salary > 500;

select * from trainer where name like ('%�%');

select * from sport_type where sport_type like ('%���');

select trainer.name, sport_type.sport_type ,sport_type.salary from trainer
join sport_type on (trainer.id_sport_type = sport_type.id) order by salary desc;

select * from trainer order by name;

update trainer set name = '����� ���������' where id = 1;

update sport_type set salary = salary * 2;

delete from trainer where name = '���� ��';
