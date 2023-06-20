using ExploreRussia.MVVM.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;

namespace ExploreRussia.MVVM.Repositories
{
    /// <summary>
    /// Класс репозитория таблицы сложностей
    /// </summary>
    public class DifficultyRepository : RepositoryBase, IDifficultyRepository
    {
        public void Add(DifficultyModel difficultyModel)
        {
            throw new NotImplementedException();
        }

        public void Edit(DifficultyModel difficultyModel)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<DifficultyModel> GetAll()
        {
            IEnumerable<DifficultyModel> difficulties = new List<DifficultyModel>();
            using (var connection = GetConnection())
            using (var command = new SqlCommand())
            {
                connection.Open();
                command.Connection = connection;
                command.CommandText = "select * from [Difficulty]";
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        DifficultyModel DifficultyModel = new DifficultyModel()
                        {
                            Id = Convert.ToInt32(reader[0]),
                            Name = reader[1].ToString()
                        };
                        difficulties = difficulties.Append<DifficultyModel>(DifficultyModel);
                    }
                }
            }
            return difficulties;
        }


        public void Remove(int id)
        {
            throw new NotImplementedException();
        }

        public DifficultyModel GetById(int id)
        {
            DifficultyModel difficultyModel = null;
            using (var connection = GetConnection())
            using (var command = new SqlCommand())
            {
                connection.Open();
                command.Connection = connection;
                command.CommandText = "select * from [Difficulty] where Id=@id";
                command.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = id;
                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        difficultyModel = new DifficultyModel()
                        {
                            Id = Convert.ToInt32(reader[0]),
                            Name = reader[1].ToString()
                        };
                    }
                }
            }
            return difficultyModel;
        }
    }
}
