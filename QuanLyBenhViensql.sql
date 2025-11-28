create database QuanLyBenhVien 
use QuanLyBenhVien 

Create Table Users 
(
Id int primary key identity(1,1),
FullName nvarchar(250) not null,
Email varchar(250) not null,
Password varchar(250) not null 
)

select * from Doctor
select * from users 
select * from bacSiChuyenKhoa 

Create Table BacSiChuyenKhoa
(
Id int primary key identity(1,1),
TenChuyenKhoa nvarchar(250) not null 
)
INSERT INTO BacSiChuyenKhoa (TenChuyenKhoa)
VALUES
(N'Nội khoa'),
(N'Ngoại khoa'),
(N'Nhi khoa'),
(N'Sản - Phụ khoa'),
(N'Tim mạch'),
(N'Tai - Mũi - Họng'),
(N'Răng - Hàm - Mặt'),
(N'Chẩn đoán hình ảnh'),
(N'Hồi sức cấp cứu'),
(N'Da liễu');
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
INSERT INTO Doctor (FullName, Dob, Qualification, ChuyenKhoa, Email, MobNo, Password)
VALUES
(N'Nguyễn Văn An', '1985-04-12', N'Bác sĩ Nội trú', N'Nội khoa', 'an.nguyen@example.com', '0912345678', 'pass123'),

(N'Trần Thị Bình', '1990-07-25', N'Thạc sĩ Y học', N'Nhi khoa', 'binh.tran@example.com', '0987654321', '123456'),

(N'Lê Hoàng Minh', '1982-01-30', N'Bác sĩ Chuyên khoa I', N'Ngoại khoa', 'minh.le@example.com', '0909888777', 'abc123'),

(N'Phạm Thị Thu', '1993-09-15', N'Bác sĩ Đa khoa', N'Sản phụ khoa', 'thu.pham@example.com', '0933555777', 'password1'),

(N'Hoàng Quốc Huy', '1988-12-05', N'Bác sĩ Chẩn đoán hình ảnh', N'X-quang', 'huy.hoang@example.com', '0977666555', 'doctor2024');

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
INSERT INTO CuocHen 
(userId, fullName, gioiTinh, age, ngayHen, email, sdt, benhTat, doctorId, diaChi, trangThai)
VALUES
(1, N'Nguyễn Thị Hoa', N'Nữ', '28', '2025-01-15', 'hoa.nguyen@example.com', '0912345678', N'Cảm cúm', 4, N'Hà Nội', N'Chờ xác nhận'),

(1, N'Lê Minh Tuấn', N'Nam', '35', '2025-01-16', 'tuan.le@example.com', '0988111222', N'Đau dạ dày', 2, N'Hồ Chí Minh', N'Đã xác nhận'),

(2, N'Trần Thị Hạnh', N'Nữ', '42', '2025-01-18', 'hanh.tran@example.com', '0909777555', N'Khám tim mạch', 3, N'Đà Nẵng', N'Đang chờ')

select * from CuocHen 

CREATE TABLE Benh (
    Id INT PRIMARY KEY identity(1,1),
    TenBenh NVARCHAR(250),
    TrieuChung NVARCHAR(500),
    ChuyenKhoaId INT,
    FOREIGN KEY (ChuyenKhoaId) REFERENCES BacSiChuyenKhoa(Id)
);
INSERT INTO Benh (TenBenh, TrieuChung, ChuyenKhoaId)
VALUES
(N'Viêm họng', N'Đau họng, khó nuốt, ho khan', 6),           -- Tai - Mũi - Họng
(N'Đau đầu', N'Đau nhức đầu, hoa mắt, chóng mặt', 1),        -- Nội khoa
(N'Đau bụng', N'Đau vùng bụng, buồn nôn, khó tiêu', 2),      -- Ngoại khoa
(N'Viêm phổi', N'Ho, sốt, khó thở, tức ngực', 1),            -- Nội khoa
(N'Cảm cúm', N'Sổ mũi, ho, đau họng, sốt nhẹ', 1),           -- Nội khoa
(N'Bệnh tim mạch', N'Đau tức ngực, khó thở, tim đập nhanh', 5), -- Tim mạch
(N'Mụn trứng cá', N'Nổi mụn, sưng viêm da mặt', 10),         -- Da liễu
(N'Sâu răng', N'Đau răng, ê buốt, viêm lợi', 7),             -- Răng - Hàm - Mặt
(N'Viêm tai giữa', N'Đau tai, nghe kém, chảy dịch tai', 6),  -- Tai - Mũi - Họng
(N'Đau lưng', N'Đau vùng lưng, cứng cơ, khó cử động', 2);
CREATE TABLE BenhAn (
    Id INT PRIMARY KEY identity(1,1),
    CuocHenId INT,
    MoTaBenh NVARCHAR(500),
    KetQuaKham NVARCHAR(500),
    ThuocKeDon NVARCHAR(500),
    NgayKham DATE,
    FOREIGN KEY (CuocHenId) REFERENCES CuocHen(Id)
);

SELECT * FROM Benh 
WHERE TrieuChung COLLATE SQL_Latin1_General_CP1_CI_AI LIKE N'%viem hong%'
   OR TenBenh COLLATE SQL_Latin1_General_CP1_CI_AI LIKE N'%viem hong%';

SELECT d.*
FROM Doctor d
JOIN BacSiChuyenKhoa b
  ON d.ChuyenKhoa COLLATE SQL_Latin1_General_CP1_CI_AI = 
     b.TenChuyenKhoa COLLATE SQL_Latin1_General_CP1_CI_AI
WHERE b.Id = 6;

	 INSERT INTO Doctor (FullName, Dob, Qualification, ChuyenKhoa, Email, MobNo, Password)
VALUES
(N'Phạm Quốc Dũng', '1989-10-12', N'Bác sĩ chuyên khoa I', N'Tai - Mũi - Họng', 
'dung.pham@example.com', '0909123456', '123456');