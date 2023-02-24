﻿using System.Runtime.Serialization;

namespace HQTrivia.Models.Models.Exceptions
{
    [Serializable]
    public class DuplicateIdException : Exception
    {
        public DuplicateIdException()
        {
        }

        public DuplicateIdException(string? message) : base(message)
        {
        }

        public DuplicateIdException(string? message, Exception? innerException) : base(message, innerException)
        {
        }

        protected DuplicateIdException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}