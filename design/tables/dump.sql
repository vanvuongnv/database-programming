--categories
SET IDENTITY_INSERT Categories ON 
GO

INSERT INTO Categories (
    CategoryId,
    CategoryName,
    Description,
    PictureUrl)
VALUES 
(1, N'Apple', NULL, NULL),
(2, N'Samsung', NULL, NULL),
(3, N'LG', NULL, NULL),
(4, N'Panasonic', NULL, NULL)
GO

SET IDENTITY_INSERT Categories OFF
GO
--customers
SET IDENTITY_INSERT Customers ON 
GO

INSERT INTO Customers (
    CustomerId,
    ContactName,
    ContactTitle,
    CompanyName,
    Address,
    City,
    Phone,
    Email)
VALUES 
(1, N'Olivia', 'Ms', 'Microsoft', NULL, NULL, '(711) 265-9193', 'cparis@comcast.net'),
(2, N'Noah', 'Mr', 'Saudi Aramco', NULL, NULL, '(675) 844-7400 ', 'jdhildeb@yahoo.ca'),
(3, N'Liam', 'Mr', 'Alphabet', NULL, NULL, '(995) 565-4039', 'nacho@sbcglobal.net'),
(4, N'Amelia', 'Ms', 'NVIDIA', NULL, NULL, '(620) 454-1799', 'hauma@yahoo.com'),
(5, N'Elijah', 'Mr', 'Tesla', NULL, NULL, '(966) 291-5045', 'adamk@sbcglobal.net')
GO

SET IDENTITY_INSERT Customers OFF
GO
--suppliers
SET IDENTITY_INSERT Suppliers ON 
GO

INSERT INTO Suppliers (
    SupplierId,
    CompanyName,
    ContactName,
    ContactTitle,
    Address,
    City,
    Phone,
    Email,
    HomePage)
VALUES 
(1, N'Siemens', 'Evelyn', 'Sale Manager', NULL, NULL, '(711) 265-9193', 'jdhildeb@yahoo.ca', 'wikipedia.org'),
(2, N'Iberdrola', 'Ethan', 'Sale Agent', NULL, NULL, '(213) 111-0123', 'ingolfke@verizon.net', 'instagram.com'),
(3, N'TEPCO', 'Sebastian', 'Director', NULL, NULL, '(333) 999-1812', 'gregh@optonline.net', 'reddit.com'),
(4, N'General Electric Co', 'Harper', 'Vice Director', NULL, NULL, '(751) 142-3131', 'emmanuel@msn.com', 'amazon.com'),
(5, N'State Grid Corporation of China', 'Maverick', 'Customer Support', NULL, NULL, '(222) 111-2121', 'erynf@verizon.net', 'tracnghiem.vn')
GO

SET IDENTITY_INSERT Suppliers OFF
GO
--shippers
SET IDENTITY_INSERT Shippers ON 
GO

INSERT INTO Shippers (
    ShipperId,
    CompanyName,
    Phone)
VALUES 
(1, N'A.P. Moller-Maersk Group', '(620) 454-1799'),
(2, N'Mediterranean Shipping Company (MSC)', '(266) 855-0710'),
(3, N'CMA CGM Group', '(995) 565-4039'),
(4, N'COSCO Shipping', '(711) 265-9193'),
(5, N'Hapag-Lloyd', '(966) 291-5045'),
GO

SET IDENTITY_INSERT Shippers OFF
GO
--products
SET IDENTITY_INSERT Products ON
GO

INSERT INTO Products(
    ProductId,
    ProductName,
    CategoryId,
    SupplierId,
    QuantityPerUnit,
    UnitPrice,
    UnitsInStock
)
VALUES
(1, N'iPhone 15 Pro 256GB', 1, 1, 1, 1100, 50),
(2, N'iPhone 15 Pro', 2, 2, 1, 100, 20),
(3, N'Xiaomi Redmi 13C', 3, 3, 1, 100, 70),
(4, N'Laptop HP 15s fq5229TU i3 1215U/8GB/512GB/Win11 (8U237PA)', 4, 4, 1, 1200, 0),
(5, N'Laptop Asus Vivobook X415EA i3 1115G4/8GB/256GB/Win11 (EK2034W)', 1, 5, 1, 2000, 5),
(6, N'Điện thoại Samsung Galaxy A15 128GB', 2, 1, 1, 350, 90),
(7, N'LG Inverter 217 lít GV-B212WB', 3, 2, 1, 600, 3),
(8, N'Bếp từ đôi lắp âm Sunhouse Mama MMB9301', 4, 3, 1, 250, 5),
(9, N'Nồi chiên không dầu Rapido RAF-8.0M 8 lít', 1, 4, 1, 200, 15),
(10, N'LG Smart TV 55UQ8000PSC', 2, 5, 1, 500, 3)
GO

SET IDENTITY_INSERT Products OFF
GO
--orders
SET IDENTITY_INSERT Orders ON
GO

INSERT INTO Orders(
    OrderId,
    CustomerId,
    OrderDate,
    ShipperId,
    ShipAddress,
    ShipCity
)
VALUES
(1, 1, '2023-11-11', 1, N'123 Ngô Quyền', N'Đà Nẵng'),
(2, 2, '2023-12-12', 2, N'11 Trần Văn Dư', N'Hà Nội'),
(3, 3, '2023-10-10', 3, N'93 Lý Thái Tổ', N'Tp. Hồ Chí Minh'),
(4, 4, '2024-01-01', 4, N'32 Minh Mạng', N'Huế'),
(5, 5, '2023-09-09', 5, N'81 Hải Phòng', N'Đà Nẵng')
GO

SET IDENTITY_INSERT Orders OFF
GO
--order details
