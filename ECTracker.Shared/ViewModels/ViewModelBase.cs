using Common.Library;
using Common.Library.Exceptions;
using Common.Library.MessageBroker;
using Common.Library.Validation;
using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ECTracker.Common.ViewModels
{
    public class ViewModelBase : CommonBase, IDataErrorInfo
    {
        #region Private Variables
        private ObservableCollection<ValidationMessage> _validationMessages = new ObservableCollection<ValidationMessage>();
        private bool _isValidationVisible = false;
        #endregion

        #region Public Properties

        public string this[string columnName] => OnValidate(columnName);

        public string Error => throw new NotSupportedException();

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

        #region OnValidate Method

        protected virtual string OnValidate(string propertyName)
        {
            var context = new ValidationContext(this)
            {
                MemberName = propertyName
            };

            var results = new Collection<ValidationResult>();
            var isValid = Validator.TryValidateObject(this, context, results, true);

            return !isValid ? results[0].ErrorMessage : null;
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
            global::Common.Library.MessageBroker.MessageBroker.Instance.SendMessage(MessageBrokerMessages.DisplayStatusMessage, msg);
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
            global::Common.Library.MessageBroker.MessageBroker.Instance.SendMessage(MessageBrokerMessages.CloseUserControl, wasCancelled);
        }
        #endregion

        #region Dispose Method
        public virtual void Dispose()
        {
        }
        #endregion
    }
}
