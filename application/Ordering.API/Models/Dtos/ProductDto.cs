using System;
namespace Ordering.API.Models.Dtos
{
    public class ProductDto
    {
        public int ProductId { get; set; }
        public string? ProductName { get; set; }
        public int CategoryId { get; set; }
        public int SupplierId { get; set; }
        public int QuantityPerUnit { get; set; }
        public decimal UnitPrice { get; set; }
        public int UnitsInStock { get; set; }

        public string? CategoryName { get; set; }
        public string? SupplierName { get; set; }
    }
}

