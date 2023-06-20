using LiveCharts;
using System;
using System.Collections.Generic;

namespace ExploreRussia.MVVM.Model
{
    /// <summary>
    /// Интерфейс репозитория таблицы заявок
    /// </summary>
    internal interface IApplicationRepository
    {
        IEnumerable<ApplicationModel> GetAll();
        int GetCount();
        ChartValues<double> GetCountLastWeek();
        int GetCountDay(DateTime date);
    }
}
