using cattocdi.Service.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using cattocdi.Service.ViewModel.User;
using cattocdi.repository;
using cattocdi.entity;

namespace cattocdi.Service.Implement
{
   public class CategoryServices : ICategoryServices
    {
        private IRepository<ServiceCategory> _categoryRepo;
        private IUnitOfWork _unitOfWork;
        public CategoryServices(IRepository<ServiceCategory> categoryRepo, IUnitOfWork unitOfWork)
        {
            _categoryRepo = categoryRepo;
            _unitOfWork = unitOfWork;
        }

        public void Delete(int id)
        {
            _categoryRepo.Delete(id);
            _unitOfWork.SaveChanges();
        }

        public IEnumerable<CategoryViewModel> GetAllCategory()
        {
            var cateGories = _categoryRepo.Gets().Select(s => new CategoryViewModel
            {
                CategoryName = s.Name,
                CategoryId = s.Id,
                Services = s.Service.Select(p => new ServiceViewModel
                {
                    CategoryId = p.CategoryId,
                    ServiceName = p.Name,
                    ServiceId = p.Id
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
