using ExploreRussia.Core;
using ExploreRussia.MVVM.Model;
using ExploreRussia.MVVM.Repositories;
using System;
using System.Security.Principal;
using System.Threading;
using System.Windows.Input;

namespace ExploreRussia.MVVM.ViewModel
{
    /// <summary>
    /// Класс описывающий логику окна входа
    /// </summary>
    internal class LoginViewModel : ObservableObject
    {
        private string _username;
        private string _password;
        private string _errorMessage;
        private bool _isViewVisible = true;
        private IUserRepository userRepository;
        private ILogRepository logRepository;


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
        public RelayCommand LogAuthoCommand { get; set; }

        //Конструктор
        public LoginViewModel()
        {
            userRepository = new UserRepository();
            LoginCommand = new RelayCommand(ExecuteLoginCommand, CanExecuteLogincommand);
        }

        /// <summary>
        /// Метод проверки условий выполнения команды
        /// </summary>
        /// <param name="arg"></param>
        /// <returns></returns>
        private bool CanExecuteLogincommand(object arg)
        {
            bool validData;
            if (string.IsNullOrWhiteSpace(Username) || Username.Length < 1 ||
            Password == null || Password.Length < 1)
                validData = false;
            else validData = true;
            return validData;
        }

        /// <summary>
        /// Метод выполняющий действия команды
        /// </summary>
        /// <param name="obj"></param>
        private void ExecuteLoginCommand(object obj)
        {
            var isValidUser = userRepository.AuthenticateUser(new System.Net.NetworkCredential(Username, Password));
            if (isValidUser)
            {
                Thread.CurrentPrincipal = new GenericPrincipal(
                    new GenericIdentity(Username), null);
                logRepository = new LogRepository();
                LogModel log = new LogModel();
                log.UserId = userRepository.GetByUsername(Username).Id;
                log.Time = DateTime.Now;
                logRepository.Add(log);
                IsViewVisible = false;
            }
            else
            {
                ErrorMessage = "* Неверный логин или пароль";
            }
        }
    }
}
