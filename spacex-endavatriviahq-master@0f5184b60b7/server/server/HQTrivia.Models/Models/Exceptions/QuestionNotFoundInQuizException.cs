using System.Runtime.Serialization;

namespace HQTrivia.Models.Models.Exceptions
{
    [Serializable]
    public class QuestionNotFoundInQuizException : Exception
    {
        public QuestionNotFoundInQuizException()
        {
        }

        public QuestionNotFoundInQuizException(string? message) : base(message)
        {
        }

        public QuestionNotFoundInQuizException(string? message, Exception? innerException) : base(message, innerException)
        {
        }

        protected QuestionNotFoundInQuizException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}