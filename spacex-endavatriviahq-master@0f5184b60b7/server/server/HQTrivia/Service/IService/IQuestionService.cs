using HQTrivia.Models.Models;
using HQTrivia.Models.Models.Dtos;

namespace HQTrivia.Service.IService
{
    public interface IQuestionService
    {
        IEnumerable<Question> GetAllQuestions();
        Question? GetQuestion(int id);
        void Remove(int id);
        void Update(int questionId, Question question);
        void UpdatePartial(Question question);
        void Add(Question question);
        IEnumerable<Question> GetUnsentQuestionsFromQuiz(int quizId);
    }
}