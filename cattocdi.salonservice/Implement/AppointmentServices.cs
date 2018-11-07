using cattocdi.salonservice.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using cattocdi.salonservice.ViewModel;
using cattocdi.repository;
using cattocdi.entity;

namespace cattocdi.salonservice.Implement
{
    
    public class AppointmentServices : IAppointmentServices
    {
        IRepository<Appointment> _apmRepo;
        IRepository<Salon> _salonRepo;
        public AppointmentServices(IRepository<Appointment> apmRepo, IRepository<Salon> salonRepo)
        {
            _apmRepo = apmRepo;
            _salonRepo = salonRepo;
        }
        public AppointmentSeprationViewModel getAllAppoitment(string AccountId)
        {

            List<int> salonServices = _salonRepo.Gets().Where(p => p.AccountId.Equals(AccountId)).Select(x => x.SalonServices.Where(v => v.SalonId == x.Id).Select(l => l.Id)).FirstOrDefault().ToList();
            var apms = _apmRepo.Gets();
            var result = new AppointmentSeprationViewModel {
                ListToday  = apms.Where(p => p.ServiceAppointments.Where(x => salonServices.Contains(x.ServiceId)).Count() > 0 && p.BookedDate == DateTime.Today  && p.Status != 2).Select(m => new AppointmentViewmodel
                {
                    AppointmentId = m.Id,
                    BookedDate = m.BookedDate,
                    CustomerId = m.CustomerId,
                    Duration = m.Duration,
                    Status = m.Status,
                    //TimeSlot = m.TimeSlot,
                    Customer = new CustomerViewModel
                    {
                        CustomerId = m.Customer.CustomerId,
                        Firstname = m.Customer.FirstName,
                        Lastname = m.Customer.LastName,
                        Gender = m.Customer.Gender ?? false,
                        Phone = m.Customer.Phone

                    },
                    Promotion = new PromotionViewModel
                    {
                        Description = m.Promotion.Description,
                        DiscountPercent = m.Promotion.DiscountPercent,
                        EndTime = m.Promotion.EndTime,
                        SalonId = m.Promotion.SalonId,
                        StartTime = m.Promotion.StartTime,
                        Id = m.Promotion.Id,
                    },
                    Services = m.ServiceAppointments.Select(p => p.SalonService).Select(q => new SalonServiceViewModel
                    {
                        AvarageTime = q.AvarageTime ?? 0,
                        Price = q.Price ?? 0,
                        ServiceId = q.ServiceId,
                        ServiceName = q.Service.Name

                    }).ToList()
                }).ToList(),

                ListNotApprove = apms.Where(p => p.ServiceAppointments.Where(x => salonServices.Contains(x.ServiceId)).Count() > 0 && p.Status == 0).Select(m => new AppointmentViewmodel
                {
                    AppointmentId = m.Id,
                    BookedDate = m.BookedDate,
                    CustomerId = m.CustomerId,
                    Duration = m.Duration,
                    Status = m.Status,
                    //TimeSlot = m.TimeSlot,
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
                    Promotion = new PromotionViewModel
                    {
                        Description = m.Promotion.Description,
                        DiscountPercent = m.Promotion.DiscountPercent,
                        EndTime = m.Promotion.EndTime,
                        SalonId = m.Promotion.SalonId,
                        StartTime = m.Promotion.StartTime,
                        Id = m.Promotion.Id,
                    }
                }).ToList(),
            };

            return result;
        }

        public List<AppointmentViewmodel> getBydate(DateTime date, string accountId)
        {
            List<int> salonServices = _salonRepo.Gets().Where(p => p.AccountId.Equals(accountId)).Select(x => x.SalonServices.Where(v => v.SalonId == x.Id).Select(l => l.Id)).FirstOrDefault().ToList();
            var result = _apmRepo.Gets().Where(p => p.ServiceAppointments.Where(x => salonServices.Contains(x.ServiceId)).Count() > 0 && p.BookedDate == date && p.Status != 2).Select(m => new AppointmentViewmodel
            {
                AppointmentId = m.Id,
                BookedDate = m.BookedDate,
                CustomerId = m.CustomerId,
                Duration = m.Duration,
                Status = m.Status,
                //TimeSlot = m.TimeSlot,
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
                Promotion = new PromotionViewModel
                {
                    Description = m.Promotion.Description,
                    DiscountPercent = m.Promotion.DiscountPercent,
                    EndTime = m.Promotion.EndTime,
                    SalonId = m.Promotion.SalonId,
                    StartTime = m.Promotion.StartTime,
                    Id = m.Promotion.Id,
                }
            }).ToList();
            return result;
        }
    }
}
