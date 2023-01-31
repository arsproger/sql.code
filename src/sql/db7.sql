create table students (
    id integer primary key,
    name varchar(20) not null,
    age integer not null,
    course integer not null check (course > 0 and course < 5)
);

CREATE TABLE subjects(
    id integer primary key,
    name varchar(50) not null
);

CREATE TABLE grades(
    student_id integer not null references students(id),
    grade numeric(7, 2) not null,
    subject_id integer not null references subjects(id),
    UNIQUE (student_id, subject_id)
);

insert into students values
                         (1, 'Arsen', 19, 2),
                         (2, 'Bob', 18, 3),
                         (3, 'Ruslan', 20, 4),
                         (4, 'Tom', 22, 1),
                         (5, 'Nancy', 21, 2);
insert into subjects values
                         (1, '�����������'),
                         (2, '������'),
                         (3, '����������'),
                         (4, '����������'),
                         (5, '�������');
insert into grades values
                       (1, 4.5, 1),
                       (1, 4.2, 3),
                       (1, 4.9, 5),
                       (2, 5.0, 4),
                       (2, 4.6, 2),
                       (2, 4.4, 1),
                       (3, 4.8, 2),
                       (3, 4.2, 4),
                       (3, 4.3, 3),
                       (4, 4.7, 1),
                       (4, 4.9, 2),
                       (4, 3.7, 4),
                       (5, 5.0, 3),
                       (5, 3.8, 2),
                       (5, 4.2, 5);

select * from students;
select * from grades;
select * from subjects;

-- Tasks

select count(*) as amount_students from students where lower(name) like ('%a%');

select max(age) as max_age from students;

select student_id, students.name, cast(avg(grade) as decimal(7, 2)) from grades
join students on(grades.student_id = students.id)
group by student_id, students.name order by student_id;

select count(*) as amount_students from students;

select min(age) as min_age from students;

select students.name, grades.student_id, sum(grade) as sum_grade from grades
join students on (students.id = grades.student_id)
group by student_id, students.name order by students.name;
