SELECT 
    ProductId, 
    ProductName, 
    dbo.func_GetCategoryName(CategoryId) as CategoryName
FROM
    Products

--
SELECT * FROM dbo.func_GetOrders('2024-01-01', '2024-01-30')

SELECT * 
FROM 
	dbo.func_GetOrders('2024-01-01', '2024-01-30') as vOrders JOIN
	OrderDetails od ON vOrders.OrderId = od.OrderId

--
SELECT * FROM dbo.func_CustomerReport('2024-01-01','2024-01-30')