using HQTrivia.Models.Models;
using HQTrivia.Models.Models.Dtos;

namespace HQTrivia.Hubs.IHubs
{
    public interface IQuizHub
    {
        Task GetQuestion(QuestionDTO question);
        Task JoinMessage(string message);
        Task ResetQuiz(QuizDTO quizDto);
        Task OpenQuiz(QuizDTO quizDto);
        Task StartQuiz(QuizDTO quizDto);
        Task FinishQuiz(QuizDTO quizDto);
        Task UpdateScore(int score);
        Task GetLeaderboard(List<User> users);

    }
}
