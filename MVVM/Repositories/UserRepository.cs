﻿using ExploreRussia.MVVM.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace ExploreRussia.MVVM.Repositories
{
    public class UserRepository : RepositoryBase, IUserRepository
    {
        public void Add(UserModel userModel)
        {
            throw new NotImplementedException();
        }

        public bool AuthenticateUser(NetworkCredential credential)
        {
            bool validUser = false;
            try
            {
                using (var connection = GetConnection())

                using (var command = new SqlCommand())
                {
                    connection.Open();
                    command.Connection = connection;
                    command.CommandText = "select * from [Users] where Login=@username and [Paswword]=@password";
                    command.Parameters.Add("@username", SqlDbType.NVarChar).Value = credential.UserName;
                    command.Parameters.Add("@password", SqlDbType.NVarChar).Value = credential.Password;
                    validUser = command.ExecuteScalar() == null ? false : true;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка подкобчения к БД", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return validUser;
        }

        public void Edit(UserModel userModel)
        {
            throw new NotImplementedException();
        }
        public IEnumerable<UserModel> GetByAll()
        {
            throw new NotImplementedException();
        }
        public UserModel GetById(int id)
        {
            throw new NotImplementedException();
        }
        public UserModel GetByUsername(string username)
        {
            UserModel user = null;
            try
            {
                using (var connection = GetConnection())
                using (var command = new SqlCommand())
                {
                    connection.Open();
                    command.Connection = connection;
                    command.CommandText = "select * from [Users] where Login=@username";
                    command.Parameters.Add("@username", SqlDbType.NVarChar).Value = username;
                    using (var reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            user = new UserModel()
                            {
                                Id = reader[0].ToString(),
                                Username = reader[1].ToString(),
                                Password = string.Empty,
                                Name = reader[3].ToString(),
                                LastName = reader[4].ToString(),
                            };
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка подключения к БД", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return user;
        }
        public void Remove(int id)
        {
            throw new NotImplementedException();
        }
    }
}

