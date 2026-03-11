create view v_generated_dates as
/* если убрать date_trunc, даты будут выводиться с часовым поясом . данная функция по сути "отрезает" часовой пояс*/
    select date_trunc('day', gd)::date as generated_date
	from generate_series('2022-01-01'::date,
            			'2022-01-31'::date,
            			'1 day'::interval) as gd
order by gd

