create sequence seq_person_discount start 1;
select setval('seq_person_discount', (select max(id) from person_discounts));

alter table person_discounts
    alter column id set default nextval('seq_person_discount');
