using cattocdi.Service.ViewModel.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cattocdi.Service.Interface
{
    public interface IServiceService
    {
        List<ServiceViewModel> GetAllServices();

        void Insert(ServiceViewModel model);

        void Update(ServiceViewModel model);

        void Delete(int id);
    }
}
