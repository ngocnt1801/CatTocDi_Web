﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cattocdi.salonservice.ViewModel
{
    public class SalonProfileViewModel
    {
        public int SalonId { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }        
        public bool IsForMen { get; set; }
        public bool IsForWomen { get; set; }        
        public double Longitude { get;  set; }
        public double Latitude { get; set; }   
        public List<SalonServiceViewModel> Services { get; set; }
    }
}