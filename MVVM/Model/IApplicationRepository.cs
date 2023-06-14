using LiveCharts;
using System;
using System.Collections.Generic;

namespace ExploreRussia.MVVM.Model
{
    internal interface IApplicationRepository
    {
        IEnumerable<ApplicationModel> GetAll();
        int GetCount();
        ChartValues<double> GetCountLastWeek();
        int GetCountDay(DateTime date);
    }
}
