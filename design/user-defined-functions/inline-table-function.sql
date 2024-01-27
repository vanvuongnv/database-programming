--Inline Table-Value Function

CREATE FUNCTION func_GetOrders
(
    @fromDate datetime,
    @toDate datetime
)
RETURNS TABLE
AS
RETURN
(
    SELECT o.OrderId, o.OrderDate, c.ContactName
    FROM 
        Orders o JOIN
        Customers c ON o.CustomerId = c.CustomerId
    WHERE o.OrderDate BETWEEN @fromDate AND @toDate
)