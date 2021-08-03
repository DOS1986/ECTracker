using ECTracker.DAL.Models;
using System.Collections.Generic;

namespace ECTracker.DAL.DataAccess.Interfaces
{
    public interface IDataConnection
    {
        List<Category> LoadCategories();

        Category GetSingle_Category(int categoryId);
    }
}
