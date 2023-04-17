--Sisteme yeni bir ders kaydý yapýldýðý zaman otomatik olarak toplamders tablosundaki veriyi 1 artýran trigger fonksiyonu
create or replace function test()
returns TRIGGER
language plpgsql
as
$$
begin
update toplamders set sayi=sayi+1;
return new;
end; $$

create trigger testtrig after insert on dersler for each row execute procedure test()

insert into dersler values (default,'MySQL')

select * from toplamders