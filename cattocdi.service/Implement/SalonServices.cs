using cattocdi.entity;
using cattocdi.repository;
using cattocdi.Service.Interface;
using cattocdi.Service.ViewModel;
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
        private IUnitOfWork _unitOfWork;
        public SalonServices(IRepository<Salon> salonRepo, IUnitOfWork unitOfWork)
        {
            _salonRepo = salonRepo;
            _unitOfWork = unitOfWork;
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
                _salonRepo.Save();
            }
        }
    }
}
