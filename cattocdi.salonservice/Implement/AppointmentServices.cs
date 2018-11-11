using cattocdi.salonservice.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using cattocdi.salonservice.ViewModel;
using cattocdi.repository;
using cattocdi.entity;
using cattocdi.salonservice.Constant;

namespace cattocdi.salonservice.Implement
{
    
    public class AppointmentServices : IAppointmentServices
    {
        private IRepository<Appointment> _apmRepo;
        private IRepository<Salon> _salonRepo;
        private IRepository<ServiceAppointment> _serviceAppointmentRepo;
        private IRepository<SlotTime> _slotTimeRepo;        
        private IUnitOfWork _unitOfWork;
        public AppointmentServices(IRepository<Appointment> apmRepo, 
            IRepository<Salon> salonRepo,
            IRepository<ServiceAppointment> serviceAppointmentRepo,
            IRepository<SlotTime> slotTimeRepo,
            IUnitOfWork unitOfWork)
        {
            _apmRepo = apmRepo;
            _salonRepo = salonRepo;
            _serviceAppointmentRepo = serviceAppointmentRepo;
            _slotTimeRepo = slotTimeRepo;
            _unitOfWork = unitOfWork;
        }

        public void ApproveAppointment(int appointmentId)
        {
            var apm = _apmRepo.GetByID(appointmentId); 


            if (apm != null)
            {                                
                apm.Status = (int)AppointmentStatusEnum.APPROVE;                
                _apmRepo.Edit(apm);
                _unitOfWork.SaveChanges();
            }          
        }

        public void CancelAppointment(int appoitmentId, string reason)
        {
            var apm = _apmRepo.Gets().Where(p => p.Id == appoitmentId).FirstOrDefault(); 
            if(apm != null)
            {
                var salonId = _serviceAppointmentRepo.Gets()
                    .Where(s => s.AppointmentId == apm.Id).Select(s => s.SalonService.SalonId).Distinct().FirstOrDefault();

                var slot = _slotTimeRepo.Gets()
                                        .Where(s => s.SlotDate == apm.StartTime.Date && s.SalonId == salonId)
                                        .FirstOrDefault();                
                if (slot != null)
                {
                    // Reset Capacity 
                    var startSlot = Convert.ToInt32(apm.StartTime.TimeOfDay.TotalMinutes / 15);
                    var totalSlot = Convert.ToInt32(apm.Duration / 15);
                    for (int i = 0; i < totalSlot; i++)
                    {
                        var currentCapacity = (byte)slot.GetType().GetProperty($"Slot{startSlot}").GetValue(slot);
                        currentCapacity -= 1;
                        slot.GetType().GetProperty($"Slot{startSlot}").SetValue(slot, currentCapacity);                        
                        startSlot++;

                        _slotTimeRepo.Edit(slot);
                        _unitOfWork.SaveChanges();
                    }                                        
                }

                apm.Status = (int)AppointmentStatusEnum.CANCEL;
                apm.CancelledReason = reason;
                _apmRepo.Edit(apm);                    
                _unitOfWork.SaveChanges();                
            }         
        }

        public AppointmentSeprationViewModel GetAllAppointment(string AccountId)
        {
            var salon = _salonRepo.Gets().Where(p => p.AccountId.Equals(AccountId)).FirstOrDefault();
            List<int> salonServices = salon.SalonServices.Where(v => v.SalonId == salon.Id).Select(l => l.Id).ToList();
            var appointments = _serviceAppointmentRepo.Gets()                
                .Where(s => s.SalonService.SalonId == salon.Id)
                .Select(s => s.Appointment)                
                .Distinct()                
                .AsQueryable();

            var listToday = appointments.Where(a => a.StartTime >= DateTime.Now && a.Status != (byte)AppointmentStatusEnum.CANCEL)
                                        .OrderBy(a => a.StartTime)
                                        .Select(m => new AppointmentViewmodel
                                        {
                                            AppointmentId = m.Id,
                                            BookedDate = m.BookedDate,
                                            CustomerId = m.CustomerId,
                                            Duration = m.Duration,
                                            Status = m.Status,
                                            StartTime = m.StartTime,
                                            Customer = new CustomerViewModel
                                            {
                                                CustomerId = m.Customer.CustomerId,
                                                Firstname = m.Customer.FirstName,
                                                Lastname = m.Customer.LastName,
                                                Gender = m.Customer.Gender ?? false,
                                                Phone = m.Customer.Phone
                                            },
                                            Promotion = m.Promotion != null ? new PromotionViewModel
                                            {
                                                Description = m.Promotion.Description,
                                                DiscountPercent = m.Promotion.DiscountPercent,
                                                EndTime = m.Promotion.EndTime,
                                                SalonId = m.Promotion.SalonId,
                                                StartTime = m.Promotion.StartTime,
                                                Id = m.Promotion.Id,
                                                Status = m.Promotion.Status ?? 0,
                                            } : null,
                                            Services = m.ServiceAppointments.Select(p => p.SalonService).Select(q => new SalonServiceViewModel
                                            {
                                                AvarageTime = q.AvarageTime ?? 0,
                                                Price = q.Price ?? 0,
                                                ServiceId = q.ServiceId,
                                                ServiceName = q.Service.Name
                                            }).ToList()
                                        }).ToList();

            var historyList = appointments.Where(a => a.StartTime < DateTime.Now && a.Status != (byte)PromotionEnum.CANCELED)
                                               .Select(m => new AppointmentViewmodel
                                               {
                                                   AppointmentId = m.Id,
                                                   BookedDate = m.BookedDate,
                                                   CustomerId = m.CustomerId,
                                                   Duration = m.Duration,
                                                   Status = m.Status,
                                                   StartTime = m.StartTime,
                                                   Customer = new CustomerViewModel
                                                   {
                                                       CustomerId = m.Customer.CustomerId,
                                                       Firstname = m.Customer.FirstName,
                                                       Lastname = m.Customer.LastName,
                                                       Gender = m.Customer.Gender ?? false,
                                                       Phone = m.Customer.Phone
                                                   },
                                                   Services = m.ServiceAppointments.Select(p => p.SalonService).Select(q => new SalonServiceViewModel
                                                   {
                                                       AvarageTime = q.AvarageTime ?? 0,
                                                       Price = q.Price ?? 0,
                                                       ServiceId = q.ServiceId,
                                                       ServiceName = q.Service.Name

                                                   }).ToList(),
                                                   Promotion = m.Promotion != null ? new PromotionViewModel
                                                   {
                                                       Description = m.Promotion.Description,
                                                       DiscountPercent = m.Promotion.DiscountPercent,
                                                       EndTime = m.Promotion.EndTime,
                                                       SalonId = m.Promotion.SalonId,
                                                       StartTime = m.Promotion.StartTime,
                                                       Id = m.Promotion.Id,
                                                       Status = m.Promotion.Status ?? 0
                                                   } : null
                                               }) 
                                               .OrderByDescending(s => s.StartTime)
                                               .ToList();
            var listCancel = appointments.Where(a => a.Status == (byte)AppointmentStatusEnum.CANCEL)
                                               .Select(m => new AppointmentViewmodel
                                               {
                                                   AppointmentId = m.Id,
                                                   BookedDate = m.BookedDate,
                                                   CustomerId = m.CustomerId,
                                                   Duration = m.Duration,
                                                   Status = m.Status,
                                                   StartTime = m.StartTime,
                                                   Customer = new CustomerViewModel
                                                   {
                                                       CustomerId = m.Customer.CustomerId,
                                                       Firstname = m.Customer.FirstName,
                                                       Lastname = m.Customer.LastName,
                                                       Gender = m.Customer.Gender ?? false,
                                                       Phone = m.Customer.Phone
                                                   },
                                                   Services = m.ServiceAppointments.Select(p => p.SalonService).Select(q => new SalonServiceViewModel
                                                   {
                                                       AvarageTime = q.AvarageTime ?? 0,
                                                       Price = q.Price ?? 0,
                                                       ServiceId = q.ServiceId,
                                                       ServiceName = q.Service.Name
                                                   }).ToList(),
                                                   Promotion = m.Promotion != null ? new PromotionViewModel
                                                   {
                                                       Description = m.Promotion.Description,
                                                       DiscountPercent = m.Promotion.DiscountPercent,
                                                       EndTime = m.Promotion.EndTime,
                                                       SalonId = m.Promotion.SalonId,
                                                       StartTime = m.Promotion.StartTime,
                                                       Id = m.Promotion.Id,
                                                       Status = m.Promotion.Status ?? 0
                                                   } : null
                                               })
                                               .OrderByDescending(s => s.StartTime)
                                               .ToList();

            var result = new AppointmentSeprationViewModel
            {
                Capacity = salon.Capacity ?? 0,
                ListToday = listToday,
                ListNotApprove = historyList,
                ListCancel = listCancel
            };
            
            return result;
        }

        public List<AppointmentViewmodel> GetByDate(DateTime date, string accountId)
        {
            var salon = _salonRepo.Gets().Where(p => p.AccountId.Equals(accountId)).FirstOrDefault();
            List<int> salonServices = salon.SalonServices.Where(v => v.SalonId == salon.Id).Select(l => l.Id).ToList();
            
            var result = _apmRepo.Gets().Where(p => p.ServiceAppointments
            .Where(x => salonServices.Contains(x.ServiceId)).Count() > 0 && p.BookedDate == date && p.Status != (byte)AppointmentStatusEnum.CANCEL)
            .Select(m => new AppointmentViewmodel
            {
                AppointmentId = m.Id,
                BookedDate = m.BookedDate,
                CustomerId = m.CustomerId,
                Duration = m.Duration,
                Status = m.Status,               
                StartTime = m.StartTime,
                Customer = new CustomerViewModel
                {
                    CustomerId = m.Customer.CustomerId,
                    Firstname = m.Customer.FirstName,
                    Lastname = m.Customer.LastName,
                    Gender = m.Customer.Gender ?? false,
                    Phone = m.Customer.Phone
                },
                Promotion = m.Promotion != null ? new PromotionViewModel
                {
                    Description = m.Promotion.Description,
                    DiscountPercent = m.Promotion.DiscountPercent,
                    EndTime = m.Promotion.EndTime,
                    SalonId = m.Promotion.SalonId,
                    StartTime = m.Promotion.StartTime,
                    Id = m.Promotion.Id,
                    Status = m.Promotion.Status ?? 0,
                } : null,
                Services = m.ServiceAppointments.Select(p => p.SalonService).Select(q => new SalonServiceViewModel
                {
                    AvarageTime = q.AvarageTime ?? 0,
                    Price = q.Price ?? 0,
                    ServiceId = q.ServiceId,
                    ServiceName = q.Service.Name
                }).ToList()
            }).ToList();
            return result;
        }
    }
}
