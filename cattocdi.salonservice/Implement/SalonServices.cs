using cattocdi.entity;
using cattocdi.repository;
using cattocdi.salonservice.Constant;
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
        private IRepository<ServiceAppointment> _serviceAptRepo;        
        private IUnitOfWork _unitOfWork;
        private IRepository<AspNetUsers> _accountRepo;

        public SalonServices(IRepository<Salon> salonRepo, IUnitOfWork unitOfWork, 
            IRepository<Promotion> promotionRepo,
            IRepository<ServiceAppointment> serviceAptRepo,
            IRepository<AspNetUsers> accountRepo
            )
        {
            _salonRepo = salonRepo;
            _unitOfWork = unitOfWork;
            _promotionRepo = promotionRepo;
            _accountRepo = accountRepo;         
            _serviceAptRepo = serviceAptRepo;         
        }     
        public void RegisterSalonAccount(SalonViewModel newSalon)
        {
            if (newSalon != null)
            {
                var account = _accountRepo.Gets().Where(c => c.Id.Equals(newSalon.AccountId)).FirstOrDefault();
                if (account != null)
                {
                    var salon = new Salon
                    {
                        Name = newSalon.SalonName,
                        AspNetUsers = account,
                        Address = newSalon.Address,
                        Email = newSalon.Email,
                        Latitude = 0,
                        Longitude = 0,
                        RatingAverage = 0,
                        Phone = newSalon.Phone,
                        IsForMen = newSalon.IsForMen,
                        IsForWomen = newSalon.IsForWomen,
                        RegisterDate = DateTime.Now,
                        FirebaseToken = newSalon.FirebaseToken
                    };
                    _salonRepo.Insert(salon);
                    _unitOfWork.SaveChanges();
                }               
            }
        }

        public SalonProfileViewModel GetSalonProfile(string accountId)
        {
            var salons = _salonRepo.GetsAsNoTracking()
                    .Where(s => s.AccountId == accountId)
                    .Select(s => new SalonProfileViewModel
                    {
                        SalonId = s.Id,
                        Address = s.Address,
                        SalonName = s.Name,
                        Phone = s.Phone,
                        Capacity = s.Capacity ?? 0,
                        Email = s.Email,
                        IsForMen = s.IsForMen ?? false,
                        IsForWomen = s.IsForWomen ?? false,
                        Longitude = s.Longitude ?? 0,
                        Latitude = s.Latitude ?? 0,
                        Services = s.SalonService
                            .Where(se => se.Disabled == false)
                            .Select(se => new SalonServiceViewModel {
                                Id = se.Id,
                                ServiceId = se.ServiceId,
                                CategoryId = se.Service.CategoryId,
                                CategoryName = se.Service.ServiceCategory.Name,
                                Price = se.Price ?? 0,
                                AvarageTime = se.AvarageTime ?? 0,
                                ServiceName = se.Service.Name
                            }).ToList(),
                        CurrentPromotions = s.Promotion.Where(p => p.EndTime >= DateTime.Now)
                                                    .Select(pro => new PromotionViewModel {
                                                        Id = pro.Id,
                                                        StartTime = pro.StartTime,
                                                        EndTime = pro.EndTime,
                                                        Description = pro.Description,
                                                        Status = pro.Status ?? 0,
                                                        DiscountPercent = pro.DiscountPercent
                                                    }).ToList(),
                        WorkingHours = s.WorkingHour.Select(w => new WorkDayViewModel {
                            DayOfWeek = w.DayOfWeek,
                            FromHour = w.StartHour,
                            ToHour = w.EndHour,
                            IsClosed = w.IsClosed
                        }).ToList(),
                        ImageUrl = s.Image.Select(i => i.Url).LastOrDefault()
                    }).FirstOrDefault();           
            return salons; 
        }       

        public void UpdateProfile(SalonProfileViewModel model)
        {
            var salon = _salonRepo.Gets().FirstOrDefault(s => s.AccountId == model.AccountId);                
            if (salon != null)
            {                
                if (model.SalonName != null)
                {
                    salon.Name = model.SalonName;
                }
                if (model.Email != null)
                {
                    salon.Email = model.Email;
                }
                if (model.Phone != null)
                {
                    salon.Phone = model.Phone;
                }                
                if (model.Address != null)
                {
                    salon.Address = model.Address;
                }
                
                salon.Capacity = model.Capacity;                
                salon.Longitude = model.Longitude;
                salon.Latitude = model.Latitude;
                _salonRepo.Edit(salon);
                _unitOfWork.SaveChanges();
            }
        }

        public List<SalonViewModel> GetSalonsForAdmin()
        {
            return _salonRepo.Gets().Select(s => new SalonViewModel
            {
                SalonId = s.Id,
                SalonName = s.Name,
                ImageUrl = s.Image.Any() ? s.Image.OrderByDescending(i => i.Id).FirstOrDefault().Url : "",
                RatingAvarage = (float)(s.RatingAverage.HasValue ? s.RatingAverage.Value : 0.0),
                Phone = s.Phone,
                Email = s.Email,
                Address = s.Address,
                
            }).ToList();
        }

        public List<AppointmentViewmodel> GetAppointmentsByMonth(int salonId, int month)
        {
            return _serviceAptRepo.Gets().Where(s => s.SalonService.SalonId == salonId && s.Appointment.BookedDate.Month == month)
                                        .Select(s => new AppointmentViewmodel
                                        {
                                            AppointmentId = s.AppointmentId,
                                            BookedDate = s.Appointment.BookedDate,
                                            Duration = s.Appointment.Duration,
                                            Status = s.Appointment.Status,
                                            CancelledReason = s.Appointment.CancelledReason
                                        }).ToList();
        }
    }
}
