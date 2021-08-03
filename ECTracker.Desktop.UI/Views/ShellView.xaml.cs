using Common.Library.MessageBroker;
using ECTracker.Desktop.UI.ViewModels;
using System;
using System.Diagnostics;
using System.Reflection;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Threading;

namespace ECTracker.Desktop.UI.Views
{
    /// <summary>
    /// Interaction logic for ShellView.xaml
    /// </summary>
    public partial class ShellView : Window
    {
        private readonly ShellViewModel _viewModel = null;
        // Hold main window's original status message
        private readonly string _originalMessage;


        public ShellView()
        {
            InitializeComponent();
            Title = $"ECTracker {GetVersionNumber()}";
            _viewModel = (ShellViewModel)
                this.Resources["ViewModel"];

            // Get the original status message
            _originalMessage = _viewModel.StatusMessage;

            // Initialize the Message Broker Events
            MessageBroker.Instance.MessageReceived += Instance_MessageReceived;
        }

        public string GetVersionNumber()
        {
            var assembly = Assembly.GetExecutingAssembly();
            var fileVersionInfo = FileVersionInfo.GetVersionInfo(assembly.Location);
            var version = fileVersionInfo.ProductVersion;
            return version;
        }

        public async Task LoadApplication()
        {
            _viewModel.InfoMessage = "Loading State Codes...";
            await Dispatcher.BeginInvoke(new Action(() =>
            {
                _viewModel.LoadStateCodes();
            }), DispatcherPriority.Background);

            _viewModel.InfoMessage = "Loading Country Codes...";
            await Dispatcher.BeginInvoke(new Action(() =>
            {
                _viewModel.LoadCountryCodes();
            }), DispatcherPriority.Background);

            _viewModel.InfoMessage = "Loading Employee Types...";
            await Dispatcher.BeginInvoke(new Action(() =>
            {
                _viewModel.LoadEmployeeTypes();
            }), DispatcherPriority.Background);
        }

        public void DisplayUserControl(UserControl uc)
        {
            // Add new user control to content area
            ContentArea.Children.Add(uc);
        }

        private void MenuItem_Click(object sender, RoutedEventArgs e)
        {
            var mnu = (MenuItem)sender;

            // The Tag property contains a command or the name of a user control to load
            if (mnu.Tag == null)
            {
                return;
            }

            var cmd = mnu.Tag.ToString();
            if (cmd != null && cmd.Contains("."))
            {
                // Display a user control
                LoadUserControl(cmd);
            }
            else
            {
                // Process special commands
                ProcessMenuCommands(cmd);
            }
        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            // Call method to load resources application
            await LoadApplication();

            // Turn off informational message area
            _viewModel.ClearInfoMessages();
        }

        private void CloseUserControl()
        {
            // Remove current user control
            ContentArea.Children.Clear();

            // Restore the original status message
            _viewModel.StatusMessage = _originalMessage;
        }

        private void LoadUserControl(string controlName)
        {

            // Create a Type from controlName parameter
            var ucType = Type.GetType(controlName);
            if (!ShouldLoadUserControl(controlName)) return;
            if (ucType == null)
            {
                MessageBox.Show("The Control: " + controlName + " does not exist.");
            }
            else
            {
                // Close current user control in content area
                CloseUserControl();

                // Create an instance of this control
                var uc = (UserControl)Activator.CreateInstance(ucType);
                if (uc != null)
                {
                    // Display control in content area
                    DisplayUserControl(uc);
                }
            }
        }

        private bool ShouldLoadUserControl(string controlName)
        {
            var ret = true;

            // Don't reload a control already loaded.
            if (ContentArea.Children.Count <= 0) return true;
            if (((UserControl)ContentArea.Children[0]).GetType().FullName == controlName)
            {
                ret = false;
            }

            return ret;
        }

        private void ProcessMenuCommands(string command)
        {
            switch (command.ToLower())
            {
                case "exit":
                    Close();
                    break;
                case "login":
                    //if (_viewModel.UserEntity.IsLoggedIn)
                    //{
                    //    // Logging out, so close any open windows
                    //    CloseUserControl();

                    //    //Reset the user object
                    //    //_viewModel.UserEntity = new User();

                    //    // Make menu display Login
                    //    _viewModel.LoginMenuHeader = "Login";
                    //}
                    //else
                    //{
                    // Display the login screen
                    LoadUserControl("RomTracker.UserControls.LoginControl");
                    //}
                    break;
            }
        }

        private void Instance_MessageReceived(object sender, MessageBrokerEventArgs e)
        {
            switch (e.MessageName)
            {
                case MessageBrokerMessages.LoginSuccess:
                    //_viewModel.UserEntity = (User)e.MessagePayload;
                    _viewModel.LoginMenuHeader = "Logout "; // + _viewModel.UserEntity.UserName;
                    break;
                case MessageBrokerMessages.Logout:
                    //_viewModel.UserEntity.IsLoggedIn = false;
                    _viewModel.LoginMenuHeader = "Login";
                    break;
                case MessageBrokerMessages.DisplayStatusMessage:
                    // Set new status message
                    _viewModel.StatusMessage = e.MessagePayload.ToString();
                    break;
                case MessageBrokerMessages.CloseUserControl:
                    CloseUserControl();
                    break;
                case MessageBrokerMessages.DisplayTimeoutInfoMessageTitle:
                    _viewModel.InfoMessageTitle = e.MessagePayload.ToString();
                    _viewModel.CreateInfoMessageTimer();
                    break;
                case MessageBrokerMessages.DisplayTimeoutInfoMessage:
                    _viewModel.InfoMessage = e.MessagePayload.ToString();
                    _viewModel.CreateInfoMessageTimer();
                    break;
            }
        }
    }
}
