CREATE VIEW UpdatableSiswa AS
SELECT * FROM siswa;

UPDATE UpdatableSiswa
SET nama_siswa = 'Ani Rahayu', alamat = 'Jl. Diponegoro 30', tanggal_lahir = '2006-03-20', kelas = '10D'
WHERE id_siswa = 3;
SELECT * FROM UpdatableSiswa;

CREATE VIEW UpdatableGuru AS
SELECT * FROM guru;

INSERT INTO UpdatableGuru (id_guru, nama_guru, alamat, nomor_telepon, mata_pelajaran)
VALUES (21, 'Bapak Joko', 'Jl. A. Yani 105', '081234567890', 'Bahasa Arab');
SELECT * FROM UpdatableGuru;

CREATE VIEW InfoAbsensi AS
SELECT A.id_absensi, S.nama_siswa, A.status
FROM Absensi A
JOIN Siswa S ON A.id_siswa = S.id_siswa;
SELECT * FROM InfoAbsensi;

CREATE VIEW InfoJadwal AS
SELECT JP.id_guru, G.nama_guru, G.mata_pelajaran, JP.hari
FROM JadwalPelajaran JP
JOIN Guru G ON JP.id_guru = G.id_guru;

SELECT * FROM InfoJadwal
