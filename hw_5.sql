/*
ФИО: Фарход Джонмахмадов
Домашнее задание 5 по работе с текстом и датой в SQL


	1. Из таблицы customer вытащите список телефонных номеров, не содержащих скобок;
 */
select *
from customer
;

select 
	phone 
from customer
where 
	phone not like '%(%)%'
;


/*
	2. Измените текст 'lorem ipsum' так чтобы только первая буква первого слова была в верхнем регистре а всё остальное в нижнем;
*/
select initcap('lorem ipsum')
;

select 
	upper(left('lorem ipsum', 1)) || lower(substring('lorem ipsum', 2)) as formatted_text
;

/*
 *  3. Из таблицы track вытащите список названий песен, которые содежат слово 'run';
 */
select 
	name
from track
where 
--	regexp_like(name, 'Run')
	name  ilike ('%run%') 
;

/*
 * 	4. Вытащите список клиентов с почтовым ящиком в 'gmail';
 */

select *
from customer;

select 
	*
-- email
from customer
where 
	regexp_like(email, 'gmail') ;

/*
 * 	5. Из таблицы track найдите произведение с самым длинным названием.
 */

select 
	name
	, length(name) as n_cnt
from track
order by
	n_cnt desc
--limit 1
;

/*
 * 	6. Посчитайте общую сумму продаж за 2021 год, в разбивке по месяцам. Итоговая таблица должна содержать следующие поля: month_id, sales_sum
 */

select *
from invoice;

select 
--	invoice_date 
	extract('month' from invoice_date) as month_id
	, sum(total) as sales_sum 
from invoice
where 
	extract ('year' from invoice_date) = 2021
group by
	month_id
order by 
	month_id
;

/*
 * 	7. К предыдущему запросу (вопрос №6) добавьте также поле с названием месяца 
 * (для этого функции to_char в качестве второго аргумента нужно передать слово 'month'). 
 * Итоговая таблица должна содержать следующие поля: month_id, month_name, sales_sum. 
 * Результат должен быть отсортирован по номеру месяца.
 */

select 
	extract('month' from invoice_date) as month_id
	, to_char(invoice_date, 'month') as month_name
	, sum(total) as sales_sum 
from invoice
where 
	extract ('year' from invoice_date) = 2021
group by
	month_id, month_name
order by 
	month_id
;


/*
 * 	8. Вытащите список 3 самых возрастных сотрудников компании. 
 * 	Итоговая таблица должна содержать следующие поля: full_name (имя и фамилия), 
 * 	birth_date, age_now (возраст в годах в числовом формате)
 */

select *
from employee;

select 
	concat_ws(' ', first_name, last_name) as full_name
	, birth_date 
	, extract ('year' from age(birth_date)) as age_now
from employee
order by 
	birth_date
--limit 3
;

/*
 * 	9. Посчитайте каков будет средний возраст сотрудников через 3 года и 4 месяца.
 */

select 
	avg(extract ('year' from age(birth_date) + interval '3 years 4 month')) as avg_age_after_3y_4m
from employee
;


/*
 * 
 * для теста
 select 
	concat_ws(' ', first_name, last_name) as full_name
	, birth_date 
	, extract ('year' from age(birth_date)) as age_now
	, avg(extract ('year' from age(birth_date) + interval '3 years 4 month')) as avg_age_after_3y_4m
from employee
group by
	full_name, birth_date
order by 
	birth_date
;
 */

/*
 * 	10. Посчитайте сумму продаж в разбивке по годам и странам. 
 * 	Оставьте только те строки где сумма продажи больше 20. 
 * 	Результат отсортируйте по году продажи (по возрастанию) и сумме продажи (по убыванию).
 */

select *
from invoice;

select 
	extract('year' from invoice_date) as y_sales
	, billing_country
	, sum(total) as sales_sum
from invoice
group by 
	y_sales, billing_country
having 
	sum(total) > 20
order by
	y_sales asc
	, billing_country desc	
;








