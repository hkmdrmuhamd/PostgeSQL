--Öğrenciler içerisinde isminde a harfi geçen öğrencileri ekrana getiren fonksiyon
create or replace function ogrenci_listele(deger varchar)
returns table
(
	idsutun int,
	adstun varchar
)
as 
$$
begin 
Return Query 
select ogrenci_id,ad from ogrenciler where ad like deger;
end; $$
language plpgsql;

select * from ogrenci_listele('%a%')