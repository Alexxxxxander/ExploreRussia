using ExploreRussia.Core;
using ExploreRussia.MVVM.Model;
using ExploreRussia.MVVM.Repositories;
using System.Threading;

namespace ExploreRussia.MVVM.ViewModel
{
    class MainViewModel : ObservableObject
    {
        //команды перехода
        public RelayCommand TourViewCommand { get; set; }
        public RelayCommand DiscoveryViewCommand { get; set; }
        public RelayCommand HomeViewCommand { get; set; }

        //ViewModels
        public TourViewModel TourVM { get; set; }
        public DiscoveryViewModel DiscoveryVM { get; set; }
        public HomeViewViewModel HomeVM { get; set; }

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
            DiscoveryVM = new DiscoveryViewModel();
            HomeVM = new HomeViewViewModel();

            CurrentView = TourVM;

            TourViewCommand = new RelayCommand(o =>
            {
                CurrentView = TourVM;
            });

            DiscoveryViewCommand = new RelayCommand(o =>
            {
                CurrentView = DiscoveryVM;
            });
            HomeViewCommand = new RelayCommand(o =>
            {
                CurrentView = HomeVM;
            });
        }
        private void LoadCurrentUserData()
        {
            var user = userRepository.GetByUsername(Thread.CurrentPrincipal.Identity.Name);
            if (user != null)
            {
                CurrentUserAccount.Username = user.Username;
                CurrentUserAccount.DisplayName = $"Здравствуйте {user.Name} {user.LastName}";
                CurrentUserAccount.ProfilePicture = null;
            }
            else
            {
                CurrentUserAccount.DisplayName = "Пользователь не зарегистрирован";
            }
        }
    }
}
