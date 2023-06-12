using ExploreRussia.MVVM.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExploreRussia.MVVM.Model
{
    public interface IDifficultyRepository 
    {
        void Add(DifficultyModel difficultyModel);
        void Edit(DifficultyModel difficultyModel);
        void Remove(int id);
        DifficultyModel GetById(int id);
        IEnumerable<DifficultyModel> GetAll();
    }
}
