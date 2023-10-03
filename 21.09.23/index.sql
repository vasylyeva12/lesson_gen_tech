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
 
 select * from product
