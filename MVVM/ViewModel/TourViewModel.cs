using ExploreRussia.Core;
using ExploreRussia.MVVM.Model;
using ExploreRussia.MVVM.View;
using System.Collections;
using System.Collections.Generic;
using System.Net.Http.Headers;
using System.Runtime.Serialization;
using System.Windows;
using System.Windows.Input;

namespace ExploreRussia.MVVM.ViewModel
{

    internal class TourViewModel : ObservableObject
    {
        //поля
        private TourModel _selectedItem;
        private object _topView;

        //команды
        public RelayCommand TopViewEditCommand { get; set; }
        public RelayCommand TopViewAddCommand {  get; set; }


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

            TopViewEditCommand = new RelayCommand(o => 
            { 
                if (SelectedItem != null)
                {
                    AddEditWindow addEditWindow = new AddEditWindow((TourModel)SelectedItem);
                    addEditWindow.ShowDialog();
                }
            });
            TopViewAddCommand = new RelayCommand(o =>
            {
                AddEditWindow addEditWindow = new AddEditWindow(null);
                addEditWindow.ShowDialog();

            });
            
        }

    }
}
