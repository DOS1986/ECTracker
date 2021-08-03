using Newtonsoft.Json;
using System;

namespace ECTracker.DAL.Models
{
    public class BaseModel
    {
        [JsonProperty("id")]
        public int Id { get; set; }

        [JsonProperty("dateCreated")]
        public DateTime DateCreated { get; set; }

        [JsonProperty("dateModified")]
        public DateTime DateModified { get; set; }
    }
}
