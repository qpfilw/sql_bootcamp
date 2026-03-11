select name, count(person_id) as count_of_visits from person_visits
left join person on person_id = person.id
group by name having count(person_id) > 3