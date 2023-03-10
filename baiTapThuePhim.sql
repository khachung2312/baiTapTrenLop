CREATE DATABASE thuePhim;
use thuePhim;

 CREATE TABLE NGUOI_DUNG (
	 MA_NGUOI_DUNG varchar(255) PRIMARY KEY,
	 HO_TEN_NGUOI_DUNG varchar(255),
	 SO_DIEN_THOAI int,
	 MA_GIOI_TINH varchar(255),
     FOREIGN KEY (MA_GIOI_TINH) REFERENCES GIOI_TINH(MA_GIOI_TINH)
 );

 CREATE TABLE GIOI_TINH (
	MA_GIOI_TINH varchar(255) PRIMARY KEY,
    TEN_GIOI_TINH varchar(255)
);
 
CREATE TABLE PHIM (
	MA_PHIM varchar(255) PRIMARY KEY,
    TEN_PHIM varchar(255),
    MA_THE_LOAI varchar(255),
    NGAY_SAN_XUAT varchar(255),
    GIA_PHIM int,
    MA_DANH_MUC varchar(255),
    FOREIGN KEY (MA_DANH_MUC) REFERENCES DANH_MUC (MA_DANH_MUC),
    FOREIGN KEY (MA_THE_LOAI) REFERENCES THE_LOAI (MA_THE_LOAI)
);

CREATE TABLE THE_LOAI (
	MA_THE_LOAI varchar(255) PRIMARY KEY,
    TEN_THE_LOAI varchar(255)
);
CREATE TABLE DANH_MUC (
	MA_DANH_MUC varchar(255) PRIMARY KEY,
    TEN_DANH_MUC varchar(255)
);

CREATE TABLE THUE_PHIM (
	MA_THUE_PHIM varchar(255) PRIMARY KEY,
    THOI_GIAN varchar(255),
    MA_NGUOI_DUNG varchar(255),
    MA_PHIM varchar(255),
    SO_TIEN int,
    THOI_GIAN_TRA varchar(255),
    FOREIGN KEY (MA_NGUOI_DUNG) REFERENCES NGUOI_DUNG (MA_NGUOI_DUNG),
    FOREIGN KEY (MA_PHIM) REFERENCES PHIM (MA_PHIM)
);

INSERT INTO GIOI_TINH (MA_GIOI_TINH, TEN_GIOI_TINH) VALUES
	('MGT1', 'Nam'),
    ('MGT2', 'Nữ'),
    ('MGT3', 'Không xác định');


INSERT INTO THE_LOAI (MA_THE_LOAI, TEN_THE_LOAI) VALUES
	('MTL1', 'Kinh dị'),
    ('MTL2', 'Hài hước'),
    ('MTL3', 'Tâm lí');

INSERT INTO DANH_MUC (MA_DANH_MUC, TEN_DANH_MUC) VALUES 
	('MDM1', 'Dành cho trẻ em trên 6 tuổi '),
    ('MDM2', 'Dành cho trẻ em trên 12 tuổi'),
    ('MDM3', 'Dành cho người trên 18 tuổi');
    
INSERT INTO NGUOI_DUNG (MA_NGUOI_DUNG, HO_TEN_NGUOI_DUNG, SO_DIEN_THOAI, MA_GIOI_TINH) VALUES
	('MND1', 'NGUYEN KHAC HUNG', 099887766, 'MGT1'),
    ('MND2', 'NGUYEN THI TRANG', 011223344, 'MGT2'),
    ('MND3', 'NGUYEN VAN TUAN', 08997766, 'MGT1');

INSERT INTO PHIM (MA_PHIM, TEN_PHIM, MA_THE_LOAI, NGAY_SAN_XUAT, GIA_PHIM, MA_DANH_MUC) VALUES
	('MP1', 'DORAEMON', 'MTL2', '2022-12-30', 60000, 'MDM1'),
    ('MP2', 'NHA BA NU', 'MTL3', 2022-12-15, 90000, 'MDM2'),
    ('MP3', 'M3GAN', 'MTL1', '2022-10-13', 80000, 'MDM3');
    
INSERT INTO THUE_PHIM (MA_THUE_PHIM, THOI_GIAN, MA_NGUOI_DUNG, MA_PHIM, SO_TIEN, THOI_GIAN_TRA) VALUES
	('MTP1', '2023-01-02 8:15', 'MND2', 'MP1',100000, '2023-01-02 12:05'),
    ('MTP2', '2023-01-03 12:05', 'MND1', 'MP3',120000, '2023-01-03 02:010'),
    ('MTP3', '2023-01-03 13:15', 'MND3', 'MP2',100000, '2023-01-02 15:05');
    
SELECT * FROM GIOI_TINH;
SELECT * FROM NGUOI_DUNG;
SELECT * FROM THE_LOAI;
SELECT * FROM DANH_MUC;
SELECT * FROM PHIM;
SELECT * FROM THUE_PHIM;

//Lay ra 3 nguoi thue nhieu phim nhat. Hien thi thong tin nhung nguoi thue phim do

SELECT TOP 3 THUE_PHIM.MA_NGUOI_DUNG, COUNT(THUE_PHIM.MA_NGUOI_DUNG) AS soNguoiThue
FROM THUE_PHIM
inner join NGUOI_DUNG ON NGUOI_DUNG.MA_NGUOI_DUNG = THUE_PHIM.MA_NGUOI_DUNG
GROUP BY THUE_PHIM.MA_NGUOI_DUNG
ORDER BY soNguoiThue DESC 

//Tinh tong doanh thu cua 1 bo phim trong 2 ngay
SELECT DISTINCT PHIM.MA_PHIM, PHIM.TEN_PHIM, THUE_PHIM.giaThue1Ngay*2*(COUNT(THUE_PHIM.MA_NGUOI_DUNG)) AS tongDoanhThu2Ngay
FROM PHIM
inner join THUE_PHIM on PHIM.MA_PHIM = THUE_PHIM.MA_PHIM

//Lay ra top 3 phim duoc thue nhieu nhat trong 1 ngay 
SELECT TOP 3 THUE_PHIM.MA_PHIM, COUNT(THUE_PHIM.MA_PHIM) AS soLuongThuePhim
FROM THUE_PHIM
GROUP BY NGUOI_DUNG.MA_PHIM
ORDER BY soLuongThuePhim DESC 

//Hien thi danh sach tat ca thong tin phim
SELECT DISTINCT * FROM PHIM


