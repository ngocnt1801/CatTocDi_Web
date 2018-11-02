using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cattocdi.Service.ViewModel.Salon
{
    public class SalonServiceViewModel
    {
        public int Id { get; set; }
        public int ServiceId { get; set; }
        public int CategoryId { get; set; }
        public string ServiceName { get; set; }
        public string CategoryName { get; set; }  
        public double Price { get; set; }
        public int AvarageTime { get; set; }
    }
}
