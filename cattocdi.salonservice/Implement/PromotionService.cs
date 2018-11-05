using cattocdi.entity;
using cattocdi.repository;
using cattocdi.salonservice.Interface;
using cattocdi.salonservice.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cattocdi.salonservice.Implement
{
    public class PromotionService : IPromotionService
    {
        private IRepository<Salon> _salonRepo;
        private IRepository<Promotion> _promotionRepo;
        public PromotionService(IRepository<Salon> salonRepo, IRepository<Promotion> promotionRepo)
        {
            _salonRepo = salonRepo;
            _promotionRepo = promotionRepo;
        }
        public List<PromotionViewModel> GetPromotions(string accountId)
        {
            var salonId = _salonRepo.Gets().Where(s => s.AccountId == accountId).Select(s => s.Id).FirstOrDefault();
            if (salonId == 0)
            {
                var list = _promotionRepo.Gets().Where(p => p.SalonId == salonId && p.StartTime >= DateTime.Now)
                    .Select(s => new PromotionViewModel
                    {
                        Id = s.Id,
                        StartTime = s.StartTime,
                        EndTime = s.EndTime,
                        Description = s.Description,
                        DiscountPercent = s.DiscountPercent
                    }).ToList();
                return list; 
            }
            return null; 
        }
    }
}
