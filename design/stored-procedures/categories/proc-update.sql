CREATE PROCEDURE proc_UpdateCategoryById
(
    @id INT,
    @name NVARCHAR(255),
    @description NVARCHAR(MAX),
    @pictureUrl NVARCHAR(2048)
)
AS
BEGIN
    IF @id < 0
    BEGIN
        print 'Invalid id'
        RETURN 0
    END

    IF NOT EXISTS (SELECT * FROM Categories WHERE CategoryId = @id)
    BEGIN
        print 'Category not found'
        RETURN 0
    END

    UPDATE Categories
    SET 
        CategoryName = @name,
        Description = @description,
        PictureUrl = @pictureUrl
    WHERE CategoryId = @id

    --Xem gia tri
    SELECT * FROM Categories WHERE CategoryId = @id
END