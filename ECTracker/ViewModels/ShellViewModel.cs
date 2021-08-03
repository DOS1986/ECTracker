﻿using Common.Library.ViewModels;
using System.Timers;

namespace ECTracker.Desktop.UI.ViewModels
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
        #endregion

        #region Public Methods
        public void LoadStateCodes()
        {
            // TODO: Write code to load state codes
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
