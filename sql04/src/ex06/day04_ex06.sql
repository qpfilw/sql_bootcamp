create materialized view mv_dmitriy_visits_and_eats as 
	select pizzeria.name from person_visits
		left join person on person_id = person.id
		left join pizzeria on pizzeria_id = pizzeria.id
	where visit_date = '2022-01-08' and person.name = 'Dmitriy'
intersect
	select pizzeria.name from pizzeria
	join menu on menu.pizzeria_id = pizzeria.id where price < 800