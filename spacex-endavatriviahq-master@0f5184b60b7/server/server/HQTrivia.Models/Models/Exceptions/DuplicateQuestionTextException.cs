using System.Runtime.Serialization;

namespace HQTrivia.Models.Models.Exceptions
{
    [Serializable]
    public class DuplicateQuestionTextException : Exception
    {
        public DuplicateQuestionTextException()
        {
        }

        public DuplicateQuestionTextException(string? message) : base(message)
        {
        }

        public DuplicateQuestionTextException(string? message, Exception? innerException) : base(message, innerException)
        {
        }

        protected DuplicateQuestionTextException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}