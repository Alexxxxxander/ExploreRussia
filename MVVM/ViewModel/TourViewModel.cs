using ExploreRussia.Core;
using ExploreRussia.MVVM.Model;
using ExploreRussia.MVVM.Repositories;
using ExploreRussia.MVVM.View;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Net.Http.Headers;
using System.Runtime.Serialization;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace ExploreRussia.MVVM.ViewModel
{

    internal class TourViewModel : ObservableObject
    {
        //поля
        private TourModel _selectedItem;
        private object _topView;
        private IEnumerable<TourModel> itemsSource;

        //команды
        public RelayCommand TopViewEditCommand { get; set; }
        public RelayCommand TopViewAddCommand {  get; set; }
        public RelayCommand DeleteTourCommand { get; set; }


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


        public TourViewModel()
        {
            TourRepository tours = new TourRepository();
            ItemsSource = tours.GetAll();
            TopViewEditCommand = new RelayCommand(o => 
            { 
                if (SelectedItem != null)
                {
                    AddEditWindow addEditWindow = new AddEditWindow((TourModel)SelectedItem);
                    addEditWindow.ShowDialog();
                    ItemsSource = tours.GetAll();
                }
            });
            TopViewAddCommand = new RelayCommand(o =>
            {
                TourModel tourModel = new TourModel();
                AddEditWindow addEditWindow = new AddEditWindow(tourModel);
                addEditWindow.ShowDialog();
                ItemsSource = tours.GetAll();

            });
            DeleteTourCommand = new RelayCommand(o =>
            {
                if (SelectedItem != null)
                {
                    TourRepository tourRepository = new TourRepository();
                    tourRepository.Remove((TourModel)SelectedItem); 
                    ItemsSource = tours.GetAll();
                }
            });
            
        }

    }
}
