			--Procedure  Kullanımı

Create Procedure deneme()
language plpgsql
as $$
begin
raise notice 'Hello World';	
end $$;

call deneme() --procedure'ü çağırma şekli

--Procedure üzerinde güncelleme işlemi
Create or Replace Procedure deneme()
language plpgsql
as $$
begin
raise notice 'Hello World I"m muhammed';	
end $$;

--Procedure'leri parametre olarak kullanmak(procedure üzerinden fakülte eklemek)
create or replace procedure insertion(p1 integer,p2 varchar(10))
language plpgsql
as $$
begin
insert into fakulte(id,ad) values (p1,p2);
end $$;

call insertion(999,'gönderildi')