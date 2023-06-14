using ExploreRussia.Core;
using ExploreRussia.MVVM.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LiveCharts;
using LiveCharts.Wpf;
using System.Runtime.InteropServices;
using System.Windows.Media;

namespace ExploreRussia.MVVM.ViewModel
{
    internal class HomeViewViewModel : ObservableObject
    {
        SeriesCollection _seriesCollection;
        private int _applicationCount;

        private string[] _labels;
        private Func<double, string> _formatter;

        public int ApplicationCount
        {
            get { return _applicationCount; }
            set
            {
                _applicationCount = value;
                OnPropertyChanged();
            }
        }

        public SeriesCollection SeriesCollectionData
        {
            get => _seriesCollection;
            set
            {
                _seriesCollection = value;
                OnPropertyChanged();
            }
        }

        public string[] Labels
        {
            get => _labels;
            set
            {
                _labels = value;
                OnPropertyChanged();
            }
        }
        public Func<double, string> Formatter
        {
            get => _formatter;
            set
            {
                _formatter = value;
                OnPropertyChanged();
            }
        }

        public HomeViewViewModel()
        {
            ApplicationRepository applicationRepository = new ApplicationRepository();
            SeriesCollectionData = new SeriesCollection
            {
                new ColumnSeries
                {
                    Values = applicationRepository.GetCountLastWeek(),
                    Fill = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#F2E205")),
                    Title = "Заявки"
                }
            };


            Labels = new[] 
            {
                               
                DateTime.Now.Date.AddDays(-6).ToShortDateString().ToString(),
                DateTime.Now.Date.AddDays(-5).ToShortDateString().ToString(),
                DateTime.Now.Date.AddDays(-4).ToShortDateString().ToString(),
                DateTime.Now.Date.AddDays(-3).ToShortDateString().ToString(),
                DateTime.Now.Date.AddDays(-2).ToShortDateString().ToString(),
                DateTime.Now.Date.AddDays(-1).ToShortDateString().ToString(),
                DateTime.Now.Date.ToShortDateString().ToString()

            };
            Formatter = value => value.ToString("N");


            ApplicationCount = applicationRepository.GetCountDay(DateTime.Now.AddDays(-1));
        }


          
    }
}
