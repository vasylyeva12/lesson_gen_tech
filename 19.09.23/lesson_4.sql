create database tmp;

use tmp;
create table users (
id integer primary key auto_increment,
First_name varchar(128) null,
last_name varchar (128) not null,
user_name varchar(128) unique,
age int check (age between 0 and 140),
role varchar(16) check(role IN ('admin', 'root', 'manager'))
);

insert into users (first_name, last_name, user_name, age, role)
values ('Гайк', 'Инанц', 'gaga_1', 30, 'admin');
-- создать таблицу product со следующими полями 
-- id - автоинкремент
-- title не null
-- price больше 0
-- count от 0 до 10
-- vin уникальный

create table product (
id integer primary key auto_increment,
title varchar(128) not null,
price integer check (price > 0),
count integer check (count between 0 and 10),
vin varchar(128) unique);


insert into product (title, price, count, vin)
values ('BMW', '30000', '1', 'wrdkk3gg5jk');

insert into product (title, price, count, vin)
values ('Mersedes', '45000', '5', 'wrdkk3ggfts');

insert into product (title, price, count, vin)
values ('Ford', '12000', '8', 'wrdkk3ggfts');

insert into product (title, price, count, vin)
values ('Renault', '25000', '5', 'wrdk3gasfts');

insert into product (title, price, count, vin)
values ('Opel', '14000', '6', 'wrdkk3grfts');

insert into product (title, price, count, vin)
values ('Mazda', '24000', '3', 'wrdkk3ldfts');

insert into product (title, price, count, vin)
values ('Porsche', '140000', '2', 'fgdrk3ggfts');
DELETE FROM product ;

set sql_safe_updates = 0;
select * from product;

insert into product (title, price, count, vin) 
 values ('велосипед', 3500,  5,  'fewvrb');

insert into product (title, price, count, vin) 
 values ('ролики',    700,   2,  'hrtefe');

insert into product (title, price, count, vin) 
 values ('самокат',   1200,  4,  'fwewh');

insert into product (title, price, count, vin) 
 values ('лыжи',      1700,  1,  'fe3rwge');

insert into product (title, price, count, vin) 
 values ('коньки',    1350,  0,  'd2ewg4');

insert into product (title, price, count, vin) 
 values ('сноуборд',  2200,  3,  'g54erw');

insert into product (title, price, count, vin) 
 values ('санки',     450,   2,  '2df3gy5');
 
 -- у тех товаров, у которых кол-во меньше 3  указать кол-во 0
 
 update product
 set count = 0
 where count < 3;
 
 select * from product;
 


use tmp;

create table products (
id  integer primary key auto_increment,
title varchar (64),
quantity integer check (quantity between 0 and 10)
);

insert into products (title, quantity) 
 values ('велосипед', 5);

insert into products (title, quantity) 
 values ('ролики', 2);

insert into products (title, quantity) 
 values ('самокат', 4);

insert into products (title, quantity) 
 values ('лыжи', 1);

insert into products (title, quantity) 
 values ('коньки', 5);

insert into products (title, quantity) 
 values ('сноуборд', 3);

insert into products (title, quantity) 
 values ('санки', 2);
 
 -- 4. Добавить поле price (integer) со значением по умолчанию 0
 
alter table products
add column price integer default 0;

-- 5. У поля price изменить тип данных на numeric(8, 2)

alter table products
modify column price numeric(8, 2);

-- 6. Переименовать поле price на item_price
alter table products
rename column price to item_price;

insert into products (title, quantity) 
 values ('сани', 7);
 
-- 7. Всем продуктам, количество которых превышает 6 (>6) установить в поле price значение 100. 
-- 8. Всем продуктам увеличить текущее значение price на 150

use hr;

select 
first_name,
last_name
from employees
where first_name like '%_ll_%';

select 
first_name,
last_name,
commission_pct
from employees
where commission_pct is not null;

select distinct
job_id
from employees;

select distinct
job_id
from employees
where commission_pct is null
or salary < 3000;

create database Group_090523_300523;
use Group_090523_300523;

create table goods (
id integer primary key auto_increment,
title varchar(30),
quantity integer check (quantity > 0) default 10,
price numeric(7, 2),
in_stock char (1) check (in_stock in ("Y","N"))
);

insert into goods(title, quantity, price, in_stock)
values ('sweater', 12, 35.99, 'Y'),
       ('T-shirt', 20, 6.89, 'Y'),
       ('pants', 15, 18, 'Y'),
       ('skirt', 7, 22, 'N'),
       ('blouse', 23, 17, 'N'),
       ('suit', 10, 45, 'Y'),
       ('shorts', 6, 16.99, 'Y'),
       ('hat', 30, 5, 'Y'),
       ('jacket', 14, 60, 'N'),
       ('coat', 13, 80.99, 'Y');
       
       select * from goods;
       
insert into goods(title, price, in_stock)
values ('sweatshirt', 35.99, 'Y');

drop table goods;

delete from goods
where title in('Jacket');

set sql_safe_updates = 0;

-- Сбросить таблицу до изначального состояния

truncate goods;

-- переименовать товар

update goods
set title = 'Sweatshirt'
where id =1;

-- Всем товарам дороже 22 увеличить количество на 10
update goods
set price = price + 10
where price > 22;

select * from goods;

update goods
set quantity = quantity + 10
where price > 22;

-- товар с айди от 2 до 5 поменять значение поле price на 7

update goods
set price = 7
where id between 2 and 5;

-- Товарам в названии которых есть 'o' почистить значение в поле price

update goods
set price = null
where title like '%o%';

alter table goods
add column country varchar(64);       

select * from goods;

alter table goods
drop column country;

alter table goods
add column country varchar(64) default 'Germany'; 

alter table goods
rename column country to origin_country;

-- ПРАКТИКА

-- 1. Создать таблицу students c полями

-- id первичный ключ авто инкремент
-- name (строка 64, не null)
-- lastname (строка 64, не null)
-- avg_mark (от 0 до 5)
-- gender varchar(128) (или “M” или “F”)

create table students (
id integer primary key auto_increment,
name varchar(64) not null,
last_name varchar(64) not null,
avg_mark numeric (2,1) check (avg_mark between 0 and 5),
gender varchar(128)  check (gender in ('M', 'F'))
);

insert into students(name, last_name, avg_mark, gender) values ("Олег", "Петров", 4.3,    "M");
insert into students(name, last_name, avg_mark, gender) values ("Семен", "Степанов", 3.1, "M");
insert into students(name, last_name, avg_mark, gender) values ("Ольга", "Семенова", 4.7, "F");
insert into students(name, last_name, avg_mark, gender) values ("Игорь", "Романов", 3.1,  "M");
insert into students(name, last_name, avg_mark, gender) values ("Ирина", "Иванова", 2.2,  "F");

select * from students;

-- 3. Поменять у поля gender тип данных на char(1)

alter table students
modify column gender char(1);

-- 4. У поля name изменить название на first_name

alter table students
rename column name to first_name;

-- 5. Увеличить всем учащимся оценку в 10 раз
set sql_safe_updates = 0;

alter table students
modify column avg_mark numeric (3.1);

alter table students
drop check students_chk_1;



update students
set avg_mark = avg_mark * 10;









 
 

