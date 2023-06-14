using ExploreRussia.Core;
using ExploreRussia.MVVM.Model;
using ExploreRussia.MVVM.Repositories;
using System;
using System.Threading;
using System.Windows.Input;

namespace ExploreRussia.MVVM.ViewModel
{
    internal class UserViewModel : ObservableObject
    {
        private IUserRepository userRepository;
        public event EventHandler ConfirmEvent;
        private UserAccountModel _currentUserAccount;

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

        private ICommand confirmCommand;

        public ICommand ConfirmCommand
        {
            get
            {
                if (confirmCommand == null)
                {
                    confirmCommand = new RelayCommand(p => FireConfirmEvent(), p => ConfirmEventPredicate());
                }
                return confirmCommand;
            }
        }

        private bool ConfirmEventPredicate()
        {
            throw new NotImplementedException();
        }

        private void FireConfirmEvent()
        {
            throw new NotImplementedException();
        }

        public UserViewModel()
        {
            userRepository = new UserRepository();
            CurrentUserAccount = new UserAccountModel();
            LoadCurrentUserData();
        }

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
