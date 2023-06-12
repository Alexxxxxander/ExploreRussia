using System.Windows.Controls;
using ExploreRussia.MVVM.Repositories;

namespace ExploreRussia.MVVM.View
{
    /// <summary>
    /// Логика взаимодействия для TourView.xaml
    /// </summary>
    public partial class TourView : UserControl
    {

        public TourView()
        {
            InitializeComponent();
            TourRepository tourRepository = new TourRepository();
            dGrid.ItemsSource = tourRepository.GetAll();
        }

        private void btn_Refresh_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            TourRepository tourRepository = new TourRepository();
            dGrid.ItemsSource = tourRepository.GetAll();
        }
    }
}
