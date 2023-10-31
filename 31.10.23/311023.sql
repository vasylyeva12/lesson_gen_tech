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