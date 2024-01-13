--Declare variables
DECLARE @id INT
DECLARE @name nvarchar(255)
DECLARE @address nvarchar(2000)
--SET
SET @id = 1
SET @name = N'Nguyễn Văn Vương'
SET @address = N'Đà Nẵng' --(SELECT TOP 1 ProvinceName FROM Provinces)
--Query
SELECT * FROM Students
WHERE StudentId = @id

--Insert
INSERT INTO Students(Id, StudentName, Address)
VALUE (@id, @name, @address)

--Update
UPDATE Students
SET StudentName = @name
WHERE StudentId = @id

--Delete
DELETE FROM Students
WHERE StudentId = @id