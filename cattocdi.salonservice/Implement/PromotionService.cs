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
        private IUnitOfWork _unitOfWork;
        public PromotionService(IRepository<Salon> salonRepo, IRepository<Promotion> promotionRepo, IUnitOfWork unitOfWork)
        {
            _salonRepo = salonRepo;
            _promotionRepo = promotionRepo;
            _unitOfWork = unitOfWork;                 
        }

        public void CreatePromotion(PromotionViewModel model)
        {
            var salonId = _salonRepo.Gets()
                .Where(s => s.AccountId == model.AccountId)
                .Select(s => s.Id).FirstOrDefault();

            var newPromotion = new Promotion
            {
                SalonId = salonId,
                PostDate = DateTime.Now,
                StartTime = model.StartTime,
                EndTime = model.EndTime,
                Description = model.Description,
                DiscountPercent = model.DiscountPercent,                 
            };
            _promotionRepo.Insert(newPromotion);
            _unitOfWork.SaveChanges();            
        }

        public List<PromotionViewModel> GetPromotions(string accountId)
        {
            var salonId = _salonRepo.Gets().Where(s => s.AccountId == accountId).Select(s => s.Id).FirstOrDefault();
            if (salonId > 0)
            {
                var list = _promotionRepo.Gets().Where(p => p.SalonId == salonId && p.EndTime > DateTime.Now)
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
        public void UpdatePromotion(PromotionViewModel model)
        {
            var founded = _promotionRepo.GetByID(model.Id);
            founded.StartTime = model.StartTime;
            founded.EndTime = model.EndTime;
            founded.Description = model.Description;
            founded.DiscountPercent = model.DiscountPercent;
            _promotionRepo.Edit(founded);
            _unitOfWork.SaveChanges();        
        }
    }
}
