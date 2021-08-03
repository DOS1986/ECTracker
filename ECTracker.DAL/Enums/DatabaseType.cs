using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Runtime.Serialization;

namespace ECTracker.DAL.Enums
{
    [JsonConverter(typeof(StringEnumConverter))]
    public enum DatabaseType
    {
        [EnumMember(Value = "SQLite")]
        SqLite,
        [EnumMember(Value = "NoSQL")]
        NoSql,
        [EnumMember(Value = "Json")]
        Json,
        [EnumMember(Value = "Sql")]
        Sql,
        [EnumMember(Value = "MySql")]
        MySql,
        [EnumMember(Value = "Oracle")]
        Oracle,
        [EnumMember(Value = "Postgresql")]
        Postgresql,
    }
}
