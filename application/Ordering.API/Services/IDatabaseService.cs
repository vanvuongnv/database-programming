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

    public List<CategoryDto> GetCategories()
    {
        string sql = """
            SELECT CategoryId, CategoryName
            FROM Categories
            """;

        using var connection = GetConnection();

        return connection.Query<CategoryDto>(sql).ToList();
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

    private SqlConnection GetConnection()
    {
        return new SqlConnection(_connectionString);
    }
}