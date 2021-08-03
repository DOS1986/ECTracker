using Dapper;
using ECTracker.DAL.DataAccess.Interfaces;
using ECTracker.DAL.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace ECTracker.DAL.DataAccess
{
    public class NoSqlConnector : IDataConnection
    {
        private readonly IDbConnection _cnn = GlobalConfig.GetConnectionString();

        public List<Category> LoadCategories()
        {
            try
            {
                var output = _cnn.Query<Category>("select Name from Category", new DynamicParameters());
                return output.ToList();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public Category GetSingle_Category(int categoryId)
        {
            Category result = _cnn.Query<Category>(@"SELECT Id, Name, Description, DateCreated FROM Category WHERE Id = @categoryId", new { categoryId }).FirstOrDefault();
            return result;
        }

    }
}
