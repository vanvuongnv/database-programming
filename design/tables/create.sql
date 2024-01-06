--categories
CREATE TABLE Categories (
    CategoryId INT IDENTITY(1, 1) PRIMARY KEY,
    CategoryName nvarchar(255) NOT NULL,
    Description nvarchar(max),
    PictureUrl nvarchar(2048)
)
--customers
CREATE TABLE Customers(
    CustomerId INT IDENTITY(1,1) PRIMARY KEY,
    ContactName nvarchar(255) NOT NULL,
    ContactTitle nvarchar(255),
    CompanyName nvarchar(255),
    Address nvarchar(255),
    City nvarchar(255),
    Phone nvarchar(255),
    Email nvarchar(255)
)
--suppliers
CREATE TABLE Suppliers(
    SupplierId INT IDENTITY(1,1) PRIMARY KEY,
    CompanyName nvarchar(255),
    ContactName nvarchar(255) NOT NULL,
    ContactTitle nvarchar(255),
    Address nvarchar(255),
    City nvarchar(255),
    Phone nvarchar(255),
    Email nvarchar(255),
    HomePage nvarchar(2048)
)
--shippers
CREATE TABLE Shippers(
    ShipperId INT IDENTITY(1,1) PRIMARY KEY,
    CompanyName nvarchar(255),
    Phone nvarchar(255),
)
--products
CREATE TABLE Products(
    ProductId INT IDENTITY(1,1) PRIMARY KEY,
    ProductName nvarchar(255) NOT NULL,
    CategoryId INT NOT NULL FOREIGN KEY REFERENCES Categories(CategoryId),
    SupplierId INT NOT NULL FOREIGN KEY REFERENCES Suppliers(SupplierId),
    QuantityPerUnit int NOT NULL default(1),
    UnitPrice money NOT NULL default(0),
    UnitsInStock int NOT NULL default(0)
)
--orders
CREATE TABLE Orders(
    OrderId INT IDENTITY(1,1) PRIMARY KEY,
    CustomerId INT NOT NULL FOREIGN KEY REFERENCES Customers(CustomerId),
    OrderDate datetime NOT NULL,
    ShipperId INT NULL FOREIGN KEY REFERENCES Shippers(ShipperId),
    ShipAddress nvarchar(255) NOT NULL,
    ShipCity nvarchar(255) NOT NULL
)
--order details
CREATE TABLE OrderDetails(
    OrderId INT NOT NULL FOREIGN KEY REFERENCES Orders(OrderId),
    ProductId INT NOT NULL FOREIGN KEY REFERENCES Products(ProductId),
    Quantity INT NOT NULL,
    UnitPrice money,
    DiscountPercentage INT NOT NULL,
    PRIMARY KEY (OrderId, ProductId),
)