create or replace FUNCTION kontrol(p_ogrenci_adi varchar(20), p_ders_adi varchar(20),p_derslik_adi varchar(20), p_hoca_adi varchar(20),p_anlatir_id integer, p_hoca_kayit_id integer,p_islenir_id integer,p_derslik_kayit_id integer,p_ogrenci_kayit_id integer)
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
	g_hoca_kayit_id integer,
	g_islenir_id integer,
	g_derslik_kayit_id integer,
	g_ogrenci_kayit_id integer
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
	    l_hoca_kayit_id integer;
		l_islenir_id integer;
		l_derslik_kayit_id integer;
		l_ogrenci_kayit_id integer;
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
		
		select anlatir_id,anlatir.hoca_id into l_anlatir_id,l_hoca_kayit_id
		from anlatir
		where anlatir.hoca_id = p_hoca_kayit_id;
		if not found then
			insert into anlatir(anlatir.hoca_id) values(p_hoca_kayit_id) returning anlatir_id,anlatir.hoca_id into l_anlatir_id,l_hoca_kayit_id;
		end if;
		
		select islenir_id,derslik_id into l_islenir_id,l_derslik_kayit_id
		from islenir
		where derslik_id = p_derslik_kayit_id;
		if not found then
			insert into islenir(derslik_id) values(p_derslik_kayit_id) returning islenir_id,derslik_id into l_islenir_id,l_derslik_kayit_id;
		end if;
		
		select girer.ogrenci_id into l_ogrenci_kayit_id
		from girer
		where girer.ogrenci_id = p_ogrenci_kayit_id;
		if not found then
			insert into girer(girer.ogrenci_id) values(p_ogrenci_kayit_id) returning girer.ogrenci_id into l_ogrenci_kayit_id;
		end if;
		
		return query select l_ogrenci_id, l_ogrenci_adi,l_ders_id, l_ders_adi,l_derslik_id, l_derslik_adi,l_hoca_id,l_hoca_adi,l_anlatir_id,l_hoca_kayit_id,l_islenir_id,l_derslik_kayit_id,l_ogrenci_kayit_id;
	end;
$$ language plpgsql;