using cattocdi.entity;
using cattocdi.repository;
using cattocdi.Service.Interface;
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
        private IRepository<cattocdi.entity.Service> _serviceRepo;
        private IRepository<ServiceCategory> _categoryRepo;
 

        public SalonServices(IRepository<Salon> salonRepo, IUnitOfWork unitOfWork, IRepository<cattocdi.entity.Service> serviceRepo, IRepository<ServiceCategory> categoryRepo)
        {
            _serviceRepo = serviceRepo;
            _salonRepo = salonRepo;
            _unitOfWork = unitOfWork;
            _categoryRepo = categoryRepo;
        }

        public IEnumerable<SalonViewModel> GetAllSalon()
        {
            

            var services = _serviceRepo.Gets().Select(s => new ServiceViewModel
            {
                //CategoryName = _categoryRepo.Gets().Where(e => e.Id == s.Id).FirstOrDefault().Name,
                Name = s.Name,
                ServiceId = s.Id,
                SalonServiceViewModels = s.SalonServices.Select(m => new SalonServiceViewModel {
                    AverageTime = m.AvarageTime ?? 0,
                    Price = m.Price ?? 0,
                    SalonId = m.SalonId,
                    ServiceId = m.ServiceId

                }).ToList()
            });
            var salons = _salonRepo.Gets().Select(s => new SalonViewModel
            {
                SalonId = s.Id,
                AccountId = s.AccountId,
                Address = s.Address,
                IsForMen = s.IsForMen ?? false,
                IsForWomen = s.IsForWomen ?? false,
                RatingAvarage = s.RatingAverage ?? 0,
                SalonName = s.Name,
                Promotions = s.Promotions.Where(q => q.Id == s.Id).ToList().Select(p => new PromotionViewModel
                {
                    Description = p.Description,
                    DiscountPersent = p.DiscountPercent,
                    EndTime = p.EndTime,
                    StartTime = p.StartTime,
                    PromotionId = p.Id,
                    SalonId = p.SalonId
                    
                }).ToList(),

                Services = s.SalonServices.Where(q => q.Id == s.Id).ToList().Select(x => new SalonServiceViewModel {
                    AverageTime = x.AvarageTime ?? 0,
                    Price = x.Price ?? 0,
                    SalonId = x.SalonId,
                    ServiceId = x.ServiceId,
                    ServiceName = x.Service.Name,
                    CategoryName = x.Service.ServiceCategory.Name
                }).ToList(),
                //ClosedDays = s.ClosedDays.Select (c => new ClosedDayViewModel
                //{
                //    ClosedDayId = c.Id,
                //    Date = c.Date ?? DateTime.Now,
                //    Description = c.Description,
                //    SalonId = c.SalonId
                //}).ToList(),
                //TimeSlots = s.TimeSlots.Select (t => new TimeSlotViewModel
                //{
                //    DayOfWeek = t.DayOfWeek ?? 0,
                //    SalonId = t.SalonId ?? 0,
                //    SlotDate = t.SlotDate ?? DateTime.Now,
                //    SlotTime = t.SlotTime ?? TimeSpan.Zero,
                //    SlotType = t.SlotType ?? false,
                //    TimeSlotId = t.Id

                //}).ToList()

                

                
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
