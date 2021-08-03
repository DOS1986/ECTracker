using Common.Library.Exceptions;
using Common.Library.MessageBroker;
using Common.Library.Validation;
using System;
using System.Collections.ObjectModel;

namespace Common.Library.ViewModels
{
    public class ViewModelBase : CommonBase
    {
        #region Private Variables
        private ObservableCollection<ValidationMessage> _validationMessages = new ObservableCollection<ValidationMessage>();
        private bool _isValidationVisible = false;
        #endregion

        #region Public Properties
        public ObservableCollection<ValidationMessage> ValidationMessages
        {
            get => _validationMessages;
            set
            {
                _validationMessages = value;
                RaisePropertyChanged("ValidationMessages");
            }
        }

        public bool IsValidationVisible
        {
            get => _isValidationVisible;
            set
            {
                _isValidationVisible = value;
                RaisePropertyChanged("IsValidationVisible");
            }
        }
        #endregion

        #region AddBusinessRuleMessage Method
        public virtual void AddValidationMessage(string propertyName, string msg)
        {
            _validationMessages.Add(new ValidationMessage { Message = msg, PropertyName = propertyName });
            IsValidationVisible = true;
        }
        #endregion

        #region Clear Method
        public virtual void Clear()
        {
            ValidationMessages.Clear();
            IsValidationVisible = false;
        }
        #endregion

        #region DisplayStatusMessage Method
        public virtual void DisplayStatusMessage(string msg = "")
        {
            MessageBroker.MessageBroker.Instance.SendMessage(MessageBrokerMessages.DisplayStatusMessage, msg);
        }
        #endregion

        #region PublishException Method
        public void PublishException(Exception ex)
        {
            // Publish Exception
            ExceptionManager.Instance.Publish(ex);
        }
        #endregion

        #region Close Method
        public virtual void Close(bool wasCancelled = true)
        {
            MessageBroker.MessageBroker.Instance.SendMessage(MessageBrokerMessages.CloseUserControl, wasCancelled);
        }
        #endregion

        #region Dispose Method
        public virtual void Dispose()
        {
        }
        #endregion
    }
}
