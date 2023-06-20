using System.Collections.Generic;

namespace ExploreRussia.MVVM.Model
{
    /// <summary>
    /// Интейрфейс репозитория таблицы регионов
    /// </summary>
    public interface IRegionRepository
    {
        void Add(RegionModel regionModel);
        void Edit(RegionModel regionModel);
        void Remove(int id);
        RegionModel GetById(int id);
        IEnumerable<RegionModel> GetAll();
    }
}
