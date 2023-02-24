using HQTrivia.Data.Data;
using HQTrivia.Data.Repository.IRepository;
using HQTrivia.Models.Models;
using HQTrivia.Models.Models.Exceptions;
using Microsoft.EntityFrameworkCore;

namespace HQTrivia.Data.Repository
{
    public class AnswerRepository : IAnswerRepository
    {
        private readonly ApplicationDbContext _db;

        public AnswerRepository(ApplicationDbContext db)
        {
            _db = db;
        }

        public Answer? GetAnswer(int id)
        {
            return _db.Answers.FirstOrDefault(answer => answer.Id == id);
        }
        public void RemoveAnswer(int answerId)
        {
            var answer = _db.Answers.FirstOrDefault(answer => answer.Id == answerId);
            _db.Answers.Remove(answer);
            _db.SaveChanges();
        }
    }
}
