--Inline Table-Value Function

CREATE FUNCTION func_CustomerReport
(
    @fromDate datetime,
    @toDate datetime
)
RETURNS @report TABLE
(
    CustomerId INT,
    CustomerName NVARCHAR(255),
    AmountOrder INT,
    Total money
)
AS
BEGIN
    INSERT INTO 
        @report(CustomerId,CustomerName,AmountOrder,Total)
    VALUES
        SELECT 
            c.CustomerId, 
            c.ContactName, 
            COUNT(o.OrderId),
            SUM(Quantity * UnitPrice)
        FROM 
            Orders o JOIN 
            Customers c ON c.CustomerId = o.CustomerId JOIN
            OrderDetails od ON o.OrderId = od.OrderId
        WHERE
            OrderDate BETWEEN @fromDate AND @toDate
        GROUP BY c.CustomerId, c.ContactName
    
    --DELETE FROM @report
    --WHERE Total < 1000000

    RETURN
END