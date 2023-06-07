using System.Windows.Controls;
using ExploreRussia.MVVM.Repositories;

namespace ExploreRussia.MVVM.View
{
    /// <summary>
    /// Логика взаимодействия для HomeView.xaml
    /// </summary>
    public partial class HomeView : UserControl
    {
        public HomeView()
        {
            InitializeComponent();
            TourRepository tourRepository = new TourRepository();
            txtBox.Text = tourRepository.GetCount().ToString();
            dGrid.ItemsSource = tourRepository.GetByAll();
        }
    }
}
