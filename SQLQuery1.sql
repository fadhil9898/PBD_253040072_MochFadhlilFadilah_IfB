USE TokoRetailDB;

INSERT INTO Pelanggan(NamaDepan,NamaBelakang,Email,NoTelepon)
VALUES
('Fadhil', 'Fadhilah', 'fadhilahfadhil770@gmail.com', '089699385631'),
('Fadel','jyden', 'fadel009@gmail.com', '089699385631');
PRINT 'Data Pelanggan:';
SELECT * FROM Pelanggan;

INSERT INTO KategoriProduk(NamaKategori)
VALUES
('Elektronik'),
('Pakaian'),
('Buku');

PRINT 'Data Kategori:';
SELECT * FROM KategoriProduk;

INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES
('ELEC-001', 'Laptop Pro 14 inch', 15000000.00, 50, 1),
('PAK-001', 'Kaos Polos Putih', 75000.00, 200, 2),
('BUK-001', 'Dasar-Dasar SQL', 120000.00, 100, 3);

PRINT 'Data Produk:';
SELECT P.*, K.NamaKategori
FROM Produk AS P
JOIN KategoriProduk AS K ON P.KategoriID = K.KategoriID;

PRINT 'Uji Coba Error 1 (UNIQUE):';
INSERT INTO Pelanggan (NamaDepan, Email)
VALUES ('Budi', 'budi.santoso@email.com');
GO

PRINT 'Uji Coba Error 2 (FOREIGN KEY):';
INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES ('XXX-001', 'Produk Aneh', 1000, 10, 99);
GO

PRINT 'Uji Coba Error 3 (CHECK):';
INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES ('NGT-001', 'Produk Minus', -50000, 10, 1);
GO

PRINT 'Data Citra SEBELUM Update:';
SELECT * FROM Pelanggan WHERE PelangganID = 2;

BEGIN TRANSACTION; 

UPDATE Pelanggan
SET NoTelepon = '085566778899'
WHERE PelangganID = 2;

PRINT 'Data Citra SETELAH Update (Belum di-COMMIT):';
SELECT * FROM Pelanggan WHERE PelangganID = 2;

COMMIT TRANSACTION;

PRINT 'Data Citra setelah di-COMMIT:';
SELECT * FROM Pelanggan WHERE PelangganID = 2;

PRINT 'Data Elektronik SEBELUM Update:';
SELECT * FROM Produk WHERE KategoriID = 1;

BEGIN TRANSACTION;

UPDATE Produk
SET Harga = Harga * 1.10 
WHERE KategoriID = 1;

PRINT 'Data Elektronik SETELAH Update (Belum di-COMMIT):';
SELECT * FROM Produk WHERE KategoriID = 1;

COMMIT TRANSACTION;

PRINT 'Data Produk SEBELUM Delete:';
SELECT * FROM Produk WHERE SKU = 'BUK-001';

BEGIN TRANSACTION;

DELETE FROM Produk
WHERE SKU = 'BUK-001';

PRINT 'Data Produk SETELAH Delete (Belum di-COMMIT):';
SELECT * FROM Produk WHERE SKU = 'BUK-001';

COMMIT TRANSACTION;

PRINT 'Data Stok SEBELUM Bencana:';
SELECT SKU, NamaProduk, Stok FROM Produk;

BEGIN TRANSACTION;

UPDATE Produk
SET Stok = 0;

PRINT 'Data Stok SETELAH Bencana (PANIK!):';
SELECT SKU, NamaProduk, Stok FROM Produk;

PRINT 'Melakukan ROLLBACK...';
ROLLBACK TRANSACTION;

PRINT 'Data Stok SETELAH di-ROLLBACK (AMAN):';
SELECT SKU, NamaProduk, Stok FROM Produk;

INSERT INTO PesananHeader (PelangganID, StatusPesanan)
VALUES (1, 'Baru');

PRINT 'Data Pesanan Budi:';
SELECT * FROM PesananHeader WHERE PelangganID = 1;
GO

PRINT 'Mencoba menghapus Budi...';
BEGIN TRANSACTION;

DELETE FROM Pelanggan
WHERE PelangganID = 1;

ROLLBACK TRANSACTION; 