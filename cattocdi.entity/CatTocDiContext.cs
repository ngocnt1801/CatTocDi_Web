namespace cattocdi.entity
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class CatTocDiContext : DbContext
    {
        public CatTocDiContext()
            : base("name=CatTocDi")
        {
        }

        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<Appointment> Appointments { get; set; }
        public virtual DbSet<AppointmentStatu> AppointmentStatus { get; set; }
        public virtual DbSet<AspNetRole> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Salon> Salons { get; set; }
        public virtual DbSet<SalonRegistration> SalonRegistrations { get; set; }
        public virtual DbSet<SalonService> SalonServices { get; set; }
        public virtual DbSet<Schedule> Schedules { get; set; }
        public virtual DbSet<Service> Services { get; set; }
        public virtual DbSet<ServiceAppointment> ServiceAppointments { get; set; }
        public virtual DbSet<ServiceCategory> ServiceCategories { get; set; }
        public virtual DbSet<Staff> Staffs { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<TimeSlot> TimeSlots { get; set; } 
        public virtual DbSet<Voucher> Vouchers { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Appointment>()
                .HasMany(e => e.ServiceAppointments)
                .WithRequired(e => e.Appointment)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<AspNetRole>()
                .HasMany(e => e.AspNetUsers)
                .WithMany(e => e.AspNetRoles)
                .Map(m => m.ToTable("AspNetUserRoles").MapLeftKey("RoleId").MapRightKey("UserId"));

            modelBuilder.Entity<AspNetUser>()
                .HasMany(e => e.AspNetUserClaims)
                .WithRequired(e => e.AspNetUser)
                .HasForeignKey(e => e.UserId);

            modelBuilder.Entity<AspNetUser>()
                .HasMany(e => e.AspNetUserLogins)
                .WithRequired(e => e.AspNetUser)
                .HasForeignKey(e => e.UserId);

            modelBuilder.Entity<AspNetUser>()
                .HasMany(e => e.Customers)
                .WithOptional(e => e.AspNetUser)
                .HasForeignKey(e => e.AccountId);

            modelBuilder.Entity<AspNetUser>()
                .HasMany(e => e.Salons)
                .WithOptional(e => e.AspNetUser)
                .HasForeignKey(e => e.AccountId);

            modelBuilder.Entity<Customer>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Salon>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<Salon>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<SalonService>()
                .HasMany(e => e.ServiceAppointments)
                .WithRequired(e => e.SalonService)
                .HasForeignKey(e => e.ServiceId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ServiceCategory>()
                .HasMany(e => e.Services)
                .WithRequired(e => e.ServiceCategory)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Voucher>()
                .Property(e => e.VoucherCode)
                .IsUnicode(false);
        }
    }
}
