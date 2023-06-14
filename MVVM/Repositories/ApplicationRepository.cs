using ExploreRussia.MVVM.Model;
using LiveCharts;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;

namespace ExploreRussia.MVVM.Repositories
{
    internal class ApplicationRepository : RepositoryBase, IApplicationRepository
    {
        public IEnumerable<ApplicationModel> GetAll()
        {
            IEnumerable<ApplicationModel> appls = new List<ApplicationModel>();
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
                            Id = Int32.Parse(reader[0].ToString()),
                            TourId = Int32.Parse(reader[1].ToString()),
                            FName = reader[2].ToString(),
                            LName = reader[3].ToString(),
                            Patronymic = reader[4].ToString(),
                            Phone = reader[5].ToString(),
                            Email = reader[6].ToString(),
                            DateCreated = DateTime.Parse(reader[7].ToString()),
                        };
                        appls = appls.Append(appl);
                    }
                }
            }
            return appls;
        }

        public int GetCount()
        {
            return GetAll().Count();
        }

        public int GetCountDay(DateTime date)
        {
            int result = 0;
            DateTime from = date.Date;
            DateTime to = date.Date.AddHours(23).AddMinutes(59).AddSeconds(59).AddMilliseconds(59);
            using (var connection = GetConnection())
            using (var command = new SqlCommand())
            {
                connection.Open();
                command.Connection = connection;
                command.CommandText = "select * from [Application] where DateCreated BETWEEN @from AND @to;";
                command.Parameters.Add("@from", System.Data.SqlDbType.DateTime).Value = from;
                command.Parameters.Add("@to", System.Data.SqlDbType.DateTime).Value = to;
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        result++;
                    }
                }
            }
            return result;
        }

        public ChartValues<double> GetCountLastWeek()
        {
            ChartValues<double> result = new ChartValues<double>();
            DateTime cc = DateTime.Now.Date.AddDays(-6);
            for (int i = 0; i <= 6; i++)
            {
                result.Add(GetCountDay(cc));
                cc = cc.AddDays(1);
            }
            return result;
        }
    }
}
