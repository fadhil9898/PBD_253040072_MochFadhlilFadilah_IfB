-- cara membuat variable
-- cara pertama
-- declare @nilai int = 100;
print @nilai;

-- cara kedua
declare @nama char(255);
set @nama = 'fadil';
print @nama;

-- jika nilai diatas 80 
-- maka tampilkan lulus jika tidak tampilkan
-- tidak lulus 
declare @nilai int = 50;
if @nilai > 80
	print 'lulus'
else 
	print 'tidak lulus'

-- buatkan kondisi jika harga barang lebih dari 100.000
-- maka tampilkan mahal jika tidak tampilkan beli

declare @hargaBaranag int = 100000
if @hargaBaranag > 100000
	print 'mahal'
else
	print 'beli'


--tanpa view
select * from Mahasiswa

-- mahasiswa + nilai
select * from Mahasiswa M
inner join Nilai N
on M.MahasiswaID = N.MahasiswaID

-- menggunakan view
create or alter view vw_nilaiMahasiswa
as
	select M.NamaMahasiswa,M.Prodi,M.Angkatan,N.NilaiAkhir
	from Mahasiswa M
	inner join Nilai N
	on M.MahasiswaID = N.MahasiswaID

-- cara panggil item
select * from vw_nilaiMahasiswa

-- study casus view 
create or alter view vw_Mahasiswasmt
as
	select M.NamaMahasiswa,K.Semester
	from Mahasiswa M
	inner join KRS K
	on M.MahasiswaID = K.MahasiswaID
select * from vw_Mahasiswasmt

-- stored procedure
create or alter procedure sp_LihatMahasiswa
as
	begin 
		select * from Mahasiswa
	end;

exec sp_LihatMahasiswa

-- study kasus
create or alter procedure sp_Nilai
as
	begin
		declare @NilaiAkhir char = 'A' ;
		if @NilaiAkhir = 'A'
			select M.NamaMahasiswa, N.NilaiAkhir
			from Nilai N
			inner join Mahasiswa M 
			on N.MahasiswaID = M.MahasiswaID
			where N.NilaiAkhir = 'A';
		else 
			print 'tidak lulus'
	end;
exec sp_nilai