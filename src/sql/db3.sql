CREATE TABLE students(
    id integer primary key,
    first_name varchar(25) not null,
    last_name varchar(25),
    group_id integer not null references groups(id),
    date_of_birth date not null
);

CREATE TABLE groups(
    id integer primary key,
    faculty_id integer not null references faculties_name(id),
    name varchar(50) not null unique
);

CREATE TABLE faculties_name(
    id integer primary key,
    name text not null unique
);

CREATE TABLE faculties_university(
    university_id integer not null references universities (id),
    faculty_id integer not null references faculties_name(id)
);
CREATE TABLE universities(
    id integer primary key,
    name varchar(50) not null
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

insert into subjects values
                         (1, 'Информатика'),
                         (2, 'Физика'),
                         (3, 'Математика'),
                         (4, 'Астрономия'),
                         (5, 'Русский');
insert into universities values
                             (1, 'КРСУ'),
                             (2, 'КНУ'),
                             (3, 'КГТУ'),
                             (4, 'МУК'),
                             (5, 'АУЦА');
insert into faculties_name values
                               (1, 'филологический'),
                               (2, 'журналистики'),
                               (3, 'социологии'),
                               (4, 'информационные технологии'),
                               (5, 'экономический');
insert into faculties_university values
                                     (1, 2),
                                     (1, 3),
                                     (2, 5),
                                     (2, 1),
                                     (3, 4),
                                     (3, 2),
                                     (4, 3),
                                     (4, 1),
                                     (5, 4),
                                     (5, 2);
insert into groups values
                       (1, 5, 'Group economic'),
                       (2, 1, 'Group philology'),
                       (3, 4, 'Group programming'),
                       (4, 2, 'Group journalism'),
                       (5, 3, 'Group social');
create sequence student_id;
insert into students values
                         (nextval('student_id'), 'Arsen', 'Bekboev', 3, '2005.08.29'),
                         (nextval('student_id'), 'Steven', 'King', 1, '2004.09.13'),
                         (nextval('student_id'), 'Ruslan', 'Koledin', 4, '2006.03.24'),
                         (nextval('student_id'), 'Erlan', 'Alisherov', 2, '2003.10.03'),
                         (nextval('student_id'), 'Aidai', 'Kubatova', 4, '2001.02.21');
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
select * from groups;
select * from faculties_name;
select university_id, faculty_id, faculties_name.name from faculties_university
    join faculties_name on(faculties_university.faculty_id = faculties_name.id);
select * from universities;
select * from subjects;
select * from grades;


-- tasks

select student_id, students.first_name, cast(avg(grade) as decimal(7, 2)) from grades
    join students on(grades.student_id = students.id)
group by student_id, students.first_name order by student_id;

select distinct first_name, last_name, groups.name as group_name, faculties_name.name as faculty_name from students
    inner join groups on(students.group_id = groups.id)
    inner join faculties_name on(groups.faculty_id = faculties_name.id)
    inner join faculties_university on(faculties_name.id = faculties_university.faculty_id);