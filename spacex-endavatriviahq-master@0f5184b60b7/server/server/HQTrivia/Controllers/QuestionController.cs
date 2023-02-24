using AutoMapper;
using HQTrivia.Models.Models;
using HQTrivia.Models.Models.Dtos;
using HQTrivia.Models.Models.Exceptions;
using HQTrivia.Service;
using HQTrivia.Service.IService;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;

namespace HQTrivia.Controllers
{
    [Route("admin/Question")]
    [ApiController]
    public class QuestionController : ControllerBase
    {
        private readonly ILogger<QuestionController> _logger;
        private readonly IQuestionService _questionService;
        private readonly IMapper _mapper;

        public QuestionController(ILogger<QuestionController> logger, IQuestionService questionService, IMapper mapper)
        {
            _logger = logger;
            _questionService = questionService;
            _mapper = mapper;
        }
        [HttpPut("{questionId:int}")]
        public IActionResult UpdateQuestion(int questionId, [FromBody]Question updatedQuestion)
        {
            _logger.LogInformation("Updating question with id: " + questionId);
            try
            {
                _questionService.Update(questionId, updatedQuestion);
            }
            catch (QuestionTextEmptyException questionTextEmptyException)
            {
                _logger.LogError("Question text can't be empty");
                return BadRequest(questionTextEmptyException.Message);
            }
            catch (MultipleAnswersAreCorrectException multipleAnswersAreCorrectException)
            {
                _logger.LogError("Multiple answers cannot be correct");
                return BadRequest(multipleAnswersAreCorrectException.Message);
            }
            catch (OneAnswerMustBeCorrectException oneAnswerMustBeCorrectException)
            {
                _logger.LogError("One answer must be correct");
                return BadRequest(oneAnswerMustBeCorrectException.Message);
            }
            catch (DurationNotValidException durationNotValidException)
            {
                _logger.LogError("Question duration must be longer than 5 seconds");
                return BadRequest(durationNotValidException.Message);
            }
            return Ok(updatedQuestion);
        }

        [HttpPatch("{questionId:int}")]
        public IActionResult UpdatePartialQuestion(int questionId, [FromBody] JsonPatchDocument<Question> patchEntity)
        {
            _logger.LogInformation("Partial update for question with id: " + questionId);

            var question = _questionService.GetQuestion(questionId);

            if (questionId >= 0 && question == null)
            {
                return NotFound();
            }

            patchEntity.ApplyTo(question, ModelState);
            _questionService.UpdatePartial(question);
            return Ok(question);
        }

        [HttpGet("{questionId:int}", Name = "GetQuestion")]
        public ActionResult<QuestionDTO> GetQuestion(int questionId)
        {
            _logger.LogInformation("Getting question with id: " + questionId);
            var questionDto = new QuestionDTO();
            try
            {
                var question = _questionService.GetQuestion(questionId);
                _mapper.Map(question, questionDto);
            }
            catch (QuestionNotFoundException questionNotFoundException)
            {
                _logger.LogError("Question with id:" + questionId + " does not exist");
                return NotFound(questionNotFoundException.Message);
            }
            catch (InvalidIdException invalidIdException)
            {
                _logger.LogError("Id:" + questionId + " must be a positive integer");
                return BadRequest(invalidIdException.Message);
            }
            return questionDto;
        }

        [HttpPost]
        public ActionResult<Question> CreateQuestion([FromBody] Question questionToCreate)
        {
            _logger.LogInformation("Creating new question");
            try
            {
                _questionService.Add(questionToCreate);
            }
            catch (QuestionTextEmptyException questionTextEmptyException)
            {
                _logger.LogError("Question text can't be empty");
                return BadRequest(questionTextEmptyException.Message);
            }
            catch (MultipleAnswersAreCorrectException multipleAnswersAreCorrectException)
            {
                _logger.LogError("Multiple answers cannot be correct");
                return BadRequest(multipleAnswersAreCorrectException.Message);
            }
            catch (OneAnswerMustBeCorrectException oneAnswerMustBeCorrectException)
            {
                _logger.LogError("One answer must be correct");
                return BadRequest(oneAnswerMustBeCorrectException.Message);
            }
            catch (DurationNotValidException durationNotValidException)
            {
                _logger.LogError("Question duration must be longer than 5 seconds");
                return BadRequest(durationNotValidException.Message);
            }
            return Ok(questionToCreate);
        }

        [HttpDelete("{questionId:int}", Name = "DeleteQuestion")]
        public IActionResult DeleteQuestion(int questionId)
        {
            _logger.LogInformation("Deleting question with id: " + questionId);
            try
            {
                _questionService.Remove(questionId);
            }
            catch (QuestionNotFoundException questionNotFoundException)
            {
                _logger.LogError("Question with id:" + questionId + " does not exist");
                return NotFound(questionNotFoundException.Message);
            }
            catch (InvalidIdException invalidIdException)
            {
                _logger.LogError("Id:" + questionId + " must be a positive integer");
                return BadRequest(invalidIdException.Message);
            }
            return Ok("The question with id: " + questionId + " was successfully deleted");
        }

        [HttpGet("GetUnsentQuestionsFromQuiz/{quizId:int}")]
        public ActionResult<IEnumerable<QuestionDTO>> GetUnsentQuestionsFromQuiz(int quizId)
        {

            _logger.LogInformation("Getting unsent questions from quiz with id: " + quizId);
            
            List<QuestionDTO> questionsUnsentDto = new List<QuestionDTO>();
            try
            {
                var questionsUnsent = _questionService.GetUnsentQuestionsFromQuiz(quizId);
                _mapper.Map(questionsUnsent, questionsUnsentDto);

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
            return Ok(questionsUnsentDto);
        }
    }
}
