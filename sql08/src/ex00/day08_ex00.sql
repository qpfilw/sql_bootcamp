/*1. создадим нового пользователя для того, чтобы обеспечить два разных сеанса*/
    create user kylalayl1 with password '12345';
    grant all privileges on database "day08" to kylalayl1; /*дали права к бд*/
    grant all privileges on all tables in schema public to "kylalayl1"; /*дали права к таблицам*/
/*2. открываем две консоли и заходим с разных пользователей*/
/*3. прописываем start transaction и меняем значение таблицы pizzeria у пользователя postgres*/
    start transaction;
    update pizzeria set rating = 5 where name = 'Pizza Hut';
/*4. выводим значение таблицы у kylalayl1 до коммита. замечаем, что остались старые данные*/
    select * from pizzeria where name  = 'Pizza Hut';
/*5. после коммита, данные обновлены*/


/*первая сессия*/
start transaction;
update pizzeria set rating = 5 where name = 'Pizza Hut';
commit;

/*вторая сессия*/
select * from pizzeria where name  = 'Pizza Hut';


