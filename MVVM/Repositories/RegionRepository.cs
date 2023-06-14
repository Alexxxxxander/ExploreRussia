using ExploreRussia.MVVM.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;

namespace ExploreRussia.MVVM.Repositories
{
    internal class RegionRepository : RepositoryBase, IRegionRepository
    {
        public void Add(RegionModel regionModel)
        {
            using (var connection = GetConnection())
            using (var command = new SqlCommand())
            {
                connection.Open();
                command.Connection = connection;
                command.CommandText = "insert into [Regions](Name) values(Name=@name)";
                command.Parameters.Add("@name", System.Data.SqlDbType.NVarChar).Value = regionModel.Name;
                command.ExecuteNonQuery();

            }
        }

        public void Edit(RegionModel regionModel)
        {
            using (var connection = GetConnection())
            using (var command = new SqlCommand())
            {
                connection.Open();
                command.Connection = connection;
                command.CommandText = "update [Regions] SET Name = @name WHERE Id=@id";
                command.Parameters.Add("@name", System.Data.SqlDbType.NVarChar).Value = regionModel.Name;
                command.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = regionModel.Id;
                command.ExecuteNonQuery();
            }
        }

        public IEnumerable<RegionModel> GetAll()
        {
            IEnumerable<RegionModel> regions = new List<RegionModel>();
            using (var connection = GetConnection())
            using (var command = new SqlCommand())
            {
                connection.Open();
                command.Connection = connection;
                command.CommandText = "select * from [Regions]";
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        RegionModel regionModel = new RegionModel()
                        {
                            Id = Convert.ToInt32(reader[0]),
                            Name = reader[1].ToString()
                        };
                        regions = regions.Append<RegionModel>(regionModel);
                    }
                }
            }
            return regions;
        }

        public RegionModel GetById(int id)
        {
            RegionModel regionModel = null;
            using (var connection = GetConnection())
            using (var command = new SqlCommand())
            {
                connection.Open();
                command.Connection = connection;
                command.CommandText = "select * from [Regions] where Id=@id";
                command.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = id;
                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        regionModel = new RegionModel()
                        {
                            Id = Convert.ToInt32(reader[0]),
                            Name = reader[1].ToString()
                        };
                    }
                }
            }
            return regionModel;
        }
        public void Remove(int id)
        {
            using (var connection = GetConnection())
            using (var command = new SqlCommand())
            {
                connection.Open();
                command.Connection = connection;
                command.CommandText = "delete from [Regions] WHERE (Id=@id)";
                command.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = id;
                command.ExecuteNonQuery();

            }
        }
    }
}
