
using HQTrivia.Data.Data;
using HQTrivia.Data.Repository;
using HQTrivia.Data.Repository.IRepository;
using HQTrivia.Models.Models;
using HQTrivia.Models.Models.Dtos;
using HQTrivia.Models.Models.Exceptions;
using HQTrivia.Service.IService;

namespace HQTrivia.Service
{
    public class QuestionService : IQuestionService
    {
        private readonly IQuestionRepository _questionRepository;
        private readonly IQuizRepository _quizRepository;
        public QuestionService(ApplicationDbContext _db)
        {
            _questionRepository = new QuestionRepository(_db);
            _quizRepository = new QuizRepository(_db);
        }
        public void Add(Question questionDto)
        {
            ValidateQuestion(questionDto);
            
            List<Answer> Answers = new List<Answer>();
            foreach (var answer in questionDto.Answers)
            {
                Answers.Add(new Answer()
                {
                    Text = answer.Text,
                    IsCorrect = answer.IsCorrect
                });
            }
            Question question = new()
            {
                Text = questionDto.Text,
                Answers = Answers,
                Duration = questionDto.Duration,
                QuizId = questionDto.QuizId
            };
            _questionRepository.Add(question);
        }

        public IEnumerable<Question> GetAllQuestions()
        {
            return _questionRepository.GetAllQuestions();
        }

        public Question? GetQuestion(int questionId)
        {
            if (questionId <= 0)
            {
                throw new InvalidIdException();
            }
            var question = _questionRepository.GetQuestion(questionId);
            if (question == null)
            {
                throw new QuestionNotFoundException();
            }
            return question;
        }

        public IEnumerable<Question>? GetUnsentQuestionsFromQuiz(int quizId)
        {
            if (quizId <= 0)
            {
                throw new InvalidIdException();
            }
            var quiz = _quizRepository.GetQuiz(quizId);
            if (quiz == null)
            {
                throw new QuizNotFoundException();
            }
            return _questionRepository.GetUnsentQuestionsFromQuiz(quizId);
        }

        public void Remove(int questionId)
        {
            var question = GetQuestion(questionId);
            _questionRepository.Remove(question);
        }

        public void Update(int questionId, Question question)
        {
            ValidateQuestion(question);

            Question questionToUpdate = new()
            {
                Id = questionId,
                Text = question.Text,
                Duration = question.Duration,
                IsSent = question.IsSent,
                Answers = question.Answers,
                QuizId = question.QuizId
            };
            
            _questionRepository.Update(questionToUpdate);
        }

        public void UpdatePartial(Question question)
        {
            _questionRepository.Update(question);
        }

        public void ValidateQuestion(Question questionForValidation)
        {
            var questionList = _questionRepository.GetAllQuestions();
            if (questionForValidation.Text.Length == 0)
            {
                throw new QuestionTextEmptyException();
            }
            if (questionForValidation.Answers.Count(q => q.IsCorrect == true) > 1)
            {
                throw new MultipleAnswersAreCorrectException();
            }
            if (questionForValidation.Answers.Count(q => q.IsCorrect == true) == 0)
            {
                throw new OneAnswerMustBeCorrectException();
            }
            if (questionForValidation.Duration <= 5)
            {
                throw new DurationNotValidException();
            }
        }
    }
}
