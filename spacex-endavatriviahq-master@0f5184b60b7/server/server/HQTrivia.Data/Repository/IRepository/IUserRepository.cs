using HQTrivia.Models.Models;

namespace HQTrivia.Data.Repository.IRepository
{
    public interface IUserRepository
    {
        User? GetUser(string username);
        IEnumerable<User> GetAllUsers();
        User AddUser(string username);
        void UpdateUserScore(User user);
        void ResetUsers();

    }
}