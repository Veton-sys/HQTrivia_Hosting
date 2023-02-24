using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;
using HQTrivia.Models.Models.Utility;

namespace HQTrivia.Models.Models
{
    public class Quiz
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [JsonIgnore]
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Prize { get; set; }
        [Required]
        public DateTime StartingDateTime { get; set; }
        [JsonIgnore]
        public DateTime CreatedDateTime { get; set; } = DateTime.Now;
        public Status Status { get; set; } = Status.SCHEDULED;
        public List<Question>? Questions { get; set; }
        public string? ThumbNailURL { get; set; }

    }   
}