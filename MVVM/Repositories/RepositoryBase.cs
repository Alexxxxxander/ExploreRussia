﻿using System.Data.SqlClient;

namespace ExploreRussia.MVVM.Repositories
{
    public class RepositoryBase
    {
        private readonly string _connectionString;
        public RepositoryBase()
        {
            _connectionString = "Server=TUMBA; Database=ExploreRussiaDB; Integrated Security = true";
        }
        protected SqlConnection GetConnection()
        {
            return new SqlConnection(_connectionString);
        }
    }
}
