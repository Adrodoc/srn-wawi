drop table if exists baugruppe cascade;
---
create table baugruppe (
  id    integer not null,
  name  varchar(128) not null
);
---
create unique index baugruppe_pk on baugruppe(id);
alter table baugruppe
  add primary key
  using index baugruppe_pk
;
---
drop sequence if exists seq_baugruppe;
---
create sequence seq_baugruppe
  minvalue 1
  maxvalue 2147483647
  no cycle
  owned by baugruppe.id
;
---
alter table baugruppe alter column id set default nextval('seq_baugruppe');
