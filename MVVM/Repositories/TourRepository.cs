using ExploreRussia.MVVM.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace ExploreRussia.MVVM.Repositories
{
    internal class TourRepository : RepositoryBase, ITourRepository
    {
        public void Add(TourModel tourModel)
        {
            throw new NotImplementedException();
        }

        public void Edit(TourModel tourModel)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<TourModel> GetByAll()
        {
            IEnumerable<TourModel> tours = new List<TourModel>();
            if(GetCount() > 0)
            {
                try{
                    using (var connection = GetConnection())
                    using (var command = new SqlCommand())
                    {
                        connection.Open();
                        command.Connection = connection;
                        command.CommandText = "select * from [Tour]";
                        using (var reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                TourModel tour = new TourModel()
                                {
                                    Id = Convert.ToInt32(reader[0]),
                                    Title = reader[1].ToString(),
                                    DateStart = Convert.ToDateTime(reader[2]),
                                    DateEnd = Convert.ToDateTime(reader[3]),
                                    Cost = Decimal.Parse((reader[4]).ToString()),
                                    Rate = Single.Parse((reader[5]).ToString()),
                                    ImageMain = string.IsNullOrEmpty(reader[6].ToString()) ? " " : reader[6].ToString(),
                                    Route = reader[7].ToString(),
                                    PeopleMin = Convert.ToInt32(reader[8]),
                                    PeopleMax = Convert.ToInt32(reader[9]),
                                    Lenght = Convert.ToInt32(reader[10]),
                                    DifficultyId = Convert.ToInt32(reader[11]),
                                    AgeMin = Convert.ToInt32(reader[12]),
                                    Actual = Convert.ToBoolean(reader[13]),
                                    RegionId = Convert.ToInt32(reader[14]),
                                    Description = reader[15].ToString(),
                                };
                                tours = tours.Append<TourModel>(tour);
                            }
                        }
                    }
                }
                catch (Exception ex) { MessageBox.Show(ex.Message); }


            }
            return tours;
        }

        public TourModel GetById(int id)
        {
            TourModel result = null;
            try
            {
                using(var connection = GetConnection())
                using (var command = new SqlCommand())
                {
                    connection.Open();
                    command.Connection = connection;
                    command.CommandText = "select * from [Tour] where Id=@id";
                    command.Parameters.Add("@id",System.Data.SqlDbType.Int).Value = id;
                    using (var reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            result = new TourModel()
                            {
                                Id = Convert.ToInt32( reader[0]),
                                Title = reader[1].ToString(),
                                DateStart = Convert.ToDateTime(reader[2]),
                                DateEnd = Convert.ToDateTime(reader[3]),
                                Cost = Decimal.Parse((reader[4]).ToString()),
                                Rate = Single.Parse((reader[5]).ToString()),
                                ImageMain = reader[6].ToString(),
                                Route = reader[7].ToString(),
                                PeopleMin = Convert.ToInt32(reader[8]),
                                PeopleMax = Convert.ToInt32(reader[9]),
                                DifficultyId = Convert.ToInt32(reader[10]),
                                AgeMin = Convert.ToInt32(reader[11]),
                                Actual = Convert.ToBoolean(reader[12]),
                                RegionId = Convert.ToInt32(reader[13]),
                                Description = reader[14].ToString(),    
                            };
                        }
                    }
                }
            }
            catch (Exception)
            {

                MessageBox.Show("Ошибка подключения к БД", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return result;
        }

        public TourModel GetByTitle(string title)
        {
            throw new NotImplementedException();
        }

        public int GetCount()
        {
            int result = 0;
            try
            {
                using (var connection = GetConnection())
                using (var command = new SqlCommand())
                {
                    connection.Open();
                    command.Connection = connection;
                    command.CommandText = "select * from [Tour]";
                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            result += 1;
                        }
                    }
                }
            }
            catch (Exception)
            {

                MessageBox.Show("Ошибка подключения к БД", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return result;
        }

        public void Remove(int id)
        {
            throw new NotImplementedException();
        }
    }
}
