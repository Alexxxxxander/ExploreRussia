using ExploreRussia.MVVM.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Windows;

namespace ExploreRussia.MVVM.Repositories
{
    internal class TourRepository : RepositoryBase, ITourRepository
    {
        public void Add(TourModel tourModel)
        {
            using (var connection = GetConnection())
            using (var command = new SqlCommand())
            {
                connection.Open();
                command.Connection = connection;
                command.CommandText = "insert into [Tour](Title, DateStart, DateEnd, Cost, Rate, " +
                    "ImageMain, Route, PeopleMin, PeopleMax, Lenght, DifficultyId, AgeMin, Actual, RegionId, Description)" +
                    "Values(@title, @dateStart, @dateEnd, @cost, @rate, @imageMain, @route, @peopleMin, @peopleMax, @lenght," +
                    " @difficultyId, @ageMin, @actual, @regionId, @description)";
                command.Parameters.Add("@title", System.Data.SqlDbType.NVarChar).Value = tourModel.Title;
                command.Parameters.Add("@dateStart", System.Data.SqlDbType.Date).Value = tourModel.DateStart;
                command.Parameters.Add("@dateEnd", System.Data.SqlDbType.Date).Value = tourModel.DateEnd;
                command.Parameters.Add("@cost", System.Data.SqlDbType.Money).Value = tourModel.Cost;
                command.Parameters.Add("@rate", System.Data.SqlDbType.Real).Value = tourModel.Rate;
                command.Parameters.Add("@imageMain", System.Data.SqlDbType.NVarChar).Value = tourModel.ImageMain;
                command.Parameters.Add("@route", System.Data.SqlDbType.NVarChar).Value = tourModel.Route;
                command.Parameters.Add("@peopleMin", System.Data.SqlDbType.Int).Value = tourModel.PeopleMin;
                command.Parameters.Add("@peopleMax", System.Data.SqlDbType.Int).Value = tourModel.PeopleMax;
                command.Parameters.Add("@lenght", System.Data.SqlDbType.Int).Value = tourModel.Lenght;
                command.Parameters.Add("@difficultyId", System.Data.SqlDbType.Int).Value = tourModel.DifficultyId;
                command.Parameters.Add("@ageMin", System.Data.SqlDbType.Int).Value = tourModel.AgeMin;
                command.Parameters.Add("@actual", System.Data.SqlDbType.Bit).Value = tourModel.Actual;
                command.Parameters.Add("@regionId", System.Data.SqlDbType.Int).Value = tourModel.RegionId;
                command.Parameters.Add("@description", System.Data.SqlDbType.NVarChar).Value = tourModel.Description;
                command.ExecuteNonQuery();
            }
        }
        public void Edit(TourModel tourModel)
        {
            using (var connection = GetConnection())
            using (var command = new SqlCommand())
            {
                connection.Open();
                command.Connection = connection;
                command.CommandText = "update [Tour]" +
                    "SET Title = @title, " +
                    "DateStart = @dateStart, " +
                    "DateEnd = @dateEnd, " +
                    "Cost = @cost, " +
                    "Rate = @rate, " +
                    "ImageMain = @imageMain, " +
                    "Route = @route, " +
                    "PeopleMin = @peopleMin, " +
                    "PeopleMax = @peopleMax, " +
                    "Lenght = @lenght, " +
                    "DifficultyId = @difficultyId, " +
                    "AgeMin = @ageMin, " +
                    "Actual = @actual, " +
                    "RegionId = @regionId, " +
                    "Description = @description " +
                    "WHERE Id = @id";
                command.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = tourModel.Id;
                command.Parameters.Add("@title", System.Data.SqlDbType.NVarChar).Value = tourModel.Title;
                command.Parameters.Add("@dateStart", System.Data.SqlDbType.Date).Value = tourModel.DateStart;
                command.Parameters.Add("@dateEnd", System.Data.SqlDbType.Date).Value = tourModel.DateEnd;
                command.Parameters.Add("@cost", System.Data.SqlDbType.Money).Value = tourModel.Cost;
                command.Parameters.Add("@rate", System.Data.SqlDbType.Real).Value = tourModel.Rate;
                command.Parameters.Add("@imageMain", System.Data.SqlDbType.NVarChar).Value = tourModel.ImageMain;
                command.Parameters.Add("@route", System.Data.SqlDbType.NVarChar).Value = tourModel.Route;
                command.Parameters.Add("@peopleMin", System.Data.SqlDbType.Int).Value = tourModel.PeopleMin;
                command.Parameters.Add("@peopleMax", System.Data.SqlDbType.Int).Value = tourModel.PeopleMax;
                command.Parameters.Add("@lenght", System.Data.SqlDbType.Int).Value = tourModel.Lenght;
                command.Parameters.Add("@difficultyId", System.Data.SqlDbType.Int).Value = tourModel.DifficultyId;
                command.Parameters.Add("@ageMin", System.Data.SqlDbType.Int).Value = tourModel.AgeMin;
                command.Parameters.Add("@actual", System.Data.SqlDbType.Bit).Value = tourModel.Actual;
                command.Parameters.Add("@regionId", System.Data.SqlDbType.Int).Value = tourModel.RegionId;
                command.Parameters.Add("@description", System.Data.SqlDbType.NVarChar).Value = tourModel.Description;
                command.ExecuteNonQuery();
            }
        }

        public IEnumerable<TourModel> GetAll()
        {
            IEnumerable<TourModel> tours = new List<TourModel>();
            if (GetCount() > 0)
            {
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
                using (var connection = GetConnection())
                using (var command = new SqlCommand())
                {
                    connection.Open();
                    command.Connection = connection;
                    command.CommandText = "select * from [Tour] where Id=@id";
                    command.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = id;
                    using (var reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            result = new TourModel()
                            {
                                Id = Convert.ToInt32(reader[0]),
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

        public void Remove(TourModel tourModel)
        {
            using (var connection = GetConnection())
            using (var command = new SqlCommand())
            {
                connection.Open();
                command.Connection = connection;
                command.CommandText = "delete from [Tour] where Id=@id";
                command.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = tourModel.Id;
                command.ExecuteNonQuery();
            }
        }
    }
}
