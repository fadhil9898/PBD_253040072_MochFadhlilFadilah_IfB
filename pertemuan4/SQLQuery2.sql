use KampusDB;

select * from Mahasiswa;

select NamaMahasiswa from Mahasiswa;

select * from Mahasiswa,JadwalKuliah;

select M.NamaMahasiswa, MK.NamaMK
from Mahasiswa M
cross join MataKuliah MK;

select D.NamaDosen, R.KodeRuangan
from Dosen d
cross join Ruangan R;

insert into Mahasiswa (NamaMahasiswa, Prodi, Angkatan) values (
	'Moch Fadhlil','Informatika','2025'
);

select * from Mahasiswa

select Z.NamaMahasiswa, X.MataKuliahID
from Mahasiswa z
left join Krs X on Z.MahasiswaID = X.MahasiswaID;

select * from MataKuliah
select * from JadwalKuliah

select P.NamaMK, O.Hari
from MataKuliah P
left join JadwalKuliah O on P.MataKuliahID = O.MataKuliahID

select P.NamaMK, O.Hari
from MataKuliah P
right join JadwalKuliah O on P.MataKuliahID = O.MataKuliahID

select V.Hari, S.KodeRuangan 
from JadwalKuliah V
right join Ruangan S on S.RuanganID = V.RuanganID

select L.NamaMahasiswa, O.KrsID
from Mahasiswa L
inner join KRS O on L.MahasiswaID = O.MahasiswaID

select wkwk.NamaMK, hehe.Hari
from MataKuliah wkwk
inner join JadwalKuliah hehe on hehe.MataKuliahID = wkwk.MataKuliahID

select Hayuk.NamaMahasiswa, Uhuy.NilaiAkhir
from Mahasiswa Hayuk
inner join Nilai Uhuy on Hayuk.MahasiswaID = Uhuy.MahasiswaID
inner join MataKuliah buakar on buakar.MataKuliahID = Uhuy.MataKuliahID

select MK.NamaMK,JK.Hari, D.NamaDosen, R.KodeRuangan
from JadwalKuliah JK
inner join MataKuliah MK on JK.MataKuliahID = MK.MataKuliahID
inner join Dosen D on D.DosenID = MK.DosenID
inner join Ruangan R on JK.RuanganID = R.RuanganID 