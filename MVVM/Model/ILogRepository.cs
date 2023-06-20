using System.Collections.Generic;

namespace ExploreRussia.MVVM.Model
{
    /// <summary>
    /// Интерфейс репозитория таблицы логирования
    /// </summary>
    internal interface ILogRepository
    {
        void Add(LogModel log);
        IEnumerable<LogModel> GetAll();
    }
}
