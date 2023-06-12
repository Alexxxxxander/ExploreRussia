using ExploreRussia.MVVM.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using ExploreRussia.MVVM.Repositories;

namespace ExploreRussia.MVVM.View
{
    /// <summary>
    /// Логика взаимодействия для AddEditWindow.xaml
    /// </summary>
    public partial class AddEditWindow : Window
    {
        public TourModel _tourModel;
        public AddEditWindow(TourModel tourModel)
        {

            InitializeComponent();
            _tourModel = tourModel;
            DataContext = _tourModel;
            DifficultyRepository difficultyRepository = new DifficultyRepository();
            RegionRepository regionRepository = new RegionRepository();
            cmbBoxDifficulty.ItemsSource = difficultyRepository.GetAll().ToList().Select(x => x.Name);
            cmbBoxDifficulty.SelectedIndex = tourModel.DifficultyId - 1;
            cmb_Regions.ItemsSource = regionRepository.GetAll().ToList().Select(x => x.Name);
            cmb_Regions.SelectedIndex = tourModel.RegionId-1;
        }

        private void btn_Close_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ChangedButton == MouseButton.Left)
            {
                this.DragMove();
            }
        }

        private void btn_Save_Click(object sender, RoutedEventArgs e)
        {
            TourRepository tourRepository = new TourRepository();
            if ( _tourModel.Id > 0)
            {
                tourRepository.Edit(_tourModel);
                MessageBox.Show("Успешно");
            }
            else
            {
                tourRepository.Add(_tourModel);
                MessageBox.Show("Успешно");
            }
        }
    }
}
