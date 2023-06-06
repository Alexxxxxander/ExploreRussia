using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace ExploreRussia.MVVM.Repositories
{
    public class RepositoryBase
    {
        private readonly string _connectionString;
        public RepositoryBase() 
        {
            _connectionString = "Server=(local); Database=ExploreRussiaDB; Integrated Security = true";
        }
        protected SqlConnection GetConnection()
        {
            return new SqlConnection(_connectionString);
        }
    }
}
