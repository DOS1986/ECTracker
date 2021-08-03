using ECTracker.Shared.Interfaces;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.IO.IsolatedStorage;

namespace ECTracker.Shared.Implementations
{
    public abstract class AppSettings : IAppSettings
    {
        private const string FileName = "settings.json";

        public void Load(object tar)
        {
            Dictionary<string, object> items;
            var type = tar.GetType();

            try
            {
                var storage = IsolatedStorageFile.GetUserStoreForAssembly();
                using IsolatedStorageFileStream stream = new IsolatedStorageFileStream(FileName, FileMode.Open, storage);
                using StreamReader reader = new StreamReader(stream);
                items = JsonConvert.DeserializeObject<Dictionary<string, object>>(reader.ReadToEnd());
            }
            catch (Exception) { return; }   // If fails - just don't use preferences.

            if (items == null) { return; }

            foreach (var (key, value) in items)
            {
                type.GetProperty(key)?.SetValue(tar, value, null);
            }
        }

        public void Save(object src, string tar)
        {
            var items = new Dictionary<string, object>();
            var type = src.GetType();

            var paramList = tar.Split(new char[] { ',' });
            foreach (var paramName in paramList)
            {
                items.Add(paramName, type.GetProperty(paramName.Trim())?.GetValue(src, null));
                var storage = IsolatedStorageFile.GetUserStoreForAssembly();
                using var stream = new IsolatedStorageFileStream(FileName, FileMode.Create, storage);
                using var writer = new StreamWriter(stream);
                writer.Write(JsonConvert.SerializeObject(items));
            }
        }
    }
}
