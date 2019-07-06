using cattocdi.Service.ViewModel.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cattocdi.Service.Interface
{
    public interface IStatisticService
    {
        GeneralStatisticModel GetGeneralStatistic();

        List<StatisticModel> GetTotalSalonsByMonth(int? year);

        List<StatisticModel> GetTotalUsersByMonth(int? year);

        List<StatisticModel> GetAppointmentsByMonth(int? year);
    }
}
