--(Karmaşık sorguları gizlemek için kullanılırlar.Ayrıca kullanıcıların database'e 
--direkt olarak erişmesi yerine sadece ilgili kısma erişim sağlamasını gerçekleştirir.)

create view view1
as
select bolumid,bolumad,ad from bolum inner join fakulte on bolum.bolumf = fakulte.id