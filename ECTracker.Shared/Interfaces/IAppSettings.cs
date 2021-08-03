namespace ECTracker.Shared.Interfaces
{
    public interface IAppSettings
    {
        public void Save(object src, string tar);
        public void Load(object tar);
    }
}
