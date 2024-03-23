using System.Net;
using System.Numerics;
using Dapper;
using Microsoft.Data.SqlClient;
using Ordering.API.Models.Dtos;
using Ordering.API.Models.RequestModels;

namespace Ordering.API.Services;

public interface IDatabaseService
{
    List<CategoryDto> GetCategories();
    List<ProductDto> GetProducts();
    ProductDto? GetProductById(int productId);
    List<ProductDto> GetProducts(int categoryId);

    int Add(CategoryRequestModel requestModel);

    int Update(int categoryId, CategoryRequestModel requestModel);
    CategoryDto? GetCategoryById(int categoryId);

    int DeleteCategory(int categoryId);

    int InsertCustomer(CustomerRequestModel customerRequest);
    int InsertOrder(int customerId, OrderRequestModel orderRequest);
    int InsertOrderDetail(int orderId, int productId, int quantity, decimal price);
}

public class DatabaseService : IDatabaseService
{
    private readonly string _connectionString;
    public DatabaseService(string connectionString)
    {
        _connectionString = connectionString;
    }

    public int Add(CategoryRequestModel requestModel)
    {
        string sql = """
            INSERT INTO Categories(
                CategoryName,
                Description,
                PictureUrl)
            VALUES (@name, @description, @pictureUrl)
            """;

        using var connection = GetConnection();

        var result = connection.Execute(sql, new
        {
            name = requestModel.CategoryName,
            description = requestModel.Description,
            pictureUrl = requestModel.PictureUrl
        });

        return result;
    }

    public int DeleteCategory(int categoryId)
    {
        string sql = """
            DELETE Categories
            WHERE CategoryId = @id
            """;

        using var connection = GetConnection();

        var result = connection.Execute(sql, new
        {
            id = categoryId
        });

        return result;
    }

    public List<CategoryDto> GetCategories()
    {
        string sql = """
            SELECT CategoryId, CategoryName
            FROM Categories
            """;

        using var connection = GetConnection();

        return connection.Query<CategoryDto>(sql).ToList();
    }

    public CategoryDto? GetCategoryById(int categoryId)
    {
        string sql = """
            SELECT *
            FROM Categories
            WHERE CategoryId = @categoryId
            """;
        using var connection = GetConnection();

        return connection.Query<CategoryDto>(sql, new { categoryId }).FirstOrDefault();
    }

    public ProductDto? GetProductById(int productId)
    {
        string sql = """
            SELECT p.*, c.CategoryName, s.CompanyName AS SupplierName
            FROM Products p Join Categories c ON p.CategoryId = c.CategoryId
            JOIN Suppliers s ON p.SupplierId = s.SupplierId
            WHERE p.ProductId = @productId
            """;
        using var connection = GetConnection();

        return connection.Query<ProductDto>(sql, new { productId }).FirstOrDefault();
    }

    public List<ProductDto> GetProducts()
    {
        string sql = """
            SELECT p.*, c.CategoryName, s.CompanyName AS SupplierName
            FROM Products p Join Categories c ON p.CategoryId = c.CategoryId
            JOIN Suppliers s ON p.SupplierId = s.SupplierId
            """;
        using var connection = GetConnection();

        return connection.Query<ProductDto>(sql).ToList();
    }

    public List<ProductDto> GetProducts(int categoryId)
    {
        string sql = """
            SELECT p.*, c.CategoryName, s.CompanyName AS SupplierName
            FROM Products p Join Categories c ON p.CategoryId = c.CategoryId
            JOIN Suppliers s ON p.SupplierId = s.SupplierId
            WHERE p.CategoryId = @categoryId
            """;
        using var connection = GetConnection();

        return connection.Query<ProductDto>(sql, new { categoryId }).ToList();
    }

    public int InsertCustomer(CustomerRequestModel customerRequest)
    {
        string sql = """
            INSERT INTO 
                Customers(ContactTitle, ContactName, Address, Phone, Email, CompanyName, City)
            VALUES 
                (@ContactTitle, @ContactName, @Address, @Phone, @Email, @CompanyName, @City);

            SELECT SCOPE_IDENTITY();
            """;

        using var connection = GetConnection();

        return connection.ExecuteScalar<int>(sql, new
        {
            customerRequest.ContactName,
            customerRequest.Address,
            customerRequest.Phone,
            customerRequest.Email,
            customerRequest.CompanyName,
            customerRequest.ContactTitle,
            customerRequest.City
        });
    }

    public int InsertOrder(int customerId, OrderRequestModel orderRequest)
    {
        string sql = """
            INSERT INTO Orders(CustomerId,OrderDate,ShipAddress,ShipCity)
            VALUES (@customerId, @orderDate, @ShipAddress, @ShipCity)

            SELECT SCOPE_IDENTITY();
            """;

        using var connection = GetConnection();

        return connection.ExecuteScalar<int>(sql, new
        {
            orderRequest.ShipAddress,
            orderRequest.ShipCity,
            customerId,
            orderDate = DateTime.Now
        });
    }

    public int InsertOrderDetail(int orderId, int productId, int quantity, decimal price)
    {
        string sql = """
            INSERT INTO OrderDetails(OrderId,ProductId,Quantity,UnitPrice,DiscountPercentage)
            VALUES (@orderId, @productId, @quantity, @price, 0)

            SELECT SCOPE_IDENTITY();
            """;

        using var connection = GetConnection();

        return connection.ExecuteScalar<int>(sql, new
        {
            orderId,
            productId,
            price,
            quantity
        });
    }

    public int Update(int categoryId, CategoryRequestModel requestModel)
    {
        string sql = """
            UPDATE Categories
            SET 
                CategoryName = @name,
                Description = @description,
                PictureUrl = @pictureUrl
            WHERE CategoryId = @id
            """;

        using var connection = GetConnection();

        var result = connection.Execute(sql, new
        {
            name = requestModel.CategoryName,
            description = requestModel.Description,
            pictureUrl = requestModel.PictureUrl,
            id = categoryId
        });

        return result;
    }

    private SqlConnection GetConnection()
    {
        return new SqlConnection(_connectionString);
    }
}