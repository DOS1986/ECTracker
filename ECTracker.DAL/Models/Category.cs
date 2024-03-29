﻿using Newtonsoft.Json;

namespace ECTracker.DataLayer.Models
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
