CREATE TABLE football_teems (
    id integer primary key,
    name varchar not null,
    rating integer unique default 999
);

CREATE TABLE positions(
    id integer primary key,
    name varchar not null unique
);

CREATE TABLE staff(
    id integer primary key,
    name varchar not null,
    position_id integer not null references positions(id) on delete cascade ,
    teem_id integer not null references football_teems(id) on delete cascade ,
    salary integer not null
);

insert into football_teems values
                               (1, 'Manchester United', 4),
                               (2, 'Real Madrid', 1),
                               (3, 'Barcelona', 2),
                               (4, 'Bayern Munich', 5),
                               (5, 'Paris Saint-Germain', 6),
                               (6, 'Juventus', 3),
                               (7, 'Manchester City', 7),
                               (8, 'Liverpool', 8),
                               (9, 'Chelsea', 9),
                               (10, 'Arsenal', 10);
insert into positions values
                          (1, 'Soccer'),
                          (2, 'Referee'),
                          (3, 'Coach');
insert into staff(id, name, position_id, teem_id, salary) values
                                                              (1, 'Alice', 1, 1, 500),
                                                              (2, 'Bob', 1, 1, 700),
                                                              (3, 'Charlie', 2, 3, 800),
                                                              (4, 'David', 2, 4, 400),
                                                              (5, 'Eve', 3, 5, 600),
                                                              (6, 'Frank', 3, 5, 900),
                                                              (7, 'Grace', 1, 7, 300),
                                                              (8, 'Heather', 2, 8, 450),
                                                              (9, 'Ivan', 3, 8, 1000),
                                                              (10, 'Jack', 1, 10, 800),
                                                              (11, 'Nancy', 3, 1, 750),
                                                              (12, 'John', 2, 3, 670),
                                                              (13, 'Steven', 1, 5, 730),
                                                              (14, 'Nina', 2, 7, 900),
                                                              (15, 'Phantom', 1, 10, 850);

select * from football_teems;
select * from positions;
select * from staff;

-- Tasks --

-- Вывести на экран кол-во футболистов в каждой команде
select ft.id, ft.name, count(*) from football_teems ft
    join staff on(ft.id = staff.teem_id) group by ft.id order by ft.id;

-- Вывести на экран всех тренеров
select staff.id, staff.name, positions.name from staff
    join positions on(staff.position_id = positions.id)
where positions.name = 'Coach';

-- Посчитать сколько сотрудников кроме футболистов и тренеров
select count(*) from staff
    join positions on (staff.position_id = positions.id)
where positions.name NOT IN('Soccer', 'Coach');

-- Удалить футбольную команду если нет сотрудников
delete from football_teems where id IN(
    select football_teems.id from football_teems
    left join staff on(football_teems.id = staff.teem_id)
    group by football_teems.id
    having count(staff.teem_id) = 0 );

-- Удалить игрока если ЗП выше средней ЗП команды
delete from staff where salary > ( select avg(salary) from staff );
