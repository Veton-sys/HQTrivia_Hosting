using HQTrivia.Models.Models;
using HQTrivia.Models.Models.Dtos;

namespace HQTrivia.Service.IService
{
    public interface IAnswerService
    {
       
        Answer? GetAnswer(int id);
       
        void RemoveAnswer(int id);
      
    }
}