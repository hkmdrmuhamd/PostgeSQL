--Şart İfadeleri
select * from musteri where ad = 'Mehmet';
select * from musteri where sehir = 'Ankara' and id = 5;
select * from musteri where sehir = 'Ankara' and id = 5 or sehir = 'Adana';
select * from musteri where bakiye>3000 or bakiye<=2500;