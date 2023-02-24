using HQTrivia.Data.Data;
using HQTrivia.Data.Repository;
using HQTrivia.Data.Repository.IRepository;
using HQTrivia.Models.Models;
using HQTrivia.Service.IService;

namespace HQTrivia.Service
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _userRepository;
        private static int correctlyGuessed = 0;
        private static int flag = 0;
        public UserService(IServiceScopeFactory factory)
        {
            _userRepository = new UserRepository(factory);

        }
        public void HandleAnswer(string username, string value)
        {
            User? user = _userRepository.GetUser(username);
            var userCount = _userRepository.GetAllUsers().Count();
            if (user == null)
            {
                user = _userRepository.AddUser(username);
            }

            flag++;
            if (flag == userCount+1)
            {
                flag = 0;
                correctlyGuessed = 0;
            }

            if (value.Equals("True"))
            {
                user.Score += userCount - correctlyGuessed;
                correctlyGuessed++;
                _userRepository.UpdateUserScore(user);
            }
        }
        public IEnumerable<User> GetLeaderboard()
        {
            return _userRepository.GetAllUsers();
        }

        public void ResetUsers()
        {
            _userRepository.ResetUsers();
        }
    }
}
