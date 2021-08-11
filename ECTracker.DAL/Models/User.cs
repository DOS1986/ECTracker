using Common.Library;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ECTracker.DataLayer.Models
{
    [Table("User", Schema = "dbo")]
    public class User : CommonBase
    {
        private int _userId;
        private string _userName = string.Empty;
        private string _password = string.Empty;
        private string _firstName = string.Empty;
        private string _lastName = string.Empty;
        private string _emailAddress = string.Empty;
        private bool _isLoggedIn = false;

        [Required]
        [Key]
        public int UserId
        {
            get => _userId;
            set
            {
                _userId = value;
                RaisePropertyChanged("UserId");
            }
        }

        [Required]
        public string UserName
        {
            get => _userName;
            set
            {
                _userName = value;
                RaisePropertyChanged("UserName");
            }
        }

        [Required]
        public string Password
        {
            get => _password;
            set
            {
                _password = value;
                RaisePropertyChanged("Password");
            }
        }

        [Required]
        public string FirstName
        {
            get => _firstName;
            set
            {
                _firstName = value;
                RaisePropertyChanged("FirstName");
            }
        }

        [Required]
        public string LastName
        {
            get => _lastName;
            set
            {
                _lastName = value;
                RaisePropertyChanged("LastName");
            }
        }

        [Required]
        public string EmailAddress
        {
            get => _emailAddress;
            set
            {
                _emailAddress = value;
                RaisePropertyChanged("EmailAddress");
            }
        }

        [NotMapped]
        public bool IsLoggedIn
        {
            get => _isLoggedIn;
            set
            {
                _isLoggedIn = value;
                RaisePropertyChanged("IsLoggedIn");
            }
        }
    }
}
