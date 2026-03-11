select menu.id as menu_id from menu
left join person_order on menu.id = person_order.menu_id
where person_order.menu_id is null
order by menu_id