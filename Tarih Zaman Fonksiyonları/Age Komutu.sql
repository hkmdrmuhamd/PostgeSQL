--Age Komutu(Şimdiki zamanla girilen tarihin farkını verir)
Select age(TIMESTAMP '23.05.2023')

--Kitapların sisteme kayıt olalı ne kadar zaman geçtiğini gösteren sorgu
select ad,tarih,age(now(),tarih) from kitaplar