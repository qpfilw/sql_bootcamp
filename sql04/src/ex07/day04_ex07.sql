insert into person_visits 
values ((select max(id) + 1 from person_visits), (select id from person where name = 'Dmitriy'),
		 (select pizzeria_id from menu
		  left join pizzeria on pizzeria.id = menu.pizzeria_id where price < 800 and pizzeria.name != 'Papa Johns' limit 1),
		  '2022-01-08');

select pizzeria.name from person_visits
		left join person on person_id = person.id
		left join pizzeria on pizzeria_id = pizzeria.id
where visit_date = '2022-01-08' and person.name = 'Dmitriy'

intersect

select pizzeria.name from pizzeria
left join menu on menu.pizzeria_id = pizzeria.id where price < 800;

refresh materialized view mv_dmitriy_visits_and_eats;

select * from mv_dmitriy_visits_and_eats;

