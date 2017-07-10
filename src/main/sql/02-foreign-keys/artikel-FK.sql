create index artikel_nx101 on artikel(baugruppe_id);
---
alter table artikel
  add constraint artikel_fk001
  foreign key (baugruppe_id)
  references baugruppe(id)
;
---
create index artikel_nx102 on artikel(hersteller_id);
---
alter table artikel
  add constraint artikel_fk002
  foreign key (hersteller_id)
  references hersteller(id)
;
---
create index artikel_nx103 on artikel(lieferant_id);
---
alter table artikel
  add constraint artikel_fk003
  foreign key (lieferant_id)
  references lieferant(id)
;
