using cattocdi.entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cattocdi.Service.ViewModel.User
{
   public class NewAppointmentViewModel
    {
        public int CustomerId { get; set; }
        public string AccountId { get; set; }
        public int SalonId { get; set; }
        public DateTime BookedDate { get; set; }
        public int Duration { get; set; }
        public TimeSpan TimeSlot { get; set; }
        public int DiscountPercent { get; set; }
        public int PromotionId { get; set; }

        public List<ServiceAppointmentViewModel> Services { get; set; }
    }
}
