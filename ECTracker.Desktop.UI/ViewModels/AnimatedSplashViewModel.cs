using Caliburn.Micro;
using System.ComponentModel;
using System.Threading;

namespace ECTracker.Desktop.UI.ViewModels
{
    public class AnimatedSplashViewModel : Screen
    {
        private readonly IEventAggregator _events;

        private string _splashMessage;

        public string SplashMessage
        {
            get => _splashMessage;
            set
            {
                _splashMessage = value;
                NotifyOfPropertyChange(() => SplashMessage);
            }
        }

        public AnimatedSplashViewModel(IEventAggregator events)
        {
            _events = events;
            SplashMessage = "Please wait";

            // Simulation of long tasks
            var worker = new BackgroundWorker();
            worker.DoWork += Worker_DoWork;
            worker.RunWorkerCompleted += Worker_RunWorkerCompleted;
            worker.RunWorkerAsync();


        }

        private void Worker_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            //_events.PublishOnUIThreadAsync(new SplashFinishedEvent());
        }

        private static void Worker_DoWork(object sender, DoWorkEventArgs e)
        {
            Thread.Sleep(10000);
        }
    }
}
