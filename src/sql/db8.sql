CREATE TABLE students(
    id integer primary key,
    name varchar not null
);

CREATE TABLE subjects(
    id integer primary key,
    name varchar not null unique,
    passing_score numeric(3, 2)
);

CREATE TABLE grades(
    student_id integer not null references students(id) on delete cascade,
    grade numeric(3, 2) not null,
    subject_id integer not null references subjects(id) on delete cascade,
    UNIQUE (student_id, subject_id)
);

insert into students values
                         (1, 'John Smith'),
                         (2, 'Jane Doe'),
                         (3, 'Bob Johnson'),
                         (4, 'Samantha Williams'),
                         (5, 'Michael Brown'),
                         (6, 'Emily Davis'),
                         (7, 'Joshua Garcia'),
                         (8, 'Amanda Rodriguez'),
                         (9, 'Daniel Martinez'),
                         (10, 'Matthew Robinson');
insert into subjects values
                         (5, 'Russian', 4.2),
                         (10, 'Algebra', 4.1),
                         (15, 'Geometry', 4.4),
                         (20, 'Geography', 3.5),
                         (25, 'History', 4.0),
                         (30, 'Biology', 3.7),
                         (35, 'Chemistry', 3.8),
                         (40, 'Physics', 3.5),
                         (45, 'English', 4.4),
                         (50, 'Astronomy', 3.7);
insert into grades values
                       (1, 3.5, 20),
                       (2, 4.5, 40),
                       (3, 4.5, 35),
                       (4, 3.2, 5),
                       (5, 4.9, 25),
                       (6, 4.8, 50),
                       (7, 4.6, 15),
                       (8, 4.1, 45),
                       (9, 3.7, 30),
                       (10, 3.9, 20),
                       (1, 3.8, 50),
                       (2, 4.2, 35),
                       (3, 4.4, 25),
                       (4, 3.7, 40),
                       (5, 2.3, 30),
                       (6, 4.6, 20),
                       (7, 4.5, 45),
                       (8, 3.8, 50),
                       (9, 4.2, 15),
                       (10, 4.4, 30),
                       (1, 3.3, 25),
                       (2, 4.6, 45),
                       (3, 4.5, 50),
                       (4, 4.9, 30),
                       (5, 3.1, 10),
                       (6, 4.7, 15),
                       (7, 4.8, 5),
                       (8, 3.6, 30),
                       (9, 4.1, 25),
                       (10, 4.3, 40);

select * from students;
select * from subjects;
select * from grades;

select student_id, students.name, cast(avg(grade) as decimal(7, 2)) from grades
    join students on(grades.student_id = students.id)
group by student_id, students.name order by student_id;


-----------
-- Tasks --
-----------

-- Вывести кол-во студентов по предметам – на консоль
select subject_id, subjects.name, count(*) amount_students from subjects
    join grades on(subjects.id = grades.subject_id)
group by subject_id, subjects.name order by subject_id;

-- Вывести всех студентов у кого средняя оценка выше среднего проходного балла
select students.id, students.name, avg(grade) from students
    join grades on (students.id = grades.student_id)
    join subjects on (subjects.id = grades.subject_id)
group by students.id
having avg(grade) > (select avg(passing_score) from subjects)
order by students.id;

-- Вывести все предметы где есть больше двух студентов
select subject_id, subjects.name, count(*) amount_students from subjects
    join grades on(subjects.id = grades.subject_id)
group by subject_id, subjects.name
having count(*) > 2
order by subject_id;

-- Вывести все предметы у каждого студента
select students.id, students.name, subjects.name from students
    join grades on students.id = grades.student_id
    join subjects on subjects.id = grades.subject_id order by student_id;

-- Удалить Студента если средняя оценка ниже среднего проходного балла
delete from students where id
    IN(select students.id from students
    join grades on (students.id = grades.student_id)
    join subjects on (subjects.id = grades.subject_id)
    group by students.id
    having avg(grade) < avg(passing_score)
    order by students.id);
