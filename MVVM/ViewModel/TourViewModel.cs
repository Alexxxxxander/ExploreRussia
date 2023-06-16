using ExploreRussia.Core;
using ExploreRussia.MVVM.Model;
using ExploreRussia.MVVM.Repositories;
using ExploreRussia.MVVM.View;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using Excel = Microsoft.Office.Interop.Excel;
using Microsoft.Office.Interop.Excel;

namespace ExploreRussia.MVVM.ViewModel
{

    internal class TourViewModel : ObservableObject
    {
        //поля
        private TourModel _selectedItem;
        private object _topView;
        private IEnumerable<TourModel> itemsSource = new List<TourModel>();
        private string _searchText;
        private ICommand _searchTextChangedCommand;

        //команды
        public RelayCommand TopViewEditCommand { get; set; }
        public RelayCommand TopViewAddCommand { get; set; }
        public RelayCommand DeleteTourCommand { get; set; }
        public RelayCommand ExportTourCommand { get; set; }


        public object SelectedItem
        {
            get { return _selectedItem; }
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

        public object ItemsSource
        {
            get { return itemsSource; }
            set
            {
                itemsSource = (IEnumerable<TourModel>)value;
                OnPropertyChanged();

            }
        }

        public string SearchText 
        {
            get { return _searchText; }
            set
            {
                _searchText = value;
                OnPropertyChanged(nameof(SearchText));                
            }
        }

        public ICommand SearchTextChangedCommand
        {
            get
            {
                if (_searchTextChangedCommand == null)
                {
                    _searchTextChangedCommand =
                      new RelayCommand(param => OnRequestSearchTextChanged());
                }
                return _searchTextChangedCommand;
            }
        }

        private void OnRequestSearchTextChanged()
        {
            TourRepository tours = new TourRepository();
            if (!string.IsNullOrEmpty(SearchText))
            {
                ItemsSource = tours.GetAll().Where(x => x.Title.ToLower().Contains(SearchText.ToLower()) || x.Description.ToLower().Contains(SearchText.ToLower()));
            }
            else
            {
                ItemsSource = tours.GetAll();
            }
        }


        public TourViewModel()
        {
            TourRepository tours = new TourRepository();
            ItemsSource = tours.GetAll().ToList();
            TopViewEditCommand = new RelayCommand(o =>
            {
                if (SelectedItem != null)
                {
                    AddEditWindow addEditWindow = new AddEditWindow((TourModel)SelectedItem);
                    addEditWindow.ShowDialog();
                    ItemsSource = tours.GetAll();
                    SearchText = "";
                }
            });
            TopViewAddCommand = new RelayCommand(o =>
            {
                TourModel tourModel = new TourModel();
                AddEditWindow addEditWindow = new AddEditWindow(tourModel);
                addEditWindow.ShowDialog();
                ItemsSource = tours.GetAll();
                SearchText = "";

            });
            DeleteTourCommand = new RelayCommand(o =>
            {
                if (SelectedItem != null)
                {
                    if (MessageBox.Show("Вы уверены, что хотите удалить эту запись?", "Удаление", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
                    {
                        TourRepository tourRepository = new TourRepository();
                        tourRepository.Remove((TourModel)SelectedItem);
                    }
                    ItemsSource = tours.GetAll();
                    SearchText = "";
                }
            });
            
        }

    }
}
