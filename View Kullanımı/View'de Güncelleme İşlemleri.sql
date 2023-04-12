--View'de Güncelleme İşlemleri
DROP VIEW IF EXISTS view1;
CREATE VIEW view1
AS
select bolum.bolumid,bolum.bolumad,fakulte.ad,dersler.dersad
from bolum inner join fakulte on bolum.bolumf = fakulte.id
inner join dersler on bolum.bolumid = dersler.bolumi

--Şartı sağlamayan ifadeyi insert etmemek için with check option komutunu kullanırız.
Drop view if EXISTS view2;
create view view2
as
select dersler.id,dersler.dersad,dersler.kontenjan,dersler.bolumid
from dersler where length(dersad)>12 with check OPTION;
--insert into view2 (id,dersad) values (8,'oop') ifadesini çalıştırmaz çünkü oop 3 karakter