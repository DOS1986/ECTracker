using Newtonsoft.Json;

namespace ECTracker.DAL.Models
{
    public class Category : BaseModel
    {
        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("parentId")]
        public int ParentId { get; set; }

        [JsonProperty("description")]
        public string Description { get; set; }
    }
}
