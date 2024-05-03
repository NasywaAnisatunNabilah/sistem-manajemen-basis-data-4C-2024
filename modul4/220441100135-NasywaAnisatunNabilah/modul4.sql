--1
SELECT * FROM siswa ORDER BY nama_siswa ASC;
SELECT * FROM matapelajaran ORDER BY tingkat_kelas DESC;
--2
SELECT tanggal, COUNT(*) AS jumlah_absensi
FROM absensi
GROUP BY tanggal
HAVING COUNT(*) > 1
--3
SELECT * FROM absensi WHERE tanggal BETWEEN '2024-04-15' AND '2024-04-19';
--4
SELECT mp.nama_mapel, COUNT(*) AS jumlah_pengajaran
FROM matapelajaran mp
LEFT JOIN jadwalpelajaran jp ON mp.id_mapel = jp.id_mapel
GROUP BY mp.nama_mapel
ORDER BY jumlah_pengajaran ASC
LIMIT 1;
--5
SELECT mp.nama_mapel AS Tipe_Pelajaran, COUNT(*) AS Jumlah_Pengajaran
FROM jadwalpelajaran jp
RIGHT JOIN matapelajaran mp ON jp.id_mapel = mp.id_mapel
GROUP BY mp.nama_mapel
ORDER BY Jumlah_Pengajaran ASC
LIMIT 1;
--6
SELECT *
FROM guru
WHERE nama_guru LIKE 'a%'
ORDER BY nama_guru;
--7
SELECT id_siswa, COUNT(*) AS jumlah_absensi
FROM absensi
GROUP BY id_siswa
ORDER BY jumlah_absensi DESC
LIMIT 1;
--8
SELECT id_siswa, COUNT(*) AS Jumlah_Absensi
FROM absensi
GROUP BY id_siswa
HAVING COUNT(*) = 1;
--9
SELECT s.id_siswa, s.nama_siswa, s.alamat, s.tanggal_lahir, s.kelas, a.id_absensi, a.id_jadwal, a.tanggal, a.status
FROM siswa s
LEFT JOIN absensi a ON s.id_siswa = a.id_siswa;




