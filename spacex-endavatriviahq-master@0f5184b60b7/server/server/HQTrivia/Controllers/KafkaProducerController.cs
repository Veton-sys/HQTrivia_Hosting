using Confluent.Kafka;
using HQTrivia.Models.Models;
using HQTrivia.Models.Models.Dtos;
using HQTrivia.Models.Models.Exceptions;
using HQTrivia.Service;
using HQTrivia.Service.IService;
using Microsoft.AspNetCore.Mvc;

namespace HQTrivia.Controllers
{
    [Route("play")]
    [ApiController]
    public class KafkaProducerController : ControllerBase
    {
        private readonly ProducerConfig config = new ProducerConfig
        { BootstrapServers = "localhost:9092" };
        private readonly string topic = "hqtriviatopic";
        private readonly IAnswerService _answerService;
        private readonly IUserService _userService;

        public KafkaProducerController(IUserService userService, IAnswerService answerService)
        {
            _userService = userService;
            _answerService = answerService;
        }

        [HttpPost]
        public IActionResult SendAnswer([FromQuery] int answerId, string username)
        {
            Answer answer = new();
            try
            {
                answer = _answerService.GetAnswer(answerId);
            }
            catch (InvalidIdException invalidIdException)
            {
                return BadRequest(invalidIdException.Message);
            }
            catch (AnswerNotFoundException answerNotFoundException)
            {
                return BadRequest(answerNotFoundException.Message);
            }

            return Created(string.Empty, SendToKafka(topic, username, answer));
        }

        private Object SendToKafka(string topic, string username, Answer answer)
        {
            using (var producer =
                 new ProducerBuilder<string, string>(config).Build())
            {
                try
                {
                    return producer.ProduceAsync(topic, new Message<string, string> 
                    { Key = username, Value = answer.IsCorrect.ToString() })
                        .GetAwaiter()
                        .GetResult();
                }
                catch (Exception e)
                {
                    Console.WriteLine($"Oops, something went wrong: {e}");
                }
            }
            return null;
        }

        [HttpGet("GetLeaderboard")]
        public ActionResult<IEnumerable<User>> GetLeaderboard()
        {
            var userPoints = _userService.GetLeaderboard();
            return Ok(userPoints);
        }
    }
}