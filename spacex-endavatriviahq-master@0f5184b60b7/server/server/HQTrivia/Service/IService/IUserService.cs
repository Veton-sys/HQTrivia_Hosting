using HQTrivia.Models.Models;

namespace HQTrivia.Service.IService
{
    public interface IUserService
    {
        void HandleAnswer(string username, string value);
        IEnumerable<User> GetLeaderboard();
        void ResetUsers();
    }
}