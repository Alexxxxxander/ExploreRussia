using System.Collections.Generic;

namespace ExploreRussia.MVVM.Model
{
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
