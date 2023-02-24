using System.Runtime.Serialization;

namespace HQTrivia.Models.Models.Exceptions
{
    [Serializable]
    public class AnswerNotFoundException : Exception
    {
        public AnswerNotFoundException()
        {
        }

        public AnswerNotFoundException(string? message) : base(message)
        {
        }

        public AnswerNotFoundException(string? message, Exception? innerException) : base(message, innerException)
        {
        }

        protected AnswerNotFoundException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}