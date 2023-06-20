using ExploreRussia.Core;
using ExploreRussia.MVVM.Model;
using ExploreRussia.MVVM.Repositories;
using ExploreRussia.MVVM.View;
using System;
using System.Threading;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace ExploreRussia.MVVM.ViewModel
{
    /// <summary>
    /// Класс, описывающий логику окна пользователя
    /// </summary>
    internal class UserViewModel : ObservableObject
    {
        private IUserRepository userRepository;
        private UserAccountModel _currentUserAccount;
        
        public RelayCommand CloseWindow { get; set; }

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


        public UserViewModel()
        {
            userRepository = new UserRepository();
            CurrentUserAccount = new UserAccountModel();
            LoadCurrentUserData();
            CloseWindow = new RelayCommand(o =>
            {
                UserControl window = (UserControl)o;

                LoginView loginView = new LoginView();
                loginView.Show();
                loginView.IsVisibleChanged += (s, ev) =>
                {
                    if (loginView.IsVisible == false && loginView.IsLoaded)
                    {
                        var mainView = new MainView();
                        mainView.Show();
                        loginView.Close();
                    }
                };
                loginView.txtBoxUser.Text = Thread.CurrentPrincipal.Identity.Name;
                var myWindow = Window.GetWindow(window);
                myWindow.Close();
            });
        }

        /// <summary>
        /// Метод, загружающий данные пользователя
        /// </summary>
        private void LoadCurrentUserData()
        {
            var user = userRepository.GetByUsername(Thread.CurrentPrincipal.Identity.Name);
            if (user != null)
            {
                CurrentUserAccount.Username = user.Username;
                CurrentUserAccount.DisplayName = $"{user.Name} {user.LastName}";
                CurrentUserAccount.FName = $"{user.Name}";
                CurrentUserAccount.LName = $"{user.LastName}";
                CurrentUserAccount.ProfilePicture = null;
            }
            else
            {
                CurrentUserAccount.DisplayName = "Пользователь не зарегистрирован";
            }
        }
    }
}
