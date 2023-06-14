using ExploreRussia.MVVM.Model;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;

namespace ExploreRussia.MVVM.Repositories
{
    internal class LogRepository : RepositoryBase, ILogRepository
    {
        public void Add(LogModel log)
        {
            using (var connection = GetConnection())
            using (var command = new SqlCommand())
            {
                connection.Open();
                command.Connection = connection;
                command.CommandText = "insert into [LogAutho](UserId, Time)" +
                    "Values(@userId, @time)";
                command.Parameters.Add("@userId", System.Data.SqlDbType.Int).Value = log.UserId;
                command.Parameters.Add("@time", System.Data.SqlDbType.DateTime).Value = log.Time;
                command.ExecuteNonQuery();
            }
        }

        public IEnumerable<LogModel> GetAll()
        {
            IEnumerable<LogModel> logs = null;
            using (var connection = GetConnection())
            using (var command = new SqlCommand())
            {
                connection.Open();
                command.Connection = connection;
                command.CommandText = "select * from [LogAutho]";
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        LogModel log = new LogModel()
                        {
                            Id = reader.GetInt32(0),
                            UserId = reader.GetInt32(1),
                            Time = reader.GetDateTime(2),
                        };
                        logs = logs.Append<LogModel>(log);
                    }
                }
            }
            return logs;
        }
    }
}
