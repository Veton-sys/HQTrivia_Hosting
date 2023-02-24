using System.Runtime.Serialization;

namespace HQTrivia.Models.Models.Exceptions
{
    [Serializable]
    public class MultipleAnswersAreCorrectException : Exception
    {
        public MultipleAnswersAreCorrectException()
        {
        }

        public MultipleAnswersAreCorrectException(string? message) : base(message)
        {
        }

        public MultipleAnswersAreCorrectException(string? message, Exception? innerException) : base(message, innerException)
        {
        }

        protected MultipleAnswersAreCorrectException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}