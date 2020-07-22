create database Qlcafe
go
use Qlcafe
go

if OBJECT_ID('DangNhap') is not null
drop table DangNhap
go
if OBJECT_ID('NhanVien') is not null
drop table NhanVien
go

if OBJECT_ID('DanhSachNV') is not null
drop table DanhSachNV
go
if OBJECT_ID('SanPham') is not null
drop table SanPham
go
if OBJECT_ID('CTdoanhThu') is not null
drop table CTdoanhThu
go
if OBJECT_ID('HoaDon') is not null
drop table HoaDon
go
if OBJECT_ID('LoaiSP') is not null
drop table LoaiSP
go


create table DangNhap(

TaiKhoan nvarchar(30) not null,
MatKhau nvarchar(30) not null,
chucVu nvarchar(15) not null
	constraint PK_DangNhap primary key(TaiKhoan)
)
go

Create table NhanVien(
	MaNV nvarchar(10) not null,
	hoTen nvarchar(30) not null,
GioiTinh nvarchar(5) not null,
tuoi int,
chucVu nvarchar(15) not null,
	constraint PK_NhanVien primary key(MaNV)
)
go


create table DanhSachNV(

MaNV nvarchar(10) not null,
hoTen nvarchar(30) not null,
GioiTinh nvarchar(5) not null,
tuoi int,
TaiKhoan nvarchar(30) not null,
MatKhau nvarchar(30) not null
constraint PK_DanhSachNV primary key(MaNV),
constraint FK_DanhSachNV_NhanVien foreign key (MaNV) references NhanVien(MaNV)
)
go
Create table SanPham(
maHD nvarchar(10) not null,
	maSP nvarchar(10) not null,
	tenSP nvarchar(20) not null,
	gia money,
	moTa nvarchar(50) not null
	constraint PK_SanPham primary key(maSP)

)
go
create table LoaiSP(
MaTLoai nvarchar(10) not null,
TenTLoai nvarchar(30) not null,
maSP nvarchar(10) not null,
soLg int,
constraint PK_LoaiSP primary key(MaTLoai),
constraint FK_LoaiSP_SanPham foreign key (MaSP) references SanPham(MaSP) 
)
go

Create table HoaDon(
	MaNV nvarchar(10) not null,
	maHD nvarchar(10) not null,
	maSP nvarchar(10) not null,
	tenSP nvarchar(20) not null,
	soLg int,
	gia money,
	tongTien money,
	constraint PK_HoaDon primary key(maHD),
constraint FK_HoaDon_NhanVien foreign key (maNV) references NhanVien(MaNV)
	
)
go
create table CTdoanhThu(

	maHD nvarchar(10) not null,
	maSP nvarchar(10) not null,
	tenSP nvarchar(20) not null,
	soLg int,
	tongTien money,
	ngXuatHD date,
	[chuaThanhToan/daThanhToan] bit
	constraint PK_CTdoanhThu primary key(maHD,maSP),
constraint FK_CTdoanhThu_HoaDon foreign key (maHD) references HoaDon(maHD),
constraint FK_CTdoanhThu_SanPham foreign key (maSP) references SanPham(maSP)
)
go