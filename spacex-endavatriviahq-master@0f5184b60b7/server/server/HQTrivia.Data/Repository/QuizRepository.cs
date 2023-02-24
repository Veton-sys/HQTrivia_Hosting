using HQTrivia.Data.Data;
using HQTrivia.Data.Repository.IRepository;
using HQTrivia.Models.Models;
using HQTrivia.Models.Models.Exceptions;
using HQTrivia.Models.Models.Utility;
using Microsoft.EntityFrameworkCore;

namespace HQTrivia.Data.Repository
{
    public class QuizRepository : IQuizRepository
    {
        private readonly ApplicationDbContext _db;

        public QuizRepository(ApplicationDbContext db)
        {
            _db = db;
        }
        public void Add(Quiz quiz)
        {
            _db.Quizzes.Add(quiz);
            _db.SaveChanges();
        }

        public IEnumerable<Quiz> GetAllQuizzes()
        {
            return _db.Quizzes.Include("Questions.Answers").Where(quiz => quiz.Status != Status.FINISHED);
        }

        public Quiz? GetQuiz(int id)
        {
            return _db.Quizzes.Include("Questions.Answers").FirstOrDefault(quiz => quiz.Id == id);
        }

        public void Remove(Quiz quiz)
        {
            _db.Quizzes.Remove(quiz);
            _db.SaveChanges();
        }

        public void UpdatePartial(Quiz quiz)
        {
            _db.Quizzes.Update(quiz);
            _db.SaveChanges();
        }

        public void AddToQuiz(int questionId, int quizId)
        {
            var quiz = _db.Quizzes.Include("Questions").FirstOrDefault(quiz => quiz.Id == quizId);
            var question = _db.Questions.Include("Answers").FirstOrDefault(question => question.Id == questionId);

            if (quiz == null)
            {
                throw new QuizNotFoundException();
            }
            if (question == null)
            {
                throw new QuestionNotFoundException();
            }

            quiz.Questions.Add(question);
            _db.SaveChanges();
        }

        public void RemoveFromQuiz(int questionId, int quizId)
        {
            var quiz = _db.Quizzes.Include("Questions").FirstOrDefault(quiz => quiz.Id == quizId);
            var question = _db.Questions.Include("Answers").FirstOrDefault(question => question.Id == questionId);

            if (quiz == null)
            {
                throw new QuizNotFoundException();
            }
            if (question == null || !quiz.Questions.Contains(question))
            {
                throw new QuestionNotFoundException();
            }

            quiz.Questions.Remove(question);
            _db.SaveChanges();
        }

        public void Save()
        {
            _db.SaveChanges();
        }
        public IEnumerable<Quiz> GetAllPastQuizzes()
        {
            return _db.Quizzes.Include("Questions.Answers").Where(quiz => quiz.Status == Status.FINISHED);
        }

        public void Update(Quiz quiz)
        {
            foreach (var question in quiz.Questions)
            {
                _db.Questions.Update(question);
            }
            _db.Quizzes.Update(quiz);
            _db.SaveChanges();
        }
    }
}
