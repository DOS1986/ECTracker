using System;

namespace Common.Library.Configuration
{
    /// <summary>
    /// This class holds global data for this application
    /// </summary>
    public class ConfigurationSettings : CommonBase
    {
        #region LoadSettings Method
        public virtual void LoadSettings()
        {
            // TODO: Load any common application settings here
        }
        #endregion

        #region GetSetting Method
        protected T GetSetting<T>(string key, object defaultValue)
        {
            var value = System.Configuration.ConfigurationManager.AppSettings[key];
            var ret = string.IsNullOrEmpty(value) ? (T)defaultValue : (T)Convert.ChangeType(value, typeof(T));

            return ret;
        }
        #endregion
    }
}
