--Right Join (Null değer olmadan)
Select * from ögrenci o right join dersler d on o.ögrencino=d.ögrencino

--Right Join (Null değer olduğu zaman)
Select * from dersler d right join ögrenci o on o.ögrencino=d.ögrencino