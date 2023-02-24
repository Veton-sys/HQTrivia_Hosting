using System.Runtime.Serialization;

namespace HQTrivia.Models.Models.Exceptions
{
    [Serializable]
    public class QuizNameEmptyException : Exception
    {
        public QuizNameEmptyException()
        {
        }

        public QuizNameEmptyException(string? message) : base(message)
        {
        }

        public QuizNameEmptyException(string? message, Exception? innerException) : base(message, innerException)
        {
        }

        protected QuizNameEmptyException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}