using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace HQTrivia.Models.Models
{
    public class Answer
    {
        [Key]
        [JsonIgnore]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        [Required]
        public string Text { get; set; }
        [Required]
        public bool IsCorrect { get; set; }
        [JsonIgnore]
        public int QuestionId { get; set; }
        [ForeignKey("QuestionId")]
        [NotMapped]
        [JsonIgnore]
        public Question? Question { get; set; }
    }
}