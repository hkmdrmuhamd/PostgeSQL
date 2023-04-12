			--Trigger Kullanımı
Create or replace function test()
returns trigger
as $$
begin
	update toplamfakulte set sayi=sayi+1;
return new;
end $$
language plpgsql;

create trigger testtrig 
after insert on fakulte for each row execute procedure test();

select * from toplamfakulte

insert into fakulte(id,ad) values (789,'denemeee')