/*
ФИО: Фарход Джонмахмадов
Домашнее задание по SQL


2. Напишите код, который вернёт из таблицы track поля name и genreid
 */

select 
	name
	, genre_id 
from track;	

/* 3. Напишите код, который вернёт из таблицы track поля name, composer, unitprice. 
 	  Переименуйте поля на song, author и price соответственно. 
      Расположите поля так, чтобы сначало следовало название произведения, 
      далее его цена и в конце список авторов.
 */

select 
	name as song
	, unit_price as price
	, composer as author
from track;
	
/* 4. Напишите код, который вернёт из таблицы track название произведения и его длительность в минутах.
 	  Результат должен быть отсортирован по длительности произведения по убыванию.
 */

select
	 name
	, round(milliseconds/60000., 2) as duration_in_minute
from track
order by
	duration_in_minute desc 
;

/*
 5. Напишите код, который вернёт из таблицы track поля name и genreid, и только первые 15 строк. 
 */

select 
	name
	, genre_id
from track
limit 15
;

/*
 6. Напишите код, который вернёт из таблицы track все поля и все строки начиная с 50-й строки.
 */

select 
	*
from track
offset 50
;

/*
 7. Напишите код, который вернёт из таблицы track названия всех произведений, чей объём больше 100 мегабайт.
 */

select
	name
	, bytes / 1000000 as mbytes
from track
where 
	bytes / 1000000 > 100
;

/* 8. Напишите код, который вернёт из таблицы track поля name и composer, 
 	  где composer не равен "U2". Код должен вернуть записи с 10 по 20-й включительно.
 */

select 
	track_id 
	, name
	, composer 
from track
where 
	composer <> 'U2'
limit 11
offset 9
;

/* 9. Напишите код, который из таблицы invoice вернёт дату самой первой и самой последней покупки. */
-- сначло выгрузим таблицу invoice, чтобы посмотреть какие столбцы там существуют.
select 
	*
from 
	invoice;
--	
select
	min(invoice_date) as pervaya_pokupka
	, max(invoice_date) as poslednyaya_pokupka
from invoice;

/* 10. Напишите код, который вернёт размер среднего чека для покупок из США. */

select 
	avg(total) as sredny_check_USA
from invoice
where 
	billing_country = 'USA'
;

/* 11. Напишите код, который вернёт список городов в которых имеется более одного клиента. */

select 
	billing_city
	, customer_id 
from invoice
where 
	customer_id > 1;

