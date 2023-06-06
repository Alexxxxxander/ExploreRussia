using ExploreRussia.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExploreRussia.MVVM.ViewModel
{
    class MainViewModel : ObservableObject
    {
        //команды перехода
        public RelayCommand HomeViewCommand { get; set; }
        public RelayCommand DiscoveryViewCommand { get; set; }

        //ViewModels
        public HomeViewModel HomeVM { get; set; }
        public DiscoveryViewModel DiscoveryVM { get; set; }

        private object _currentView;

        public object CurrentView
        {
            get { return _currentView; }
            set 
            { 
                _currentView = value;
                OnPropertyChanged();
            }
        }

        public MainViewModel()
        {
            HomeVM = new HomeViewModel();
            DiscoveryVM = new DiscoveryViewModel();

            CurrentView = HomeVM;

            HomeViewCommand = new RelayCommand(o =>
            {
                CurrentView = HomeVM;
            });

            DiscoveryViewCommand = new RelayCommand(o =>
            {
                CurrentView = DiscoveryVM;
            });
        }
    }
}
