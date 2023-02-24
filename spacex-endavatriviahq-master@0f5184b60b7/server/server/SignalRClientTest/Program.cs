using HQTrivia.Models.Models;
using HQTrivia.Models.Models.Dtos;
using HQTrivia.Models.Models.Utility;
using Microsoft.AspNetCore.SignalR.Client;

var connection = new HubConnectionBuilder()
                .WithUrl("https://localhost:7104/quizHubs")
                .Build();

if (connection != null)
{
    connection.StartAsync().Wait();

    connection.On("JoinMessage", (string message) =>
    {
        Console.WriteLine(message);
    });
    connection.On("ResetQuiz", (QuizDTO quiz) =>
    {
        Console.WriteLine(quiz.Status);
    });
    connection.On("OpenQuiz", (QuizDTO quiz) =>
    {
        Console.WriteLine(quiz.Status);
    });
    connection.On("StartQuiz", (QuizDTO quiz) =>
    {
        Console.WriteLine(quiz.Status);
    });
    connection.On("FinishQuiz", (QuizDTO quiz) =>
    {
        Console.WriteLine(quiz.Status);
    });
    connection.On("UpdateScore", (int score) =>
    {
        Console.WriteLine("Veton: " + score);
    });
    connection.On("GetLeaderboard", (List<User> users) =>
    {
        Console.WriteLine(users.ToString());
    });
    connection.On("GetQuestion", (QuestionDTO question) =>
    {
        Console.WriteLine(question.Text);
        foreach (var answer in question.Answers)
        {
            Console.WriteLine(answer.Text);
        }
    });
  
    var action = Console.ReadLine();

    if (action == "4")
    {
        Console.Write("Invoking UpdateScore method");
        connection.InvokeCoreAsync("UpdateScore", args: new[] { "veton"});
        //connection.InvokeCoreAsync("OpenQuiz", args: new[] { quiz });
    }
    var action2 = Console.ReadLine();

    if (action2 == "4")
    {
        Console.Write("Invoking UpdateScore method");
        connection.InvokeCoreAsync("UpdateScore", args: new[] { "veton" });
        //connection.InvokeCoreAsync("OpenQuiz", args: new[] { quiz });
    } 
    var action3 = Console.ReadLine();

    if (action3 == "4")
    {
        Console.Write("Invoking UpdateScore method");
        connection.InvokeCoreAsync("UpdateScore", args: new[] { "asd"});
        //connection.InvokeCoreAsync("OpenQuiz", args: new[] { quiz });
    }
    var action4 = Console.ReadLine();

    if (action4 == "4")
    {
        Console.Write("Invoking UpdateScore method");
        connection.InvokeCoreAsync("UpdateScore", args: new[] { "asd" });
        //connection.InvokeCoreAsync("OpenQuiz", args: new[] { quiz });
    }
    Console.ReadLine();
}
