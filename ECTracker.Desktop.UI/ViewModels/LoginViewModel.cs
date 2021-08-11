using Common.Library.MessageBroker;
using ECTracker.Common.ViewModels;
using ECTracker.DataLayer.DataAccess;
using ECTracker.DataLayer.Models;
using System;

namespace ECTracker.Wpf.ViewModels
{
    public sealed class LoginViewModel : ViewModelBase
    {
        private readonly SqLiteConnector _db = new SqLiteConnector();

        public LoginViewModel() : base()
        {
            DisplayStatusMessage("Login to Application");

            Entity = new User
            {
                UserName = Environment.UserName
            };
        }

        private User _entity;

        public User Entity
        {
            get => _entity;
            set
            {
                _entity = value;
                RaisePropertyChanged("Entity");
            }
        }

        public bool Validate()
        {
            Entity.IsLoggedIn = false;
            ValidationMessages.Clear();
            if (string.IsNullOrEmpty(Entity.UserName))
            {
                AddValidationMessage("UserName", "User Name Must Be Filled In");
            }
            if (string.IsNullOrEmpty(Entity.Password))
            {
                AddValidationMessage("Password", "Password Must Be Filled In");
            }

            return ValidationMessages.Count == 0;
        }

        public bool ValidateCredentials()
        {
            try
            {
                //NOTE: Not using password here, but in production you would.I intentionally leave it out so as not having to go into hashing and securing your password.
                if (_db.GetOne<User>("UserName", "User", Entity.UserName) != null)
                {
                    return true;
                }
                else
                {
                    AddValidationMessage("LoginFailed",
                                    "Invalid User Name and/or Password.");
                }
            }
            catch (Exception ex)
            {
                PublishException(ex);
            }

            return false;
        }

        public bool Login()
        {
            if (!Validate())
            {
                return false;
            }

            // Check Credentials in User Table
            if (!ValidateCredentials())
            {
                return false;
            }

            // Mark as logged in
            Entity.IsLoggedIn = true;

            // Send message that login was successful
            MessageBroker.Instance.SendMessage(MessageBrokerMessages.LoginSuccess, Entity);

            // Close the user control
            Close(false);

            return true;
        }

        public override void Close(bool wasCancelled = true)
        {
            if (wasCancelled)
            {
                // Display Informational Message
                MessageBroker.Instance.SendMessage(MessageBrokerMessages.DisplayTimeoutInfoMessageTitle, "User NOT Logged In.");
            }

            base.Close(wasCancelled);
        }
    }
}
