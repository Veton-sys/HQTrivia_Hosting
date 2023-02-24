using System.Runtime.Serialization;

namespace HQTrivia.Service
{
    [Serializable]
    public class DurationNotValidException : Exception
    {
        public DurationNotValidException()
        {
        }

        public DurationNotValidException(string? message) : base(message)
        {
        }

        public DurationNotValidException(string? message, Exception? innerException) : base(message, innerException)
        {
        }

        protected DurationNotValidException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}