using System.Runtime.Serialization;

namespace HQTrivia.Models.Models.Exceptions
{
    [Serializable]
    public class QuizNotFoundException : Exception
    {
        public QuizNotFoundException()
        {
        }

        public QuizNotFoundException(string? message) : base(message)
        {
        }

        public QuizNotFoundException(string? message, Exception? innerException) : base(message, innerException)
        {
        }

        protected QuizNotFoundException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}