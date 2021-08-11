using Microsoft.Data.Sqlite;

namespace ECTracker.DataLayer
{
    public interface IDbRepository
    {
        public static SqliteConnection ConnectionString { get; set; }
        public void InitializeConnections();
        public string FullFolderPath(string applicationFolder);
    }
}
