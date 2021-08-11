using ECTracker.DataLayer.Enums;
using Newtonsoft.Json;

namespace ECTracker.DataLayer.Models
{
    public class DatabaseSettings
    {
        [JsonProperty("attachmentFolderName")]
        public DatabaseType DatabaseType { get; set; }

        [JsonProperty("databaseName")]
        public string DatabaseName { get; set; }

        [JsonProperty("connectionString")]
        public string ConnectionString { get; set; }

        [JsonProperty("databaseUsername", NullValueHandling = NullValueHandling.Ignore)]
        public string DatabaseUsername { get; set; }

        [JsonProperty("DatabasePassword", NullValueHandling = NullValueHandling.Ignore)]
        public string DatabasePassword { get; set; }
    }
}
