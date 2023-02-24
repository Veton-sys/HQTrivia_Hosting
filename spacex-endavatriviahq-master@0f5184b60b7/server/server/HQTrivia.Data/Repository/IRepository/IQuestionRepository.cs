using HQTrivia.Models.Models;

namespace HQTrivia.Data.Repository.IRepository
{
    public interface IQuestionRepository
    {
        IEnumerable<Question> GetAllQuestions();
        void Add(Question question);
        Question? GetQuestion(int id);
        void Remove(Question question);
        void Update(Question question);
        IEnumerable<Question> GetUnsentQuestionsFromQuiz(int quizId);
    }
}