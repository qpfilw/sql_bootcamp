select address, pizzeria.name, count(*) as count_of_orders from person_order
left join menu on menu_id = menu.id
left join person on person_id = person.id
left join pizzeria on pizzeria_id = pizzeria.id
group by address, pizzeria.name
order by address, pizzeria.name