using System.ComponentModel.DataAnnotations;

namespace HQTrivia.Models.Models.Dtos
{
    public class AnswerDTO
    {
        [Required]
        public int Id { get; set; }
        [Required]
        public int QuestionId { get; set; }
        [Required]
        public string Text { get; set; }
        [Required]
        public bool IsCorrect { get; set; }
    }
}