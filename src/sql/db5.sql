CREATE TABLE countries(
    id integer primary key,
    name varchar(50) not null unique
);
CREATE TABLE attraction_type (
    id integer primary key,
    name varchar(50)
);

insert into attraction_type values
                                (1, '�����'),
                                (2, '����'),
                                (3, '�����'),
                                (4, '����'),
                                (6, '���'),
                                (7, '�������'),
                                (8, '����'),
                                (9, '������');
select * from attraction_type;

insert into countries values
                          (1, 'USA'),
                          (2, 'Russian'),
                          (3, 'Portugal'),
                          (4, 'Brazil'),
                          (5, 'Mexico');

select * from countries;

CREATE TABLE attractions (
    id integer primary key,
    id_country integer references countries(id),
    id_attraction integer references attraction_type(id),
    geographical_position varchar(50),
    origin varchar(50),
    description varchar(50)
);
