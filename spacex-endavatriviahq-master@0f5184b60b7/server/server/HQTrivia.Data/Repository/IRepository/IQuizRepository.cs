using HQTrivia.Models.Models;
using System.Linq.Expressions;

namespace HQTrivia.Data.Repository.IRepository
{
    public interface IQuizRepository
    {
        IEnumerable<Quiz> GetAllQuizzes();
        void Add(Quiz quiz);
        Quiz? GetQuiz(int id);
        void Remove(Quiz quiz);
        void Update(Quiz quiz);
        void AddToQuiz(int questionId, int quizId);
        void RemoveFromQuiz(int questionId, int quizId);
        void Save();
        IEnumerable<Quiz> GetAllPastQuizzes();
    }
}