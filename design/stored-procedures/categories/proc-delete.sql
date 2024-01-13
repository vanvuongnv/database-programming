CREATE PROCEDURE proc_DeleteCategoryById
(
    @id INT
)
AS
BEGIN
    IF @id < 1
    BEGIN
        print 'Invalid id'
        RETURN 0
    END

    IF NOT EXISTS (SELECT * FROM Categories WHERE CategoryId = @id)
    BEGIN
        print 'Category not found'
        RETURN 0
    END

    DELETE FROM Categories
    WHERE CategoryId = @id

    RETURN 1
END