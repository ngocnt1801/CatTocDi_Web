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
    public class SalonServices : ISalonServices
    {
        private IRepository<Salon> _salonRepo;
        private IRepository<Promotion> _promotionRepo;
        private IRepository<TimeSlot> _slotRepo;
        private IUnitOfWork _unitOfWork;

        public SalonServices(IRepository<Salon> salonRepo, IUnitOfWork unitOfWork, 
            IRepository<Promotion> promotionRepo,IRepository<TimeSlot> slotRepo
            )
        {
            _salonRepo = salonRepo;
            _unitOfWork = unitOfWork;
            _promotionRepo = promotionRepo;
            _slotRepo = slotRepo;
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
                    Email = newSalon.Email,
                    Latitude = 0,
                    Longitude = 0,
                    RatingAverage = 0,
                    Phone = newSalon.Phone,
                    IsForMen = newSalon.IsForMen,                    
                    IsForWomen = newSalon.IsForWomen,                                        
                };
                _salonRepo.Insert(salon);
                _unitOfWork.SaveChanges();
            }
        }

        public SalonProfileViewModel GetSalonProfile(string accountId)
        {           
            var salons = _salonRepo.Gets()
                    .Where(s => s.AccountId == accountId)
                    .Select(s => new SalonProfileViewModel
                    {
                        SalonId = s.Id,
                        Address = s.Address,
                        Name = s.Name,
                        Phone = s.Phone,
                        IsForMen = s.IsForMen ?? false,
                        IsForWomen = s.IsForWomen ?? false,
                        Longitude = s.Longitude ?? 0,
                        Latitude = s.Latitude ?? 0,
                        Services = s.SalonServices.Select(se => new SalonServiceViewModel {
                            Id = se.Id,
                            ServiceId = se.ServiceId,
                            CategoryId = se.Service.CategoryId,
                            CategoryName = se.Service.ServiceCategory.Name,
                            Price = se.Price ?? 0,
                            AvarageTime = se.AvarageTime ?? 0,
                            ServiceName = se.Service.Name
                        }).ToList(),
                        CurrentPromotions = s.Promotions.Where(p => p.StartTime >= DateTime.Now)
                                                    .Select(pro => new PromotionViewModel {
                                                        Id = pro.Id,
                                                        StartTime = pro.StartTime,
                                                        EndTime = pro.EndTime,
                                                        Description = pro.Description,
                                                        DiscountPercent = pro.DiscountPercent
                                                    }).ToList()                        
                    }).FirstOrDefault();           
            return salons; 
        }
        public List<WorkDayViewModel> GetSalonTimeTable(int salonId)
        {
            return null;
        }

    }
}
