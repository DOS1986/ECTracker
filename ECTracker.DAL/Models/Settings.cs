using Newtonsoft.Json;

namespace ECTracker.DataLayer.Models
{
    public class Settings : SettingsManager<Settings>
    {
        [JsonProperty("firstRun")]
        public bool FirstRun { get; set; }

        [JsonProperty("application")]
        public ApplicationSettings Application { get; set; }

        [JsonProperty("database")]
        public DatabaseSettings Database { get; set; }
    }
}
