                --Karar Yapıları
Do $$
DECLARE
Sinav1 int:=75;
Sinav2 int:=89;
Sinav3 int:=60;
ortalama int;
BEGIN
ortalama:=(Sinav1+Sinav2+Sinav3)/3;
raise notice 'Öğrenci sınav ortalaması: %',ortalama;
if ortalama>=50 then
raise notice 'Öğrenci Dersi Geçti';
else 
raise notice 'Öğrenci Dersten Kaldı';
end if;
end $$;

--2 nolu id'de kaç ders olduğunu bulan sorgu
Do $$
DECLARE adet int;
BEGIN
	adet:= (select count(*) from dersler where bolumid=2);
if adet>3 then
	raise notice '2 nou id"de 3"ten daha fazla ders vardır.';
elsif adet=3 then
	raise notice '2 nou id"de 3 tane ders vardır.';
else 
	raise notice '2 nou id"de 3"ten daha az ders vardır.';
end if;
end $$;

--Bölüm adı yazılım olan dersin kodunun 3'ten fazla mı yoksa 3'ten az mı olduğunu veren sorgu
Do $$
Declare 
	adet int;
BEGIN
	adet:= (select count(*) from dersler where dersler.bolumid = (
	select bolum.bolumid from bolum where bolumad='yazılım'));
	if adet > 3 then
		raise notice 'Yazılım dersi 3"ten fazladır.';
	elsif adet = 3 then
		raise notice 'Yazılım dersi 3"e eşittir.';
	else
		raise notice 'Yazılım dersi 3"ten azdır.';
	end if;
end $$;