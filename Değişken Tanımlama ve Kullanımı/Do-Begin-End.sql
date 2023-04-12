do $$
declare x int:=20; --declare değer ataması yapar
		y int:=15;
BEGIN
raise notice 'Sayı 1: %',x; --raise notice ekrana basma komutu
raise notice 'Sayı 2: %',y;
end $$;
