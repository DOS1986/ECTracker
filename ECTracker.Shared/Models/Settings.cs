namespace ECTracker.Shared.Models
{
    public class Settings
    {
        public string ConnectionString { get; set; }
        public DatabaseType Database { get; set; }
        public string DatabaseName { get; set; }
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
