using HQTrivia.Models.Models;
using HQTrivia.Models.Models.Dtos;
using HQTrivia.Models.Models.Utility;

namespace HQTrivia.Service.IService
{
    public interface IQuizService
    {
        IEnumerable<Quiz> GetAllQuizzes();
        Quiz? GetQuiz(int id);
        void Add(Quiz quiz);
        void Remove(int id);
        void UpdatePartial(Quiz quiz);
        void Update(int quizId, Quiz quiz);
        void AddQuestionToQuiz(int questionId, int quizId);
        void RemoveQuestionFromQuiz(int questionId, int quizId);
        void Save();
        IEnumerable<Quiz> GetAllPastQuizzes();
        Status ResetQuiz(Quiz? quiz);
        Status OpenQuiz(Quiz? quiz);
        Status StartQuiz(Quiz? quiz);
        Status FinishQuiz(Quiz? quiz);
        Question SendQuestion(Quiz? quiz, int questionId);
    }
}