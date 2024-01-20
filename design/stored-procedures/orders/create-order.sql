CREATE PROCEDURE proc_createOrder
(
    @name nvarchar(255),
    @email nvarchar(255),
    @phone nvarchar(255),
    @address nvarchar(255),
    @product1 int,
    @product2 int,
    @quantity1 int,
    @quantity2 int
)
AS
BEGIN
    DECLARE @cutomerId INT
    DECLARE @orderId INT
    DECLARE @unitPrice money

    BEGIN TRANSACTION T1;

    IF EXISTS (SELECT * FROM Customers WHERE Email = @email)
    BEGIN
        SET @cutomerId = (SELECT CustomerId FROM Customers WHERE Email = @email)
        UPDATE Customers
        SET
            ContactName = @name,
            Address = @address,
            Phone = @phone
        WHERE CustomerId = @cutomerId
    END
    ELSE
    BEGIN
        INSERT INTO Customers(ContactName,Address,Phone,Email)
        VALUES (@name, @address, @phone, @email)

        SET @cutomerId = (SELECT SCOPE_IDENTITY())
    END
    -- validate product

    IF NOT EXISTS (SELECT * FROM Products WHERE ProductId = @product1 AND UnitsInStock > @quantity1)
    BEGIN
        print 'Product 1 does not found or is not enough quantity'

        ROLLBACK TRANSACTION T1;

        RETURN 0
    END

    IF NOT EXISTS (SELECT * FROM Products WHERE ProductId = @product2 AND UnitsInStock > @quantity2)
    BEGIN
        print 'Product 2 does not found or is not enough quantity'

        ROLLBACK TRANSACTION T1;
        
        RETURN 0
    END
    
    --DECLARE @unitsInStock INT
    --SET @unitsInStock = (SELECT UnitsInStock FROM Products WHERE ProductId = @product1)
    --IF @quantity1 > @unitsInStock
    --BEGIN
        --print 'Product 1 is not enough quantity'
        --RETURN 0
    --END

    INSERT INTO Orders(CustomerId,OrderDate,ShipAddress,ShipCity)
    VALUES (@cutomerId, GETDATE(), @address, 'Da Nang')

    SET @orderId = (SELECT SCOPE_IDENTITY())

    --product 1
    SET @unitPrice = (SELECT UnitPrice FROM Products WHERE ProductId = @product1)
    
    INSERT INTO OrderDetails(OrderId,ProductId,Quantity,UnitPrice,DiscountPercentage)
    VALUES (@orderId, @product1, @quantity1, @unitPrice, 0)

    --product 2
    SET @unitPrice = (SELECT UnitPrice FROM Products WHERE ProductId = @product2)
    
    INSERT INTO OrderDetails(OrderId,ProductId,Quantity,UnitPrice,DiscountPercentage)
    VALUES (@orderId, @product2, @quantity2, @unitPrice, 0)

    UPDATE Products
    SET
        UnitsInStock = UnitsInStock - @quantity1
    WHERE
        ProductId = @product1

    UPDATE Products
    SET
        UnitsInStock = UnitsInStock - @quantity2
    WHERE
        ProductId = @product2

    COMMIT TRANSACTION T1;

    RETURN @orderId

END