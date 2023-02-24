using System.Runtime.Serialization;

namespace HQTrivia.Models.Models.Exceptions
{
    [Serializable]
    public class QuizNameTooLongException : Exception
    {
        public QuizNameTooLongException()
        {
        }

        public QuizNameTooLongException(string? message) : base(message)
        {
        }

        public QuizNameTooLongException(string? message, Exception? innerException) : base(message, innerException)
        {
        }

        protected QuizNameTooLongException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}