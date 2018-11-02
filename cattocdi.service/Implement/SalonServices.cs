using cattocdi.entity;
using cattocdi.repository;
using cattocdi.Service.Interface;
using cattocdi.Service.ViewModel;
using cattocdi.Service.ViewModel.Salon;
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
        private IRepository<Promotion> _promotionRepo;        
        private IUnitOfWork _unitOfWork;

        public SalonServices(IRepository<Salon> salonRepo, IUnitOfWork unitOfWork, IRepository<Promotion> promotionRepo)
        {
            _salonRepo = salonRepo;
            _unitOfWork = unitOfWork;
            _promotionRepo = promotionRepo;
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

        public SalonProfileViewModel GetSalonProfile(string accountId)
        {
            var salon = _salonRepo.Gets()
                    .Where(s => s.AccountId == accountId)
                    .Select(s => new SalonProfileViewModel
                    {
                        SalonId = s.Id,
                        Address = s.Address,
                        Name = s.Name,
                        Phone = s.Phone,
                        IsForMen = s.IsForMen ?? false,
                        IsForWomen = s.IsForWomen ?? false,     
                        Services = s.SalonServices.Select(se => new SalonServiceViewModel{
                                     Id = se.Id,
                                     ServiceId = se.ServiceId,
                                     CategoryId = se.Service.CategoryId,
                                     CategoryName = se.Service.ServiceCategory.Name,
                                     Price = se.Price ?? 0,
                                     AvarageTime = se.AvarageTime ?? 0,
                                     ServiceName = se.Service.Name
                                }).ToList()
                    }).FirstOrDefault();           
            return salon; 
        }
    }
}
