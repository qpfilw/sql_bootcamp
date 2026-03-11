create view v_symmetric_union AS
	select person_id from 
	((select * from person_visits where visit_date = '2022-01-02' except select * from person_visits where visit_date = '2022-01-06') /*R - S*/
		union all /*∪*/
	(select * from person_visits where visit_date = '2022-01-06' except select * from person_visits where visit_date = '2022-01-02')) /*S - R*/
	as pv
order by person_id