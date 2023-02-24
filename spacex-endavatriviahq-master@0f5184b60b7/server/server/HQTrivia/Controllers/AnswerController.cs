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
    [Route("admin/Answer")]
    [ApiController]
    public class AnswerController : ControllerBase
    {
        private readonly ILogger<QuestionController> _logger;
        private readonly IAnswerService _answerService;
        private readonly IMapper _mapper;

        public AnswerController(ILogger<QuestionController> logger, IAnswerService answerService, IMapper mapper)
        {
            _logger = logger;
            _answerService = answerService;
            _mapper = mapper;
        }

        [HttpGet("{answerId:int}", Name = "GetAnswer")]
        public ActionResult<AnswerDTO> GetAnswer(int answerId)
        {
            _logger.LogInformation("Getting answer with id: " + answerId);
            var answerDto = new AnswerDTO();
            try
            {
                var answer = _answerService.GetAnswer(answerId);
                _mapper.Map(answer, answerDto);
            }
            catch (InvalidIdException invalidIdException)
            {
                _logger.LogError("Id:" + answerId + " must be a positive integer");
                return BadRequest(invalidIdException.Message);
            }
            return answerDto;
        }

        [HttpDelete("{answerId:int}", Name = "DeleteAnswer")]
        public IActionResult DeleteAnswer(int answerId)
        {
            _logger.LogInformation("Deleting answer with id: " + answerId);
            try
            {
                _answerService.RemoveAnswer(answerId);
            }
            catch (InvalidIdException invalidIdException)
            {
                _logger.LogError("Id:" + answerId + " must be a positive integer");
                return BadRequest(invalidIdException.Message);
            }
            return Ok("The answer with id: " + answerId + " was successfully deleted");
        }
    }
}
