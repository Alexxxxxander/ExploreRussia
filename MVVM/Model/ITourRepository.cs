using System.Collections.Generic;

namespace ExploreRussia.MVVM.Model
{
    /// <summary>
    /// Интерфейс репозитория таблицы туров
    /// </summary>
    internal interface ITourRepository
    {
        void Add(TourModel tourModel);
        void Edit(TourModel tourModel);
        void Remove(TourModel tourModel);
        TourModel GetById(int id);
        TourModel GetByTitle(string title);
        int GetCount();
        IEnumerable<TourModel> GetAll();
    }
}
