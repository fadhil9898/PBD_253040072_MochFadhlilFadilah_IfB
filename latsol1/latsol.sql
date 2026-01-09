select b.*, k.nama_kategori 
from buku b
inner join kategori k on b.id_kategori = k.id_kategori;

select *
from pelanggan
where email is not null
order by nama_pelanggan asc;

select * 
from buku
where harga > 50000
order by harga desc;

select k.nama_kategori, count (b.id_buku) as jumlahBuku 
from kategori k
left join buku b  on k.id_kategori =  b.id_buku
group by k.nama_kategori;

select p.id_penjualan, pl.nama_pelanggan, p.tanggal
from penjualan p
inner join pelanggan pl on p.id_pelanggan = pl.id_pelanggan
where p.tanggal = '2025-12-01';

select b.judul, sum (dp.jumlah) as totalTerjual
from buku b
left join detail_penjualan dp on b.id_buku = dp.id_buku
group by b.judul;

create table suplier(
	id_supplier INT PRIMARY KEY IDENTITY(1,1),
    nama_supplier VARCHAR(50) NOT NULL,
    telepon VARCHAR(20)
);

INSERT INTO suplier (nama_supplier, telepon) VALUES
('PT Gramedia Pustaka', '021-5320000'),
('CV Buku Sejahtera', '022-4567890'),
('Toko Buku Mandiri', '031-7654321');

UPDATE buku
SET harga = 45000
WHERE judul = 'kisah dan unpas';

DELETE FROM pelanggan
WHERE nama_pelanggan = 'Budi';

