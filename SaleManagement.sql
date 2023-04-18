create database SaleManagement;
use SaleManagement;

#Bang Phieu Xuat
create table PhieuXuat(
	SoPX int auto_increment primary key,
	NgayXuat datetime not null
);

#Bang Vat Tu
create table VatTu(
	MaVT int auto_increment primary key,
	TenVT varchar(50)
);

#Bang Phieu Nhap
create table PhieuNhap(
	SoPN int auto_increment primary key,
    NgayNhap datetime not null
);

#Bang Don Dat Hang
create table DonDH(
	SoDH int auto_increment primary key,
    NgayDH datetime not null
);

#Bang Nha Cung Cap
create table NhaCC(
	MaNCC int auto_increment primary key,
    TenNCC varchar(255) not null,
    DiaChi varchar(255) not null,
    SoDT varchar(10) not null
);


##Bang Quan he => Chi Tiet Phieu Xuat##
create table ChiTietPhieuXuat(
	SoPX int not null,
    MaVT int not null,
    SLXuat int not null,
    DGXuat float not null,
    primary key(SoPX, MaVT),
    foreign key (SoPX) references PhieuXuat(SoPX),
    foreign key (MaVT) references VatTu(MaVT)
);

##Bang Quan he => Chi Tiet Phieu Nhap##
create table ChiTietPhieuNhap(
	SoPN int not null,
    MaVT int not null,
    SLNhap int not null,
    DGNhap float not null,
    primary key(SoPN, MaVT),
    foreign key (SoPN) references PhieuNhap(SoPN),
    foreign key (MaVT) references VatTu(MaVT)
);

##Bang Quan he => Chi Tiet Dat Hang##
create table ChiTietDH(
	SoDH int not null,
	MaVT int not null,
    primary key(SoDH, MaVT),
    foreign key (SoDH) references DonDH(SoDH),
    foreign key (MaVT) references VatTu(MaVT)
);

##Bang Quan he => Chi Tiet Cung Cap##
create table ChiTietCC(
	SoDH int not null,
    MaNCC int not null,
    foreign key (SoDH) references DonDH(SoDH),
    foreign key (MaNCC) references NhaCC(MaNCC)
);

alter table ChiTietCC add primary key (SoDH);