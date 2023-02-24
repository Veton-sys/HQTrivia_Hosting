using HQTrivia.Models.Models.Utility;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HQTrivia.Models.Models.Dtos
{
    public class QuizDTO
    {
        [Required]
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public DateTime StartingDateTime { get; set; }
        [Required]
        public string Prize { get; set; }
        public Status Status { get; set; } = Status.SCHEDULED;
        public List<QuestionDTO>? Questions { get; set; }
        public string? ThumbNailURL { get; set; }

    }
}
