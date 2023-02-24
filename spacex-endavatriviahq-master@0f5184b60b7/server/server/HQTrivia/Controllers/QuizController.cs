using HQTrivia.Hubs;
using HQTrivia.Hubs.IHubs;
using HQTrivia.Models.Models;
using HQTrivia.Models.Models.Utility;
using HQTrivia.Models.Models.Dtos;
using HQTrivia.Models.Models.Exceptions;
using HQTrivia.Service.IService;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.AspNetCore.JsonPatch;
using AutoMapper;
using Newtonsoft.Json;
using HQTrivia.Service;

namespace HQTrivia.Controllers
{
    [Route("admin/Quizzes")]
    [ApiController]
    public class QuizController : ControllerBase
    {
        private readonly ILogger<QuizController> _logger;
        private readonly IQuizService _quizService;
        private readonly IUserService _userService;
        private IHubContext<QuizHub, IQuizHub> _quizHub;
        private readonly IMapper _mapper;

        public QuizController(ILogger<QuizController> logger, IQuizService quizService, IUserService userService, IHubContext<QuizHub, IQuizHub> quizHub, IMapper mapper)
        {
            _logger = logger;
            _quizService = quizService;
            _quizHub = quizHub;
            _userService = userService;
            _mapper = mapper;
        }

        [HttpGet]
        public ActionResult<IEnumerable<QuizDTO>> GetQuizzes()
        {
            _logger.LogInformation("Getting all quizzes");
            var quizzes = _quizService.GetAllQuizzes();
            List<QuizDTO> quizzesDto = new List<QuizDTO>();
            _mapper.Map(quizzes, quizzesDto);
            return Ok(quizzesDto);
        }

        [HttpGet("{quizId:int}", Name = "GetQuiz")]
        public ActionResult<QuizDTO> GetQuiz(int quizId)
        {

            _logger.LogInformation("Getting quiz with id: " + quizId);
            var quiz = new Quiz();
            var quizDto = new QuizDTO();
            try
            {
                quiz = _quizService.GetQuiz(quizId);
                quizDto = _mapper.Map<QuizDTO>(quiz);
            }
            catch (QuizNotFoundException quizNotFoundException)
            {
                _logger.LogError("Quiz with id:" + quizId + " does not exist");
                return NotFound(quizNotFoundException.Message);
            }
            catch (InvalidIdException invalidIdException)
            {
                _logger.LogError("Id:" + quizId + " must be a positive integer");
                return BadRequest(invalidIdException.Message);
            }
            return quizDto;
        }


        [HttpPatch("{quizId:int}")]
        public IActionResult UpdatePartialQuiz(int quizId, [FromBody] JsonPatchDocument<Quiz> patchEntity)
        {
            var quiz = _quizService.GetQuiz(quizId);

            if (quizId >= 0 && quiz == null)
            {
                return NotFound();
            }

            patchEntity.ApplyTo(quiz, ModelState);
            _quizService.UpdatePartial(quiz);
            return Ok(quiz);
        }

         [HttpPut("{quizId:int}")]
        public IActionResult UpdateQuiz(int quizId, [FromBody] Quiz updatedQuiz)
        {
            _logger.LogInformation("Updating quiz with id: " + quizId);
            try
            {
                _quizService.Update(quizId, updatedQuiz);
            }
            catch (QuizNameEmptyException quizNameEmptyExcpetion)
            {
                _logger.LogError("Quiz name can't be empty");
                return BadRequest(quizNameEmptyExcpetion.Message);
            }
            catch (QuizNameTooLongException quizNameTooLongException)
            {

                _logger.LogError("Quiz Name is longer than 30 characters");
                return BadRequest(quizNameTooLongException.Message);
            }
            catch (StartingDateNotValidException startingDateNotValidException)
            {
                _logger.LogError("Starting Date Not Valid");
                return BadRequest(startingDateNotValidException.Message);
            }
            return Ok(updatedQuiz);
        }


        [HttpPost("CreateQuiz")]
        public ActionResult<Quiz> CreateQuiz([FromBody] Quiz quizToCreate)
        {
            _logger.LogInformation("Creating new quiz");
            try
            {
                _quizService.Add(quizToCreate);
            }
            catch (QuizNameEmptyException quizNameEmptyExcpetion)
            {
                _logger.LogError("Quiz name can't be empty");
                return BadRequest(quizNameEmptyExcpetion.Message);
            }
            catch (QuizNameTooLongException quizNameTooLongException)
            {

                _logger.LogError("Quiz Name is longer than 30 characters");
                return BadRequest(quizNameTooLongException.Message);
            }
            catch (StartingDateNotValidException startingDateNotValidException)
            {
                _logger.LogError("Starting Date Not Valid");
                return BadRequest(startingDateNotValidException.Message);
            }

            return Ok(quizToCreate);
        }

        [HttpDelete("{quizId:int}", Name = "DeleteQuiz")]
        public IActionResult DeleteQuiz(int quizId)
        {
            _logger.LogInformation("Deleting quiz with id: " + quizId);
            try
            {
                _quizService.Remove(quizId);
            }
            catch (QuizNotFoundException quizNotFoundException)
            {
                _logger.LogError("Quiz with id:" + quizId + " does not exist");
                return NotFound(quizNotFoundException.Message);
            }
            catch (InvalidIdException invalidIdException)
            {
                _logger.LogError("Id:" + quizId + " must be a positive integer");
                return BadRequest(invalidIdException.Message);
            }

            return Ok("The Quiz with id: " + quizId + "was successfully deleted");
        }

        [HttpPost("AddQuestionToQuiz")]
        public IActionResult AddQuestionToQuiz(int questionId, int quizId)
        {
            _logger.LogInformation("Adding question with id: " + questionId + " to quiz with id: " + quizId);
            try
            {
                _quizService.AddQuestionToQuiz(questionId, quizId);
            }
            catch (QuizNotFoundException quizNotFoundException)
            {
                _logger.LogError("Quiz with id:" + quizId + " does not exist");
                return NotFound(quizNotFoundException.Message);
            }
            catch (QuestionNotFoundException questionNotFoundException)
            {
                _logger.LogError("Question with id:" + questionId + " does not exist");
                return NotFound(questionNotFoundException.Message);
            }
            catch (InvalidIdException invalidIdException)
            {
                _logger.LogError("Id must be a positive integer");
                return BadRequest(invalidIdException.Message);
            }

            return Ok();
        }

        [HttpPost("RemoveQuestionFromQuiz")]
        public IActionResult RemoveQuestionFromQuiz(int questionId, int quizId)
        {
            _logger.LogInformation("Removing question with id: " + questionId + " to quiz with id: " + quizId);
            try
            {
                _quizService.RemoveQuestionFromQuiz(questionId, quizId);
            }
            catch (QuizNotFoundException quizNotFoundException)
            {
                _logger.LogError("Quiz with id:" + quizId + " does not exist");
                return NotFound(quizNotFoundException.Message);
            }
            catch (QuestionNotFoundException questionNotFoundException)
            {
                _logger.LogError("Question with id:" + questionId + " does not exist");
                return NotFound(questionNotFoundException.Message);
            }
            catch (InvalidIdException invalidIdException)
            {
                _logger.LogError("Id must be a positive integer");
                return BadRequest(invalidIdException.Message);
            }

            return Ok();
        }

        [HttpPost("ResetQuiz/{quizId:int}")]
        public IActionResult ResetQuiz(int quizId)
        {
            _logger.LogInformation("Resetting quiz with id: " + quizId);
            var quiz = new Quiz();
            try
            {
                quiz = _quizService.GetQuiz(quizId);
            }
            catch (QuizNotFoundException quizNotFoundException)
            {
                _logger.LogError("Quiz with id:" + quizId + " does not exist");
                return NotFound(quizNotFoundException.Message);
            }
            catch (InvalidIdException invalidIdException)
            {
                _logger.LogError("Id:" + quizId + " must be a positive integer");
                return BadRequest(invalidIdException.Message);
            }

            _quizService.ResetQuiz(quiz);
            var quizDto = new QuizDTO();
            quizDto = _mapper.Map<QuizDTO>(quiz);
            _quizHub.Clients.All.ResetQuiz(quizDto);

            return Ok("Quiz is reset");
        }

        [HttpPost("OpenQuiz/{quizId:int}")]
        public IActionResult OpenQuiz(int quizId)
        {
            _logger.LogInformation("Opening quiz with id: " + quizId);
            var quiz = new Quiz();
            try
            {
                quiz = _quizService.GetQuiz(quizId);
            }
            catch (QuizNotFoundException quizNotFoundException)
            {
                _logger.LogError("Quiz with id:" + quizId + " does not exist");
                return NotFound(quizNotFoundException.Message);
            }
            catch (InvalidIdException invalidIdException)
            {
                _logger.LogError("Id must be a positive integer");
                return BadRequest(invalidIdException.Message);
            }
            _userService.ResetUsers();
            _quizService.OpenQuiz(quiz);
            var quizDto = new QuizDTO();
            quizDto = _mapper.Map<QuizDTO>(quiz);
            _quizHub.Clients.All.OpenQuiz(quizDto);

            return Ok("Quiz is open for joining");
        }

        [HttpPost("StartQuiz/{quizId:int}")]
        public IActionResult StartQuiz(int quizId)
        {
            _logger.LogInformation("Starting quiz with id: " + quizId);
            var quiz = new Quiz();
            try
            {
                quiz = _quizService.GetQuiz(quizId);
            }
            catch (QuizNotFoundException quizNotFoundException)
            {
                _logger.LogError("Quiz with id:" + quizId + " does not exist");
                return NotFound(quizNotFoundException.Message);
            }
            catch (InvalidIdException invalidIdException)
            {
                _logger.LogError("Id must be a positive integer");
                return BadRequest(invalidIdException.Message);
            }

            _quizService.StartQuiz(quiz);
            var quizDto = new QuizDTO();
            quizDto = _mapper.Map<QuizDTO>(quiz);
            _quizHub.Clients.All.StartQuiz(quizDto);

            return Ok("Quiz is started");
        } 

        [HttpPost("FinishQuiz/{quizId:int}")]
        public ActionResult<IEnumerable<User>> FinishQuiz(int quizId)
        {
            _logger.LogInformation("Finishing quiz with id: " + quizId);
            var quiz = new Quiz();
            try
            {
                quiz = _quizService.GetQuiz(quizId);
            }
            catch (QuizNotFoundException quizNotFoundException)
            {
                _logger.LogError("Quiz with id:" + quizId + " does not exist");
                return NotFound(quizNotFoundException.Message);
            }
            catch (InvalidIdException invalidIdException)
            {
                _logger.LogError("Id must be a positive integer");
                return BadRequest(invalidIdException.Message);
            }

            var quizDto = new QuizDTO();
            _quizService.FinishQuiz(quiz);
            quizDto = _mapper.Map<QuizDTO>(quiz);
            var users = _userService.GetLeaderboard().OrderByDescending(user => user.Score).ToList();
            _quizHub.Clients.All.GetLeaderboard(users);
            _quizHub.Clients.All.FinishQuiz(quizDto);

            return Ok(users.ToList());
        }


        [HttpPost("SendQuestion/{quizId:int}/{questionId:int}")]
        public IActionResult SendQuestion(int quizId, int questionId)
        {
            _logger.LogInformation("Sending question from quiz with id: " + quizId);
            var quiz = new Quiz();
            try
            {
                quiz = _quizService.GetQuiz(quizId);
            }
            catch (QuizNotFoundException quizNotFoundException)
            {
                _logger.LogError("Quiz with id:" + quizId + " does not exist");
                return NotFound(quizNotFoundException.Message);
            }
            catch (InvalidIdException invalidIdException)
            {
                _logger.LogError("Id:" + quizId + " must be a positive integer");
                return BadRequest(invalidIdException.Message);
            }

            var question = _quizService.SendQuestion(quiz, questionId);
            var questionDto = _mapper.Map<QuestionDTO>(question);
            _quizHub.Clients.All.GetQuestion(questionDto);
            return Ok("Question sent to all users");
        }

        [HttpGet("GetPastQuizzes")]
        public ActionResult<IEnumerable<QuizDTO>> GetPastQuizzes()
        {
            _logger.LogInformation("Getting all the quizzes that have passed");
            var quizzes = _quizService.GetAllPastQuizzes();
            var quizzesDto = new List<QuizDTO>();
            _mapper.Map(quizzes, quizzesDto);

            return Ok(quizzesDto);
        }
    }
}
