using ECTracker.DAL.DataAccess;
using ECTracker.DAL.DataAccess.Interfaces;
using ECTracker.DAL.Enums;
using ECTracker.Services.Common.Config;
using Microsoft.Data.Sqlite;
using System;
using System.IO;
using static System.IO.Directory;

namespace ECTracker.DAL
{
    public static class GlobalConfig
    {
        private const string ApplicationFolderName = "ECTracker";
        private const string SqLiteDatabaseName = "ECTracker.db";

        private static readonly string DbFolderPath = FullFolderPath(ApplicationFolderName);
        private static string _dbFilePath = Path.Combine(DbFolderPath, Path.GetFileName(SqLiteDatabaseName) ?? throw new InvalidOperationException());
        private static SqliteConnection DbConnection { get; set; }

        public static IDataConnection Connection { get; private set; }

        public static void InitializeConnections(DatabaseType db)
        {
            SqLiteConnector sqlite = new SqLiteConnector();
            NoSqlConnector noSql = new NoSqlConnector();
            var json = new JsonConnector();

            switch (db)
            {
                case DatabaseType.SqLite:
                    {
                        CreateAndOpenDb();
                        Connection = sqlite;
                        break;
                    }
                case DatabaseType.NoSql:
                    {
                        CreateAndOpenDb();
                        Connection = noSql;
                        break;
                    }
                case DatabaseType.Json:
                    {
                        Connection = json;
                        break;
                    }
                default:
                    CreateAndOpenDb();
                    Connection = sqlite;
                    break;
            }
        }

        public static string FullFolderPath(string applicationFolder)
        {
            return Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), applicationFolder);
        }

        public static SqliteConnection GetConnectionString()
        {
            return new SqliteConnection($"Data Source={Path.Combine(DbFolderPath, Path.GetFileName(SqLiteDatabaseName) ?? throw new InvalidOperationException())};");
        }

        public static void CreateAndOpenDb()
        {
            if (!Exists(DbFolderPath))
            {
                CreateDirectory(DbFolderPath);
            }
            _dbFilePath = Path.Combine(DbFolderPath, Path.GetFileName(SqLiteDatabaseName) ?? throw new InvalidOperationException());
            using SqliteConnection connection = DbConnection = new SqliteConnection($"Data Source={_dbFilePath}");
            new SeedDatabase(DbConnection).Execute();
        }
    }
}
