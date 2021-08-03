﻿using ECTracker.DAL.DataAccess;
using ECTracker.DAL.Enums;
using ECTracker.Services.Common.Config;
using Microsoft.Data.Sqlite;
using System;
using System.IO;
using static System.IO.Directory;

namespace ECTracker.DAL
{
    public class DbRepository
    {
        private const string ApplicationFolderName = "ECTracker";
        private const string SqLiteDatabaseName = "ECTracker.db";
        private static readonly string DbFolderPath = FullFolderPath(ApplicationFolderName);

        private static SqliteConnection DbConnection { get; set; }

        public static void InitializeConnections(DatabaseType db)
        {
            switch (db)
            {
                case DatabaseType.SqLite:
                    {
                        CreateAndOpenDb();
                        //SQLiteConnector sqlite = new SQLiteConnector();
                        //Connection = sqlite;
                        break;
                    }
                case DatabaseType.NoSql:
                    {
                        CreateAndOpenDb();
                        //NoSqlConnector noSql = new NoSqlConnector();
                        //Connection = noSql;
                        break;
                    }
                case DatabaseType.Json:
                    {
                        JsonConnector json = new JsonConnector();
                        //Connection = json;
                        break;
                    }
                default:
                    CreateAndOpenDb();
                    //SQLiteConnector sqlite = new SQLiteConnector();
                    //Connection = sqlite;
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

            string dbFilePath = Path.Combine(DbFolderPath, Path.GetFileName(SqLiteDatabaseName) ?? throw new InvalidOperationException());
            using SqliteConnection connection = DbConnection = new SqliteConnection($"Data Source={dbFilePath}");
            new SeedDatabase(DbConnection).Execute();
        }
    }
}
