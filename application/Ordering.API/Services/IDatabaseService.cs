using Dapper;
using Microsoft.Data.SqlClient;
using Ordering.API.Models.Dtos;

namespace Ordering.API.Services;

public interface IDatabaseService
{
    List<CategoryDto> GetCategories();
}

public class DatabaseService : IDatabaseService
{
    private readonly string _connectionString;
    public DatabaseService(string connectionString)
    {
        _connectionString = connectionString;
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

    private SqlConnection GetConnection()
    {
        return new SqlConnection(_connectionString);
    }
}