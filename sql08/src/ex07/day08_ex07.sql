/*Сессия #1*/
begin transaction;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;
/*Сессия #2*/
begin transaction;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;
/*Сессия #1*/
update pizzeria set rating = 1 where id = 1;
/*Сессия #2*/
update pizzeria set rating = 2 where id = 2;
/*Сессия #1*/
update pizzeria set rating = 1 where id = 2;
/*Сессия #2*/
update pizzeria set rating = 2 where id = 1;
/*Сессия #1*/
commit;
/*Сессия #2*/
commit;