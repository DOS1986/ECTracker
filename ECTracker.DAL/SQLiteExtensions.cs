﻿using Dapper;
using Microsoft.Data.Sqlite;
using System;
using System.Data;

namespace ECTracker.DAL
{
    public static class SqLiteExtensions
    {
        public static void ExecuteNonQuery(this SqliteConnection connection, string commandText, object param = null)
        {
            // Ensure we have a connection
            if (connection == null)
            {
                throw new NullReferenceException("Please provide a connection");
            }

            // Ensure that the connection state is Open
            if (connection.State != ConnectionState.Open)
            {
                connection.Open();
            }

            // Use Dapper to execute the given query
            connection.Execute(commandText, param);
        }
    }
}