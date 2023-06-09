using ExploreRussia.Core;
using ExploreRussia.MVVM.Model;
using System;
using System.Windows.Input;
using ExploreRussia.MVVM.Repositories;
using System.Security.Principal;
using System.Threading;
using System.Diagnostics.Eventing.Reader;

namespace ExploreRussia.MVVM.ViewModel
{
    internal class LoginViewModel : ObservableObject
    {
        private string _username = "admin";
        private string _password;
        private string _errorMessage;
        private bool _isViewVisible = true;
        private IUserRepository userRepository;

        public string Username
        {
            get => _username;
            set
            {
                _username = value;
                OnPropertyChanged(nameof(Username));
            }
        }
        public string Password
        {
            get => _password;

            set
            {
                _password = value;
                OnPropertyChanged(nameof(Password));
            }
        }
        public string ErrorMessage
        {
            get => _errorMessage;
            set
            {
                _errorMessage = value;
                OnPropertyChanged(nameof(ErrorMessage));
            }
        }
        public bool IsViewVisible
        {
            get => _isViewVisible;
            set
            {
                _isViewVisible = value;
                OnPropertyChanged(nameof(IsViewVisible));
            }
        }

        //Comands
        public ICommand LoginCommand { get; }
        public ICommand ShowPasswordCommand { get; }
        public ICommand RememberPasswordCommand { get; }

        //Конструктор
        public LoginViewModel()
        {
            userRepository = new UserRepository();
            LoginCommand = new RelayCommand(ExecuteLoginCommand, CanExecuteLogincommand);
        }


        private bool CanExecuteLogincommand(object arg)
        {
            bool validData;
            if (string.IsNullOrWhiteSpace(Username) || Username.Length < 1 ||
            Password == null || Password.Length < 1)
                validData = false;
            else validData = true;
            return validData;
        }

        private void ExecuteLoginCommand(object obj)
        {
            var isValidUser = userRepository.AuthenticateUser(new System.Net.NetworkCredential(Username, Password));
            if (isValidUser)
            {
                Thread.CurrentPrincipal = new GenericPrincipal(
                    new GenericIdentity(Username),null);
                    IsViewVisible = false;
            }
            else
            {
                ErrorMessage = "* Неверный логин или пароль";
            }
        }
    }
}
