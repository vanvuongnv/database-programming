CREATE PROCEDURE proc_InsertCategory
(
    @name NVARCHAR(255),
    @description NVARCHAR(MAX),
    @pictureUrl NVARCHAR(2048)
)
AS
BEGIN

    INSERT INTO Categories(
        CategoryName,
        Description,
        PictureUrl)
    VALUES (@name, @description, @pictureUrl)
    -- print primary key value
    SELECT SCOPE_IDENTITY() AS CategoryId
END