using HQTrivia.Data.Data;
using HQTrivia.Data.Repository.IRepository;
using HQTrivia.Models.Models;
using HQTrivia.Models.Models.Exceptions;
using Microsoft.EntityFrameworkCore;

namespace HQTrivia.Data.Repository
{
    public class QuestionRepository : IQuestionRepository
    {
        private readonly ApplicationDbContext _db;

        public QuestionRepository(ApplicationDbContext db)
        {
            _db = db;
        }

        public void Add(Question question)
        {
            _db.Questions.Add(question);
            _db.SaveChanges();
        }

        public void Update(Question question)
        {
            foreach (var answer in question.Answers)
            {
                _db.Answers.Update(answer);
            }
            _db.Questions.Update(question);
            _db.SaveChanges();
        }

        public Question? GetQuestion(int id)
        {
            return _db.Questions.Include("Answers").FirstOrDefault(question => question.Id == id);
        }

        public IEnumerable<Question> GetAllQuestions()
        {
            return _db.Questions.Include("Answers");
        }

        public void Remove(Question question)
        {
            _db.Questions.Remove(question);
            _db.SaveChanges();
        }

        public IEnumerable<Question> GetUnsentQuestionsFromQuiz(int quizId)
        {
            return _db.Questions.Include("Answers").Where(x => x.QuizId == quizId && x.IsSent == false);
        }

       

    }
}
