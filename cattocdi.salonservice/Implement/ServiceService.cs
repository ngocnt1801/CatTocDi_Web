using cattocdi.repository;
using cattocdi.salonservice.Interface;
using cattocdi.salonservice.ViewModel;
using System.Collections.Generic;
using System.Linq;

namespace cattocdi.salonservice.Implement
{
    public class ServiceService : IServiceService
    {
        private IRepository<entity.Service> _serviceRepo;
        private IRepository<entity.SalonService> _salonServiceRepo;
        private IUnitOfWork _unitOfWork;
        public ServiceService(
            IRepository<entity.Service> serviceRepo, 
            IRepository<entity.SalonService> salonServiceRepo, 
            IUnitOfWork unitOfWork)
        {
            _serviceRepo = serviceRepo;
            _salonServiceRepo = salonServiceRepo;
            _unitOfWork = unitOfWork;
        }

        public void Delete(int id)
        {
            _serviceRepo.Delete(id);
            _unitOfWork.SaveChanges();
        }

        public List<ServiceViewModel> GetAllServices()
        {
            return _serviceRepo.Gets().ToList().Select(s => new ServiceViewModel
            {
                ServiceId = s.Id,
                ServiceName = s.Name,
                CategoryId = s.CategoryId,
                AmountSalon = _salonServiceRepo.Gets().Where(ss => ss.ServiceId == s.Id).Count(),
                AveragePrice = _salonServiceRepo.Gets().Where(ss => ss.ServiceId == s.Id).Average(ss => ss.Price).HasValue ? _salonServiceRepo.Gets().Where(ss => ss.ServiceId == s.Id).Average(ss => ss.Price).Value : 0
            }).ToList();
        }

        public void Insert(ServiceViewModel model)
        {
            _serviceRepo.Insert(new entity.Service
            {
                CategoryId = model.CategoryId,
                Name = model.ServiceName
            });
            _unitOfWork.SaveChanges();
        }

        public void Update(ServiceViewModel model)
        {
            var entity = _serviceRepo.GetByID(model.ServiceId);
            entity.Name = model.ServiceName;
            entity.CategoryId = model.CategoryId;
            _serviceRepo.Edit(entity);
            _unitOfWork.SaveChanges();
        }
    }
}
