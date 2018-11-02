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

        #region Salon 
        SalonProfileViewModel GetSalonProfile(string salonId);
        #endregion
    }
}
