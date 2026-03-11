/*Сессия #1*/
begin transaction;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;
/*Сессия #2*/
begin transaction;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;
/*Сессия #1*/
select sum(rating) from pizzeria;
/*Сессия #2*/
insert into pizzeria(id, name, rating) values (11, 'Kazan Pizza 2', 4);
/*Сессия #2*/
commit;
/*Сессия #1*/
select sum(rating) from pizzeria;
/*Сессия #1*/
commit;
/*Сессия #1*/
select sum(rating) from pizzeria;
/*Сессия #2*/
select sum(rating) from pizzeria;
