using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using System.Xml.Serialization;
using ExploreRussia.Core;
using ExploreRussia.MVVM.Model;

namespace ExploreRussia.MVVM.ViewModel
{
    internal class EditTourViewModel : ObservableObject
    {
        public bool _editTourViewVisibility = true;
        private TourModel _tourEdit;

        public RelayCommand HideViewCommand { get; }
        public RelayCommand ShowViewCommand { get; }


        public bool EditTourViewVisibility 
        {
            get => _editTourViewVisibility;
            set
            {
                _editTourViewVisibility = value;
                OnPropertyChanged("EditTourViewVisibility");
            }
        }

        public TourModel TourEdit
        {
            get => _tourEdit; 
            set
            {
                _tourEdit = value;
                OnPropertyChanged(nameof(TourEdit));
            }
        }

        public EditTourViewModel()
        {
            HideViewCommand = new RelayCommand(o =>
            {
                EditTourViewVisibility = false;             
            });
            ShowViewCommand = new RelayCommand(o =>
            {
                EditTourViewVisibility = true;
            });
        }
        public void ShowView()
        {
            EditTourViewVisibility = true;
        }
    }
}
