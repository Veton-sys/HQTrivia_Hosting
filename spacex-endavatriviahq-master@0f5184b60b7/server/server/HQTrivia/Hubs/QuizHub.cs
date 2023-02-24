
using HQTrivia.Data.Repository.IRepository;
using HQTrivia.Hubs.IHubs;
using HQTrivia.Mapper;
using HQTrivia.Models.Models;
using HQTrivia.Service.IService;
using Microsoft.AspNetCore.SignalR;
using System.Collections.Concurrent;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace HQTrivia.Hubs
{
    public class QuizHub : Hub<IQuizHub>
    {
        private static readonly ConnectionMapping<string> _connections = new ConnectionMapping<string>();
        private IUserRepository _userRepository;

        public QuizHub(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public async Task JoinQuiz(string username, string quizName)
        {
            _connections.Add(username, Context.ConnectionId);
            _userRepository.AddUser(username);
            await Groups.AddToGroupAsync(username, quizName);

            await Clients.Caller.JoinMessage(username);
        }

        public async Task UpdateScore(string username)
        {
            var user = _userRepository.GetUser(username);
            if (user != null) 
            {
                await Clients.Caller.UpdateScore(user.Score);
            }
        }

        public async Task ExitQuiz(string username, string quizName)
        {
            _connections.Remove(username, Context.ConnectionId);
            await Groups.RemoveFromGroupAsync(username, quizName);
        }
    }
}
