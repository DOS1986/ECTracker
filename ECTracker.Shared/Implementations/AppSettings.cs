using ECTracker.Common.Interfaces;
using ECTracker.Common.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.IO.IsolatedStorage;

namespace ECTracker.Common.Implementations
{
    public class AppSettings : IAppSettings
    {
        private const string FileName = "settings.json";
        public Settings Items { get; private set; }

        public AppSettings()
        {
            Initialization();
        }

        public void Initialization()
        {
            try
            {
                var storage = IsolatedStorageFile.GetUserStoreForAssembly();
                using var stream = new IsolatedStorageFileStream(FileName, FileMode.OpenOrCreate, storage);
                using var reader = new StreamReader(stream);
                Items = JsonConvert.DeserializeObject<Settings>(reader.ReadToEnd()) ?? new Settings { IsFirstRun = true };

            }
            catch (IsolatedStorageException e) { Console.WriteLine(e.Message); }
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
