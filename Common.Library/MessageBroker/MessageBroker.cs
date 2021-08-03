namespace Common.Library.MessageBroker
{
    public class MessageBroker
    {
        #region Delegate for MessageReceivedEventHandler
        /// <summary>
        /// The delegate declaration of the MessageReceived Event Handler
        /// </summary>
        /// <param name="sender">The object raising the event</param>
        /// <param name="e">A MessageBrokerEventArgs object that contains the message</param>
        public delegate void MessageReceivedEventHandler(object sender, MessageBrokerEventArgs e);

        /// <summary>
        /// Define the MessageReceived Event
        /// </summary>
        public event MessageReceivedEventHandler MessageReceived;
        #endregion

        #region Instance Property
        private static MessageBroker _instance;

        public static MessageBroker Instance
        {
            get => _instance ??= new MessageBroker();
            set => _instance = value;
        }
        #endregion

        #region SendMessage Methods
        /// <summary>
        /// Call this method to send a message to any other objects that are asking to receive messages
        /// A null is passed for the message payload
        /// </summary>
        /// <param name="messageName">A message name</param>
        public void SendMessage(string messageName)
        {
            SendMessage(messageName, null);
        }

        /// <summary>
        /// Call this method to send a message to any other objects that are asking to receive messages
        /// </summary>
        /// <param name="messageName">A message name</param>
        /// <param name="payload">The payload to send with the message</param>
        public void SendMessage(string messageName, object payload)
        {
            var arg = new MessageBrokerEventArgs(messageName, payload);

            RaiseMessageReceived(arg);
        }
        #endregion

        #region MessageReceived Event
        /// <summary>
        /// Raise the Message Received Event
        /// </summary>
        /// <param name="e">A MessageBrokerEventArgs object</param>
        protected void RaiseMessageReceived(MessageBrokerEventArgs e)
        {
            MessageReceived?.Invoke(this, e);
        }
        #endregion
    }
}
