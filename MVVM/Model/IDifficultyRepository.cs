using System.Collections.Generic;

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
