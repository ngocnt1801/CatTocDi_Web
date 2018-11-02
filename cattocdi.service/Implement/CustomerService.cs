using cattocdi.entity;
using cattocdi.repository;
using cattocdi.Service.Interface;
using cattocdi.Service.ViewModel.Salon;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cattocdi.Service.Implement
{
    public class CustomerService : ICustomerService
    {
        private IRepository<Customer> _customerRepo;
        private IUnitOfWork _unitOfWork;
        public CustomerService(IRepository<Customer> customerRepo, IUnitOfWork unitOfWork)
        {
            _customerRepo = customerRepo;
            _unitOfWork = unitOfWork;
        }
        public void CreateCustomerAccount(CustomerViewModel model)
        {
            if (model != null)
            {
                Customer newCustomer = new Customer
                {
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    Gender = model.Gender,
                    AccountId = model.AccountId                    
                };
                _customerRepo.Insert(newCustomer);
                _unitOfWork.SaveChanges(); 
            }
        }
    }
}
