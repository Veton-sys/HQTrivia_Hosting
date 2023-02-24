using System.Runtime.Serialization;

namespace HQTrivia.Models.Models.Exceptions
{
    [Serializable]
    public class OneAnswerMustBeCorrectException : Exception
    {
        public OneAnswerMustBeCorrectException()
        {
        }

        public OneAnswerMustBeCorrectException(string? message) : base(message)
        {
        }

        public OneAnswerMustBeCorrectException(string? message, Exception? innerException) : base(message, innerException)
        {
        }

        protected OneAnswerMustBeCorrectException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}