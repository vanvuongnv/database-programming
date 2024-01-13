DECLARE @id INT 

SET @id = 5

IF @id < 1 OR @id > 100
BEGIN
    PRINT 'Vui long nhap id > 0 va id <= 100'
END

ELSE IF NOT EXISTS (SELECT * FROM Categories WHERE CategoryId = @id)
BEGIN
    PRINT 'Vui long nhap id chinh xac'
END

ELSE
BEGIN
    DELETE FROM Categories
    WHERE CategoryId = @id
    PRINT 'Xoa thanh cong'
END