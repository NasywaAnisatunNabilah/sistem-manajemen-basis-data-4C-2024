--1
CREATE TABLE IF NOT EXISTS log_absensi (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_absensi INT,
    id_siswa INT,
    id_jadwal INT,
    tanggal DATE,
    STATUS INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //
CREATE TRIGGER after_absensi_insert
AFTER INSERT ON absensi
FOR EACH ROW
BEGIN
    INSERT INTO log_absensi (id_absensi, id_siswa, id_jadwal, tanggal, STATUS)
    VALUES (NEW.id_absensi, NEW.id_siswa, NEW.id_jadwal, NEW.tanggal, NEW.status);
END//
DELIMITER ;
INSERT INTO absensi (id_absensi, id_siswa, id_jadwal, tanggal, STATUS)
VALUES (21, 3, 4, '2024-04-20', 1);
SELECT * FROM log_absensi;

--2
DELIMITER //
CREATE TRIGGER cek_status_non_negatif
BEFORE INSERT ON matapelajaran
FOR EACH ROW
BEGIN
    IF NEW.tingkat_kelas < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tingkat kelas tidak boleh negatif';
    END IF;
END//
DELIMITER ;
INSERT INTO matapelajaran (id_mapel, nama_mapel, tingkat_kelas) VALUES (21, 'Matematika', -10);
SELECT * FROM matapelajaran;

--3
DELIMITER //
CREATE TRIGGER update_data 
AFTER UPDATE ON matapelajaran
FOR EACH ROW
BEGIN
    UPDATE jadwalpelajaran
    SET nama_mapel = NEW.nama_mapel
    WHERE id_mapel = OLD.id_mapel;
END//
DELIMITER ;
UPDATE matapelajaran
SET nama_mapel = 'Matematika'
WHERE id_mapel = 1;

--4
DELIMITER //
CREATE TRIGGER cek_no_telepon
BEFORE INSERT ON guru
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.nomor_telepon) < 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nomor Telepon harus terdiri dari minimal 10 angka';
    END IF;
END //
DELIMITER ;
INSERT INTO guru (id_guru, nama_guru, alamat, nomor_telepon, mata_pelajaran)
VALUES (21, 'Anisatun Nabilah', 'Jl. Veteran No. 30', '12345678', 'SMBD');
SELECT * FROM guru WHERE id_guru = 21;
