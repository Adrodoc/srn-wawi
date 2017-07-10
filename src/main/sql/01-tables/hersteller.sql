drop table if exists hersteller cascade;
---
create table hersteller (
  id    integer not null,
  name  varchar(1024) not null
);
---
create unique index hersteller_pk on hersteller(id);
alter table hersteller
  add primary key
  using index hersteller_pk
;
---
drop sequence if exists seq_hersteller;
---
create sequence seq_hersteller
  minvalue 1
  maxvalue 2147483647
  no cycle
  owned by hersteller.id
;
---
alter table hersteller alter column id set default nextval('seq_hersteller');
