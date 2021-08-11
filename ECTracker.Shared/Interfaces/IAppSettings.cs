namespace ECTracker.Common.Interfaces
{
    public interface IAppSettings
    {
        public void Save(object src, string tar);
        public void Initialization();
    }
}
