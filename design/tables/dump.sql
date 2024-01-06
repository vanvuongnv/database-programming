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

--orders

--order details
