			--While Döngüleri

-- 1 ile 10 arasındaki değerleri ekrana yazdıran sorgu
Do $$
Declare sayac int:= 1;
toplam int:= 0;
BEGIN
	while sayac<=10
	loop
		raise notice 'sayaç: %',sayac;
		toplam:= sayac + toplam;
		sayac:= sayac + 1;
	end loop;
	raise notice '1 ile 10 arasındaki sayıların toplamı: %',toplam;
end $$;