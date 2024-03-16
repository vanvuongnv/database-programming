using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Ordering.API.Services;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Ordering.API.Controllers
{
    [Route("api/[controller]")]
    public class CategoriesController : Controller
    {
        private readonly IDatabaseService _databaseService;

        public CategoriesController(IDatabaseService databaseService)
        {
            _databaseService = databaseService;
        }

        [HttpGet]
        [Route("get-categories")]
        public IActionResult GetCategories()
        {
            var items = _databaseService.GetCategories();

            return Ok(items);
        }

        [HttpGet]
        [Route("get-products")]
        public IActionResult GetProducts()
        {
            var items = _databaseService.GetProducts();

            return Ok(items);
        }

        [HttpGet]
        [Route("get-products/{productId}")]
        public IActionResult GetProducts(int productId)
        {
            var item = _databaseService.GetProductById(productId);

            if (item is null)
            {
                return NotFound();
            }    

            return Ok(item);
        }
    }
}

