CREATE DATABASE QL_NV USE QL_NV
CREATE TABLE
	KHOA (
		MAKH CHAR(15) NOT NULL,
		TENKH NVARCHAR (30),
		CONSTRAINT PK_KHOA PRIMARY KEY (MAKH)
	)
CREATE TABLE
	LOP (
		MALOP CHAR(15) NOT NULL,
		TENLOP NVARCHAR (30),
		SISO int,
		LOPTRUONG NVARCHAR (40),
		MAKH CHAR(15) NOT NULL,
		CONSTRAINT PK_LOP PRIMARY KEY (MALOP),
		CONSTRAINT FK_KHOA_LOP FOREIGN KEY (MAKH) REFERENCES KHOA (MAKH)
	)
CREATE TABLE
	SINHVIEN (
		MASV CHAR(15) NOT NULL,
		HOTEN NVARCHAR (40),
		NGAYSINH DATE,
		GTINH NCHAR(3),
		DIACHI NVARCHAR (40),
		MALOP CHAR(15),
		CONSTRAINT PK_SINHVIEN PRIMARY KEY (MASV),
		CONSTRAINT FK_SINHVIEN_LOP FOREIGN KEY (MALOP) REFERENCES LOP (MALOP)
	)
CREATE TABLE
	GIANGVIEN (
		MAGV CHAR(15) NOT NULL,
		TENGV NVARCHAR (30),
		MAKH CHAR(15),
		CONSTRAINT PK_GIANGVIEN PRIMARY KEY (MAGV),
		CONSTRAINT FK_KHOA_GIANGVIEN FOREIGN KEY (MAKH) REFERENCES KHOA (MAKH)
	)
CREATE TABLE
	MONHOC (
		MAMH CHAR(15) NOT NULL,
		TENMH NVARCHAR (30),
		SOTC int,
		CONSTRAINT PK_MONHOC PRIMARY KEY (MAMH)
	)
CREATE TABLE
	DIEM (
		MASV CHAR(15),
		MAMH CHAR(15),
		LANTHI int,
		DIEMTHI int,
		CONSTRAINT PK_DIEM PRIMARY KEY (MASV, MAMH, LANTHI),
		CONSTRAINT FK_DIEM_SINHVIEN FOREIGN KEY (MASV) REFERENCES SINHVIEN (MASV),
		CONSTRAINT FK_DIEM_MONHOC FOREIGN KEY (MAMH) REFERENCES MONHOC (MAMH)
	)
CREATE TABLE
	GIANGDAY (
		MAGV CHAR(15),
		MAMH CHAR(15),
		NAMHOC nvarchar (20),
		HOCKY int,
		CONSTRAINT PK_GIANGDAY PRIMARY KEY (MAGV, MAMH),
		CONSTRAINT FK_GIANGDAY_MONHOC FOREIGN KEY (MAMH) REFERENCES MONHOC (MAMH),
		CONSTRAINT FK_GIANGDAY_GIANGVIEN FOREIGN KEY (MAGV) REFERENCES GIANGVIEN (MAGV)
	)
CREATE TABLE
	THANHNHAN (
		MATN CHAR(15) NOT NULL,
		HOTEN NVARCHAR (30),
		GIOITINH NCHAR(3),
		CONSTRAINT PK_THANHNHAN PRIMARY KEY (MATN)
	)
CREATE TABLE
	QUANHE (
		MATN CHAR(15),
		MASV CHAR(15),
		QUANHE nvarchar (15),
		CONSTRAINT PK_QUANHE PRIMARY KEY (MATN, MASV),
		CONSTRAINT FK_QUANHE_THANHNHAN FOREIGN KEY (MATN) REFERENCES THANHNHAN (MATN),
		CONSTRAINT FK_QUANHE_SINHVIEN FOREIGN KEY (MASV) REFERENCES SINHVIEN (MASV)
	)
INSERT INTO
	KHOA
VALUES
	('SH', N'Công nghệ sinh học'),
	('TH', N'Công nghệ thông tin'),
	('TP', N'Công nghệ thực phẩm'),
	('QT', N'Quản trị kinh doanh'),
	('TC', N'Tài chính kế toán')
INSERT INTO
	LOP
VALUES
	(
		'10SHSH1',
		N'10 Đại học Sinh học 1',
		55,
		'SV008',
		'SH'
	),
	(
		'10DHTH1',
		N'10 Đại học Tin học 1',
		50,
		'SV001',
		'TH'
	),
	(
		'11DHTH2',
		N'11 Đại học Tin học 2',
		40,
		'SV005',
		'TH'
	),
	(
		'12DHTC1',
		N'12 Đại học Tài chính 1',
		75,
		'SV009',
		'TC'
	),
	(
		'12DHTP1',
		N'10 Đại học Thực phẩm 1',
		60,
		'SV001',
		'TP'
	)
SET
	DATEFORMAT dmy;

INSERT INTO
	SINHVIEN
VALUES
	(
		'SV001',
		N'Trần Lệ Quyên',
		'21-01-1995',
		N'Nữ',
		N'TP.HCM',
		'10DHTH1'
	),
	(
		'SV002',
		N'Nguyễn Thế Bình',
		'4-06-1996',
		N'Nam',
		N'Tây Ninh',
		'11DHTH2'
	),
	(
		'SV003',
		N'Tô Ánh Nguyệt',
		'02-05-1976',
		N'Nữ',
		N'Vũng Tàu',
		'12DHTP1'
	),
	(
		'SV004',
		N'Nguyễn Thế Anh',
		'15-12-1996',
		N'Nam',
		N'Đồng Nai',
		'12DHTP1'
	),
	(
		'SV005',
		N'Lê Thanh Bình',
		'09-12-1994',
		N'Nam',
		N'Long An',
		'10DHTH1'
	),
	(
		'SV006',
		N'Phạm Quang Hậu',
		'12-10-1995',
		N'Nam',
		N'Tây Ninh',
		'10DHTH1'
	),
	(
		'SV007',
		N'Lê Cẩm Tú',
		'13-02-1989',
		N'Nữ',
		N'Bình Thuận',
		'12DHTP1'
	),
	(
		'SV008',
		N'Trương Thế Sang',
		'04-04-1993',
		N'Nam',
		N'Bình Dương',
		'10SHSH1'
	),
	(
		'SV009',
		N'Đậu Quang Ánh',
		'03-12-1994',
		N'Nam',
		N'Long An',
		'12DHTC1'
	),
	(
		'SV010',
		N'Huỳnh Kim Chi',
		'18-10-1997',
		N'Nữ',
		N'TP.HCM',
		'11DHTH2'
	),
	(
		'SV011',
		N'Trịnh Đình Ánh',
		'15-11-1995',
		N'Nam',
		N'Bình Thuận',
		'10DHTH1'
	)
INSERT INTO
	GIANGVIEN
VALUES
	('GV001', N'Phạm Thế Bảo', 'TH'),
	('GV002', N'Lê Thế Quyền', 'TH'),
	('GV003', N'Trương Anh Dũng', 'SH'),
	('GV004', N'Bùi Chí Anh', 'TC'),
	('GV005', N'Lê Công Hậu', 'QT'),
	('GV006', N'Lê Trung Thành', 'TP')
INSERT INTO
	MONHOC
VALUES
	('CSDL', N'Cơ sở dũ liệu', 3),
	('KTLT', N'Kỹ thuật lâp trình', 3),
	('THVP', N'Tin học văn phòng', 3),
	('TRR', N'Toán rời rạc', 3),
	('TTNT', N'Trí tuệ nhân tạo', 2),
	('TTQT', N'Thanh toán quốc tế', 2)
INSERT INTO
	DIEM
VALUES
	('SV001', 'CSDL', 1, 9),
	('SV002', 'THVP', 1, 3),
	('SV002', 'THVP', 2, 7),
	('SV004', 'THVP', 1, 6),
	('SV004', 'TTQT', 1, 5),
	('SV005', 'CSDL', 1, 3),
	('SV005', 'CSDL', 2, 6),
	('SV006', 'KTLT', 1, 4),
	('SV009', 'TTQT', 1, 4),
	('SV010', 'THVP', 1, 8),
	('SV010', 'TRR', 1, 7)
INSERT INTO
	GIANGDAY
VALUES
	('GV001', 'CSDL', '2021-2022', 1),
	('GV001', 'KTLT', '2020-2021', 2),
	('GV001', 'TTNT', '2020-2021', 1),
	('GV002', 'CSDL', '2021-2022', 2),
	('GV002', 'KTLT', '2021-2022', 2)
INSERT INTO
	THANHNHAN
VALUES
	('TN001', N'Nguyễn Thế Thành', N'Nam'),
	('TN002', N'Tô Ánh Hồng', N'Nữ'),
	('TN003', N'Lê Thanh Anh', N'Nam'),
	('TN004', N'Phạm Thanh Tiền', N'Nữ'),
	('TN006', N'Đậu Văn Thanh', N'Nam'),
	('TN007', N'Nguyễn Thị Ánh', N'Nữ'),
	('TN008', N'Lê Quang Định', N'Nam'),
	('TN009', N'Huỳnh Văn Tư', N'Nam')
INSERT INTO
	QUANHE
VALUES
	('TN001', 'SV002', N'Bố'),
	('TN003', 'SV005', N'Bố'),
	('TN004', 'SV007', N'Mẹ'),
	('TN006', 'SV009', N'Bố'),
	('TN007', 'SV002', N'Mẹ'),
	('TN008', 'SV005', N'Bố'),
	('TN008', 'SV007', N'Bố');

-- Tạo bảng
CREATE TABLE table_name
(
	column1 datatype,
	column2 datatype,
	...
)

-- Tạo bảng có ràng buộc
CREATE TABLE table_name
(
	column1 datatype CONSTRAINT constraint_name constraint_type,
	column2 datatype CONSTRAINT constraint_name constraint_type,
	...
)

-- Tạo bảng có ràng buộc duy nhất
CREATE TABLE table_name
(
	column1 datatype CONSTRAINT constraint_name UNIQUE,
	column2 datatype CONSTRAINT constraint_name UNIQUE,
	...
)

-- Tạo bảng có ràng buộc kiểm tra
CREATE TABLE table_name
(
	column1 datatype CONSTRAINT constraint_name CHECK (condition),
	column2 datatype CONSTRAINT constraint_name CHECK (condition),
	...
)

-- Tạo bảng có ràng buộc khóa chính
CREATE TABLE table_name
(
	column1 datatype CONSTRAINT constraint_name PRIMARY KEY,
	column2 datatype CONSTRAINT constraint_name PRIMARY KEY,
	...
)

-- Tạo bảng có ràng buộc khóa ngoại
CREATE TABLE table_name
(
	column1 datatype CONSTRAINT constraint_name FOREIGN KEY REFERENCES other_table_name (column_name),
	column2 datatype CONSTRAINT constraint_name FOREIGN KEY REFERENCES other_table_name (column_name),
	...
)

-- Tạo bảng có ràng buộc mặc định
CREATE TABLE table_name
(
	column1 datatype CONSTRAINT constraint_name DEFAULT value,
	column2 datatype CONSTRAINT constraint_name DEFAULT value,
	...
)

-- Tạo bảng có ràng buộc khóa chính theo cột
CREATE TABLE table_name
(
	column1 datatype PRIMARY KEY,
	column2 datatype,
	...
)

-- Tạo bảng có ràng buộc khóa ngoại theo cột
CREATE TABLE table_name
(
	column1 datatype REFERENCES other_table_name (column_name),
	column2 datatype REFERENCES other_table_name (column_name),
	...
)

-- Tạo bảng có ràng buộc duy nhất theo cột
CREATE TABLE table_name
(
	column1 datatype UNIQUE,
	column2 datatype UNIQUE,
	...
)

-- Tạo bảng có ràng buộc kiểm tra theo cột
CREATE TABLE table_name
(
	column1 datatype CHECK (condition),
	column2 datatype CHECK (condition),
	...
)

-- Tạo bảng có ràng buộc mặc định theo cột
CREATE TABLE table_name
(
	column1 datatype DEFAULT value,
	column2 datatype DEFAULT value,
	...
)

-- Thêm cột vào bảng
ALTER TABLE table_name
ADD column_name datatype

-- Xóa cột trong bảng
ALTER TABLE table_name
DROP COLUMN column_name

-- Đổi tên cột
EXEC sp_rename 'table_name.old_column_name', 'new_column_name', 'COLUMN'

-- Đổi tên bảng
EXEC sp_rename 'old_table_name', 'new_table_name'

-- Đổi kiểu dữ liệu cột
ALTER TABLE table_name
ALTER COLUMN column_name datatype

-- Thêm ràng buộc
ALTER TABLE table_name
ADD CONSTRAINT constraint_name constraint_type (column_name)

-- Thêm ràng buộc duy nhất
ALTER TABLE table_name
ADD CONSTRAINT constraint_name UNIQUE (column_name)

-- Thêm ràng buộc kiểm tra
ALTER TABLE table_name
ADD CONSTRAINT constraint_name CHECK (column_name > value)

-- Thêm ràng buộc khóa chính
ALTER TABLE table_name
ADD CONSTRAINT constraint_name PRIMARY KEY (column_name)

-- Thêm ràng buộc khóa ngoại
ALTER TABLE table_name
ADD CONSTRAINT constraint_name FOREIGN KEY (column_name) REFERENCES other_table_name (column_name)

-- Thêm ràng buộc mặc định
ALTER TABLE table_name
ADD CONSTRAINT constraint_name DEFAULT value FOR column_name

-- Xóa ràng buộc
ALTER TABLE table_name
DROP CONSTRAINT constraint_name

-- Chỉnh sửa ràng buộc
ALTER TABLE table_name
ALTER CONSTRAINT constraint_name constraint_type

-- Xóa bảng
DROP TABLE table_name

-- Xóa cơ sở dữ liệu
DROP DATABASE database_name

-- Xóa dữ liệu trong bảng
DELETE FROM table_name
WHERE condition

-- Cập nhật dữ liệu trong bảng
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition

-- Thêm dữ liệu vào bảng
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...)

-- Tạo trigger
CREATE TRIGGER trigger_name
ON table_name
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	-- code
END

-- Thay đổi trigger
ALTER TRIGGER trigger_name
ON table_name
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	-- code
END

-- Xóa trigger
DROP TRIGGER trigger_name

-- Code trong trigger
IF (condition)
BEGIN
	PRINT 'message'
	COMMIT TRAN
END
ELSE
BEGIN
	PRINT 'message'
	RAISEERROR('message', 16, 1)
	ROLLBACK TRAN
END

-- Giải thích bảng inserted và deleted
-- inserted: chứa dữ liệu mới được thêm vào bảng
-- deleted: chứa dữ liệu bị xóa khỏi bảng
-- Sơ đồ bảng inserted và deleted trong trigger khi thêm dữ liệu vào bảng
-- inserted: | column1 | column2 | ... | -- dữ liệu ở đây la dữ liệu mới được thêm vào bảng
-- deleted: | NULL | NULL | ... | -- dữ liệu ở đây là NULL vì không có dữ liệu bị xóa khỏi bảng
-- Sơ đồ bảng inserted và deleted trong trigger khi xóa dữ liệu khỏi bảng
-- inserted: | NULL | NULL | ... | -- dữ liệu ở đây là NULL vì không có dữ liệu mới được thêm vào bảng
-- deleted: | column1 | column2 | ... | -- dữ liệu ở đây là dữ liệu bị xóa khỏi bảng
-- Sơ đồ bảng inserted và deleted trong trigger khi cập nhật dữ liệu trong bảng
-- inserted: | column1 | column2 | ... | -- dữ liệu ở đây là dữ liệu mới được thêm vào bảng (sau khi cập nhật)
-- deleted: | column1 | column2 | ... | -- dữ liệu ở đây là dữ liệu cũ bị xóa khỏi bảng (trước khi cập nhật)

-- Ví dụ về trigger (1)
CREATE TRIGGER KT_LUONG
ON NHANVIEN
FOR INSERT, UPDATE
AS
BEGIN
	IF (SELECT LUONG FROM inserted) < 0 -- Kiểm tra lương có hợp lệ hay không (lớn hơn hoặc bằng 0)
	BEGIN
		RAISERROR('Lương không hợp lệ', 16, 1) -- In ra màn hình lỗi nếu lương không hợp lệ
		ROLLBACK TRAN -- Hủy bỏ thao tác thêm dữ liệu vào bảng NHANVIEN nếu lương không hợp lệ (rollback transaction)
	END
	-- ELSE
	-- BEGIN
	-- 	PRINT 'Lương hợp lệ' -- In ra màn hình thông báo nếu lương hợp lệ
	-- 	COMMIT TRAN -- Lưu thay đổi vào bảng NHANVIEN nếu lương hợp lệ (commit transaction)
	-- END
	-- Không cần else vì nếu lương hợp lệ thì sẽ tự động thực hiện lệnh COMMIT TRAN ở cuối trigger
END

-- Ví dụ về trigger (2)
CREATE TRIGGER KT_DIEM
ON DIEM
FOR INSERT, UPDATE
AS
BEGIN
	IF (SELECT DIEMTHI FROM inserted) < 0 OR (SELECT DIEMTHI FROM inserted) > 10 -- Kiểm tra điểm thi có hợp lệ hay không (từ 0 đến 10)
	BEGIN
		RAISERROR('Điểm thi không hợp lệ', 16, 1) -- In ra màn hình lỗi nếu điểm thi không hợp lệ
		ROLLBACK TRAN -- Hủy bỏ thao tác thêm dữ liệu vào bảng DIEM nếu điểm thi không hợp lệ (rollback transaction)
	END
	-- ELSE
	-- BEGIN
	-- 	PRINT 'Điểm thi hợp lệ' -- In ra màn hình thông báo nếu điểm thi hợp lệ
	-- 	COMMIT TRAN -- Lưu thay đổi vào bảng DIEM nếu điểm thi hợp lệ (commit transaction)
	-- END
	-- Không cần else vì nếu điểm thi hợp lệ thì sẽ tự động thực hiện lệnh COMMIT TRAN ở cuối trigger
END

-- Ví dụ về trigger (3)
CREATE TRIGGER KT_SISO
ON LOP
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	IF (SELECT COUNT(*) FROM inserted) > 0 -- Kiểm tra dữ liệu mới được thêm vào bảng LOP có tồn tại hay không
	BEGIN
		UPDATE LOP -- Cập nhật số lượng sinh viên trong lớp khi thêm sinh viên vào lớp
		SET SISO = SISO + 1 -- Tăng số lượng sinh viên trong lớp lên 1
		WHERE LOP.MALOP = (SELECT MALOP FROM inserted) -- Lấy mã lớp từ dữ liệu mới được thêm vào bảng LOP
	END
	IF (SELECT COUNT(*) FROM deleted) > 0 -- Kiểm tra dữ liệu bị xóa khỏi bảng LOP có tồn tại hay không
	BEGIN
		UPDATE LOP -- Cập nhật số lượng sinh viên trong lớp khi xóa sinh viên khỏi lớp
		SET SISO = SISO - 1 -- Giảm số lượng sinh viên trong lớp đi 1
		WHERE LOP.MALOP = (SELECT MALOP FROM deleted) -- Lấy mã lớp từ dữ liệu bị xóa khỏi bảng LOP
	END
END

-- EXTRA
-- Tạo index
CREATE INDEX index_name
ON table_name (column_name)

-- Xóa index
DROP INDEX index_name
ON table_name

-- Tạo view
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition

-- Xóa view
DROP VIEW view_name

-- Tạo thủ tục
CREATE PROCEDURE procedure_name
AS
BEGIN
	-- code
END

-- Xóa thủ tục
DROP PROCEDURE procedure_name

-- Thực thi thủ tục
EXEC procedure_name

-- Tạo hàm
CREATE FUNCTION function_name
RETURNS datatype
AS
BEGIN
	-- code
	RETURN value
END

-- Xóa hàm
DROP FUNCTION function_name

-- Thực thi hàm
SELECT function_name()

-- Tạo biến
DECLARE @variable_name datatype

-- Gán giá trị cho biến
SET @variable_name = value

-- In ra màn hình
PRINT value

-- In ra màn hình lỗi
RAISEERROR('message', 16, 1) -- 16: severity, 1: state
-- Các dạng lỗi thường gặp
-- 10: Information
-- 11: Warning
-- 16: Error
-- 17: Severe error

-- Các dạng trạng thái thường gặp
-- 0: Successful
-- 1: Failure

-- Bắt đầu giao dịch
BEGIN TRAN

-- Lưu thay đổi
COMMIT TRAN

-- Hủy bỏ thay đổi
ROLLBACK TRAN

-- Kết thúc giao dịch
END TRAN

-- Kết thúc thực thi
GO

-- Truy vấn dữ liệu
SELECT column1, column2, ...
FROM table_name
WHERE condition

-- Sắp xếp dữ liệu
SELECT column1, column2, ...
FROM table_name
ORDER BY column1 ASC, column2 DESC

-- Nhóm dữ liệu
SELECT column1, column2, COUNT(*)
FROM table_name
GROUP BY column1, column2

-- Kết hợp dữ liệu
SELECT column1, column2, ...
FROM table1
JOIN table2 ON table1.column_name = table2.column_name

-- Lấy dữ liệu từ nhiều bảng
SELECT column1, column2, ...
FROM table1, table2
WHERE table1.column_name = table2.column_name

-- Truy vấn lồng
SELECT column1, column2, ...
FROM table1
WHERE column1 IN (SELECT column1 FROM table2)

-- Truy vấn UNION
SELECT column1, column2, ...
FROM table1
UNION
SELECT column1, column2, ...
FROM table2

-- Truy vấn UNION ALL
SELECT column1, column2, ...
FROM table1
UNION ALL
SELECT column1, column2, ...
FROM table2

-- Truy vấn EXISTS
SELECT column1, column2, ...
FROM table1
WHERE EXISTS (SELECT column1 FROM table2 WHERE condition)

-- Truy vấn NOT EXISTS
SELECT column1, column2, ...
FROM table1
WHERE NOT EXISTS (SELECT column1 FROM table2 WHERE condition)

-- Truy vấn ANY
SELECT column1, column2, ...
FROM table1
WHERE column1 > ANY (SELECT column1 FROM table2)

-- Truy vấn ALL
SELECT column1, column2, ...
FROM table1
WHERE column1 > ALL (SELECT column1 FROM table2)

-- Truy vấn SOME
SELECT column1, column2, ...
FROM table1
WHERE column1 > SOME (SELECT column1 FROM table2)

-- Truy vấn BETWEEN
SELECT column1, column2, ...
FROM table1
WHERE column1 BETWEEN value1 AND value2

-- Truy vấn LIKE
SELECT column1, column2, ...
FROM table1
WHERE column1 LIKE 'value%'
-- %: bất kỳ chuỗi ký tự nào
-- _: bất kỳ ký tự nào

-- Truy vấn IN
SELECT column1, column2, ...
FROM table1
WHERE column1 IN (value1, value2, ...)
-- Ví dụ: WHERE column1 IN ('value1', 'value2', ...)
-- Ví dụ: WHERE column1 IN (1, 2, 3, ...)
-- Ví dụ: WHERE column1 IN (SELECT column1 FROM table2)

-- Truy vấn IS NULL
SELECT column1, column2, ...
FROM table1
WHERE column1 IS NULL

-- Truy vấn IS NOT NULL
SELECT column1, column2, ...
FROM table1
WHERE column1 IS NOT NULL

-- Truy vấn HAVING
SELECT column1, column2, COUNT(*)
FROM table1
GROUP BY column1, column2
HAVING COUNT(*) > value

-- Các hàm thống kê
SELECT AVG(column_name) -- Trung bình
SELECT COUNT(column_name) -- Số lượng
SELECT MAX(column_name) -- Giá trị lớn nhất
SELECT MIN(column_name) -- Giá trị nhỏ nhất
SELECT SUM(column_name) -- Tổng

-- Các hàm xử lý chuỗi
SELECT CONCAT(column1, column2) -- Nối chuỗi
SELECT LEFT(column_name, value) -- Lấy chuỗi bên trái
SELECT RIGHT(column_name, value) -- Lấy chuỗi bên phải
SELECT LEN(column_name) -- Độ dài chuỗi
SELECT LOWER(column_name) -- Chuyển chuỗi thành chữ thường
SELECT UPPER(column_name) -- Chuyển chuỗi thành chữ hoa
SELECT LTRIM(column_name) -- Xóa khoảng trắng bên trái

-- Các hàm xử lý ngày tháng
SELECT GETDATE() -- Lấy ngày giờ hiện tại
SELECT DATEADD(day, value, column_name) -- Cộng ngày
SELECT DATEDIFF(day, column1, column2) -- Trừ ngày
SELECT DATEPART(day, column_name) -- Lấy ngày
SELECT DAY(column_name) -- Lấy ngày
SELECT DATEPART(month, column_name) -- Lấy tháng
SELECT MONTH(column_name) -- Lấy tháng
SELECT DATEPART(year, column_name) -- Lấy năm
SELECT YEAR(column_name) -- Lấy năm
SELECT DATEPART(hour, column_name) -- Lấy giờ
SELECT DATEPART(minute, column_name) -- Lấy phút
SELECT DATEPART(second, column_name) -- Lấy giây

-- Các hàm xử lý số
SELECT ABS(column_name) -- Giá trị tuyệt đối
SELECT CEILING(column_name) -- Làm tròn lên
SELECT FLOOR(column_name) -- Làm tròn xuống
SELECT ROUND(column_name, value) -- Làm tròn

-- Các hàm xử lý logic
SELECT IIF(condition, value1, value2) -- Điều kiện

-- Các hàm xử lý NULL
SELECT ISNULL(column_name, value) -- Nếu NULL thì thay bằng giá trị khác
SELECT COALESCE(column1, column2, column3, ...) -- Nếu NULL thì thay bằng giá trị khác

-- Các hàm xử lý khác
SELECT CAST(column_name AS datatype) -- Chuyển đổi kiểu dữ liệu
SELECT CONVERT(datatype, column_name) -- Chuyển đổi kiểu dữ liệu
SELECT DISTINCT column_name -- Lọc dữ liệu trùng lặp
SELECT TOP value column_name -- Lấy số lượng dòng đầu tiên
SELECT ROW_NUMBER() OVER (ORDER BY column_name) -- Đánh số thứ tự
SELECT RANK() OVER (ORDER BY column_name) -- Xếp hạng
SELECT DENSE_RANK() OVER (ORDER BY column_name) -- Xếp hạng mật độ
SELECT NTILE(value) OVER (ORDER BY column_name) -- Chia nhóm
SELECT ROW_NUMBER() OVER (PARTITION BY column_name ORDER BY column_name) -- Đánh số thứ tự theo nhóm
SELECT RANK() OVER (PARTITION BY column_name ORDER BY column_name) -- Xếp hạng theo nhóm
SELECT DENSE_RANK() OVER (PARTITION BY column_name ORDER BY column_name) -- Xếp hạng mật độ theo nhóm
SELECT NTILE(value) OVER (PARTITION BY column_name ORDER BY column_name) -- Chia nhóm theo nhóm

--UPDATE
UPDATE TABLE
SET
	VALUE = VALUE + 1
WHERE
	-- ADD BẢNG
ALTER TABLE A
ADD COLUMN ACB NVARCHAR (50)
-- Xóa dòng
DELETE FROM NHAVIEN
WHERE
	NHAN.MANV = 'NV001'
	--XÓA BẢNG
DROP TABLE A
-- XÓA CỘT
ALTER TABLE A
DROP COLUMN ACB
--Viết trong table RBTV
create table
	CC (
		CONSTRAINT CHK CHECK (LUONG > 0) CONSTRAINT UQE UNIQUE (TEPH) CONSTRAINT DF DEFAULT 'UNSET' FOR ABC -- COLUM
	)
	--check
ALTER TABLE NHANVIEN ADD CONSTRAINT CHK_LUONG CHECK (LUONG > 0)
--unique
ALTER TABLE NHANVIEN ADD CONSTRAINT UNI_LUONG UNIQUE (LUONG)
--default
ALTER TABLE NHANVIEN ADD CONSTRAINT DF_NHANVIEN DEFAULT NHANVIEN.LUONG = '20000' FOR NHANVIEN
--TRIGGER
CREATE TRIGGER KT_SISO ON LOP FOR INSERT,
UPDATE,
DELETE AS IF () COMMIT TRAN BEGIN
UPDATE LOP
SET
	SISO = SISO + 1
WHERE
	LOP.MALOP = (
		SELECT
			MALOP
		FROM
			inserted
	)
UPDATE LOP
SET
	SISO = SISO -1
WHERE
	LOP.MALOP = (
		SELECT
			MALOP
		FROM
			deleted
	) END