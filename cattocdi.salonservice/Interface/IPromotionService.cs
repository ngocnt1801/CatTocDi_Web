﻿using cattocdi.salonservice.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cattocdi.salonservice.Interface
{
    public interface IPromotionService
    {
        List<PromotionViewModel> GetPromotions(string accountId);
        void UpdatePromotion(PromotionViewModel model);
        void CreatePromotion(PromotionViewModel model);        
    }
}
