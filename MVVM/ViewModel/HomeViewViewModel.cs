using ExploreRussia.Core;
using ExploreRussia.MVVM.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExploreRussia.MVVM.ViewModel
{
    internal class HomeViewViewModel : ObservableObject
    {
        private int _applicationCount;

        public int ApplicationCount
        {
            get { return _applicationCount; }
            set
            {
                _applicationCount = value;
                OnPropertyChanged();
            }
        }
        public HomeViewViewModel()
        {
            ApplicationRepository applicationRepository = new ApplicationRepository();
            ApplicationCount = applicationRepository.GetCount();
        } 
    }
}
