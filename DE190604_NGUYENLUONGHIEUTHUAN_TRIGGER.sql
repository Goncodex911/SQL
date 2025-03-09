--KHoa
Create table KHOA
( MAKHOA varchar(4)primary key,
  TENKHOA varchar(40),
  NGTLAP smalldatetime,
  TRGKHOA char(4) )
--MONHOC
Create table MONHOC 
( MAMH varchar(10)primary key,
  TENMH varchar (40),
  TCLT tinyint,
  TCTH tinyint,
  MAKHOA varchar(4)references KHOA(MAKHOA) )
 --DIEUKIEN
Create table DIEUKIEN
( MAMH varchar(10)references MONHOC(MAMH),
  MAMH_TRUOC varchar(10),
  constraint KHOACHINH primary key (MAMH,MAMH_TRUOC) )
--giaovien
Create table GIAOVIEN
( MAGV char(4)primary key,
  HOTEN varchar(50),
  HOCVI varchar(10),
  HOCHAM varchar(10),
  GIOITINH varchar(3),
  NGSINH smalldatetime,
  NGVL smalldatetime,
  HESO numeric(4,2),
  MUCLUONG money,
  MAKHOA varchar(4) references KHOA(MAKHOA) ) 
  --lop
 Create table LOP
 ( MALOP char(3)primary key,
	TENLOP varchar(40),
	TRGLOP char(5),
	SISO tinyint,
	MAGVCN char(4))
	---HOC vien
 Create table HOCVIEN 
 (	MAHV char(5) primary key,
	HO varchar(40),
	TEN varchar(20),
	NGSINH smalldatetime,
	GIOITINH varchar(3),
	NOISINH varchar(40),
	MALOP char(3) references LOP(MALOP))
---GIANG DAY
Create table GIANGDAY
( MALOP char(3)references LOP(MALOP),
  MAMH varchar (10) references MONHOC(MAMH),
  MAGV char(4)references GIAOVIEN(MAGV),
  HOCKY tinyint,
  NAM smallint,
  TUNGAY smalldatetime,
  DENNGAY smalldatetime,
  constraint KHOACC primary key (MALOP,MAMH))
---KET QUA THI
	Create table KETQUATHI 
	( MAHV char (5) references HOCVIEN(MAHV),
	 MAMH varchar(10) references MONHOC(MAMH),
	 LANTHI tinyint,
	 NGTHI smalldatetime,
	 DIEM numeric(4,2),
	 KQUA varchar(10),
	constraint KHOAKK primary key (MAHV,MAMH,LANTHI))

--khoa
insert into KHOA values ('KHMT',N'Khoa hoc may tinh ',7/6/2005,'GV01')
insert into KHOA values ('HTTT',N'He thong thong tin ',7/6/2005,'GV02')
insert into KHOA values ('CNPM',N'Cong nghe phan mem ',7/6/2005,'GV04')
insert into KHOA values ('MTT',N'Mang va truyen thong ',20/10/2005,'GV03')
insert into KHOA values ('KTMT',N'Ki thuat may tinh ',20/12/2005,null)
--mon 
insert into MONHOC values ('THDC',N'Tin hoc dai cuong ',4,1,'KHMT')
insert into MONHOC values ('CTRR',N'Cau truc roi rac ',5,0,'KHMT')
insert into MONHOC values ('CSDL',N'Co so du lieu ',3,1,'HTTT')
insert into MONHOC values ('CTDLGT',N'Cau truc du lieu va giai thuat ',3,1,'KHMT')
insert into MONHOC values ('PTTKTT',N'Phan tich thiet ke thuat toan ',3,0,'KHMT')
insert into MONHOC values ('DHMT',N'Do hoa may tinh ',3,1,'KHMT')
insert into MONHOC values ('KTMT',N'Kien truc may tinh ',3,0,'KTMT')
insert into MONHOC values ('TKCSDL',N'Thiet ke co so du lieu ',3,1,'HTTT')
insert into MONHOC values ('PTTKHTTT',N'Phan tich thiet ke he thong thong tin ',4,1,'HTTT')
insert into MONHOC values ('HDH',N'He dieu hanh ',4,0,'KTMT')
insert into MONHOC values ('NMCNPM',N'Nhap mon cong nghe pham mem ',3,0,'CNPM')
insert into MONHOC values ('LTCFW',N'Lap trinh C for Win ',3,1,'CNPM')
insert into MONHOC values ('LTHDT',N'Lap trinh huong doi tuong ',3,1,'CNPM')
--dieu kien
insert into DIEUKIEN values ('CSDL','CTRR')
insert into DIEUKIEN values ('CSDL','CTDLGT')
insert into DIEUKIEN values ('CTDLGT','THDC')
insert into DIEUKIEN values ('PTTKTT','THDC')
insert into DIEUKIEN values ('PTTKTT','CTDLGT')
insert into DIEUKIEN values ('DHMT','THDC')
insert into DIEUKIEN values ('LTHDT','THDC')
insert into DIEUKIEN values ('PTTKHTTT','CSDL')
--giao vien
insert into GIAOVIEN values ('GV01','Ho Than Son','PTS','GS','Nam',2/5/1950,11/1/2004,5.00,2250000,'KHMT')
insert into GIAOVIEN values ('GV02','Tran Tam Thanh','TS','PGS','Nam',17/12/1965,20/4/2004,4.50,2025000,'HTTT')
insert into GIAOVIEN values ('GV03','DO Nghiem Phung','TS','GS','Nu',1/8/1950,23/9/2004,4.00,1800000,'CNPM')
insert into GIAOVIEN values ('GV04','Tran Nam Son','TS','PGS','Nam',22/2/1961,12/1/2005,4.50,2025000,'KTMT')
insert into GIAOVIEN values ('GV05','Mai Thanh Danh','ThS','GV','Nam',12/03/1958,12/1/2005,3.00,1350000,'HTTT')
insert into GIAOVIEN values ('GV06','Tran Doan Hung','TS','GV','Nam',11/3/1953,12/1/2005,4.50,2025000,'KHMT')
insert into GIAOVIEN values ('GV07','Nguyen Minh Tien','ThS','GV','Nam',23/1/1971,1/3/2005,4.00,1800000,'KHMT')
insert into GIAOVIEN values ('GV08','Le Thi Tran','KS',Null,'Nu',26/3/1974,1/3/2005,1.69,760500,'KHMT')
insert into GIAOVIEN values ('GV09','Nguyen To Lan','ThS','GV','Nu',31/12/1966,1/3/2005,4.00,1800000,'HTTT')
insert into GIAOVIEN values ('GV10','Le Tran ANh Loan','KS',Null,'Nu',17/7/1972,1/3/2005,1.86,837000,'CNPM')
insert into GIAOVIEN values ('GV11','Ho Thanh Tung','CN','GV','Nam',12/1/1980,15/5/2005,2.67,1201500,'MTT')
insert into GIAOVIEN values ('GV12','Tran Van Anh','CN',Null,'Nu',29/3/1981,15/5/2005,1.69,760500,'CNPM')
insert into GIAOVIEN values ('GV13','Nguyen Lih Dan','CN',Null,'Nu',23/5/1980,15/5/2005,1.69,760500,'KTMT')
insert into GIAOVIEN values ('GV14','Truong Minh Chau','ThS','GV','Nu',30/11/1976,15/5/2005,3.00,1350000,'MTT')
insert into GIAOVIEN values ('GV15','Le Ha Thanh','ThS','GV','Nam',4/5/1978,15/5/2005,3.00,1350000,'KHMT')
--Giang d?y
insert into LOP values ('K11','Lop 1 khoa 1','K1108',11,'GV07')
insert into LOP values ('K12','Lop 2 khoa 1','K1205',11,'GV09')
insert into LOP values ('K13','Lop 3 khoa 1','K1305',11,'GV14')
--hoc vien
insert into HOCVIEN values ('K1101','Nguyen Van','A',1986/1/27,'Nam','tpHCM','K11')
insert into HOCVIEN values ('K1102','Tran Ngoc','Han',14/3/1986,'Nu','Kien Giang','K11')
insert into HOCVIEN values ('K1103','Ha Duy','Lap',18/4/1986,'Nam','Nghe An','K11')
insert into HOCVIEN values ('K1104','Tran Ngoc','Linh',30/3/1986,'Nu','Tay Ninh','K11')
insert into HOCVIEN values ('K1105','Tran Minh','Long',27/2/1986,'Nam','tpHCM','K11')
insert into HOCVIEN values ('K1106','Le Nhat','Minh',24/1/1986,'Nam','tpHCM','K11')
insert into HOCVIEN values ('K1107','Nguyen Nhu','Nhut',27/1/1986,'Nam','Ha Noi','K11')
insert into HOCVIEN values ('K1108','Nguyen Manh','Tam',27/2/1986,'Nam','Kien Giang','K11')
insert into HOCVIEN values ('K1109','PHan Thi Thanh','Tam',27/1/1986,'Nu','Vinh Long','K11')
insert into HOCVIEN values ('K1110','Le Hoai','Thuong',5/2/1986,'Nu','Can Tho','K11')
insert into HOCVIEN values ('K1111','Le Ha','Vinh',25/12/1986,'Nam','Vinh Long','K11')
insert into HOCVIEN values ('K1201','Nguyen Van ','B',11/2/1986,'Nam','tpHCM','K12')
insert into HOCVIEN values ('K1202','Nguyen Thi Kim ','Duyen',18/1/1986,'Nu','tpHCM','K12')
insert into HOCVIEN values ('K1203','Tran Thi Kim','Duyen',17/9/1986,'Nu','tpHCM','K12')
insert into HOCVIEN values ('K1204','Truong My ','Hanh',19/5/1986,'Nu','Dong Nai','K12')
insert into HOCVIEN values ('K1205','Nguyen Thanh ','Nam',17/4/1986,'Nam','tpHCM','K12')
insert into HOCVIEN values ('K1206','Nguyen Thi Truc ','Thanh',4/3/1986,'Nu','Kien Giang','K12')
insert into HOCVIEN values ('K1207','Tran Thi Bich ','Thuy',8/2/1986,'Nu','Nghe An','K12')
insert into HOCVIEN values ('K1208','Huynh Thi Kim','Trieu',8/4/1986,'Nu','Tay Ninh','K12')
insert into HOCVIEN values ('K1209','Phan Thanh  ','Trieu',23/2/1986,'Nam','tpHCM','K12')
insert into HOCVIEN values ('K1210','Ngo Thanh ','Tuan',14/2/1986,'Nam','tpHCM','K12')
insert into HOCVIEN values ('K1211','Do Thi  ','Xuan',9/3/1986,'Nu','Ha Noi','K12')
insert into HOCVIEN values ('K1212','Le Thi Phi ','Yen',12/3/1986,'Nu','tpHCM','K12')
insert into HOCVIEN values ('K1301','Nguyen Thi Kim ','Cuc',9/6/1986,'Nu','Kien Giang','K13')
insert into HOCVIEN values ('K1302','Truong Thi My  ','Hien',18/3/1986,'Nu','Nghe An','K13')
insert into HOCVIEN values ('K1303','Le Duc ','Hien',21/3/1986,'Nam','Tay Ninh','K13')
insert into HOCVIEN values ('K1304','Le QUang ','Hien',18/4/1986,'Nam','tpHCM','K13')
insert into HOCVIEN values ('K1305','Le Thi','Huong',27/3/1986,'Nu','tpHCM','K13')
insert into HOCVIEN values ('K1306','Nguyen Thai ','Huu',30/3/1986,'Nam','Ha Noi','K13')
insert into HOCVIEN values ('K1307','Tran Minh ','Man',28/5/1986,'Nam','tpHCM','K13')
insert into HOCVIEN values ('K1308','Nguyen Hieu ','Nghia',8/4/1986,'Nam','Kien Giang','K13')
insert into HOCVIEN values ('K1309','Nguyen Trung ','Nghia',18/1/1986,'Nam','Nghe An','K13')
insert into HOCVIEN values ('K1310','Tran Thi Hong ','Tham',22/4/1986,'Nu','Tay Ninh','K13')
insert into HOCVIEN values ('K1311','Tran Minh  ','Thuc',4/4/1986,'Nam','tpHCM','K13')
insert into HOCVIEN values ('K1312','Nguyen Thi Kim ','Yen',7/9/1986,'Nu','tpHCM','K13')
----giang day
insert into GIANGDAY values ('K11','THDC','GV07',1,2006,2/1/2006,12/5/2006)
insert into GIANGDAY values ('K12','THDC','GV08',1,2006,2/1/2006,12/5/2006)
insert into GIANGDAY values ('K13','THDC','GV15',1,2006,2/1/2006,12/5/2006)
insert into GIANGDAY values ('K11','CTRR','GV02',1,2006,9/1/2006,17/5/2006)
insert into GIANGDAY values ('K12','CTRR','GV02',1,2006,9/1/2006,17/5/2006)
insert into GIANGDAY values ('K13','CTRR','GV08',1,2006,9/1/2006,17/5/2006)
insert into GIANGDAY values ('K11','CSDL','GV05',2,2006,1/6/2006,15/7/2006)
insert into GIANGDAY values ('K12','CSDL','GV09',2,2006,1/6/2006,15/7/2006)
insert into GIANGDAY values ('K13','CTDLGT','GV15',2,2006,1/6/2006,15/7/2006)
insert into GIANGDAY values ('K13','CSDL','GV05',3,2006,1/8/2006,15/12/2006)
insert into GIANGDAY values ('K13','DHMT','GV07',3,2006,1/8/2006,15/12/2006)
insert into GIANGDAY values ('K11','CTDLGT','GV15',3,2006,1/8/2006,15/12/2006)
insert into GIANGDAY values ('K12','CTDLGT','GV15',3,2006,1/8/2006,15/12/2006)
insert into GIANGDAY values ('K11','HDH','GV04',1,2007,2/1/2007,18/2/2007)
insert into GIANGDAY values ('K12','HDH','GV04',1,2007,2/1/2007,20/3/2007)
insert into GIANGDAY values ('K11','DHMT','GV07',1,2007,18/2/2007,20/3/2007)
---Ket qua thi
insert KETQUATHI values ('K1101','CSDL',1,20/7/2006,10,'Dat')
insert KETQUATHI values ('K1101','CTDLGT',1,28/12/2006,9,'Dat')
insert KETQUATHI values ('K1101','THDC',1,20/5/2006,9,'Dat')
insert KETQUATHI values ('K1101','CTRR',1,13/5/2006,9.50,'Dat')
insert KETQUATHI values ('K1102','CSDL',1,20/7/2006,4,'Khong Dat')
insert KETQUATHI values ('K1102','CSDL',2,27/7/2006,4.25,'Khong Dat')
insert KETQUATHI values ('K1102','CSDL',3,10/8/2006,4.50,'Khong Dat')
insert KETQUATHI values ('K1102','CTDLGT',1,28/12/2006,4.50,'Khong Dat')
insert KETQUATHI values ('K1102','CTDLGT',2,5/1/2006,4,'Khong Dat')
insert KETQUATHI values ('K1102','CTDLGT',3,15/1/2006,6,'Dat')
insert KETQUATHI values ('K1102','THDC',1,20/5/2006,5,'Dat')
insert KETQUATHI values ('K1102','CTRR',1,13/5/2006,7,'Dat')
insert KETQUATHI values ('K1103','CSDL',1,20/7/2006,3.50,'Khong Dat')
insert KETQUATHI values ('K1103','CSDL',2,27/7/2006,8.25,'Dat')
insert KETQUATHI values ('K1103','CTDLGT',1,28/12/2006,7,'Dat')
insert KETQUATHI values ('K1103','THDC',1,20/5/2006,8,'Dat')
insert KETQUATHI values ('K1103','CTRR',1,13/5/2006,6.50,'Dat')
insert KETQUATHI values ('K1104','CSDL',1,27/7/2006,3.75,'KhongDat')
insert KETQUATHI values ('K1104','CTDLGT',1,28/12/2006,4,'Khong Dat')
insert KETQUATHI values ('K1104','THDC',1,20/5/2006,4,'Khong Dat')
insert KETQUATHI values ('K1104','CTRR',1,13/5/2006,4,'Khong Dat')
insert KETQUATHI values ('K1104','CTRR',2,20/5/2006,3.5,'Khong Dat')
insert KETQUATHI values ('K1104','CTRR',3,30/6/2006,4,'Khong Dat')
insert KETQUATHI values ('K1201','CSDL',1,20/7/2006,6,'Dat')
insert KETQUATHI values ('K1201','CTDLGT',1,28/12/2006,5,'Dat')
insert KETQUATHI values ('K1201','THDC',1,20/5/2006,8.5,'Dat')
insert KETQUATHI values ('K1201','CTRR',1,13/5/2006,9,'Dat')
insert KETQUATHI values ('K1202','CSDL',1,20/7/2006,8,'Dat')
insert KETQUATHI values ('K1202','CTDLGT',1,28/12/2006,4,'Khong Dat')
insert KETQUATHI values ('K1202','CTDLGT',2,5/1/2007,5,'Dat')
insert KETQUATHI values ('K1202','THDC',1,20/5/2006,4,'Khong Dat')
insert KETQUATHI values ('K1202','THDC',2,27/5/2006,4,'Khong Dat')
insert KETQUATHI values ('K1202','CTRR',1,13/5/2006,3,'Khong Dat')
insert KETQUATHI values ('K1202','CTRR',2,20/5/2006,4,'Khong Dat')
insert KETQUATHI values ('K1202','CTRR',3,30/6/2006,6.25,'Dat')
insert KETQUATHI values ('K1203','CSDL',1,20/7/2006,9.25,'Dat')
insert KETQUATHI values ('K1203','CTDLGT',1,28/12/2006,9.50,'Dat')
insert KETQUATHI values ('K1203','THDC',1,20/5/2006,10,'Dat')
insert KETQUATHI values ('K1203','CTRR',1,13/5/2006,10,'Dat')
insert KETQUATHI values ('K1204','CSDL',1,20/7/2006,8.50,'Dat')
insert KETQUATHI values ('K1204','CTDLGT',1,28/12/2006,6.75,'Dat')
insert KETQUATHI values ('K1204','THDC',1,20/5/2006,4,' Khong Dat')
insert KETQUATHI values ('K1204','CTRR',1,13/5/2006,6,'Dat')
insert KETQUATHI values ('K1301','CSDL',1,20/12/2006,4.25,'Khong Dat')
insert KETQUATHI values ('K1301','CTDLGT',1,25/7/2006,8,'Dat')
insert KETQUATHI values ('K1301','THDC',1,20/5/2006,7.75,'Dat')
insert KETQUATHI values ('K1301','CTRR',1,13/5/2006,8,'Dat')
insert KETQUATHI values ('K1302','CSDL',1,20/12/2006,6.75,'Khong Dat')
insert KETQUATHI values ('K1302','CTDLGT',1,25/7/2006,5,'Dat')
insert KETQUATHI values ('K1302','THDC',1,20/5/2006,8,'Dat')
insert KETQUATHI values ('K1302','CTRR',1,13/5/2006,8.5,'Dat')
insert KETQUATHI values ('K1303','CSDL',1,20/12/2006,4.00,'Khong Dat')
insert KETQUATHI values ('K1303','CTDLGT',1,25/7/2006,4.50,'Khong Dat')
insert KETQUATHI values ('K1303','CTDLGT',2,7/8/2006,4,'Khong Dat')
insert KETQUATHI values ('K1303','CTDLGT',3,15/8/2006,4.25,'Khong Dat')
insert KETQUATHI values ('K1303','THDC',1,20/5/2006,4.50,'Khong Dat')
insert KETQUATHI values ('K1303','CTRR',1,13/5/2006,3.25,'Khong Dat')
insert KETQUATHI values ('K1303','CTRR',2,20/5/2006,5,'Dat')
insert KETQUATHI values ('K1304','CSDL',1,20/12/2006,7.75,'Dat')
insert KETQUATHI values ('K1304','CTDLGT',1,25/7/2006,9.75,'Dat')
insert KETQUATHI values ('K1304','THDC',1,20/5/2006,5.5,'Dat')
insert KETQUATHI values ('K1304','CTRR',1,13/5/2006,5 ,'Dat')
insert KETQUATHI values ('K1304','CSDL',1,20/12/2006,7.75,'Dat')
insert KETQUATHI values ('K1304','CTDLGT',1,25/7/2006,9.75,'Dat')
insert KETQUATHI values ('K1304','THDC',1,20/5/2006,5.5,'Dat')
insert KETQUATHI values ('K1304','CTRR',1,13/5/2006,5 ,'Dat')
insert KETQUATHI values ('K1305','CSDL',1,20/12/2006,9.25,'Dat')
insert KETQUATHI values ('K1305','CTDLGT',1,25/7/2006,10,'Dat')
insert KETQUATHI values ('K1305','THDC',1,20/5/2006,8,'Dat')
insert KETQUATHI values ('K1305','CTRR',1,13/5/2006,10,'Dat')

-- DE190604 NGUYỄN LƯƠNG HIẾU THUẬN 
-- Câu 1:
-- a.Viết hàm thực hiện đưa vào năm sinh trả về tuổi ứng với năm sinh đó.
use QLHV
create function ftuoi(@namsinh int)
returns int
as
Begin
		declare @tuoi as int
		set @tuoi = year(getdate())-@namsinh
		return @tuoi
End

print dbo.ftuoi(2004)
-- Hiển thị dssv gồm mahv, ho, yen,tuoi
select mahv, ho, ten, dbo.ftuoi(year(NgSinh)) as [Tuoi]
from HOCVIEN
select * from HOCVIEN
-- b.Viết hàm thực hiện đưa vào một mã lớp trả về số sinh viên của lớp đó.

create function fsosv(@malop char(3))
returns int
as
Begin
		declare @sosv int 
		select @sosv = count(mahv)
		from HOCVIEN
		where malop = @malop
		return @sosv
End

print dbo.fsosv('k11')
-- Hiển thị mã lớp  

-- c.Với 1 mã sinh viên và 1 mã khoa, hãy kiểm tra sinh viên có thuộc khoa này không? 
-- (Trả về đúng hoặc sai).
create function fkhoa(@mahv char(5), @makhoa char(4))
returns nvarchar(4)
as
begin
    declare @ketqua BIT,@check nvarchar(4);

    if exists (
        select 1 
        from HOCVIEN h join LOP l on l.MALOP=h.MALOP
			 join KHOA k on k.MAKHOA=l.MAKHOA
        where h.MAHV = @mahv 
          AND k.MAKHOA = @makhoa
    )
        SET @ketqua = 1; 
    else
        SET @ketqua = 0;  
	if(@ketqua = 1)
		set @check = N'Đúng'
	else
		set @check = N'Sai'
    return @check;
end;

print [dbo].[fkhoa]('K1101','MTT')
-- d.Tính điểm thi sau cùng của 1 sinh viên trong 1 môn học cụ thể.
create function fdiem(@mamh varchar(10),@mahv char(5))
returns numeric(4,2)
as
Begin
		declare @diem numeric(4,2)
		select @diem = diem
		from KETQUATHI k
		where mamh = @mamh and mahv = @mahv and lanthi = (select max(lanthi)
														  from KETQUATHI k1 
														  where k1.MAHV=k.MAHV and k1.MAMH=k.MAMH)
		return @diem
End

print dbo.fdiem('CSDL','K1101')
-- e.Tính điểm trung bình của 1 sinh viên 
-- (chú ý: điểm trung bình được tính dựa trên lần thi sau cùng, sử dụng câu 1d đã viết.
create function faverage(@mahv char(5))
returns numeric(4,2)
as
begin	
		declare @average numeric(4,2)
		select @average = AVG(dbo.fdiem(k.MAMH,@mahv))
		from KETQUATHI k 
		where k.MAHV = @mahv 
		return @average
end

print dbo.faverage('K1102')
select * from KETQUATHI
-- f.Nhập vào 1 sinh viên và 1 môn học, trả về các điểm thi của sinh viên này trong các lần thi của môn học đó.
create function fdiemthi(@mamh varchar(10),@mahv char(5))
returns table
as
		return(
				select k.DIEM,k.LANTHI
				from KETQUATHI k
				where mamh = @mamh and mahv = @mahv)
select * from dbo.fdiemthi('CSDL','K1102')
-- g.Nhập vào 1 sinh viên, trả về danh sách các môn học mà sinh viên này phải học.

create function fdsmh(@mahv char(5))
returns table
as 
		return (
				select mamh, tenmh
				from MONHOC m join KHOA k on k.MAKHOA=m.MAKHOA
				join LOP l on l.MAKHOA=k.MAKHOA
				join HOCVIEN h on h.MALOP=l.MALOP
				where mahv = @mahv)
select * from dbo.fdsmh('K1103')

-- Câu 2:
-- a.In ra danh sách các sinh viên của 1 lớp học
create procedure sp_dssv @malop char(3)
as
	select * 
	from HOCVIEN
	where malop = @malop

	exec sp_dssv 'K13'
-- b.Nhập vào 2 sinh viên, 1 môn học
-- tìm xem sinh viên nào có điểm thi môn học đó lần đầu tiên cao hơn.
create proc sp_sosanhdiem @mahv1 char(5), @mahv2 char(5), @mamh varchar(10)
as
	declare @diemsv1 numeric(4,2), @diemsv2 numeric(4,2)
	select @diemsv1 = diem
	from KETQUATHI
	where mamh = @mamh and LANTHI = 1 and mahv = @mahv1
	
	select @diemsv2 = diem
	from KETQUATHI
	where mamh = @mamh and LANTHI =1 and mahv = @mahv2
	if(@diemsv1>@diemsv2)
		print @mahv1 + N' có điểm thi lần 1 môn '+@mamh + N' cao hơn sv ' + @mahv2
	if(@diemsv1=@diemsv2)
		print @mahv1 + N' có điểm thi lần 1 môn '+@mamh + N' bằng sv ' + @mahv2
	if(@diemsv1<@diemsv2)
		print @mahv1 + N' có điểm thi lần 1 môn '+@mamh + N' thấp hơn sv ' + @mahv2

exec sp_sosanhdiem 'K1101','K1102','CSDL'

-- c.Nhập vào 1 môn học và 1 mã sinh viên
-- Kiểm tra xem sinh viên này có đậu môn này trong lần thi đầu tiên không?
-- Nếu đậu thì xuất ra là “Đậu”, không thì xuất ra “Không đậu”
create procedure sp_dauhaykhong @mamh varchar (10), @mahv char(5)
as
	declare @ketqua varchar(10)
	select @ketqua = k.KQUA
	from KETQUATHI k
	where mamh=@mamh and LANTHI = 1 and mahv = @mahv
	if(@ketqua='Khong Dat')
		print N'Không đậu'
	else
		print N'Đậu'
		
exec sp_dauhaykhong 'CSDL','K1102'

-- d.Nhập vào 1 khoa, in danh sách các sinh viên (MaSV, họ tên, ngày sinh) thuộc khoa này.
create procedure sp_dssvcuakhoa @khoa varchar(4)
as
	select h.MAHV, h.HO, h.TEN, h.NGSINH
	from KHOA k join MONHOC m on k.MAKHOA=m.MAKHOA
	join KETQUATHI ket on ket.MAMH=m.MAMH
	join HOCVIEN h on h.MAHV=ket.MAHV
	where m.MAKHOA=@khoa
	
exec sp_dssvcuakhoa 'HTTT'

-- e.Nhập vào 1 sinh viên và 1 môn học, in điểm thi của sinh viên này của các lần thi môn học đó.
create proc sp_diemthi @mahv char(5), @mamh varchar (10)
as
	select k.DIEM,k.LANTHI
	from KETQUATHI k 
	where k.MAHV = @mahv and k.MAMH = @mamh

exec sp_diemthi 'K1102','CSDL'

-- f.Nhập vào 1 môn học, in danh sách các sinh viên đậu môn này trong lần thi đầu tiên.
create proc sp_daulandau @mamh varchar(10)
as
	select k.MAHV,h.HO,h.TEN
	from KETQUATHI k join HOCVIEN h on k.MAHV=h.MAHV
	where k.MAMH=@mamh and k.LANTHI =1 and k.KQUA = N'Dat'

exec sp_daulandau 'CSDL'

-- g.In điểm các môn học của sinh viên có mã SV được nhập vào.
-- (Chú ý: điểm của các môn học là điểm thi của lần thi sau cung)
-- Chỉ in môn đã có điểm
-- Các môn chưa có điểm thì ghi điểm là Null
-- Các môn chưa có điểm thi ghi điểm là “Chưa có điểm”.
create proc sp_indiemvoimahv @mahv char(5)
as
	SELECT 
        KQ.MAMH AS MaMon, 
        CASE 
            WHEN KQ.DIEM IS NULL THEN 'Chưa có điểm' 
			else Diem
        END AS Diem,
        KQ.KQUA AS KetQua
    FROM KETQUATHI KQ
    WHERE KQ.MAHV = @mahv
      AND KQ.LANTHI = ( 
          SELECT MAX(K2.LANTHI)
          FROM KETQUATHI K2
          WHERE K2.MAHV = KQ.MAHV 
            AND K2.MAMH = KQ.MAMH
      )
    ORDER BY KQ.MAMH;

exec sp_indiemvoimahv 'K1102'

-- h.Tạo thêm 1 table XepLoai(MaHV,DiemTB, KetQua, HocLuc)
-- Đưa dữ liệu vào bảng xếp loại ( sử dung câu 1e đã viết ở trên)
-- Qui định: Kết quả của SV là “Đạt” nếu Điểm TB (chỉ tính các môn đã có điểm) của SV đó >=5 
-- và không quá 2 môn dưới 4 điểm, ngược lại thì kết quả là không đạt.
-- Đối với những sinh viên có kết quả là “Đạt” thì học lực được xếp loại như sau:
-- Điểm TB>= 8 thì học lực “Giỏi”
-- 7 <= Điểm TB <8 thì học lực “Khá”
-- Còn lại là “Trung bình”

create proc sp_XepLoai
as
    DELETE FROM XepLoai;
    INSERT INTO XepLoai (MaHV, DiemTB, KQUA, HocLuc)
    SELECT 
        k.MAHV, 
        dbo.faverage(k.MAHV) AS DiemTB,
        CASE 
            WHEN dbo.faverage(k.MAHV) >= 5 
                 AND (
                     SELECT COUNT(*) 
                     FROM KETQUATHI 
                     WHERE MAHV = k.MAHV AND DIEM < 4
                 ) <= 2 
            THEN N'Đạt'
            ELSE N'Không đạt'
        END AS KetQua,
        CASE 
            WHEN dbo.faverage(k.MAHV) >= 8 THEN N'Giỏi'
            WHEN dbo.faverage(k.MAHV) >= 7 and dbo.faverage(k.MAHV)< 8 THEN N'Khá'
            WHEN dbo.faverage(k.MAHV) >= 5 THEN N'Trung bình'
            ELSE NULL
        end as HocLuc
    from KETQUATHI k
    group by k.MAHV;

exec sp_XepLoai
select * from Xeploai

-- i.Với các sinh viên có tham gia đầy đủ các môn học của khoa, hãy in ra điểm trung bình cho các sinh viên này. 
-- (Chú ý điểm TB được tính dựa trên điểm thi lần sau cùng; sử dụng câu 1e đã viết ở trên)
alter proc sp_diemtbdaydu
as
	select h.MAHV,h.HO,h.TEN,k.MAKHOA, dbo.faverage(h.MAHV) as [DiemTB]
	from HOCVIEN h join LOP l on h.MALOP=l.MALOP
		 join KHOA k on k.MAKHOA=l.MAKHOA
	where ( select count(distinct m.MAMH)
			from MONHOC m
			where m.MAKHOA=k.MAKHOA
		  ) = (
			select count(distinct ke.MAMH)
			from KETQUATHI ke
			where ke.MAHV=h.MAHV
		  )
	
exec sp_diemtbdaydu
select * from KETQUATHI
select * from KHOA
select * from HOCVIEN
select * from MONHOC
select * from LOP
-- Câu 3:
-- a. Viết câu lẹnh SQL để tạo bảng SOLUONGSV gồm 3 cột mã lớp, tên lớp, số sinh viên của từng lớp từ bảng SINHVIEN
-- có thể tạo bằng cách: bấm chuột phải vào table -> chọn new table
insert into SOLUONGSV -- thêm truy vấn vào bảng SOLUONGSV
select lop.MALOP,TENLOP, count(mahv) as sosv
from LOP join HOCVIEN on lop.MALOP = HOCVIEN.MALOP
group by lop.MALOP,TENLOP

-- b. Viết trigger để thực hiện yêu cầu:
-- Sau khi chèn 1 sinh viên vào bảng SINHVIEN thì tiến hành cập nhật tự động lại số lượng sinh viên của lớp đó
-- tự động cập nhật chứ ko cần phải sửa thủ công như trước
-- cách 1(đúng trong mọi trường hợp)
create trigger trg_ins_hv on HOCVIEN
after insert  -- sẽ hoạt động sau khi insert vào học viên
as
	update SOLUONGSV
	set SoSV = SOSV+1
	from inserted i join SOLUONGSV s on i.MALOP = s.MaLop
-- cách 2(đúng trong trường hợp inserted)
create trigger trg_ins_hv1 on HOCVIEN
after insert  -- sẽ hoạt động sau khi insert vào học viên
as
	update SOLUONGSV
	set SoSV = SOSV+1
	where malop = (select MaLop from inserted) 
-- cách 3
create trigger trg_ins_hv2 on HOCVIEN
after insert  -- sẽ hoạt động sau khi insert vào học viên
as
	declare @malop char(3)
	select @malop = malop from inserted
	update SOLUONGSV
	set SoSV = SOSV+1
	where malop = (select MaLop from inserted) 
select * from SOLUONGSV
-- nếu insert mà ko disable thì sẽ +3 lần -> disable (click chuột phải tại trigger)
-- test
insert into HOCVIEN
values('K1121','Nguyen Van','Tai',1986/1/27,'Nam','Nghe An','K11')
-- nếu ko disable trong bảng thì:
disable trigger trg_ins_hv1 on HOCVIEN
disable trigger trg_ins_hv2 on HOCVIEN 
enable trigger trg_ins_HV_limit on HOCVIEN
-- c.Viết Trigger để thực hiện yêu cầu: Sau khi chèn, cập nhật, xóa thông tin của một SINHVIEN trong bảng Sinh viên thì tiến hành cập nhật tự động lại số lượng sinh viên của lớp đó.
create trigger trg_up_hv on HOCVIEN
after update
as 
begin
	if update(malop)
	begin
		update SOLUONGSV
		set SoSV = SOSV-1
		from deleted d join SOLUONGSV s on d.MALOP = s.MaLop -- cập nhật tự động số lượng sinh viên => sẽ sửa lại tại mã lớp
		update SOLUONGSV
		set SoSV = SOSV+1
		from inserted i join SOLUONGSV s on i.MALOP = s.MaLop -- cập nhật tự động số lượng sinh viên => sẽ sửa lại tại mã lớp
	end
end

-- test
	update HOCVIEN
	set ten = 'Skibidi' -- nếu set tên => sẽ ko ảnh hưởng VÌ chỉ khi sửa mã lớp, nó mới có thay đổi
	where mahv = 'k1101'
	set malop = 'K13'
	where mahv = 'k1101'

--d. Viết trigger tạo ràng buộc là số sinh viên của 1 lớp phải < 4
create trigger trg_ins_HV_limit on HOCVIEN
after insert
as
	declare @sosv int
	select @sosv = COUNT(h.MAHV)
	from HOCVIEN h join inserted i on i.MALOP = h.MALOP -- kết nối mã lớp của bảng trigger với bảng hocvien
	if(@sosv >= 4)
		begin
			rollback transaction
			raiserror(N'Số sinh viên của 1 lớp ko thể > 4',16,1);
		end

--e. Viết Trigger tạo ràng buộc cho bảng SINHVIEN là tuổi của SINHVIEN phải >=17 tuổi.
create trigger trg_ins_Age_Limit on HOCVIEN
after insert
as
	declare @tuoi int
	select @tuoi = DATEDIFF(YEAR,h.NGSINH,GETDATE())
	from HOCVIEN h join inserted i on i.NGSINH = h.NGSINH
	if(@tuoi <17)
		begin
			rollback transaction
			raiserror(N'Tuổi của sinh viên >= 17',16,1);
		end
-- f.Viết Trigger tạo ràng buộc cho bảng SINHVIEN là tuổi của SINHVIEN phải <=45 đối với nữ và <=50 đối với nam.
create trigger trg_ins_tuoi_sex_limit on HOCVIEN
after insert
as
		declare @sotuoi int, @gioitinh varchar(3)
		select @sotuoi = DATEDIFF(YEAR, h.NGSINH, GETDATE()),@gioitinh = h.GIOITINH
		from HOCVIEN h join inserted i on i.MALOP = h.MALOP 
		if((@gioitinh = N'Nam' and @sotuoi>50) or (@gioitinh = N'Nu' and @sotuoi>45))
			begin 
				rollback transaction
				raiserror (N'Tuổi của SINHVIEN phải <=45 đối với nữ và <=50 đối với nam',16,1)
			end
-- g.Tạo Trigger có tên là Nomodify không cho phép người dùng xóa hay sửa đổi các đối tượng View trong CSDL. 
-- Thực hiện Disable Trigger này.
create trigger trg_ins_nomodify
on database
	for drop_view, alter_view
	as
		begin 
			rollback transaction
			raiserror (N'không được phép xóa hay sửa đổi các đối tượng View trong CSDL',16,1)
		end;

disable trigger trg_ins_nomodify on database;
enable trigger trg_ins_nomodify on database

--test
select * from HOCVIEN
select * from SOLUONGSV