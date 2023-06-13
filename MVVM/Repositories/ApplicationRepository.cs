using ExploreRussia.MVVM.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExploreRussia.MVVM.Repositories
{
    internal class ApplicationRepository : RepositoryBase, IApplicationRepository
    {
        public IEnumerable<ApplicationModel> GetAll()
        {
            IEnumerable<ApplicationModel> appls = null;
            using (var connection = GetConnection())
            using (var command = new SqlCommand())
            {
                connection.Open();
                command.Connection = connection;
                command.CommandText = "select * from [Application]";
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        ApplicationModel appl = new ApplicationModel()
                        {
                            Id =Int32.Parse( reader[0].ToString()),
                            TourId =Int32.Parse( reader[1].ToString()),
                            FName = reader[2].ToString(),
                            LName =reader[3].ToString(),
                            Patronymic = reader[4].ToString(),
                            Phone =reader[5].ToString(),
                            Email =reader[6].ToString(),
                            DateCreated = DateTime.Parse(reader[7].ToString()),
                        };
                        appls = appls.Append<ApplicationModel>(appl);
                    }
                }
            }
            return appls;
        }

        public int GetCount()
        {
            return GetAll().Count();
        }
    }
}
