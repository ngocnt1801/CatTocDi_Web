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
    public class ServiceSalonService : IServiceSalonService
    {
        private IRepository<ServiceCategory> _categoryRepo;
        private IRepository<Service> _serviceRepo;
        private IRepository<SalonService> _salonServiceRepo;
        private IRepository<Salon> _salonRepo;
        private IUnitOfWork _unitOfWork;
        public ServiceSalonService(IRepository<ServiceCategory> categoryRepo,
            IRepository<Service> serviceRepo,
            IRepository<SalonService> salonServiceRepo,
            IRepository<Salon> salonRepo,
            IUnitOfWork unitOfWork
            )
        {
            _categoryRepo = categoryRepo;
            _serviceRepo = serviceRepo;
            _salonServiceRepo = salonServiceRepo;
            _salonRepo = salonRepo;
            _unitOfWork = unitOfWork;
        }
        public List<CategoryViewModel> GetCategories()
        {
            var categories = _categoryRepo.Gets().Select(c => new CategoryViewModel
            {
                CategoryId = c.Id,
                CategoryName = c.Name,
                Services = c.Services.Select(s => new ServiceViewModel {
                    ServiceId = s.Id,
                    ServiceName = s.Name
                }).ToList()
            }).ToList();
            return categories;
        }

        public void UpdateSalonService(UpdateServiceViewModel model)
        {
            var foundedService = _salonServiceRepo.Gets()
                    .Where(s => s.SalonId == model.SalonId && s.ServiceId == model.ServiceId)
                    .FirstOrDefault(); 
            if (foundedService != null)
            {
                var salonService = _salonServiceRepo.GetByID(foundedService.ServiceId);
                salonService.Price = model.Price;
                salonService.AvarageTime = model.Duration;
                _salonServiceRepo.Edit(salonService);
                _unitOfWork.SaveChanges();
            }
            else
            {
                var salon = _salonRepo.GetByID(model.SalonId);
                var service = _serviceRepo.GetByID(model.ServiceId);
                if (salon != null && service != null)
                {
                    SalonService newService = new SalonService
                    {
                        Salon = salon,
                        Service = service,
                        Price = model.Price,
                        AvarageTime = model.Duration
                    };
                    _salonServiceRepo.Insert(newService);
                    _unitOfWork.SaveChanges();
                } 
                else
                {
                    throw new Exception("Salon Not Found");
                }
            }
        }
    }
}
