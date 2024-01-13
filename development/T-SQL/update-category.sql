DECLARE @id INT 
DECLARE @name NVARCHAR(255)
DECLARE @description NVARCHAR(MAX)
DECLARE @pictureUrl NVARCHAR(2048)

SET @id = 5
SET @name = N'New Category EDIT'
SET @description = 'New Description EDIT'
SET @pictureUrl = 'https://imgplace.com/image/category.jpg'

UPDATE Categories
SET 
    CategoryName = @name,
    Description = @description,
    PictureUrl = @pictureUrl
WHERE CategoryId = @id