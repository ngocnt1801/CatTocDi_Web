using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cattocdi.Service.ViewModel.User
{
    public class ServiceViewModel
    {
        public int ServiceId { get; set; }
        public string Name { get; set; }
        public string CategoryName { get; set; }
        public List<SalonServiceViewModel> SalonServiceViewModels {get; set;}
    }
}
