using cattocdi.salonservice.ViewModel;
using System.Collections.Generic;

namespace cattocdi.salonservice.Interface
{
    public interface ICategoryServices
    {
        IEnumerable<CategoryViewModel> GetAllCategory();

        void Insert(CategoryViewModel model);

        void Update(CategoryViewModel model);

        void Delete(int id);
    }
}
