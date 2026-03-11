with ppl as (
	select pizzeria.name, gender from person_order
	join person on person.id = person_order.person_id
	join menu on menu.id = person_order.menu_id
	join pizzeria on pizzeria.id = menu.pizzeria_id
),
man_name as (select name from ppl where gender = 'male'),
wom_name as (select name from ppl where gender = 'female')

select name as pizzeria_name from (
(select * from man_name except select * from wom_name)
union
(select * from wom_name except select * from man_name)
) as res
order by pizzeria_name