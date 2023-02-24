
using HQTrivia.Data.Data;
using HQTrivia.Data.Repository;
using HQTrivia.Data.Repository.IRepository;
using HQTrivia.Models.Models;
using HQTrivia.Models.Models.Dtos;
using HQTrivia.Models.Models.Exceptions;
using HQTrivia.Models.Models.Utility;
using HQTrivia.Service.IService;
using static Confluent.Kafka.ConfigPropertyNames;

namespace HQTrivia.Service
{
    public class QuizService : IQuizService
    {
        private readonly IQuizRepository _quizRepository;
        public QuizService(ApplicationDbContext _db)
        {
            _quizRepository = new QuizRepository(_db);
        }
        public void Add(Quiz quizDto)
        {
            ValidateQuiz(quizDto);

            Quiz quiz = new()
            {
                Name = quizDto.Name,
                StartingDateTime = quizDto.StartingDateTime,
                CreatedDateTime = DateTime.Now,
                Prize = quizDto.Prize,
                Questions = quizDto.Questions,
                ThumbNailURL = quizDto.ThumbNailURL
            };
            _quizRepository.Add(quiz);
        }

        public IEnumerable<Quiz> GetAllQuizzes()
        {
            return _quizRepository.GetAllQuizzes();
        }

        public Quiz? GetQuiz(int id)
        {
            if (id <= 0)
            {
                throw new InvalidIdException();
            }
            var quiz = _quizRepository.GetQuiz(id);
            if (quiz == null)
            {
                throw new QuizNotFoundException();
            }
            return quiz;
        }

        public void Remove(int id)
        {
            var quiz = GetQuiz(id);
            _quizRepository.Remove(quiz);
        }
        public void Update(int quizId, Quiz quiz)
        {
            ValidateQuiz(quiz);

            Quiz quizToUpdate = new()
            {
                Id = quizId,
                Name = quiz.Name,
                Prize = quiz.Prize,
                Status = quiz.Status,
                StartingDateTime = quiz.StartingDateTime,
                CreatedDateTime = quiz.CreatedDateTime,
                Questions = quiz.Questions,
                ThumbNailURL = quiz.ThumbNailURL
            };

            _quizRepository.Update(quizToUpdate);
        }
        public void UpdatePartial(Quiz quiz)
        {
            _quizRepository.Update(quiz);
        }

        public void AddQuestionToQuiz(int questionId, int quizId)
        {
            if(questionId <= 0 || quizId <= 0)
            {
                throw new InvalidIdException();
            }

            _quizRepository.AddToQuiz(questionId, quizId);
        }

        public void RemoveQuestionFromQuiz(int questionId, int quizId)
        {
            if (questionId <= 0 || quizId <= 0)
            {
                throw new InvalidIdException();
            }

            _quizRepository.RemoveFromQuiz(questionId, quizId);
        }

        public void Save()
        {
            _quizRepository.Save();
        }
        public IEnumerable<Quiz> GetAllPastQuizzes()
        {
            return _quizRepository.GetAllPastQuizzes();
        }

        public void ValidateQuiz(Quiz quizDto)
        {
            if (quizDto.Name.Length == 0)
            {
                throw new QuizNameEmptyException();
            }
            if (quizDto.Name.Length > 30)
            {
                throw new QuizNameTooLongException();
            }
            if (quizDto.StartingDateTime <= DateTime.Now)
            {
                throw new StartingDateNotValidException();
            }
        }
        public List<Question> ResetQuestions(Quiz? quiz)
        {
            foreach (var question in quiz.Questions)
            {
                question.IsSent = false;
            }
            return quiz.Questions;
        }
        public Status ResetQuiz(Quiz? quiz)
        {
            ResetQuestions(quiz);
            quiz.Status = Status.SCHEDULED;
            quiz.StartingDateTime = DateTime.Now;
            _quizRepository.Save();
            return quiz.Status;
        }
        public Status OpenQuiz(Quiz? quiz)
        {
            quiz.Status = Status.OPEN_FOR_JOINING;
            _quizRepository.Save();
            return quiz.Status;
        }
        public Status StartQuiz(Quiz? quiz)
        {
            quiz.Status = Status.IN_PROGRESS;
            _quizRepository.Save();
            return quiz.Status;
        }
        public Status FinishQuiz(Quiz? quiz)
        {
            ResetQuestions(quiz);
            quiz.Status = Status.FINISHED;
            _quizRepository.Save();
            return quiz.Status;
        }

        public Question SendQuestion(Quiz? quiz, int questionId)
        {
            if (quiz.Status != Status.IN_PROGRESS)
            {
                throw new QuizHasNotStartedException();
            }
            var question = quiz.Questions.FirstOrDefault(question => question.Id == questionId);
            if (question == null)
            {
                throw new QuestionNotFoundInQuizException();
            }
            question.IsSent = true;
            _quizRepository.Save();
            return question;
        }
    }
}
