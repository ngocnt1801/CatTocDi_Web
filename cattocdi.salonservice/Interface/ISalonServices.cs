using cattocdi.salonservice.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace cattocdi.salonservice.Interface
{
    public interface ISalonServices
    {
        void RegisterSalonAccount(SalonViewModel newSalon);        
        SalonProfileViewModel GetSalonProfile(string salonId);      
        void UpdateProfile(SalonProfileViewModel model);
        bool ToggleStatus(int salonId, bool isActive);

        List<SalonViewModel> GetSalonsForAdmin();
        List<AppointmentViewmodel> GetAppointmentsByMonth(int salonId, int month);        
    }
}
