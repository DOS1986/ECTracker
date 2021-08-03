using ECTracker.DAL.DataAccess.Interfaces;
using ECTracker.DAL.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;

namespace ECTracker.DAL.DataAccess
{
    public class JsonConnector : IDataConnection
    {
        private readonly string _jsonString = File.ReadAllText("Category.json");

        public List<Category> LoadCategories()
        {
            List<Category> employees = JsonConvert.DeserializeObject<List<Category>>(_jsonString);
            return employees;
        }

        public Category GetSingle_Category(int categoryId)
        {
            throw new NotImplementedException();
        }
    }
}
