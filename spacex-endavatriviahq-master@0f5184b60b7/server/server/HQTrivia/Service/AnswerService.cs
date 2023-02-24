
using HQTrivia.Data.Data;
using HQTrivia.Data.Repository;
using HQTrivia.Data.Repository.IRepository;
using HQTrivia.Models.Models;
using HQTrivia.Models.Models.Dtos;
using HQTrivia.Models.Models.Exceptions;
using HQTrivia.Service.IService;

namespace HQTrivia.Service
{
    public class AnswerService : IAnswerService
    {
        private readonly IAnswerRepository _answerRepository;
        public AnswerService(ApplicationDbContext _db)
        {
            _answerRepository = new AnswerRepository(_db);
        }
        
        public Answer? GetAnswer(int answerId)
        {
            if (answerId <= 0)
            {
                throw new InvalidIdException();
            }
            var answer = _answerRepository.GetAnswer(answerId);
            if(answer == null)
            {
                throw new AnswerNotFoundException();
            }
            return answer;
        }

        public void RemoveAnswer(int answerId)
        {
            if (answerId <= 0)
            {
                throw new InvalidIdException();
            }
            _answerRepository.RemoveAnswer(answerId);
        }
    }
}
