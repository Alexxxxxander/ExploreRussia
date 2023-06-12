using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExploreRussia.MVVM.Model
{
    public interface IRegionRepository
    {
        void Add(RegionModel regionModel);
        void Edit(RegionModel regionModel);
        void Remove(int id);
        RegionModel GetById(int id);
        IEnumerable<RegionModel> GetAll();
    }
}
