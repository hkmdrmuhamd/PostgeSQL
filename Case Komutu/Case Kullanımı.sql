			--Case Kullanımı

--Bölümidleri 1 olana yazılım 2 olana mekatronik 3 olana elektronik 4 olana makine yazan sorgu
Select dersad,bolumid,
	case 
		when bolumid = 1
	then 'yazılım'
		when bolumid = 2
	then 'mekatronik'
		when bolumid = 3
	then 'elektronik'
		else 'makine'
end yenikolon
from dersler