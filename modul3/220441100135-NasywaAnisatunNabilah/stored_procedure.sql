DELIMITER //

CREATE PROCEDURE InsertOrUpdateStudent(
    INOUT p_id_siswa INT,
    IN p_nama_siswa VARCHAR(50),
    IN p_alamat VARCHAR(50),
    IN p_tanggal_lahir DATE,
    IN p_kelas INT,
    OUT p_new_id_siswa INT
)
BEGIN
    IF p_id_siswa IS NULL THEN
        INSERT INTO siswa (nama_siswa, alamat, tanggal_lahir, kelas)
        VALUES (p_nama_siswa, p_alamat, p_tanggal_lahir, p_kelas);
        
        SET p_new_id_siswa = LAST_INSERT_ID();
        SET p_id_siswa = p_new_id_siswa;
    ELSE
        UPDATE siswa
        SET nama_siswa = p_nama_siswa,
            alamat = p_alamat,
            tanggal_lahir = p_tanggal_lahir,
            kelas = p_kelas
        WHERE id_siswa = p_id_siswa;
    END IF;
END //

DELIMITER ;
SET @student_id;

CALL InsertOrUpdateStudent(@student_id, 'Yasmin', 'Gresik', '2006-10-28', '11', @new_student_id);

SELECT @student_id;
