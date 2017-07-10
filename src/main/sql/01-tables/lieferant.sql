drop table if exists lieferant cascade;
---
create table lieferant (
  id    integer not null,
  name  varchar(1024) not null
);
---
create unique index lieferant_pk on lieferant(id);
alter table lieferant
  add primary key
  using index lieferant_pk
;
---
drop sequence if exists seq_lieferant;
---
create sequence seq_lieferant
  minvalue 1
  maxvalue 2147483647
  no cycle
  owned by lieferant.id
;
---
alter table lieferant alter column id set default nextval('seq_lieferant');
