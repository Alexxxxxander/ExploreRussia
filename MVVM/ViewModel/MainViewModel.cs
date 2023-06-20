using ExploreRussia.Core;
using ExploreRussia.MVVM.Model;
using ExploreRussia.MVVM.Repositories;
using System;
using System.Threading;
using System.Windows;

namespace ExploreRussia.MVVM.ViewModel
{
    /// <summary>
    /// Класс описывающий логику главного окна
    /// </summary>
    class MainViewModel : ObservableObject
    {
        //команды перехода
        public RelayCommand TourViewCommand { get; set; }
        public RelayCommand HomeViewCommand { get; set; }
        public RelayCommand UserViewCommand { get; set; }

        //ViewModels
        public TourViewModel TourVM { get; set; }
        public HomeViewViewModel HomeVM { get; set; }
        public UserViewModel UserVM { get; set; }

        //поля
        private UserAccountModel _currentUserAccount;
        private IUserRepository userRepository;

        public UserAccountModel CurrentUserAccount
        {
            get
            {
                return _currentUserAccount;
            }

            set
            {
                _currentUserAccount = value;
                OnPropertyChanged(nameof(CurrentUserAccount));
            }
        }
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
            userRepository = new UserRepository();
            CurrentUserAccount = new UserAccountModel();
            LoadCurrentUserData();

            TourVM = new TourViewModel();
            HomeVM = new HomeViewViewModel();
            UserVM = new UserViewModel();

            CurrentView = TourVM;

            TourViewCommand = new RelayCommand(o =>
            {
                CurrentView = TourVM;
            });

            HomeViewCommand = new RelayCommand(o =>
            {
                CurrentView = HomeVM;
            });

            UserViewCommand = new RelayCommand(o =>
            {
                CurrentView = UserVM;
            });
        }

        /// <summary>
        /// Загружает данные текущего пользователя
        /// </summary>
        private void LoadCurrentUserData()
        {
            var user = userRepository.GetByUsername(Thread.CurrentPrincipal.Identity.Name);
            if (user != null)
            {
                CurrentUserAccount.Username = user.Username;
                CurrentUserAccount.DisplayName = $"{user.Name} {user.LastName}";
                CurrentUserAccount.ProfilePicture = null;
            }
            else
            {
                CurrentUserAccount.DisplayName = "Пользователь не зарегистрирован";
            }
        }
    }
}
