using System.Runtime.Serialization;

namespace HQTrivia.Models.Models.Exceptions
{
    [Serializable]
    public class QuestionTextEmptyException : Exception
    {
        public QuestionTextEmptyException()
        {
        }

        public QuestionTextEmptyException(string? message) : base(message)
        {
        }

        public QuestionTextEmptyException(string? message, Exception? innerException) : base(message, innerException)
        {
        }

        protected QuestionTextEmptyException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}