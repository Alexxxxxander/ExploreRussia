using System.Collections.Generic;
using System.Net;

namespace ExploreRussia.MVVM.Model
{
    /// <summary>
    /// Интерфейс репозитория таблицы пользователей
    /// </summary>
    public interface IUserRepository
    {
        bool AuthenticateUser(NetworkCredential credential);
        void Add(UserModel userModel);
        void Edit(UserModel userModel);
        void Remove(int id);
        UserModel GetById(int id);
        UserModel GetByUsername(string username);
        IEnumerable<UserModel> GetByAll();
    }
}
