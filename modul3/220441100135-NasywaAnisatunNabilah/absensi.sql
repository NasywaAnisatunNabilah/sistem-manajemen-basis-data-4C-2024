-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Apr 2024 pada 15.26
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbsmbd`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi`
--

CREATE TABLE `absensi` (
  `id_absensi` int(30) NOT NULL,
  `id_siswa` int(30) NOT NULL,
  `id_jadwal` int(30) NOT NULL,
  `tanggal` date NOT NULL,
  `status` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `absensi`
--

INSERT INTO `absensi` (`id_absensi`, `id_siswa`, `id_jadwal`, `tanggal`, `status`) VALUES
(1, 1, 1, '2024-04-15', 1),
(2, 2, 2, '2024-04-15', 1),
(3, 3, 3, '2024-04-16', 1),
(4, 4, 4, '2024-04-16', 1),
(5, 5, 5, '2024-04-17', 1),
(6, 6, 6, '2024-04-17', 1),
(7, 7, 7, '2024-04-18', 1),
(8, 8, 8, '2024-04-18', 1),
(9, 9, 9, '2024-04-19', 1),
(10, 10, 10, '2024-04-19', 1),
(11, 11, 11, '2024-04-15', 1),
(12, 12, 12, '2024-04-15', 1),
(13, 13, 13, '2024-04-16', 1),
(14, 14, 14, '2024-04-16', 1),
(15, 15, 15, '2024-04-17', 1),
(16, 16, 16, '2024-04-17', 1),
(17, 17, 17, '2024-04-18', 1),
(18, 18, 18, '2024-04-18', 1),
(19, 19, 19, '2024-04-19', 1),
(20, 20, 20, '2024-04-19', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id_absensi`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `jadwal` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwalpelajaran` (`id_jadwal`),
  ADD CONSTRAINT `siswa` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
