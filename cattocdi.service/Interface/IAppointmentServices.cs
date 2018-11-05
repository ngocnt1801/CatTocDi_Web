using cattocdi.Service.ViewModel.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cattocdi.Service.Interface
{
    public interface IAppointmentServices
    {
        List<AppointmentViewModel> GetAllAppointment(string Username);
        bool CancelAppointment(int appointmentId);
        bool Addreview(string content, byte rate, int appointmentId);

        bool BookAppoint(NewAppointmentViewModel model);
        
    }
}
