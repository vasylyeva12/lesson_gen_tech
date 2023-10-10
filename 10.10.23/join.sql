-- SELECT 
-- t1.first_name, 
-- t1.last_name,
-- t2.item
-- FROM Customers t1
-- inner join orders t2
-- on t1.customer_id = t2.customer_id;

-- ПРАКТИК

-- USE HR;

-- drop database hr;

-- 1. Вывести имя, фамилию сотрудника и название департамента, в котором он работает 

-- Какие поля нужно вывести
-- В каких таблицах есть нужные поля
-- Как эти таблицы могут быть объединены (по какому полю)

select
t1.first_name,
t1.last_name,
t2.department_name
from employees t1
inner join departments t2
on t1.department_id = t2.department_id;


select
t1.first_name,
t1.last_name,
t2.job_title
from employees t1
inner join jobs t2
on t1.job_id = t2.job_id;










     
      
       
        
     
    