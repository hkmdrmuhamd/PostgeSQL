create VIEW view1
as
select o.ogrenci_id, o.ad ogrenci_adi, gi.ogrenci_id ogrenci_girer, i.islenir_id,
dk.ad derslik_ad,an.anlatir_id,d.ders_id, d.ad ders_ad,h.hoca_id, h.ad hoca_ad
from ogrenciler o 
left join girer gi on gi.ogrenci_id = o.ogrenci_id
left join islenir i on i.islenir_id = gi.islenir_id
left join derslik dk on dk.derslik_id = i.derslik_id
left join anlatir an on an.anlatir_id = i.anlatir_id
left join dersler d on d.ders_id = an.ders_id
left join hocalar h on h.hoca_id = an.hoca_id
order by 1


create MATERIALIZED view mdview
AS
select o.ogrenci_id, o.ad ogrenci_adi, gi.ogrenci_id ogrenci_girer, i.islenir_id,
dk.ad derslik_ad,an.anlatir_id,d.ders_id, d.ad ders_ad,h.hoca_id, h.ad hoca_ad
from ogrenciler o 
left join girer gi on gi.ogrenci_id = o.ogrenci_id
left join islenir i on i.islenir_id = gi.islenir_id
left join derslik dk on dk.derslik_id = i.derslik_id
left join anlatir an on an.anlatir_id = i.anlatir_id
left join dersler d on d.ders_id = an.ders_id
left join hocalar h on h.hoca_id = an.hoca_id
order by 1

REFRESH MATERIALIZED VIEW mdview;

insert into ogrenciler(ad) values ('ikbal')

select * from mdview