--1
DELIMITER $$

CREATE PROCEDURE CekKehadiranSiswa(
    IN p_id_siswa INT
)
BEGIN
    DECLARE top_siswa_id INT;
    DECLARE siswa_name VARCHAR(100);
    DECLARE total_kehadiran INT;
    DECLARE total_terbanyak INT;

    SELECT COUNT(*) INTO total_kehadiran
    FROM absensi
    WHERE id_siswa = p_id_siswa AND STATUS = 1;

    SELECT id_siswa, COUNT(*) INTO top_siswa_id, total_terbanyak
    FROM absensi
    WHERE STATUS = 1
    GROUP BY id_siswa
    ORDER BY COUNT(*) DESC
    LIMIT 1;

    SELECT nama_siswa INTO siswa_name
    FROM siswa
    WHERE id_siswa = p_id_siswa;

    IF total_kehadiran = total_terbanyak THEN
        SELECT CONCAT(siswa_name, ' adalah siswa dengan kehadiran terbanyak') AS Message;
    ELSE
        SELECT CONCAT(siswa_name, ' bukan siswa dengan kehadiran terbanyak') AS Message;
    END IF;
END$$

DELIMITER ;

CALL CekKehadiranSiswa(2);

--2
DELIMITER $$

CREATE PROCEDURE TampilkanSiswa()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE max_id INT;
    
    SELECT MAX(id_siswa) INTO max_id FROM siswa;

    WHILE i <= 10 AND i <= max_id DO
        SELECT * FROM siswa WHERE id_siswa = i;
        SET i = i + 1;
    END WHILE;   
END$$
DELIMITER ;

CALL TampilkanSiswa();
