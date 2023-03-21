-------------------------CAU1---------------------
CREATE DATABASE QuanLyDeAn2
ON PRIMARY
(
	NAME = QuanLyDeAn_Data2,
	FILENAME = 'D:\nguyentuantu\QuanLyDeAn2_Data.mdf',
	SIZE = 20MB,
	MAXSIZE = 500MB,
	FILEGROWTH = 1MB
)
LOG ON
(
	NAME = QuanLyDeAn2_Log,  
    FILENAME = 'D:\nguyentuantu\QuanLyDeAn2_Log.ldf',  
    SIZE = 2MB,  
    MAXSIZE = 48MB,  
    FILEGROWTH = 10%
)
-------------------------CAU2---------------------
USE master
CREATE DATABASE QuanLyDeAn
USE QuanLyDeAn
CREATE TABLE tbNHANVIEN
( MaNV varchar(9) NOT NULL PRIMARY KEY,
  HoNV nvarchar(15) NULL,
  TenLot nvarchar(30) NULL,
  TenNV	nvarchar(30) NULL,
  NgaySinh smalldatetime NULL,
  DiaCh nvarchar(150) NULL,
  Phai nvarchar(3) NULL,
  Luong numeric(18,0) NULL,
  Phong varchar(2) NULL FOREIGN KEY REFERENCES tbPHONGBAN (MaPhg),
);
CREATE TABLE tbPHANCONG
( MaNV varchar(9) NOT NULL FOREIGN KEY (MaNV) REFERENCES tbNHANVIEN (MaNV),
  MaDA varchar(2) NOT NULL FOREIGN KEY  REFERENCES tbDEAN (MaDA),
  ThoiGian numeric(18,0) NULL,
  CONSTRAINT PHANCONG_PK PRIMARY KEY (MaNV, MaDA),
);
CREATE TABLE tbDEAN
( MaDA varchar(2) NOT NULL PRIMARY KEY,
  TenDA nvarchar(50)  NULL,
  DDiemDA varchar(20) NULL,
);
CREATE TABLE tbPHONGBAN
( MaPhg varchar(2) NOT NULL PRIMARY KEY,
  TenPhg nvarchar(20)  NULL,
);
CREATE TABLE tbTHANNHAN
( MaNV varchar(9) NOT NULL FOREIGN KEY REFERENCES tbNHANVIEN (MaNV),
  TenTN varchar(20) NOT NULL,
  NgaySinh smalldatetime NULL,
  Phai varchar(3) NULL,
  QuanHe varchar(15) NULL,
  CONSTRAINT THANNHAN_PK PRIMARY KEY (MaNV, TenTN),
);
---------------------------CAU4---------------------
ALTER TABLE tbPHONGBAN
ALTER COLUMN TenPhg nvarchar(30)
ALTER TABLE tbDEAN
ALTER COLUMN DDiemDA nvarchar(20)
ALTER TABLE tbTHANNHAN
ALTER COLUMN TenTN nvarchar(20)
ALTER TABLE tbTHANNHAN
ALTER COLUMN Phai nvarchar(3)
ALTER TABLE tbTHANNHAN
ALTER COLUMN QuanHe nvarchar(15)
ALTER TABLE tbNHANVIEN
DROP COLUMN SoDienThoai 
--------------CAU5-------------------------------------------------
insert into tbNHANVIEN
values ('123','Đinh','Bá','Tiến','1982-02-27','Mộ Đức','Nam',null ,'4')
insert into tbNHANVIEN
values('234','Nguyễn','Thanh','Tùng','1956-08-12','Sơn Tịnh','Nam',null,'5')
insert into tbNHANVIEN
values('345','Bùi','Thúy','Vũ',null,'Tư Nghĩa','Nữ',null,'4')
insert into tbNHANVIEN
values('456','Lê','Thị','Nhàn','1962-07-12','Mộ Đức','Nữ',null,'4')
insert into tbNHANVIEN
values('567','Nguyễn','Mạnh','Hùng','1985-03-25','Sơn Tịnh','Nam',null,'5')
insert into tbNHANVIEN
values('678','Trần','Hồng','Quan',null,'Bình Sơn','Nam',null,'5')
insert into tbNHANVIEN
values('789','Trần','Thanh','Tâm','1972-06-17','TP Quảng Ngãi','Nam',null,'5')
insert into tbNHANVIEN
values('890','Cao','Thanh','Huyền',null,'Tư Nghã','Nữ',null,'1')
insert into tbNHANVIEN
values('901','Vương','Ngọc','Quyền','1987-12-12','Mộ Đức','Nam',null,'1')

insert into tbPHONGBAN
values('1','Quản lý')
insert into tbPHONGBAN
values('4','Điều hành')
insert into tbPHONGBAN
values('5','Nghiên cứu')

insert tbDEAN
values('1','Nâng cao chất lượng muối','Sa Huỳnh')
insert tbDEAN
values('10','Xây dựng nhà máy chế biến thủy sản','Dung Quất')
insert tbDEAN
values('2','Phát triển hạ tầng mạng','TP Quảng Ngãi')
insert tbDEAN
values('20','Truyền tải cáp quang','TP Quảng Ngãi')
insert tbDEAN
values('3','Tin học hóa trường học','Ba tơ')
insert tbDEAN
values('30','Đào tạo nhân lực','Tịnh Phong')

insert tbPHANCONG
values('123','1','33')
insert tbPHANCONG
values('123','2','8')
insert tbPHANCONG
values('345','10','10')
insert tbPHANCONG
values('345','20','10')
insert tbPHANCONG
values('345','3','10')
insert tbPHANCONG
values('456','1','20')
insert tbPHANCONG
values('456','2','20')
insert tbPHANCONG
values('678','3','40')
insert tbPHANCONG
values('789','10','35')
insert tbPHANCONG
values('789','20','30')
insert tbPHANCONG
values('789','30','5')

insert tbTHANNHAN
values('123','Châu','2005-05-30','Nữ','Con gái')
insert tbTHANNHAN
values('123','Duy','2001-10-25','Nam','Con trai')
insert tbTHANNHAN
values('123','Phương','1985-10-30','Nữ','Vợ chồng')
insert tbTHANNHAN
values('234','Thanh','1980-04-05','Nữ','Con gái')
insert tbTHANNHAN
values('345','Dương','1956-10-30','Nam','Vợ chồng')
insert tbTHANNHAN
values('345','Khang','1982-10-25','Nam','Con trai')
insert tbTHANNHAN
values('456','Hùng','1987-01-01','Nam','Con trai')
insert tbTHANNHAN
values('901','Thương','1989-04-05','Nữ','Vợ chồng')