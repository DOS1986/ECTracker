using Dapper;
using Microsoft.Data.Sqlite;
using System.Collections.Generic;
using System.Linq;

namespace ECTracker.DataLayer.DataAccess
{
    public class SqLiteConnector : DbRepository
    {
        private readonly SqliteConnection _cnn = GetConnection();

        public List<T> GetAll<T>(string tableName)
        {
            var output = _cnn.Query<T>($"SELECT * FROM {tableName}", new DynamicParameters());
            return output.ToList();
        }

        public T GetOneById<T>(int id, string tableName)
        {
            var result = _cnn.Query<T>($"SELECT * FROM {tableName} WHERE Id = $id", new { id }).FirstOrDefault();
            return result;
        }

        public T GetOne<T>(string fieldName, string tableName, string value)
        {
            _cnn.Open();

            var param = new DynamicParameters();
            param.Add($"@{fieldName}", value);

            var result = _cnn.Query<T>($"SELECT * FROM {tableName} WHERE {fieldName} = @{fieldName}", param).FirstOrDefault();
            _cnn.Close();
            return result;
        }

    }
}
