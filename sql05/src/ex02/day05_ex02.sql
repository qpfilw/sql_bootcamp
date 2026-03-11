create index idx_person_name on person (UPPER(name));

set enable_seqscan = off;

explain analyze
select name from person 
order by UPPER(name)