--select
EXEC dbo.proc_SelectCategoryById @id = 1
-- insert
EXEC dbo.proc_InsertCategory
    @name = N'NEW CAT',
    @description = N'NEW DESCRIPTION',
    @pictureUrl = 'https://tracnghiem.vn'

-- insert with output
DECLARE @categoryId INT
EXEC dbo.proc_InsertCategoryAndReturnId
    @name = N'NEW CAT',
    @description = N'NEW DESCRIPTION',
    @pictureUrl = 'https://tracnghiem.vn',
    @id = @categoryId OUTPUT

SELECT @categoryId as CategoryNewId
-- update
EXEC dbo.proc_UpdateCategoryById
    @name = N'NEW CAT',
    @description = N'NEW DESCRIPTION',
    @pictureUrl = 'https://tracnghiem.vn',
    @id = 5
