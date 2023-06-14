using System.Collections.Generic;

namespace ExploreRussia.MVVM.Model
{
    internal interface ILogRepository
    {
        void Add(LogModel log);
        IEnumerable<LogModel> GetAll();
    }
}
