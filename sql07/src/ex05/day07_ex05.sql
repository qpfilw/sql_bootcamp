select distinct person.name from person_order
left join person on person.id = person_order.person_id
order by person.name