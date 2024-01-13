--DECLARE @id INT 
DECLARE @name NVARCHAR(255)
DECLARE @description NVARCHAR(MAX)
DECLARE @pictureUrl NVARCHAR(2048)

SET @name = N'New Category'
SET @description = 'New Description'
SET @pictureUrl = 'https://imgplace.com/image/abc.jpg'

INSERT INTO Categories(CategoryName,
    Description,
    PictureUrl)
VALUES (@name, @description, @pictureUrl)