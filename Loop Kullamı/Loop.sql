			--Loop Kullan�m�
Do $$
Declare sayac int:=0;
BEGIN
	loop
		exit when sayac = 5;
		raise notice 'say� de�eri: %',sayac;
		sayac:=sayac+1;
	end loop;
end $$;