using AutoMapper;
using HQTrivia.Models.Models;
using HQTrivia.Models.Models.Dtos;

namespace HQTrivia.Mapper
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<Quiz, QuizDTO>();
            CreateMap<Question, QuestionDTO>();
            CreateMap<Answer, AnswerDTO>();
        }
    }
}
