-- Агрегационные функции (+ группировка)

-- 1. Найти сумму возрастов всех покупателей

select
 sum(age) as sum_age
from customers;


-- 2. Найти средний возраст покупателей

select
 avg(age) as avg_age
from customers;


-- 3. Найти минимальный возраст среди всех покупателей

select
 min(age) as min_age
from customers;

-- 4. Найти максимальный возраст среди всех покупателей

select
 max(age) as max_age
from customers;

-- 5. Найти количество всех покупателей


select
 count(*) as customers_cnt
from customers;


/*
update customers
set age = null
where customer_id = 5;
*/

-- 6. Найти самых младших покупателей (имя, фамилия, возраст)
-- 6. Найти покупателей (имя, фамилия, возраст), чей возраст равен минимальному

select
 first_name,
    last_name,
    age
from customers
where age = (select min(age) from customers);

-- 7. Найти покупателей (имя, фамилия, возраст, страна) из USA и UK, чей возраст выше среднего
select
 first_name,
 last_name,
 age,
 country
from customers
where country in ('USA', 'UK') 
and age > (select avg(age) as avg_age from customers)
;

use hr;

-- 1. Найти сотрудников (имя, фамилия, зп), которые зарабатывают меньше всех

select
 first_name,
 last_name,
 salary
from employees
where salary = (select min(salary) from employees);

-- 2. Найти сотрудников (имя, фамилия, зп), которые зарабатывают меньше среднего по компании и работают в департаментах (90, 100, 60)
select
 first_name,
 last_name,
 salary,
 department_id
from employees
where department_id in ('90', '100', '60') 
and salary < (select avg(salary) from employees)
;

-- 3. Найти сотрудников (имя, фамилия, зп), 
-- которые зарабатывают меньше среднего по компании и работают в департаментах ('Executive', 'Finance', 'IT')
select
 t1.first_name,
 t1.last_name,
 t1.salary,
 t2.department_name 
from employees t1
inner join departments t2
on t1.department_id  = t2.department_id
where salary  < (select avg(salary) from employees)
and t2.department_name in ('Executive', 'Finance', 'IT');

 
 select
 first_name,
 last_name,
 salary
from employees
where salary < (select avg(salary) from employees)
and department_id in (
select
department_id
from departments
where department_name in ('Executive', 'Finance', 'IT')
);

-- 4. Вывести сотрудников (имя, фамилия, job_id), работающих на должностях 'Finance Manager', 'Programmer', 'Sales Manager'
select
first_name,
last_name,
job_id
from employees
where job_id in (
select
job_id
from jobs
where job_title in ('Finance Manager', 'Programmer', 'Sales Manager')
);

select
t1.first_name,
t1.last_name,
t1.job_id
from employees t1
inner join jobs t2
on t1.job_id = t2.job_id
where t2.job_title in ('Finance Manager', 'Programmer', 'Sales Manager')
;

use airport;
-- 1. Вывести пассажиров, которые хоть раз летали первым классом.
-- Вывести : clients.id, clients.name

select
id,
name
from clients
where id in (
select
client_id
from tickets
where service_class in ('FirstClass')
);

select
 t1.id,
 t1.name
from clients t1
inner join tickets t2
on t1.id = t2.client_id
where t2.service_class = 'FirstClass';

-- 2. Вывести количество Надежд ('Nadezhda') на самолетах в пути (departed).
-- Вывести: hope_count

select
count(*) as hope_count
from clients t1
inner join tickets t2
on t1.id = t2.client_id
inner join trips t3
on t2.trip_id = t3.id
where t3.status = 'Departed'
and t1.name like 'Nadezhda%'
;

-- 3. Найдите билеты на рейсы из аэропорта Саратова (код аэропорта RTW). 
-- В выборке должен присутствовать один атрибут - id.
 
select
t2.id
from trips t1
inner join tickets t2
on t1.id = t2.trip_id
where t1.departure = 'RTW';

select
id
from tickets
where trip_id in (
select
id
from trips
where departure = 'RTW');

-- 4. Найдите самолеты, построенные позже 1990 года и хотя бы раз слетавшие в Домодедово (код аэропорта DME).
-- В выборке должны присутствовать три атрибута: id, model_name, production_year.

select
t1.id,
t1.model_name,
t1.production_year
from airliners t1
inner join trips t2
on t1.id = t2.airliner_id
where t1.production_year > 1990
and t2.arrival in ('DME');

select
id,
model_name,
production_year
from airliners 
where production_year > 1990
and id in (
select
airliner_id
from trips
where arrival ='DME'
);

-- 5. Найдите задержанные рейсы на самолеты с дальностью полета меньше 10000 километров.
-- В выборке должен присутствовать один атрибут - id.

select
t1.id
from airliners t1
inner join trips t2
on t1.id = t2.airliner_id
where t2.status = 'Delayed'
and t1._range < 10000












