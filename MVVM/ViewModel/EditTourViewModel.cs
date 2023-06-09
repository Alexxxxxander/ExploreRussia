using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;
using ExploreRussia.Core;
using ExploreRussia.MVVM.Model;

namespace ExploreRussia.MVVM.ViewModel
{
    internal class EditTourViewModel : ObservableObject
    {
        private TourModel _tourEdit;



        internal TourModel TourEdit
        {
            get => _tourEdit; 
            set
            {
                _tourEdit = value;
                OnPropertyChanged(nameof(TourEdit));
            }
        }

    }
}
