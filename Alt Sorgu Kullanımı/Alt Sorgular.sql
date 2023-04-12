--Alt Sorgular
select * from musteri where bakiye = (select max(bakiye) from musteri)

--Şehri istanbul olam müşteriler arasındaki en yüksek bakiyeye sahip olan müşteri
select * from musteri where bakiye = (select max(bakiye) from musteri
where sehir = 'İstanbul');

--Mesleği öğretmen olan müşterilerin bilgilerini yazdıran sorgu
select * from musteri where meslek = (select id from meslek where ad = 'öğretmen')

--Mesleği mühendis olan müşterilerin bakiyesine %10 zam yapan sorgu
UPDATE musteri set bakiye = bakiye + bakiye/10 where meslek =
(SELECT id from meslek where ad = 'mühendis')

select * from musteri

--Ankara ili içerisindeki öğretmenleri getiren sorgu
select * from musteri where sehir = 'Ankara' and meslek = 
(select id from meslek where ad = 'öğretmen')

--Mühendislik fakültesindeki bölümleri listeleyen sorgu
select * from bolum where bolumf = (select id from fakulte where ad = 'mühendis')

--Her bir fakültede kaç tane bölüm olduğunu gösteren sorgu
select ad, count(*) from bolum inner join fakulte on bolum.bolumf = fakulte.id
GROUP BY ad order by ad

--Bölüm tablosunda en fazla bölümü bulunan fakültenin ismini listeleyen sorgu
select fakulte.ad, count(*) ct from fakulte inner join bolum
on fakulte.id = bolum.bolumf
group by fakulte.ad order by ct desc limit 1