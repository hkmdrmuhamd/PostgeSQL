			--Loop Kullanýmý
Do $$
Declare sayac int:=0;
BEGIN
	loop
		exit when sayac = 5;
		raise notice 'sayý deðeri: %',sayac;
		sayac:=sayac+1;
	end loop;
end $$;