using ECTracker.Common.ViewModels;
using ECTracker.DataLayer;
using ECTracker.DataLayer.Models;
using System.Timers;

namespace ECTracker.Wpf.ViewModels
{
    public class ShellViewModel : ViewModelBase
    {
        #region Private Variables

        private string _loginMenuHeader = "Login";
        private string _statusMessage;
        private bool _isInfoMessageVisible = true;
        private string _infoMessageTitle = string.Empty;
        private string _infoMessage = string.Empty;
        private const int Seconds = 1500;
        private Timer _infoMessageTimer = null;
        private int _infoMessageTimeout = 1500;
        private User _userEntity = new User();
        private DbRepository _dbRepository = new DbRepository();
        #endregion

        #region Public Properties
        public string LoginMenuHeader
        {
            get => _loginMenuHeader;
            set
            {
                _loginMenuHeader = value;
                RaisePropertyChanged("LoginMenuHeader");
            }
        }

        public int InfoMessageTimeout
        {
            get => _infoMessageTimeout;
            set
            {
                _infoMessageTimeout = value;
                RaisePropertyChanged("InfoMessageTimeout");
            }
        }

        public virtual void CreateInfoMessageTimer()
        {
            if (_infoMessageTimer == null)
            {
                // Create informational message timer
                _infoMessageTimer = new Timer(_infoMessageTimeout);

                // Connect to an Elapsed event
                _infoMessageTimer.Elapsed += MessageTimer_Elapsed;
            }

            _infoMessageTimer.AutoReset = false;
            _infoMessageTimer.Enabled = true;
            IsInfoMessageVisible = true;
        }

        private void MessageTimer_Elapsed(object sender, ElapsedEventArgs e)
        {
            IsInfoMessageVisible = false;
        }

        public string StatusMessage
        {
            get => _statusMessage;
            set
            {
                _statusMessage = value;
                RaisePropertyChanged("StatusMessage");
            }
        }

        public bool IsInfoMessageVisible
        {
            get => _isInfoMessageVisible;

            set
            {
                _isInfoMessageVisible = value;
                RaisePropertyChanged("IsInfoMessageVisible");
            }
        }

        public string InfoMessage
        {
            get => _infoMessage;
            set
            {
                _infoMessage = value;
                RaisePropertyChanged("InfoMessage");
            }
        }

        public string InfoMessageTitle
        {
            get => _infoMessageTitle;
            set
            {
                _infoMessageTitle = value;
                RaisePropertyChanged("InfoMessageTitle");
            }
        }

        public User UserEntity
        {
            get => _userEntity;
            set
            {
                _userEntity = value;
                RaisePropertyChanged("UserEntity");
            }
        }

        public DbRepository DbRepository
        {
            get => _dbRepository;
            set
            {
                _dbRepository = value;
                RaisePropertyChanged("DbRepository");
            }
        }
        #endregion

        #region Public Methods

        public ShellViewModel()
        {
        }



        public void LoadDatabase()
        {
            DbRepository.InitializeConnections();
            System.Threading.Thread.Sleep(Seconds);
        }

        public void LoadCountryCodes()
        {
            // TODO: Write code to load country codes
            System.Threading.Thread.Sleep(Seconds);
        }

        public void LoadEmployeeTypes()
        {
            // TODO: Write code to load employee types
            System.Threading.Thread.Sleep(Seconds);
        }

        public void ClearInfoMessages()
        {
            InfoMessage = string.Empty;
            InfoMessageTitle = string.Empty;
            IsInfoMessageVisible = false;
        }
        #endregion
    }
}
