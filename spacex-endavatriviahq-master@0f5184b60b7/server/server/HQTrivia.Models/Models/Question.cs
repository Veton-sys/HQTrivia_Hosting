using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Security;
using System.Text.Json.Serialization;

namespace HQTrivia.Models.Models
{
    public class Question
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [JsonIgnore]
        public int Id { get; set; }
        [Required]
        public string Text { get; set; }
        [JsonIgnore]
        public bool IsSent { get; set; } = false;
        public int Duration { get; set; } = 10;
        public List<Answer>? Answers { get; set; }
        public int? QuizId { get; set; }
        [ForeignKey("QuizId")]
        [JsonIgnore]
        [NotMapped]
        public Quiz? Quiz { get; set; }

    }
}
