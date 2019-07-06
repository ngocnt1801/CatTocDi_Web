using cattocdi.entity;
using cattocdi.repository;
using cattocdi.Service.Interface;
using cattocdi.Service.ViewModel.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cattocdi.Service.Implement
{
    public class StatisticService : IStatisticService
    {
        private IRepository<Customer> _customerRepo;
        private IRepository<Salon> _salonRepo;
        private IRepository<Appointment> _appointmentRepo;
        private IRepository<Promotion> _promotionRepo;

        public StatisticService(IRepository<Customer> customerRepo,
                                IRepository<Salon> salonRepo,
                                IRepository<Appointment> appointmentRepo,
                                IRepository<Promotion> promotionRepo)
        {
            _customerRepo = customerRepo;
            _salonRepo = salonRepo;
            _appointmentRepo = appointmentRepo;
            _promotionRepo = promotionRepo;
        }

        public List<StatisticModel> GetAppointmentsByMonth(int? year = 0)
        {
            if (year == 0)
            {
                year = DateTime.Now.Year;
            }
            List<StatisticModel> list = new List<StatisticModel>();

            for (int i = 1; i <= 12; i++)
            {
                StatisticModel model = new StatisticModel { Month = i };
                model.Value = _appointmentRepo.Gets().Where(a =>   a.BookedDate.Month == i
                                                                && a.BookedDate.Year == year)
                                                   .Count();

            }

            return list;
        }

        public GeneralStatisticModel GetGeneralStatistic()
        {
            return new GeneralStatisticModel
            {
                TotalAppointments = _appointmentRepo.Gets().Count(),
                TotalSalons = _salonRepo.Gets().Count(),
                TotalUsers = _customerRepo.Gets().Count(),
                TotalRunningPromotions = _promotionRepo.Gets().Where(p => p.StartTime <= DateTime.Now && p.EndTime >= DateTime.Now).Count()
            };
        }

        public List<StatisticModel> GetTotalSalonsByMonth(int? year = 0)
        {
            if (year == 0)
            {
                year = DateTime.Now.Year;
            }
            List<StatisticModel> list = new List<StatisticModel>();

            for (int i = 1; i <= 12; i++)
            {
                StatisticModel model = new StatisticModel { Month = i };
                model.Value = _salonRepo.Gets().Where(s => s.RegisterDate.HasValue
                                                                && s.RegisterDate.Value.Month == i
                                                                && s.RegisterDate.Value.Year == year)
                                                   .Count();

            }

            return list;
        }

        public List<StatisticModel> GetTotalUsersByMonth(int? year = 0)
        {
            if (year == 0)
            {
                year = DateTime.Now.Year;
            }
            List<StatisticModel> list = new List<StatisticModel>();

            for(int i = 1; i <=12; i++)
            {
                StatisticModel model = new StatisticModel { Month = i };
                model.Value = _customerRepo.Gets().Where(c => c.RegisterDate.HasValue
                                                                && c.RegisterDate.Value.Month == i
                                                                && c.RegisterDate.Value.Year == year)
                                                   .Count();
                                                   
            }

            return list;
        }
    }
}
