using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HQTrivia.Data.Migrations
{
    public partial class RemovedCurrencyTypeFromQuiz : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Quizzes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Prize = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    StartingDateTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatedDateTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Status = table.Column<int>(type: "int", nullable: false),
                    ThumbNailURL = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Quizzes", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    Username = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Score = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.Username);
                });

            migrationBuilder.CreateTable(
                name: "Questions",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IsSent = table.Column<bool>(type: "bit", nullable: false),
                    Duration = table.Column<int>(type: "int", nullable: false),
                    QuizId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Questions", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Questions_Quizzes_QuizId",
                        column: x => x.QuizId,
                        principalTable: "Quizzes",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Answers",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IsCorrect = table.Column<bool>(type: "bit", nullable: false),
                    QuestionId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Answers", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Answers_Questions_QuestionId",
                        column: x => x.QuestionId,
                        principalTable: "Questions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Quizzes",
                columns: new[] { "Id", "CreatedDateTime", "Name", "Prize", "StartingDateTime", "Status", "ThumbNailURL" },
                values: new object[] { 1, new DateTime(2023, 2, 2, 13, 4, 11, 394, DateTimeKind.Local).AddTicks(4170), "Space", "1000", new DateTime(2023, 12, 29, 18, 0, 0, 0, DateTimeKind.Unspecified), 0, "https://www.travelandleisure.com/thmb/sH4T0ElWwZFyUhtqAZD3USeiaSc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/james-webb-hole-WEBB0722-a7b14258290d4da9be4c7d50ee732d9b.jpg" });

            migrationBuilder.InsertData(
                table: "Questions",
                columns: new[] { "Id", "Duration", "IsSent", "QuizId", "Text" },
                values: new object[,]
                {
                    { 1, 10, false, 1, "Which of these planets has rings?" },
                    { 2, 10, false, 1, "Who was the first person to step foot on the moon?" },
                    { 3, 10, false, 1, "Exploration Rovers investigated which planet between 2004 and 2018?" },
                    { 4, 10, false, 1, "Who is the Hubble Space Telescope named after?" },
                    { 5, 10, false, 1, "Which planet is located between Venus and Mars?" },
                    { 6, 10, false, 1, "Which of these planets has the shortest year?" },
                    { 7, 10, false, 1, "Which planet has 9 continuous rings?" },
                    { 8, 10, false, 1, "The first manned space mission to land on the Moon was called what?" },
                    { 9, 10, false, 1, "How many planets in our solar system are larger than Earth?" },
                    { 10, 10, false, 1, "Vast empty space with little or no galaxies can be found are known as which of these?" }
                });

            migrationBuilder.InsertData(
                table: "Answers",
                columns: new[] { "Id", "IsCorrect", "QuestionId", "Text" },
                values: new object[,]
                {
                    { 1, false, 1, "Earth" },
                    { 2, false, 1, "Mars" },
                    { 3, false, 1, "Mercury" },
                    { 4, true, 1, "Neptune" },
                    { 5, true, 2, "Neil Armstrong" },
                    { 6, false, 2, "Lance Armstrong" },
                    { 7, false, 2, "Buzz Lightyear" },
                    { 8, false, 2, "Buzz Aldrin" },
                    { 9, false, 3, "Jupiter" },
                    { 10, false, 3, "Venus" },
                    { 11, true, 3, "Mars" },
                    { 12, false, 3, "Pluto" },
                    { 13, false, 4, "Erwin Hubble" },
                    { 14, false, 4, "Albert Hubble" },
                    { 15, false, 4, "Christopher Hubble" },
                    { 16, true, 4, "Edwin Hubble" },
                    { 17, true, 5, "Earth" },
                    { 18, false, 5, "Mercury" },
                    { 19, false, 5, "Saturn" },
                    { 20, true, 5, "Pluto" },
                    { 21, true, 6, "Mercury" },
                    { 22, false, 6, "Saturn" },
                    { 23, false, 6, "Uranus" },
                    { 24, true, 6, "Jupiter" },
                    { 25, false, 7, "Uranus" },
                    { 26, false, 7, "Jupiter" },
                    { 27, true, 7, "Saturn" },
                    { 28, false, 7, "Neptune" },
                    { 29, false, 8, "Apollo 1" },
                    { 30, false, 8, "Apollo 3" },
                    { 31, true, 8, "Apollo 11" },
                    { 32, false, 8, "Apollo 13" },
                    { 33, false, 8, "3" },
                    { 34, false, 8, "1" },
                    { 35, true, 8, "4" },
                    { 36, false, 8, "6" },
                    { 37, true, 8, "Voids" },
                    { 38, false, 8, "Bolts" },
                    { 39, false, 8, "Death Valley" },
                    { 40, false, 8, "Black holes" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Answers_QuestionId",
                table: "Answers",
                column: "QuestionId");

            migrationBuilder.CreateIndex(
                name: "IX_Questions_QuizId",
                table: "Questions",
                column: "QuizId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Answers");

            migrationBuilder.DropTable(
                name: "Users");

            migrationBuilder.DropTable(
                name: "Questions");

            migrationBuilder.DropTable(
                name: "Quizzes");
        }
    }
}
