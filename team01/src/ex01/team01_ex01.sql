select t1.name, t1.lastname, currency_name, money * rate_to_usd as currency_in_usd
from (
		select coalesce(u.name, 'not defined') as name, 
		coalesce(u.lastname, 'not defined') as lastname,
		cur.name as currency_name, balance.money,
		coalesce((select rate_to_usd from currency as cur where 
			balance.currency_id = cur.id and cur.updated < balance.updated
			order by cur.updated desc
			limit 1), (select rate_to_usd from currency as cur where 
			balance.currency_id = cur.id and cur.updated > balance.updated
			order by cur.updated asc
			limit 1)) as rate_to_usd from balance 

		inner join

		(select cur.id, cur.name from currency as cur
		 group by cur.id, cur.name) as cur on cur.id = balance.currency_id

		 left join "user" as u on u.id = balance.user_id
) as t1

order by t1.name desc, t1.lastname, currency_name