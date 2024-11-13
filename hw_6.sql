/*
ФИО: Фарход Джонмахмадов
Домашнее задание 6 по созданию и редактированию таблиц в SQL


	1.  Создайте таблицу students. Заполните её данными из нашей группы в телеграме. 
		Таблица должна содержать следующие поля: student_id, student_name, username, 
		bio, mobile, has_picture (есть ли фото профиля).
 */

create table students (
	student_id serial primary key
	, student_name varchar(100) not null
	, username varchar(50) unique not null
	, bio text
	, mobile varchar (20)
	, has_picture boolean default false
)
;

select *
from students;

insert into students (student_name, username, bio, mobile, has_picture)
values
	('Hakim', 'hakimps1', 'none', '502xxxx54', False)
	, ('Behzod', 'behzod_31', 'none', '559xxxx74', False)
	, ('Smile', 'Izarum55', 'none', 'none', True)
	, ('Aziz A', 'none', 'none', 'none', True)
	, ('Alijon M', 'M_Alijon', 'none', 'none', True)
	, ('Sadriddin Kh', 'khojazodas', 'none', 'none', True)
	, ('Jahon', 'Jahon987', 'none', '917xxxx00', False)
	, ('Jamik B', 'Jamik2306', 'none', 'none', True)
	, ('Alisher N', 'avixon', 'av1xon', 'none', true)
	, ('Munira K', 'krb_munira', 'none', 'none', True)
	, ('Amir O', 'Amir_Olimi', 'none', 'none', True)
	, ('Alexandra L', 'Alexandraleshaya', 'none', '900xxxx77', True)
;

insert into students (student_name, username, bio, mobile, has_picture)
values
	('FarhodJKH', 'farhodjkh', 'none', '901xxxx809', true)
;

update students 
set 
	student_id ='13'
where 
	student_id ='15'
;



/*
 * 2. Создайте таблицу lessons. Таблица должна содержать следующие поля: 
 * lesson_id, lesson_name, lesson_date, attendance (был, не был). 
 * Внесите в таблицу информацию об уроках, которые были пройдены в рамках модуля SQL.
 */

create table lessons (
	lesson_id serial primary key
	, lesson_name varchar(100) not null
	, lesson_date date not null
	, attendance boolean not null
)
;

select *
from lessons;

insert into lessons (lesson_name, lesson_date, attendance)
values
	('SQL знакомство', '2024-10-18', True)
	, ('Операторы выборки, фильтрации и агрегации данных', '2024-10-18', True)
	, ('Работа с текстом и датой', '2024-10-21', False)
	, ('Создание, редактирование и удаление таблиц', '2024-10-23', False)
;



/*
 *  3. Создайте таблицу scores. Таблица должна содержать следующие поля: score_id, user_id, lesson_id, score. 
 * Внесите в неё оценки, которые вы получили за выполненные домашние задания. 
 * Если по-какой либо домашке вы [ещё] не получили оценки - оставьте поле score пустым. 
 * Свяжите таблицу scores с таблицами students и lessons по внешним ключам.
 */

create table scores (
	score_id serial primary key
	, user_id integer not null
	, lesson_id integer not null
	, score integer
	, constraint fk_user foreign key (user_id) references students(student_id) on delete cascade
	, constraint fk_lesson foreign key (lesson_id) references lessons(lesson_id) on delete cascade
)
;

select *
from scores;

insert into scores (user_id, lesson_id, score)
values
	(13, 1, 80)
	, (13, 2, null)
	, (13, 3, null)
	, (13, 4, null)
;


/*
 *  4. В таблице students добавьте индекс к столбцу username.
 */

create index usr_indx on students (username);

select *
from students;

/*
 * 5. Создайте представление my_results, которое будет возвращать ваш: 
 * student_id, student_name, username, mobile, lessons_attended 
 * (количество уроков на которых вы присутствовали), avg_score(средняя оценка за все домашки).
 */

create view my_results as 
select 
	student_id
	, student_name
	, username
	, count(distinct ls.lesson_id) as lessons_attended
	, avg(score) as avg_score
from students st, scores sc, lessons ls
where 
	st.student_id = sc.user_id
and 
	sc.lesson_id = ls.lesson_id
and 
	ls.attendance = true 
group by 
	st.student_id
	, st.student_name
	, st.username
	, st.mobile
;

select *
from my_results;



