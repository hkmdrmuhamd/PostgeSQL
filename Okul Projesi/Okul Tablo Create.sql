CREATE table derslik(
	derslik_id serial PRIMARY KEY not null,
	ad VARCHAR(20),
	created_by integer DEFAULT 0,
	created_at TIMESTAMP with time zone default CURRENT_TIMESTAMP,
	update_by INTEGER DEFAULT 0,
	updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ogrenciler(
	ogrenci_id serial PRIMARY KEY not NULL,
	ad VARCHAR(20),
	created_by integer DEFAULT 0,
	created_at TIMESTAMP with time zone default CURRENT_TIMESTAMP,
	update_by INTEGER DEFAULT 0,
	updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dersler(
	ders_id serial PRIMARY KEY NOT NULL,
	ad VARCHAR(20),
	created_by integer DEFAULT 0,
	created_at TIMESTAMP with time zone default CURRENT_TIMESTAMP,
	update_by INTEGER DEFAULT 0,
	updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE hocalar(
	hoca_id serial PRIMARY KEY NOT NULL,
	ad VARCHAR(20),
	created_by integer DEFAULT 0,
	created_at TIMESTAMP with time zone default CURRENT_TIMESTAMP,
	update_by INTEGER DEFAULT 0,
	updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE anlatir(
	anlatir_id serial PRIMARY KEY NOT NULL,
	hoca_id integer,
	ders_id integer,
	created_by integer DEFAULT 0,
	created_at TIMESTAMP with time zone default CURRENT_TIMESTAMP,
	update_by INTEGER DEFAULT 0,
	updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	UNIQUE(hoca_id,ders_id)
);

CREATE TABLE islenir(
	islenir_id serial PRIMARY KEY NOT NULL,
	derslik_id integer,
	anlatir_id integer,
	created_by integer DEFAULT 0,
	created_at TIMESTAMP with time zone default CURRENT_TIMESTAMP,
	update_by INTEGER DEFAULT 0,
	updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	UNIQUE(derslik_id,anlatir_id)
);

CREATE TABLE girer(
	ogrenci_id integer,
	islenir_id integer,
	created_by integer DEFAULT 0,
	created_at TIMESTAMP with time zone default CURRENT_TIMESTAMP,
	update_by INTEGER DEFAULT 0,
	updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	UNIQUE(ogrenci_id,islenir_id)
);