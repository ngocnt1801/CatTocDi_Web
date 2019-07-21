﻿using cattocdi.Service.ViewModel.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace cattocdi.Service.Interface
{
    public interface ISalonServices
    {
        void RegisterSalonAccount(SalonViewModel newSalon);

        IEnumerable<SalonViewModel> GetAllSalon();
        IEnumerable<SalonViewModel> SearchSalon(string nameAndAddress, string serviceName);
        SalonDetailViewModel GetSalonById(int id);

        List<SalonViewModel> GetSalonsForAdmin();
        List<AppointmentViewModel> GetAppointmentsByMonth(int salonId, int month);

        string GetFirebaseToken(int salonId);
    }
}
