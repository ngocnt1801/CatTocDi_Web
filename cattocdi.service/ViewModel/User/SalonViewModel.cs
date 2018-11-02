using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cattocdi.Service.ViewModel.User
{
    public class SalonViewModel
    {
        public int SalonId { get; set; }
        public string SalonName { get; set; }
        public string Address { get; set; }
        public string AccountId { get; set; }
        public bool IsForMen { get; set; }
        public bool IsForWomen { get; set; }
        public double RatingAvarage { get; set; }
        public List<PromotionViewModel> Promotions{get; set;}
    }
}
