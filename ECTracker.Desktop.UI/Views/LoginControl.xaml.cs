using ECTracker.Wpf.ViewModels;
using System.Windows;
using System.Windows.Controls;

namespace ECTracker.Wpf.Views
{
    /// <summary>
    /// Interaction logic for LoginView.xaml
    /// </summary>
    public partial class LoginControl : UserControl
    {
        public LoginControl()
        {
            InitializeComponent();

            // Connect to instance of the view model created by the XAML
            _viewModel = (LoginViewModel)Resources["ViewModel"];
        }

        // Login view model class
        private readonly LoginViewModel _viewModel = null;

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            _viewModel.Close();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            // Add the Password manually because data binding does not work
            _viewModel.Entity.Password = TxtPassword.Password;

            _viewModel.Login();
        }
    }
}
