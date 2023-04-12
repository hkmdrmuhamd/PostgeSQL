--Left Join (Null değer olmadan)
Select * from dersler d left join ögrenci o on o.ögrencino=d.ögrencino

--Left Join (Null değer olduğu zaman)
Select * from ögrenci o left join dersler d on o.ögrencino=d.ögrencino