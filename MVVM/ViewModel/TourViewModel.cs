using ExploreRussia.Core;
using ExploreRussia.MVVM.Model;
using System.Collections;
using System.Collections.Generic;
using System.Net.Http.Headers;
using System.Runtime.Serialization;
using System.Windows.Input;

namespace ExploreRussia.MVVM.ViewModel
{

    internal class TourViewModel : ObservableObject
    {


        //поля
        private TourModel _selectedItem;
        private object _topView;

        //команды
        public ICommand EditTour { get; }


        public object SelectedItem 
        { 
            get => _selectedItem; 
            set
            {
                _selectedItem = (TourModel)value;
                OnPropertyChanged(nameof(SelectedItem));
            } 
        }

        public object TopView
        {
            get { return _topView; }
            set
            {
                _topView = value;
                OnPropertyChanged();
            }
        }

        public TourViewModel()
        {
            EditTour = new RelayCommand(ExecuteEditCommand, CanExecuteEditCommand);
            AddEditView = new A
        }
        private void ExecuteEditCommand(object obj)
        {
          
        }
        private bool CanExecuteEditCommand(object arg)
        {
            bool isSelectItem = false;
            return isSelectItem;
        }
    }
}
