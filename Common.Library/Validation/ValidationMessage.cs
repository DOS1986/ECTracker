namespace Common.Library.Validation
{
    public class ValidationMessage : CommonBase
    {
        #region Private Properties
        private string _propertyName;
        private string _message;
        #endregion

        #region Public Properties
        public string PropertyName
        {
            get => _propertyName;
            set
            {
                _propertyName = value;
                RaisePropertyChanged("PropertyName");
            }
        }

        public string Message
        {
            get => _message;
            set
            {
                _message = value;
                RaisePropertyChanged("Message");
            }
        }
        #endregion
    }
}
