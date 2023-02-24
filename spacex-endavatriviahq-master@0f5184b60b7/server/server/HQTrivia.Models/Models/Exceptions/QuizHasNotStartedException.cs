using System.Runtime.Serialization;

namespace HQTrivia.Models.Models.Exceptions
{
    [Serializable]
    public class QuizHasNotStartedException : Exception
    {
        public QuizHasNotStartedException()
        {
        }

        public QuizHasNotStartedException(string? message) : base(message)
        {
        }

        public QuizHasNotStartedException(string? message, Exception? innerException) : base(message, innerException)
        {
        }

        protected QuizHasNotStartedException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}