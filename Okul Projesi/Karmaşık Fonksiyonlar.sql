create or replace FUNCTION kontrol(p_ogrenci_adi varchar(20), p_ders_adi varchar(20),p_derslik_adi varchar(20), p_hoca_adi varchar(20))
returns table (
    	g_ogrenci_id integer,
    	g_ogrenci_adi varchar(20),
    	g_ders_id integer,
    	g_ders_adi varchar(20),
    	g_derslik_id integer,
    	g_derslik_adi varchar(20),
    	g_hoca_id integer,
    	g_hoca_adi varchar(20),
	g_anlatir_id integer,
	g_anlatird_id integer,
	g_islenir_id integer,
	g_girer_id integer
)
as $$
	declare
		l_ogrenci_id integer;
		l_ogrenci_adi VARCHAR(20);
		l_ders_id integer;
		l_ders_adi VARCHAR(20);
		l_derslik_id integer;
		l_derslik_adi VARCHAR(20);
		l_hoca_id integer;
		l_hoca_adi VARCHAR(20);
		l_anlatir_id integer;
		l_anlatird_id integer;
		l_islenir_id integer;
		l_girer_id integer;
	begin
		select ogrenci_id,ad into l_ogrenci_id,l_ogrenci_adi
		from ogrenciler
		where ad = p_ogrenci_adi;
		if not found then
			insert into ogrenciler(ad) values(p_ogrenci_adi) returning ogrenci_id,ad into l_ogrenci_id,l_ogrenci_adi;
		end if;
		
		select ders_id,ad into l_ders_id,l_ders_adi
		from dersler
		where ad = p_ders_adi;
		if not found then
			insert into dersler(ad) values(p_ders_adi) returning ders_id,ad into l_ders_id,l_ders_adi;
		end if;
		
		select derslik_id,ad into l_derslik_id,l_derslik_adi
		from derslik
		where ad = p_derslik_adi;
		if not found then
			insert into derslik(ad) values(p_derslik_adi) returning derslik_id,ad into l_derslik_id,l_derslik_adi;
		end if;
		
		select hoca_id,ad into l_hoca_id,l_hoca_adi
		from hocalar
		where ad = p_hoca_adi;
		if not found then
			insert into hocalar(ad) values(p_hoca_adi) returning hoca_id,ad into l_hoca_id,l_hoca_adi;
		end if;
		
		select anlatir.hoca_id,anlatir.ders_id into l_anlatir_id,l_anlatird_id
		from anlatir
		where anlatir.hoca_id = l_hoca_id
		and anlatir.ders_id = l_ders_id;
		if not found then
			insert into anlatir(hoca_id,ders_id) values(l_hoca_id,l_ders_id) returning anlatir.hoca_id,anlatir.ders_id into l_anlatir_id,l_anlatird_id;
		end if;
		
		select derslik_id into l_islenir_id
		from islenir
		where islenir.derslik_id = l_derslik_id;
		if not found then
			insert into islenir(derslik_id) values(l_derslik_id) returning derslik_id into l_islenir_id;
		end if;
		
		select ogrenci_id into l_girer_id
		from girer
		where girer.ogrenci_id = l_ogrenci_id;
		if not found then
			insert into girer(ogrenci_id) values(l_ogrenci_id) returning ogrenci_id into l_girer_id;
		end if;
		
		return query select l_ogrenci_id, l_ogrenci_adi,l_ders_id, l_ders_adi,l_derslik_id, l_derslik_adi,l_hoca_id,l_hoca_adi,l_anlatir_id,l_anlatird_id,l_islenir_id,l_girer_id;
	end;
$$ language plpgsql;
