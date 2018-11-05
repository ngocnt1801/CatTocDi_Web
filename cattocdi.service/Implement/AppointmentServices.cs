using cattocdi.Service.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using cattocdi.Service.ViewModel.User;
using cattocdi.repository;
using cattocdi.entity;
using cattocdi.Service.Constant;

namespace cattocdi.Service.Implement
{
    public class AppointmentServices : IAppointmentServices
    {
        private IRepository<Customer> _customerRepo;
        private IRepository<Appointment> _apmRepo;
        private IRepository<Review> _reviewRepo;
        private IUnitOfWork _unitOfWork;
        private IRepository<Promotion> _promotionRepo;

        public AppointmentServices(IUnitOfWork unitOfWork, IRepository<Review> reviewRepo, IRepository<Customer> customerRepo, IRepository<Appointment> apmRepo, IRepository<Promotion> promotionRepo)
        {
            _promotionRepo = promotionRepo;
            _unitOfWork = unitOfWork;
            _customerRepo = customerRepo;
            _apmRepo = apmRepo;
            _reviewRepo = reviewRepo;
        }
        public bool Addreview(string content, byte rate, int appointmentId)
        {
            
                var newReview = new Review
                {
                    AppointmentId = appointmentId,
                    Comment = content,
                    Date = DateTime.Now,
                    RateNumber = rate,
                };
            _reviewRepo.Insert(newReview);
            return _unitOfWork.SaveChanges() > 0;
            

        }

        public bool CancelAppointment(int appointmentId)
        {
            var apm = _apmRepo.Gets().Where(p => p.AppointmentId == appointmentId).FirstOrDefault();
            apm.Status = AppointmentStatusConstant.CANCEL;
            _apmRepo.Edit(apm);
            return _unitOfWork.SaveChanges() > 0;
            

        }

        public List<AppointmentViewModel> GetAllAppointment(string username)
        {
            var customer = _customerRepo.Gets().Where(x => x.AspNetUser.UserName.Equals(username)).FirstOrDefault();
            var apms = customer.Appointments.Select(p => new AppointmentViewModel
            {
                AppointmentId = p.AppointmentId,
                BookDate = p.BookedDate,
                DiscountPercent = _promotionRepo.Gets().Where(n => n.Id == p.PromotionId).Select(k => k.DiscountPercent).FirstOrDefault(),
                Duration = p.Duration,
                Status = p.Status,
                TimeSlot = p.TimeSlot,
                SalonID = p.ServiceAppointments.Where(n => n.AppointmentId == p.AppointmentId)
                                                .Select(k => k.SalonService)
                                                .Select(l => l.SalonId).FirstOrDefault(),

            }).OrderByDescending(x => x.AppointmentId).ToList();
            return apms;
        }

        public bool BookAppoint(NewAppointmentViewModel model)
        {
            var customerId = _customerRepo.Gets().Where(p => p.AccountId == model.AccountId).Select(x => x.CustomerId).FirstOrDefault();
            model.CustomerId = customerId;
            var apm = new Appointment
            {
                BookedDate = model.BookedDate,
                CustomerId = model.CustomerId,
                PromotionId = model.PromotionId,
                Duration = model.Duration,
                Status = AppointmentStatusConstant.NOTAPPROVE,
                TimeSlot = model.TimeSlot,
                ServiceAppointments = model.Services.Select(x => new ServiceAppointment
                {
                    Price = x.Price,
                    ServiceId = x.SalonServiceID,
                }).ToList(),
            };
            _apmRepo.Insert(apm);
            return _unitOfWork.SaveChanges() > 0;
        }
    }
}
