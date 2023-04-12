--Group By Komutu
select sehir,count(*) as sırala from musteri group by sehir
select sehir,sum(bakiye) as toplam from musteri group by sehir
select sehir,avg(bakiye) as ortalama from musteri group by sehir