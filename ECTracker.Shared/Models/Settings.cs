namespace ECTracker.Common.Models
{
    public class Settings
    {
        public string ConnectionString { get; set; }
        public string ApplicationFolderName { get; set; }
        public string DatabaseFilePath { get; set; }
        public string DatabaseFolderPath { get; set; }
        public DatabaseType Database { get; set; }
        public string DatabaseName { get; set; }
        public bool IsFirstRun { get; set; }
    }

    public enum DatabaseType
    {
        SqLite,
        MsSql,
        MySql,
        Oracle,
        Postgresql,
        NoSql,
        Json
    }
}
