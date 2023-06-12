using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
