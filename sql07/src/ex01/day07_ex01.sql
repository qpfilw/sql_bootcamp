select person.name, count(person_id) as count_of_visits from person_visits
left join person on person_visits.person_id = person.id
group by person.name
order by count_of_visits desc, name asc
limit 4 