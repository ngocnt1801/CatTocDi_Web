using cattocdi.entity;
using cattocdi.repository;
using cattocdi.Service.Interface;
using cattocdi.Service.ViewModel;
using cattocdi.Service.ViewModel.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cattocdi.Service.Implement
{
    public class SalonServices : ISalonServices
    {
        private IRepository<Salon> _salonRepo;
        private IUnitOfWork _unitOfWork;
        private IRepository<Promotion> _promotionRepo;
        public SalonServices(IRepository<Salon> salonRepo, IUnitOfWork unitOfWork)
        {
            _salonRepo = salonRepo;
            _unitOfWork = unitOfWork;
        }

        public IEnumerable<SalonViewModel> GetAllSalon()
        {
            var salons = _salonRepo.Gets().Select(s => new SalonViewModel {
                SalonId = s.Id,
                AccountId = s.AccountId,
                Address = s.Address,
                IsForMen = s.IsForMen ?? false,
                IsForWomen = s.IsForWomen ?? false,
                RatingAvarage = s.RatingAverage ?? 0,
                SalonName = s.Name,
                Promotions = s.Promotions.Select(p => new PromotionViewModel {
                    Description = p.Description,
                    DiscountPersent = p.DiscountPercent,
                    EndTime = p.EndTime,
                    StartTime = p.StartTime,
                    PromotionId = p.Id,
                    SalonId = p.SalonId
                }).ToList()
            });
            
            return salons;
        }

        public void RegisterSalonAccount(SalonViewModel newSalon)
        {
            if (newSalon != null)
            {
                var salon = new Salon
                {                    
                    Name = newSalon.SalonName,
                    AccountId = newSalon.AccountId,
                    Address = newSalon.Address,
                    RatingAverage = 0,
                    IsForMen = newSalon.IsForMen,
                    IsForWomen = newSalon.IsForWomen
                };
                _salonRepo.Insert(salon);
                _unitOfWork.SaveChanges();
            }
        }
    }
}
