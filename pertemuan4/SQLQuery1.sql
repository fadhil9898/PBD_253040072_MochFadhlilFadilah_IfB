------------------------------------------------------------
-- CREATE DATABASE
------------------------------------------------------------
CREATE DATABASE KampusDB;
GO

USE KampusDB;
GO

-- ada tabel Dosen, JadwalKuliah, KRS, Mahasiswa, MataKuliah, Nilai, Ruangan

------------------------------------------------------------
-- TABLE DOSEN
------------------------------------------------------------
CREATE TABLE Dosen (
    DosenID INT PRIMARY KEY IDENTITY(1,1),
    NamaDosen VARCHAR(100),
    Prodi VARCHAR(50)
);

------------------------------------------------------------
-- TABLE MAHASISWA
------------------------------------------------------------
CREATE TABLE Mahasiswa (
    MahasiswaID INT PRIMARY KEY IDENTITY(1,1),
    NamaMahasiswa VARCHAR(100),
    Prodi VARCHAR(50),
    Angkatan INT
);

------------------------------------------------------------
-- TABLE MATAKULIAH
------------------------------------------------------------
CREATE TABLE MataKuliah (
    MataKuliahID INT PRIMARY KEY IDENTITY(1,1),
    NamaMK VARCHAR(100),
    SKS INT,
    DosenID INT,
    FOREIGN KEY (DosenID) REFERENCES Dosen(DosenID)
);

------------------------------------------------------------
-- TABLE KRS (relasi MHS mengambil MK)
------------------------------------------------------------
CREATE TABLE KRS (
    KRSID INT PRIMARY KEY IDENTITY(1,1),
    MahasiswaID INT,
    MataKuliahID INT,
    Semester INT,
    FOREIGN KEY (MahasiswaID) REFERENCES Mahasiswa(MahasiswaID),
    FOREIGN KEY (MataKuliahID) REFERENCES MataKuliah(MataKuliahID)
);

------------------------------------------------------------
-- TABLE RUANGAN
------------------------------------------------------------
CREATE TABLE Ruangan (
    RuanganID INT PRIMARY KEY IDENTITY(1,1),
    KodeRuangan VARCHAR(20),
    Gedung VARCHAR(50),
    Kapasitas INT
);

------------------------------------------------------------
-- TABLE JADWAL KULIAH
------------------------------------------------------------
CREATE TABLE JadwalKuliah (
    JadwalID INT PRIMARY KEY IDENTITY(1,1),
    MataKuliahID INT,
    DosenID INT,
    RuanganID INT,
    Hari VARCHAR(20),
    JamMulai TIME,
    JamSelesai TIME,
    FOREIGN KEY (MataKuliahID) REFERENCES MataKuliah(MataKuliahID),
    FOREIGN KEY (DosenID) REFERENCES Dosen(DosenID),
    FOREIGN KEY (RuanganID) REFERENCES Ruangan(RuanganID)
);

------------------------------------------------------------
-- TABLE NILAI MAHASISWA
------------------------------------------------------------
CREATE TABLE Nilai (
    NilaiID INT PRIMARY KEY IDENTITY(1,1),
    MahasiswaID INT,
    MataKuliahID INT,
    NilaiAkhir CHAR(2),
    FOREIGN KEY (MahasiswaID) REFERENCES Mahasiswa(MahasiswaID),
    FOREIGN KEY (MataKuliahID) REFERENCES MataKuliah(MataKuliahID)
);

------------------------------------------------------------
-- INSERT SAMPLE DATA DOSEN
------------------------------------------------------------
INSERT INTO Dosen (NamaDosen, Prodi) VALUES
('Dr. Andi Saputra', 'Informatika'),
('Siti Rahma, M.Kom', 'Sistem Informasi'),
('Budi Santoso, M.T', 'Informatika'),
('Dr. Rini Lestari', 'Teknik Industri'),
('Agus Hidayat, M.Kom', 'Informatika'),
('Nurul Fadhilah, M.T', 'Sistem Informasi'),
('Dr. Johan Pratama', 'Informatika'),
('Hendra Wijaya, M.Kom', 'Teknik Komputer'),
('Lina Wulandari, M.Sc', 'Informatika'),
('Farhan Yusuf, M.T', 'Sistem Informasi');

------------------------------------------------------------
-- INSERT SAMPLE DATA MAHASISWA
------------------------------------------------------------
INSERT INTO Mahasiswa (NamaMahasiswa, Prodi, Angkatan) VALUES
('Chalida', 'Informatika', 2023),
('Rina Marlina', 'Sistem Informasi', 2022),
('Dimas Arya', 'Informatika', 2021),
('Fajar Kurnia', 'Informatika', 2023),
('Nadia Putri', 'Sistem Informasi', 2023),
('Bagas Pratama', 'Teknik Industri', 2022),
('Salsa Ayu', 'Informatika', 2024),
('Reyhan Ramadhan', 'Sistem Informasi', 2021),
('Rafi Akbar', 'Informatika', 2022),
('Mega Lestari', 'Teknik Komputer', 2023);

------------------------------------------------------------
-- INSERT DATA MATAKULIAH
------------------------------------------------------------
INSERT INTO MataKuliah (NamaMK, SKS, DosenID) VALUES
('Basis Data', 3, 1),
('Pemrograman Web', 3, 1),
('Sistem Informasi Manajemen', 3, 2),
('Jaringan Komputer', 3, 3),
('Analisis Perancangan Sistem', 3, 2),
('Kewirausahaan', 2, 4),
('Kecerdasan Buatan', 3, 7),
('Struktur Data', 3, 5),
('Interaksi Manusia dan Komputer', 3, 9),
('Data Mining', 3, 10);

------------------------------------------------------------
-- INSERT DATA KRS
------------------------------------------------------------
INSERT INTO KRS (MahasiswaID, MataKuliahID, Semester) VALUES
(1, 1, 3),
(1, 2, 3),
(2, 3, 3),
(3, 1, 5),
(3, 4, 5),
(4, 6, 1),
(5, 2, 2),
(6, 5, 4),
(7, 8, 1),
(8, 9, 6),
(9, 7, 5),
(10, 4, 3);

------------------------------------------------------------
-- INSERT DATA RUANGAN
------------------------------------------------------------
INSERT INTO Ruangan (KodeRuangan, Gedung, Kapasitas) VALUES
('IF101', 'Gedung Informatika', 40),
('IF202', 'Gedung Informatika', 35),
('SI301', 'Gedung Sistem Informasi', 45),
('TI210', 'Gedung Teknik Industri', 50),
('AULA1', 'Gedung Utama', 200);

------------------------------------------------------------
-- INSERT DATA JADWAL KULIAH
------------------------------------------------------------
INSERT INTO JadwalKuliah (MataKuliahID, DosenID, RuanganID, Hari, JamMulai, JamSelesai) VALUES
(1, 1, 1, 'Senin', '08:00', '10:00'),
(2, 1, 2, 'Selasa', '10:00', '12:00'),
(3, 2, 3, 'Rabu', '09:00', '11:00'),
(4, 3, 4, 'Kamis', '13:00', '15:00'),
(7, 7, 1, 'Jumat', '08:00', '10:00');

------------------------------------------------------------
-- INSERT DATA NILAI
------------------------------------------------------------
INSERT INTO Nilai (MahasiswaID, MataKuliahID, NilaiAkhir) VALUES
(1, 1, 'A'),
(1, 2, 'B'),
(3, 1, 'A'),
(4, 6, 'B'),
(7, 8, 'A');