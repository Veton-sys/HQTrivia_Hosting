using HQTrivia.Models.Models;
using HQTrivia.Models.Models.Utility;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HQTrivia.Data.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {

        }

        public DbSet<Question> Questions { get; set; }
        public DbSet<Answer> Answers { get; set; }
        public DbSet<Quiz> Quizzes { get; set; }
        public DbSet<User> Users { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Quiz>().HasData(
                 new Quiz
                 {
                     Id = 1,
                     Name = "Space",
                     Prize = "1000",
                     StartingDateTime = new DateTime(2023, 12, 29, 18, 00, 00),
                     CreatedDateTime = DateTime.Now,
                     Status = Status.SCHEDULED,
                     ThumbNailURL = "https://www.travelandleisure.com/thmb/sH4T0ElWwZFyUhtqAZD3USeiaSc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/james-webb-hole-WEBB0722-a7b14258290d4da9be4c7d50ee732d9b.jpg"
                 }
                 );

            //Question Seed Data
            modelBuilder.Entity<Question>().HasData(
                new Question
                {
                    Id = 1,
                    QuizId = 1,
                    Text = "Which of these planets has rings?"
                },
                new Question
                {
                    Id = 2,
                    QuizId = 1,
                    Text = "Who was the first person to step foot on the moon?"
                },
                new Question
                {
                    Id = 3,
                    QuizId = 1,
                    Text = "Exploration Rovers investigated which planet between 2004 and 2018?"
                },
                new Question
                {
                    Id = 4,
                    QuizId = 1,
                    Text = "Who is the Hubble Space Telescope named after?"
                },
                new Question
                {
                    Id = 5,
                    QuizId = 1,
                    Text = "Which planet is located between Venus and Mars?"
                },
                new Question
                {
                    Id = 6,
                    QuizId = 1,
                    Text = "Which of these planets has the shortest year?"
                },
                new Question
                {
                    Id = 7,
                    QuizId = 1,
                    Text = "Which planet has 9 continuous rings?"
                },
                new Question
                {
                    Id = 8,
                    QuizId = 1,
                    Text = "The first manned space mission to land on the Moon was called what?"
                },
                new Question
                {
                    Id = 9,
                    QuizId = 1,
                    Text = "How many planets in our solar system are larger than Earth?"
                },
                new Question
                {
                    Id = 10,
                    QuizId = 1,
                    Text = "Vast empty space with little or no galaxies can be found are known as which of these?"
                }
                );

            modelBuilder.Entity<Answer>().HasData(

                new Answer
                {
                    Id = 1,
                    Text = "Earth",
                    IsCorrect = false,
                    QuestionId = 1
                },
                new Answer
                {
                    Id = 2,
                    Text = "Mars",
                    IsCorrect = false,
                    QuestionId = 1
                },
                new Answer
                {
                    Id = 3,
                    Text = "Mercury",
                    IsCorrect = false,
                    QuestionId = 1
                },
                new Answer
                {
                    Id = 4,
                    Text = "Neptune",
                    IsCorrect = true,
                    QuestionId = 1
                },
                new Answer
                {
                    Id = 5,
                    Text = "Neil Armstrong",
                    IsCorrect = true,
                    QuestionId = 2
                },
                new Answer
                {
                    Id = 6,
                    Text = "Lance Armstrong",
                    IsCorrect = false,
                    QuestionId = 2
                },
                new Answer
                {
                    Id = 7,
                    Text = "Buzz Lightyear",
                    IsCorrect = false,
                    QuestionId = 2
                },
                new Answer
                {
                    Id = 8,
                    Text = "Buzz Aldrin",
                    IsCorrect = false,
                    QuestionId = 2
                },
                new Answer
                {
                    Id = 9,
                    Text = "Jupiter",
                    IsCorrect = false,
                    QuestionId = 3
                },
                new Answer
                {
                    Id = 10,
                    Text = "Venus",
                    IsCorrect = false,
                    QuestionId = 3
                },
                new Answer
                {
                    Id = 11,
                    Text = "Mars",
                    IsCorrect = true,
                    QuestionId = 3
                },
                new Answer
                {
                    Id = 12,
                    Text = "Pluto",
                    IsCorrect = false,
                    QuestionId = 3
                },
                new Answer
                {
                    Id = 13,
                    Text = "Erwin Hubble",
                    IsCorrect = false,
                    QuestionId = 4
                },
                new Answer
                {
                    Id = 14,
                    Text = "Albert Hubble",
                    IsCorrect = false,
                    QuestionId = 4
                },
                new Answer
                {
                    Id = 15,
                    Text = "Christopher Hubble",
                    IsCorrect = false,
                    QuestionId = 4
                },
                new Answer
                {
                    Id = 16,
                    Text = "Edwin Hubble",
                    IsCorrect = true,
                    QuestionId = 4
                },
                new Answer
                {
                    Id = 17,
                    Text = "Earth",
                    IsCorrect = true,
                    QuestionId = 5
                },
                new Answer
                {
                    Id = 18,
                    Text = "Mercury",
                    IsCorrect = false,
                    QuestionId = 5
                },
                new Answer
                {
                    Id = 19,
                    Text = "Saturn",
                    IsCorrect = false,
                    QuestionId = 5
                },
                new Answer
                {
                    Id = 20,
                    Text = "Pluto",
                    IsCorrect = true,
                    QuestionId = 5
                },
                new Answer
                {
                    Id = 21,
                    Text = "Mercury",
                    IsCorrect = true,
                    QuestionId = 6
                },
                new Answer
                {
                    Id = 22,
                    Text = "Saturn",
                    IsCorrect = false,
                    QuestionId = 6
                },
                new Answer
                {
                    Id = 23,
                    Text = "Uranus",
                    IsCorrect = false,
                    QuestionId = 6
                },
                new Answer
                {
                    Id = 24,
                    Text = "Jupiter",
                    IsCorrect = true,
                    QuestionId = 6
                },
                new Answer
                {
                    Id = 25,
                    Text = "Uranus",
                    IsCorrect = false,
                    QuestionId = 7
                },
                new Answer
                {
                    Id = 26,
                    Text = "Jupiter",
                    IsCorrect = false,
                    QuestionId = 7
                },
                new Answer
                {
                    Id = 27,
                    Text = "Saturn",
                    IsCorrect = true,
                    QuestionId = 7
                },
                new Answer
                {
                    Id = 28,
                    Text = "Neptune",
                    IsCorrect = false,
                    QuestionId = 7
                },
                new Answer
                {
                    Id = 29,
                    Text = "Apollo 1",
                    IsCorrect = false,
                    QuestionId = 8
                },
                new Answer
                {
                    Id = 30,
                    Text = "Apollo 3",
                    IsCorrect = false,
                    QuestionId = 8
                },
                new Answer
                {
                    Id = 31,
                    Text = "Apollo 11",
                    IsCorrect = true,
                    QuestionId = 8
                },
                new Answer
                {
                    Id = 32,
                    Text = "Apollo 13",
                    IsCorrect = false,
                    QuestionId = 8
                },
                new Answer
                {
                    Id = 33,
                    Text = "3",
                    IsCorrect = false,
                    QuestionId = 9
                },
                new Answer
                {
                    Id = 34,
                    Text = "1",
                    IsCorrect = false,
                    QuestionId = 9
                },
                new Answer
                {
                    Id = 35,
                    Text = "4",
                    IsCorrect = true,
                    QuestionId = 9
                },
                new Answer
                {
                    Id = 36,
                    Text = "6",
                    IsCorrect = false,
                    QuestionId = 9
                },
                new Answer
                {
                    Id = 37,
                    Text = "Voids",
                    IsCorrect = true,
                    QuestionId = 10
                },
                new Answer
                {
                    Id = 38,
                    Text = "Bolts",
                    IsCorrect = false,
                    QuestionId = 10
                },
                new Answer
                {
                    Id = 39,
                    Text = "Death Valley",
                    IsCorrect = false,
                    QuestionId = 10
                },
                new Answer
                {
                    Id = 40,
                    Text = "Black holes",
                    IsCorrect = false,
                    QuestionId = 10
                }
                );


            base.OnModelCreating(modelBuilder);
        }
    }
}
