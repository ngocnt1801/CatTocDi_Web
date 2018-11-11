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
    public class ImageService : IImageService
    {
        private IRepository<Image> _imageRepo;
        private IRepository<Salon> _salonRepo;
        private IUnitOfWork _unitOfWork;
        public ImageService(IRepository<Image> imageRepo, IRepository<Salon> salonRepo, IUnitOfWork unitOfWork)
        {
            _imageRepo = imageRepo;
            _salonRepo = salonRepo;
            _unitOfWork = unitOfWork;
        }
        public void AddImage(string accountId, string url)
        {
            var salon = _salonRepo.Gets().Where(s => s.AccountId == accountId).FirstOrDefault();             
            if (salon != null) {
                Image newImage = new Image
                {
                    SalonId = salon.Id,
                    Url = url
                };
                _imageRepo.Insert(newImage);
                _unitOfWork.SaveChanges();
            }
        }
    }
}
