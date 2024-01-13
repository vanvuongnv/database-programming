CREATE PROCEDURE proc_SelectCategoryById
(
    @id INT
)

AS

BEGIN

    SELECT * FROM Categories WHERE CategoryId = @id

END