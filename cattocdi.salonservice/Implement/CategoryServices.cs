using cattocdi.entity;
using cattocdi.repository;
using cattocdi.salonservice.Interface;
using cattocdi.salonservice.ViewModel;
using System.Collections.Generic;
using System.Linq;

namespace cattocdi.salonservice.Implement
{
    public class CategoryServices : ICategoryServices
    {
        private IRepository<ServiceCategory> _categoryRepo;
        private IRepository<entity.SalonService> _salonServiceRepo;
        private IUnitOfWork _unitOfWork;
        public CategoryServices(
            IRepository<ServiceCategory> categoryRepo, 
            IRepository<entity.SalonService> salonServiceRepo,
            IUnitOfWork unitOfWork)
        {
            _categoryRepo = categoryRepo;
            _salonServiceRepo = salonServiceRepo;
            _unitOfWork = unitOfWork;
        }

        public void Delete(int id)
        {
            _categoryRepo.Delete(id);
            _unitOfWork.SaveChanges();
        }

        public IEnumerable<CategoryViewModel> GetAllCategory()
        {
            var cateGories = _categoryRepo.Gets().ToList().Select(s => new CategoryViewModel
            {
                CategoryName = s.Name,
                CategoryId = s.Id,
                Services = s.Service.ToList().Select(p => new ServiceViewModel
                {
                    CategoryId = p.CategoryId,
                    ServiceName = p.Name,
                    ServiceId = p.Id,
                    AmountSalon = _salonServiceRepo.Gets().Where(ss => ss.ServiceId == s.Id).Count(),
                    AveragePrice = _salonServiceRepo.Gets().Where(ss => ss.ServiceId == s.Id).Average(ss => ss.Price).HasValue ? _salonServiceRepo.Gets().Where(ss => ss.ServiceId == s.Id).Average(ss => ss.Price).Value : 0
                }).ToList()
            }).ToList();

            return cateGories;
        }

        public void Insert(CategoryViewModel model)
        {
            _categoryRepo.Insert(new ServiceCategory
            {
                Name = model.CategoryName
            });
            _unitOfWork.SaveChanges();
        }

        public void Update(CategoryViewModel model)
        {
            var entity = _categoryRepo.GetByID(model.CategoryId);
            entity.Name = model.CategoryName;
            _categoryRepo.Edit(entity);
            _unitOfWork.SaveChanges();
        }
    }
}
