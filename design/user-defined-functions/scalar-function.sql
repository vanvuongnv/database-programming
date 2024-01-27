--Scalar Function

CREATE FUNCTION func_GetCategoryName
(
    @categoryId INT
)
RETURNS NVARCHAR(255)
AS
BEGIN
    DECLARE @result NVARCHAR(255)
    SET @result = ( SELECT 
                        CategoryName 
                    From 
                        Categories 
                    WHERE CategoryId = @categoryId)
    
    RETURN @result
END