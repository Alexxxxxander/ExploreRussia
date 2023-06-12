using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExploreRussia.MVVM.Model
{
    internal interface ILogRepository
    {
        void Add(LogModel log);
        IEnumerable<LogModel> GetAll();
    }
}
