create database QuanLyBenhVien1 
use QuanLyBenhVien1

Create Table Users 
(
Id int primary key identity(1,1),
FullName nvarchar(250) not null,
Email varchar(250) not null,
Password varchar(250) not null 
)
Create Table BacSiChuyenKhoa
(
Id int primary key identity(1,1),
TenChuyenKhoa nvarchar(250) not null 
)
Create Table Doctor 
(
Id int primary key identity(1,1),
FullName nvarchar(250) not null,
Dob date not null ,
Qualification nvarchar(250) not null,
ChuyenKhoa nvarchar(250) not null ,
Email varchar(250) not null,
MobNo varchar(20) not null ,
Password varchar(250) not null
)
create table CuocHen 
(
Id int primary key identity (1,1),
userId int foreign key references Users(id),
fullName nvarchar (255) not null,
gioiTinh nvarchar(10),
age varchar(20),
ngayHen varchar(20),
email varchar(255),
sdt varchar(20),
benhTat nvarchar(255),
doctorId int foreign key references Doctor(id),
diaChi nvarchar(255),
trangThai nvarchar(255)
)

CREATE TABLE Benh (
    Id INT PRIMARY KEY identity(1,1),
    TenBenh NVARCHAR(250),
    TrieuChung NVARCHAR(500),
    ChuyenKhoaId INT,
    FOREIGN KEY (ChuyenKhoaId) REFERENCES BacSiChuyenKhoa(Id)
);

CREATE TABLE UserProfile (
    Id INT PRIMARY KEY IDENTITY(1,1),
    UserId INT UNIQUE,
    Gender NVARCHAR(10),
    Dob DATE,
    Phone NVARCHAR(20),
    Address NVARCHAR(255),
    InsuranceNumber NVARCHAR(50),
    Avatar NVARCHAR(255),
    FOREIGN KEY (UserId) REFERENCES Users(Id)
);

CREATE TABLE HoSoBenhAn (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CuocHenId INT,
    UserId INT,
    DoctorId INT,
    Symptoms NVARCHAR(500),
    Diagnosis NVARCHAR(500),
    Medicine NVARCHAR(500),
    NextAppointment DATE,
    PdfResult NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CuocHenId) REFERENCES CuocHen(Id),
    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (DoctorId) REFERENCES Doctor(Id)
);

CREATE TABLE Messages (
    Id INT PRIMARY KEY IDENTITY(1,1),
    SenderId INT,
    ReceiverId INT,
    Content NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE(),
    MessageType NVARCHAR(20),   -- 'USER' / 'DOCTOR'
    FOREIGN KEY (SenderId) REFERENCES Users(Id),
    FOREIGN KEY (ReceiverId) REFERENCES Doctor(Id)
);



INSERT INTO Users (FullName, Email, Password)
VALUES 
(N'Nguyễn Văn An', 'an.nguyen@example.com', '123'),
(N'Lê Thị Bình', 'binh.le@example.com', '123'),
(N'Trần Văn Cường', 'cuong.tran@example.com', '123'),
(N'Phạm Thị Dung', 'dung.pham@example.com', '123'),
(N'Ngô Minh Đức', 'duc.ngo@example.com', '123'),
(N'Hoàng Lan', 'lan.hoang@example.com', '123'),
(N'Võ Tuấn', 'tuan.vo@example.com', '123'),
(N'Lý Hồng', 'hong.ly@example.com', '123'),
(N'Đặng Phương', 'phuong.dang@example.com', '123'),
(N'Đỗ Quang', 'quang.do@example.com', '123');

INSERT INTO BacSiChuyenKhoa (TenChuyenKhoa)
VALUES 
(N'Nội Tổng Quát'),
(N'Tim Mạch'),
(N'Nhi Khoa'),
(N'Mắt'),
(N'Răng Hàm Mặt'),
(N'Sản Khoa'),
(N'Thần Kinh'),
(N'Tai Mũi Họng'),
(N'Da Liễu'),
(N'Cơ Xương Khớp');

INSERT INTO Doctor (FullName, Dob, Qualification, ChuyenKhoa, Email, MobNo, Password)
VALUES (N'BS. Nguyễn Hữu M', '1980-05-10', N'BSCKII', N'Nội Tổng Quát', 'minh.nguyen@medihome.com', '0901000001', '123')

INSERT INTO Doctor (FullName, Dob, Qualification, ChuyenKhoa, Email, MobNo, Password)
VALUES
(N'BS. Nguyễn Hữu Minh', '1980-05-10', N'BSCKII', N'Nội Tổng Quát', 'minh.nguyen@medihome.com', '0901000001', '123'),
(N'BS. Trần Thị Hạnh', '1985-03-20', N'BSCKI', N'Tim Mạch', 'hanh.tran@medihome.com', '0901000002', '123'),
(N'BS. Lê Quốc Đạt', '1978-07-15', N'BSCKII', N'Nhi Khoa', 'dat.le@medihome.com', '0901000003', '123'),
(N'BS. Võ Tấn Tài', '1982-01-30', N'BSCKI', N'Mắt', 'tai.vo@medihome.com', '0901000004', '123'),
(N'BS. Phạm Ngọc Hà', '1983-06-25', N'BSCKI', N'Răng Hàm Mặt', 'ha.pham@medihome.com', '0901000005', '123'),
(N'BS. Nguyễn Thị Thu', '1990-04-14', N'BSCKI', N'Sản Khoa', 'thu.nguyen@medihome.com', '0901000006', '123'),
(N'BS. Hoàng Văn Lâm', '1975-02-18', N'BSCKII', N'Thần Kinh', 'lam.hoang@medihome.com', '0901000007', '123'),
(N'BS. Đặng Minh Tùng', '1984-12-09', N'BSCKI', N'Tai Mũi Họng', 'tung.dang@medihome.com', '0901000008', '123'),
(N'BS. Lý Anh Khoa', '1986-11-12', N'BSCKI', N'Da Liễu', 'khoa.ly@medihome.com', '0901000009', '123'),
(N'BS. Phan Thanh Hùng', '1979-09-02', N'BSCKII', N'Cơ Xương Khớp', 'hung.phan@medihome.com', '0901000010', '123');

INSERT INTO CuocHen (userId, fullName, gioiTinh, age, ngayHen, email, sdt, benhTat, doctorId, diaChi, trangThai)
VALUES
(1, N'Nguyễn Văn An', N'Nam', '30', '2025-12-01', 'an.nguyen@example.com', '0905001001', N'Cảm cúm', 1, N'Hà Nội', N'Hoàn thành'),
(2, N'Lê Thị Bình', N'Nữ', '28', '2025-12-02', 'binh.le@example.com', '0905001002', N'Tim đập nhanh', 2, N'Hải Phòng', N'Hoàn thành'),
(3, N'Trần Văn Cường', N'Nam', '25', '2025-12-03', 'cuong.tran@example.com', '0905001003', N'Sốt cao', 3, N'Hà Nội', N'Đã xác nhận'),
(4, N'Phạm Thị Dung', N'Nữ', '32', '2025-12-04', 'dung.pham@example.com', '0905001004', N'Đau mắt', 4, N'Hà Nam', N'Hoàn thành'),
(5, N'Ngô Minh Đức', N'Nam', '40', '2025-12-05', 'duc.ngo@example.com', '0905001005', N'Đau răng', 5, N'Hà Nội', N'Hoàn thành'),
(6, N'Hoàng Lan', N'Nữ', '27', '2025-12-06', 'lan.hoang@example.com', '0905001006', N'Khám thai', 6, N'Đà Nẵng', N'Đang xử lý'),
(7, N'Võ Tuấn', N'Nam', '35', '2025-12-07', 'tuan.vo@example.com', '0905001007', N'Mất ngủ', 7, N'Huế', N'Hoàn thành'),
(8, N'Lý Hồng', N'Nữ', '29', '2025-12-08', 'hong.ly@example.com', '0905001008', N'Viêm họng', 8, N'Hà Nội', N'Hoàn thành'),
(9, N'Đặng Phương', N'Nữ', '31', '2025-12-09', 'phuong.dang@example.com', '0905001009', N'Nổi mụn', 9, N'Hà Nội', N'Hoàn thành'),
(10, N'Đỗ Quang', N'Nam', '33', '2025-12-10', 'quang.do@example.com', '0905001010', N'Đau khớp', 10, N'Hà Nội', N'Hoàn thành');

INSERT INTO UserProfile (UserId, Gender, Dob, Phone, Address, InsuranceNumber, Avatar)
VALUES
(1, N'Nam', '1995-05-12', '0905001001', N'Hà Nội', 'BHYT001', 'user-avatars/an.jpg'),
(2, N'Nữ', '1997-03-20', '0905001002', N'Hải Phòng', 'BHYT002', 'user-avatars/binh.jpg'),
(3, N'Nam', '2000-08-11', '0905001003', N'Hà Nội', 'BHYT003', 'user-avatars/cuong.jpg'),
(4, N'Nữ', '1993-09-15', '0905001004', N'Hà Nam', 'BHYT004', 'user-avatars/dung.jpg'),
(5, N'Nam', '1985-10-25', '0905001005', N'Hà Nội', 'BHYT005', 'user-avatars/duc.jpg'),
(6, N'Nữ', '1998-07-01', '0905001006', N'Đà Nẵng', 'BHYT006', 'user-avatars/lan.jpg'),
(7, N'Nam', '1990-04-21', '0905001007', N'Huế', 'BHYT007', 'user-avatars/tuan.jpg'),
(8, N'Nữ', '1996-06-16', '0905001008', N'Hà Nội', 'BHYT008', 'user-avatars/hong.jpg'),
(9, N'Nữ', '1994-12-12', '0905001009', N'Hà Nội', 'BHYT009', 'user-avatars/phuong.jpg'),
(10, N'Nam', '1992-01-30', '0905001010', N'Hà Nội', 'BHYT010', 'user-avatars/quang.jpg');

INSERT INTO Benh (TenBenh, TrieuChung, ChuyenKhoaId)
VALUES
(N'Cảm cúm', N'Sốt nhẹ, ho khan, sổ mũi, mệt mỏi', 1),                -- Nội tổng quát
(N'Đau thắt ngực', N'Đau vùng ngực, khó thở, chóng mặt', 2),         -- Tim mạch
(N'Sốt virus', N'Sốt cao, phát ban, đau cơ', 3),                     -- Nhi khoa
(N'Viêm kết mạc', N'Mắt đỏ, ngứa, chảy nước mắt', 4),                -- Mắt
(N'Sâu răng', N'Đau răng, nhức hàm, sưng lợi', 5),                   -- Răng hàm mặt
(N'Viêm nhiễm phụ khoa', N'Huyết trắng, ngứa, đau vùng kín', 6),     -- Sản khoa
(N'Mất ngủ', N'Khó ngủ, tỉnh giấc giữa đêm, mệt mỏi ban ngày', 7),   -- Thần kinh
(N'Viêm họng', N'Đau rát cổ, ho, khó nuốt', 8),                      -- Tai mũi họng
(N'Mụn trứng cá', N'Nổi mụn đỏ, sưng viêm, đau nhẹ', 9),              -- Da liễu
(N'Viêm khớp', N'Đau khớp gối, sưng khớp, khó cử động', 10);          -- Cơ xương khớp

INSERT INTO HoSoBenhAn (CuocHenId, UserId, DoctorId, Symptoms, Diagnosis, Medicine, NextAppointment, PdfResult)
VALUES
(1, 1, 1, N'Sốt nhẹ, ho khan', N'Cảm cúm nhẹ', N'Paracetamol, Vitamin C', '2025-12-20', N'medical-pdf/camcum.pdf'),
(2, 2, 2, N'Đau ngực, khó thở', N'Rối loạn nhịp tim', N'Thuốc giãn mạch', '2025-12-22', N'medical-pdf/timmach.pdf'),
(3, 3, 3, N'Đau mắt, đỏ mắt', N'Viêm kết mạc', N'Thuốc nhỏ Tobradex', '2025-12-25', N'medical-pdf/mat.pdf');


select * from CuocHen h join Doctor d on d.Id = h.doctorId
select * from doctor d join CuocHen c on d.Id = c.doctorId
DELETE FROM Doctor WHERE id = 1;

select count(*) from CuocHen
select count(*) from Users 
SELECT COUNT(*) FROM CuocHen WHERE CAST(ngayHen AS DATE) = CAST(GETDATE() AS DATE)
select count(*) from CuocHen

SELECT d.* FROM Doctor d JOIN BacSiChuyenKhoa b ON d.ChuyenKhoa COLLATE SQL_Latin1_General_CP1_CI_AI = 
b.TenChuyenKhoa COLLATE SQL_Latin1_General_CP1_CI_AI 
WHERE b.Id = 2;

select * from Doctor 
select * from BacSiChuyenKhoa
select * from users 