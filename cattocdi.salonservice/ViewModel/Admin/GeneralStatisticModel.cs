using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cattocdi.salonservice.ViewModel.Admin
{
    public class GeneralStatisticModel
    {
        public int TotalSalons { get; set; }
        public int TotalUsers { get; set; }
        public int TotalAppointments { get; set; }
        public int TotalRunningPromotions { get; set; }
    }
}
