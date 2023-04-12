			--Fonksiyon Kullanımı
--Fonksiyonların Procedure'lerden farkı geri dönüş değeri sağlaması

Create Function toplam(s1 int,s2 int)
returns int
language plpgsql
as $$
	declare sonuc int;
BEGIN
	sonuc:=s1+s2;
	return sonuc;
end $$;

Select toplam(45,30)

--Kitaplar tablosundaki fiyatlara %8 kdv uygulayan fonksiyon
create or replace FUNCTION kdvHesap(kdv float)
returns float
language plpgsql
as $$
BEGIN
	kdv:=kdv*0.08+kdv;
	return kdv;
end $$;

select id,ad,yazar,tarih,fiyat,kdvHesap(fiyat) from kitaplar 

--İçinde kullanıcının girdği değeri buluduran kitapları ekrana basan fonksiyon
Create or replace function kitapGetir(degerGir varchar)
returns table(
		kitapid int,
		kitapad varchar,
		kitapyazar varchar,
		kitaptarih date,
		kitapfiyat integer
)
as $$
begin
	return Query
	Select 
		id,
		ad,
		yazar,
		tarih,
		fiyat
	from kitaplar where ad like degerGir;
End $$
language plpgsql;

select * from kitapGetir('%s%')