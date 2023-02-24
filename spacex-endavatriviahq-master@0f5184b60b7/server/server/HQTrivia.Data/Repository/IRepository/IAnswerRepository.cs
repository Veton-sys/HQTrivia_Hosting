using HQTrivia.Models.Models;

namespace HQTrivia.Data.Repository.IRepository
{
    public interface IAnswerRepository
    {  
        Answer? GetAnswer(int id);
        void RemoveAnswer(int answerId);

    }
}