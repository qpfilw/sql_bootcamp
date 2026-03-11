with ppl as (
	select pizzeria.name, gender from person_visits
	join person on person.id = person_visits.person_id
	join pizzeria on pizzeria.id = person_visits.pizzeria_id
),
man_name as (select name from ppl where gender = 'male'),
wom_name as (select name from ppl where gender = 'female')

select name as pizzeria_name from (
(select * from man_name except all select * from wom_name)
union all
(select * from wom_name except all select * from man_name)
) as name_all
order by pizzeria_name