DECLARE @orderId INT
DECLARE @customerId INT
DECLARE @customerName NVARCHAR(255)

DECLARE @report TABLE
(
    OrderId INT,
    CustomerName NVARCHAR(255)
)

DECLARE myCur CURSOR
FOR 
	SELECT OrderId, CustomerId From Orders

OPEN myCur

FETCH NEXT FROM myCur INTO @orderId, @customerId

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @customerName = (SELECT 
                            ContactName 
                        FROM 
                            Customers 
                        WHERE CustomerId = @customerId)
    INSERT INTO @report (OrderId, CustomerName)
    VALUES (@orderId, @customerName)

    FETCH NEXT FROM myCur INTO @orderId, @customerId
END

CLOSE myCur
DEALLOCATE myCur

SELECT * FROM @report