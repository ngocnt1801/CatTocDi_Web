using cattocdi.salonservice.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cattocdi.salonservice.Interface
{
    public interface IAppointmentServices
    {
        AppointmentSeprationViewModel GetAllAppointment(string AccountId);

        List<AppointmentViewmodel> GetByDate(DateTime date, string accountId);

        void CancelAppointment(int appointmentId, string reason);
        void ApproveAppointment(int appointmentId);
    }
}
