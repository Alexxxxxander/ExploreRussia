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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ExploreRussia.UI.CustomControls
{
    /// <summary>
    /// Логика взаимодействия для BindablePasswordBox.xaml
    /// </summary>
    public partial class BindablePasswordBox : UserControl
    {

        public static readonly DependencyProperty PasswordProperty =
            DependencyProperty.Register("Password", typeof(String), typeof(BindablePasswordBox));

        public String Password
        {
            get { return (String)GetValue(PasswordProperty); }
            set { SetValue(PasswordProperty, value); }
        }
        public BindablePasswordBox()
        {
            InitializeComponent();
            txtPassword.PasswordChanged += OnPasswordChanger;
            txtBoxPassword.TextChanged += OnPasswordChanger;
            txtBoxPassword.Visibility = System.Windows.Visibility.Collapsed;

        }

        private void OnPasswordChanger(object sender, RoutedEventArgs e)
        {
            if (txtBoxPassword.Visibility == Visibility.Visible) 
            {
                Password = txtBoxPassword.Text;
            }
            else
            {
                Password = txtPassword.Password;
            }
        }

        private void chkBox_Checked(object sender, RoutedEventArgs e)
        {        
            txtBoxPassword.Visibility = Visibility.Visible; 
            txtPassword.Visibility = Visibility.Collapsed;
            txtBoxPassword.Text = Password;
        }

        private void chkBox_Unchecked(object sender, RoutedEventArgs e)
        {
            txtPassword.Visibility = Visibility.Visible;
            txtBoxPassword.Visibility = Visibility.Collapsed;
            txtPassword.Password = Password;
        }
    }
}
