using cattocdi.salonservice.ViewModel;
using System;
using System.Collections.Generic;

namespace cattocdi.salonservice.Interface
{
    public interface IServiceService
    {
        List<ServiceViewModel> GetAllServices();

        void Insert(ServiceViewModel model);

        void Update(ServiceViewModel model);

        void Delete(int id);

    }
}
