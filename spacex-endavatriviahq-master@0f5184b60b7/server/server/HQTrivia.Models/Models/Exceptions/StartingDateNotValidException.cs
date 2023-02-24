using System.Runtime.Serialization;

namespace HQTrivia.Models.Models.Exceptions
{
    [Serializable]
    public class StartingDateNotValidException : Exception
    {
        public StartingDateNotValidException()
        {
        }

        public StartingDateNotValidException(string? message) : base(message)
        {
        }

        public StartingDateNotValidException(string? message, Exception? innerException) : base(message, innerException)
        {
        }

        protected StartingDateNotValidException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}