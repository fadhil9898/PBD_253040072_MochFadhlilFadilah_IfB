use KampusDB

select * from Dosen;

select NamaDosen from Dosen;

select NamaDosen,Prodi from Dosen where Prodi = 'Informatika'

select D.NamaDosen
from Dosen D
inner join MataKuliah MK on D.DosenID = MK.DosenID
where MK.NamaMK = 'Basis Data'


select NamaDosen
from Dosen
where DosenID = (
	select DosenID 
	from MataKuliah
	where NamaMK = 'Basis Data'
)

select MK.NamaMk
from MataKuliah MK
Where MK.DosenID = (
	select Dosen.DosenID
	from Dosen
	where Dosen.NamaDosen = 'Agus Hidayat, M.kom'
)

select NamaMahasiswa
from Mahasiswa
where MahasiswaID in  (
	select MahasiswaID
	from Nilai
	where NilaiAkhir = 'A'
)

select NamaMK
from MataKuliah
where MataKuliahID in (
	select MataKuliahID
	from Nilai
	where NilaiAkhir = 'A'
)

select Prodi, TotalMhs
from(
	select Prodi, Count(*) AS TotalMhs
	from Mahasiswa
	group by prodi
) as HitungMhs
where TotalMhs > 2

with MhsGrexda as (
	select * 
	from Mahasiswa
	where Prodi = 'Informatika'
)
select * from MhsGrexda


with MhsProdi as(
	select Prodi, count (*) As TotalMahasiswa
	from Mahasiswa
	group by Prodi
)
select * from MhsProdi where TotalMahasiswa > 2

select NamaDosen From Dosen
Union
select NamaMahasiswa from Mahasiswa

select MahasiswaID from KRS
intersect
select MahasiswaID from Nilai

select MataKuliahID from MataKuliah
intersect
select MataKuliahID from Nilai