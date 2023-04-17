ALTER TABLE girer ADD COLUMN statu VARCHAR(10) DEFAULT 'aktif';

CREATE OR REPLACE FUNCTION update_student_status()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM girer WHERE ogrenci_id = OLD.ogrenci_id) THEN
        UPDATE girer SET statu = 'pasif' WHERE ogrenci_id = OLD.ogrenci_id;
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER delete_student_trigger
AFTER DELETE ON ogrenciler
FOR EACH ROW
EXECUTE FUNCTION update_student_status();

select * from girer

DELETE FROM ogrenciler WHERE ogrenci_id = 2;