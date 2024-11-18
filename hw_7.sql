/*
ФИО: Фарход Джонмахмадов
Домашнее задание 7 подзапросы


	1.  По каждому сотруднику компании предоставьте следующую информацию: 
	id сотрудника, полное имя, позиция (title), id менеджера (reports_to), 
	полное имя менеджера и через запятую его позиция.
 */

select * 
from employee;

select 
	e.employee_id 
	, e.first_name || ' ' || e.last_name as full_name
	, e.title 
	, e.reports_to 
	, ( select
			e2.first_name || ' ' || e2.last_name || ', ' || e2.title
		from employee e2 
		where 	
			e2.employee_id = e.reports_to 
	) as manager
from employee e ; 


/*
 *  2. Вытащите список чеков, сумма которых была больше среднего чека за 2023 год. 
 *     Итоговая таблица должна содержать следующие поля: invoice_id, invoice_date, 
 *     monthkey (цифровой код состоящий из года и месяца), customer_id, total
 */


select *
from invoice i ;

select 
	i.invoice_id 
	, i.invoice_date 
	, to_char(i.invoice_date, 'YYYYMM') as monthkey
	, i.customer_id 
	, i.total 
from invoice i 
where 
	i.total > (
		select avg(i2.total)
		from invoice i2 
		where 
			extract ('year' from i2.invoice_date) = 2023
		)
	and extract ('year' from i.invoice_date) = 2023
;


/*
 *  3. Дополните предыдущую информацию email-ом клиента.
 */

select 
	i.invoice_id 
	, i.invoice_date 
	, to_char(i.invoice_date, 'YYYYMM') as monthkey
	, i.customer_id 
	, i.total 
	, (select 
		c.email 
		from customer c
		where c.customer_id = i.customer_id) as email
from invoice i 
where 
	i.total > (
		select avg(i2.total)
		from invoice i2 
		where 
			extract ('year' from i2.invoice_date) = 2023
		)
	and extract ('year' from i.invoice_date) = 2023
;


/*
 *  4. Отфильтруйте предыдущий запрос, чтобы в нём не было клиентов 
 * 	   имеющих почтовый ящик в домене gmail
 */

select 
	i.invoice_id 
	, i.invoice_date 
	, to_char(i.invoice_date, 'YYYYMM') as monthkey
	, i.customer_id 
	, i.total 
	, (select 
		c.email 
		from customer c
		where c.customer_id = i.customer_id
		 	and c.email not like '%@gmail%') as email
from invoice i 
where 
	i.total > (
		select avg(i2.total)
		from invoice i2 
		where 
			extract ('year' from i2.invoice_date) = 2023
		)
	and extract ('year' from i.invoice_date) = 2023
	and exists (
		select 1
		from customer c2
		where
			c2.customer_id = i.customer_id
		and c2.email not like '%@gmail%')
;

/*
 *  5. Посчитайте какой процент от общей выручки за 2024 год принёс каждый чек.
 */

select
	i.invoice_id 
	, i.invoice_date 
	, i.total 
	, round ((i.total / total_revenue) * 100, 2) as percentage_of_total_revenue
from invoice i
	, (select sum (i2.total) as total_revenue
	  from invoice i2
	  where 
	  	extract ('year' from i2.invoice_date) = 2024) as total
where 
	extract ('year' from i.invoice_date) = 2024
;


/*
 *  6. Посчитайте какой процент от общей выручки за 2024 год принёс каждый клиент компании.
 */

select
	i.customer_id 
	, sum(i.total) as total_customer_revenue
	, round ((sum(i.total) / total_revenue) * 100, 2) as percentage_of_total_revenue
from invoice i
	, (select sum (i2.total) as total_revenue
	  from invoice i2
	  where 
	  	extract ('year' from i2.invoice_date) = 2024) as total
where 
	extract ('year' from i.invoice_date) = 2024
group by
	i.customer_id, total_revenue
;

