using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cattocdi.salonservice.ViewModel
{
    public class WorkDayViewModel
    {    
        public DateTime DateSlot { get; set; }
        public int DayOfWeek { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }        
    }
}
