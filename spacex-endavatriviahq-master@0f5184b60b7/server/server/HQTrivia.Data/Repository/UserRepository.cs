using HQTrivia.Data.Data;
using HQTrivia.Data.Repository.IRepository;
using HQTrivia.Models.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System.Xml;

namespace HQTrivia.Data.Repository
{
    public  class UserRepository : IUserRepository
    {
        private readonly ApplicationDbContext _db;
        public UserRepository(IServiceScopeFactory factory)
        {
            _db = factory.CreateScope().ServiceProvider.GetRequiredService<ApplicationDbContext>(); ;
        }

        public IEnumerable<User> GetAllUsers()
        {
            return _db.Users;
        }

        public User? GetUser(string username)
        {
            return _db.Users.FirstOrDefault(user => user.Username.Equals(username));
        }
        public User AddUser(string username)
        {
            User user = new User()
            {
                Username = username,
                Score = 0
            };
            _db.Users.Add(user);
            _db.SaveChanges();
            return user;
        }

        public void UpdateUserScore(User user)
        {
            _db.Users.Update(user);
            _db.SaveChanges();
        }

        public void ResetUsers()
        {
            foreach (var username in _db.Users.Select(e => e.Username))
            {
                var entity = new User { Username = username };
                _db.Users.Attach(entity);
                _db.Users.Remove(entity);
            }
            _db.SaveChanges();
        }
    }
}