do $$
declare toplam int;
declare toplam2 int;
declare fark int;
BEGIN 
toplam:= (select count(*) from dersler);
toplam2:=(select count(*) from dersler where length(dersad)>10);
fark:=(toplam-toplam2);
raise notice 'Toplam Ders Sayısı: %',toplam;
raise notice '10 karakterden uzun isme sahip ders sayısı: %',toplam2;
raise notice 'Kalan ders sayisi %',fark;
end $$;