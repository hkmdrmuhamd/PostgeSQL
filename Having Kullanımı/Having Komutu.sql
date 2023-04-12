--Having Komutu
select sehir,count(*) from musteri GROUP by sehir having count(*)>3;
select avg(bakiye) as ortalama,sehir from musteri GROUP BY sehir HAVING avg(bakiye)>5000 and sehir like '%s%';