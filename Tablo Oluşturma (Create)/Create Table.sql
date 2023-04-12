--Tablo oluþturma
CREATE TABLE urun(
id integer PRIMARY KEY not null,
ad VARCHAR(15) not null,
marka VARCHAR(20),
stok INTEGER,
kategori VARCHAR(15)
);

CREATE table kategori(
id integer primary key not null,
ad TEXT
);