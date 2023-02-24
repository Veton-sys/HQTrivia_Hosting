using System.ComponentModel.DataAnnotations;

namespace HQTrivia.Models.Models
{
    public class User
    {
        [Key]
        public string Username { get; set; }
        public int Score { get; set; } = 0;
    }
}