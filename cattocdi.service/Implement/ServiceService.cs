using cattocdi.repository;
using cattocdi.Service.Interface;
using cattocdi.Service.ViewModel.User;
using System;
using System.Collections.Generic;
using System.Linq;

namespace cattocdi.Service.Implement
{
    public class ServiceService : IServiceService
    {
        private IRepository<entity.Service> _serviceRepo;
        private IUnitOfWork _unitOfWork;
        public ServiceService(IRepository<entity.Service> serviceRepo, IUnitOfWork unitOfWork)
        {
            _serviceRepo = serviceRepo;
            _unitOfWork = unitOfWork;
        }

        public void Delete(int id)
        {
            _serviceRepo.Delete(id);
            _unitOfWork.SaveChanges();
        }

        public List<ServiceViewModel> GetAllServices()
        {
            return _serviceRepo.Gets().Select(s => new ServiceViewModel
            {
                ServiceId = s.Id,
                ServiceName = s.Name,
                CategoryId = s.CategoryId
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
