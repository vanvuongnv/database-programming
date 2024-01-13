CREATE PROCEDURE proc_InsertCategoryAndReturnId
(
    @name NVARCHAR(255),
    @description NVARCHAR(MAX),
    @pictureUrl NVARCHAR(2048),
    @id INT OUTPUT
)
AS
BEGIN

    INSERT INTO Categories(
        CategoryName,
        Description,
        PictureUrl)
    VALUES (@name, @description, @pictureUrl)
    -- print primary key value
    SET @id = (SELECT SCOPE_IDENTITY())

    RETURN 1
END