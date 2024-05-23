--1
DELIMITER //
CREATE PROCEDURE HitungHariSejakAbsensiTerakhir(
    IN p_id_siswa INT,
    OUT p_hari INT
)
BEGIN
    DECLARE v_tanggal_terakhir DATE;
    DECLARE v_hari_sekarang DATE;

    SELECT MAX(tanggal)
    INTO v_tanggal_terakhir
    FROM absensi
    WHERE id_siswa = p_id_siswa;

    SET v_hari_sekarang = CURDATE();

    SET p_hari = DATEDIFF(v_hari_sekarang, v_tanggal_terakhir);
END //

DELIMITER ;
SET @hari = 0;
CALL HitungHariSejakAbsensiTerakhir(10, @hari);
SELECT @hari AS HariSejakAbsensiTerakhir;
--2
DELIMITER //
CREATE PROCEDURE JumlahAbsensiPerBulan(
    IN p_bulan INT,
    IN p_tahun INT,
    OUT p_jumlah INT
)
BEGIN
    SELECT COUNT(*)
    INTO p_jumlah
    FROM absensi
    WHERE MONTH(tanggal) = p_bulan
    AND YEAR(tanggal) = p_tahun;
END //
DELIMITER ;
SET @jumlah = 0;
CALL JumlahAbsensiPerBulan(4, 2024, @jumlah);
SELECT @jumlah AS JumlahAbsensiApril2024;
--3
DELIMITER //

CREATE PROCEDURE TambahDataAbsensi(
    IN p_id_siswa INT,
    IN p_id_jadwal INT,
    IN p_status INT
)
BEGIN
    INSERT INTO absensi (id_siswa, id_jadwal, tanggal, STATUS)
    VALUES (p_id_siswa, p_id_jadwal, CURDATE(), p_status);
END //
DELIMITER ;

CALL TambahDataAbsensi(1, 2, 1);
SELECT * FROM absensi WHERE id_siswa = 1 AND id_jadwal = 2 AND tanggal = CURDATE();
SELECT * FROM absensi;
