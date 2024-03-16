﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Ordering.API.Models.RequestModels;
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
        [Route("get-products/{productId}")] // /api/Categories/get-products/123 // Path String
        [Route("get-product-by-id")] // /api/Categories/get-product-by-id/?productId=123 // Query String
        public IActionResult GetProducts(int productId)
        {
            var item = _databaseService.GetProductById(productId);

            if (item is null)
            {
                return NotFound();
            }    

            return Ok(item);
        }

        [HttpGet]
        [Route("get-products-by-category")] // /api/Categories/get-products-by-category/?categoryId=123
        public IActionResult GetProductsByCategory(int categoryId)
        {
            var items = _databaseService.GetProducts(categoryId);

            return Ok(items);
        }

        [HttpPost]
        [Route("add-category")]
        public IActionResult InsertCategory([FromBody] CategoryRequestModel model)
        {
            if (ModelState.IsValid)
            {
                var result = _databaseService.Add(model);

                if (result > 0)
                {
                    return Ok(new { msg = "insert successful"});
                }    
            }

            return BadRequest(ModelState);
        }

        [HttpPut]
        [Route("update-category/{id}")]
        public IActionResult UpdateCategory(int id, [FromBody] CategoryRequestModel model)
        {
            var category = _databaseService.GetCategoryById(id);

            if (category is null)
            {
                return NotFound();
            }    

            if (ModelState.IsValid)
            {
                var result = _databaseService.Update(id, model);

                if (result > 0)
                {
                    return Ok(new { msg = "update successful" });
                }
            }

            return BadRequest(ModelState);
        }
    }
}

