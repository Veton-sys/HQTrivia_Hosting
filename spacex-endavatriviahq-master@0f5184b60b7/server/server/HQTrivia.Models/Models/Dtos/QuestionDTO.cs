using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HQTrivia.Models.Models.Dtos
{
    public class QuestionDTO
    {
        [Required]
        public int Id { get; set; }

        [Required]
        public string Text { get; set; }
        public List<AnswerDTO>? Answers { get; set; }
        public int QuizId { get; set; }
        public int Duration { get; set; }
        public bool IsSent { get; set; } = false;

    }
}
