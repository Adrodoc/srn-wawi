drop table if exists artikel cascade;
---
create table artikel (
  id                integer not null /* srn_nr */,
  baugruppe_id      integer not null,
  ean               integer,

  hersteller_id     integer,
  bezeichnung_herst varchar(1024),
  art_nr_herst      varchar(64),

  lieferant_id      integer,
  art_nr_lieferant  varchar(64),

  suchbegriff       varchar(1024),
  tech_spec         varchar(32768),
  funktion          varchar(1024),
  einheit           varchar(8)  check (einheit in ('Stk', 'm', 'km', 'Tag')),
  verpack_einheit   integer not null,
  min_best_menge    integer not null,
  list_preis        integer,
  rabatt            varchar(64) /* TODO in auswertbare Form bringen? */,
  ek_preis          integer,
  lagerort          varchar(64),
  std_lieferzeit    varchar(64) /* TODO in auswertbare Form bringen? */,
  zweck_code        char(3) not null    check (zweck_code in ('PRO', 'ÜBE', 'DAT', 'EIG', 'LEI', 'NBS', 'TEC', 'ABS'))
);
---
comment on column artikel.list_preis is 'Listenpreis in Cent ohne MwSt';
---
comment on column artikel.ek_preis is 'Einkaufspreis  in Cent ohne MwSt';
---
create unique index artikel_pk on artikel(id);
alter table artikel
  add primary key
  using index artikel_pk
;
---
drop sequence if exists seq_artikel;
---
create sequence seq_artikel
  start with 100378 /* 1+ max srn_nr */
  minvalue 1
  maxvalue 2147483647
  no cycle
  owned by artikel.id
;
---
alter table artikel alter column id set default nextval('seq_artikel');
