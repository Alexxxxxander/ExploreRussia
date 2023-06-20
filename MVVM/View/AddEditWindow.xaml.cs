using ExploreRussia.MVVM.Model;
using ExploreRussia.MVVM.Repositories;
using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Input;

namespace ExploreRussia.MVVM.View
{
    /// <summary>
    /// Логика взаимодействия для AddEditWindow.xaml
    /// </summary>
    public partial class AddEditWindow : Window
    {
        //поле хранящее в себе текущую таблицу туров
        public TourModel _tourModel;

        StringBuilder error = new StringBuilder();
        public AddEditWindow(TourModel tourModel)
        {

            InitializeComponent();
            _tourModel = tourModel;
            DataContext = _tourModel;
            DifficultyRepository difficultyRepository = new DifficultyRepository();
            RegionRepository regionRepository = new RegionRepository();
            cmbBoxDifficulty.ItemsSource = difficultyRepository.GetAll().ToList().Select(x => x.Name);
            cmb_Regions.ItemsSource = regionRepository.GetAll().ToList().Select(x => x.Name);
            if (_tourModel.Id > 0)
            {
                cmbBoxDifficulty.SelectedIndex = tourModel.DifficultyId - 1;
                cmb_Regions.SelectedIndex = tourModel.RegionId - 1;
            }
            else
            {
                lbl_AddEdit.Content = "Добавить";
            }


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
            if (_tourModel.Id > 0)
            {
                CheckDataValid();
                if (error.Length == 0)
                {
                    tourRepository.Edit(_tourModel);
                    MessageBox.Show("Успешно");
                    this.Close();
                }
                else
                {
                    MessageBox.Show(error.ToString());
                }
            }
            else
            {
                CheckDataValid();
                if (error.Length == 0)
                {
                    tourRepository.Add(_tourModel);
                    MessageBox.Show("Успешно");
                    this.Close();
                }
                else
                {
                    MessageBox.Show(error.ToString()); 
                }
            }
        }
        void CheckDataValid()
        {

            if (string.IsNullOrEmpty(txtBoxTitle.Text))
            {
                error.AppendLine("Заголовок не может быть пустым");
            }
            if (DatePickerStart.DisplayDate > DatePickerEnd.DisplayDate)
            {
                error.AppendLine("Указан неверный промежуток дат");
            }
            if (DatePickerStart.DisplayDate < DateTime.Now.Date)
            {
                error.AppendLine("Тур будет не актуален");
            }
            if (string.IsNullOrEmpty(TxtBoxCost.Text))
            {
                error.AppendLine("Введите стоимость");
            }
            if (Decimal.TryParse(TxtBoxCost.Text, out var cost))
            {
                if (cost <= 0)
                {
                    error.AppendLine("Стоимость - число больше нуля");
                }
            }
            if (Single.TryParse(TxtBoxRate.Text, out var rate))
            {
                if (rate <= 0 || rate > 5)
                {
                    error.AppendLine("Рейтинг - число больше нуля и меньше пяти");
                }
            }
            else
            {
                if (string.IsNullOrEmpty(TxtBoxRate.Text))
                {
                    error.AppendLine("Введите рейтинг");
                }
                error.AppendLine("Неверный формат рейтинга");
            }
            if (string.IsNullOrEmpty(TxtBoxRoute.Text))
            {
                error.AppendLine("Маршрут не может быть пустым");
            }
            if (!int.TryParse(TxtBoxPeopleMax.Text, out var peopleMax))
            {
                error.AppendLine("Количество - число больше нуля");
            }
            else
            {
                if (!int.TryParse(TxtBoxPeopleMin.Text, out var peopleMin))
                {
                    error.AppendLine("Количество - число больше нуля");
                }
                else
                {
                    if (peopleMin > peopleMax)
                    {
                        error.AppendLine("Максимальное количество человек должно быть больше минимального");
                    }
                }
            }
            if (!int.TryParse(TxtBoxLenght.Text, out var lenght))
            {
                error.AppendLine("Расстояние - число больше нуля");
            }
            else
            {
                if (lenght <= 0)
                {
                    error.AppendLine("Расстояние - число больше нуля");
                }
            }
            if (!int.TryParse(TxtBoxAgeMin.Text, out var ageMin))
            {
                error.AppendLine("Возраст от - число больше нуля");
            }
            else
            {
                if (ageMin <= 0)
                {
                    error.AppendLine("Возраст от - число больше нуля");
                }
            }
        }
    }
}
