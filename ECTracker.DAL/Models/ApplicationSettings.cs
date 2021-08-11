using Newtonsoft.Json;

namespace ECTracker.DataLayer.Models
{
    public class ApplicationSettings
    {
        [JsonProperty("applicationFolderName")]
        public string ApplicationFolderName { get; set; }

        [JsonProperty("attachmentFolderLocation")]
        public string AttachmentFolderLocation { get; set; }

        [JsonProperty("attachmentFolderName")]
        public string AttachmentFolderName { get; set; }

        [JsonProperty("imageFolderLocation")]
        public string ImageFolderLocation { get; set; }

        [JsonProperty("imageFolderName")]
        public string ImageFolderName { get; set; }
    }
}
