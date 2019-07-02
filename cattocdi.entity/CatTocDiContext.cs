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
        public virtual DbSet<Appointment> Appointment { get; set; }
        public virtual DbSet<AspNetRoles> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaims> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogins> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUsers> AspNetUsers { get; set; }
        public virtual DbSet<ClosedDay> ClosedDay { get; set; }
        public virtual DbSet<Customer> Customer { get; set; }
        public virtual DbSet<Image> Image { get; set; }
        public virtual DbSet<Promotion> Promotion { get; set; }
        public virtual DbSet<Review> Review { get; set; }
        public virtual DbSet<Salon> Salon { get; set; }
        public virtual DbSet<SalonService> SalonService { get; set; }
        public virtual DbSet<Service> Service { get; set; }
        public virtual DbSet<ServiceAppointment> ServiceAppointment { get; set; }
        public virtual DbSet<ServiceCategory> ServiceCategory { get; set; }
        public virtual DbSet<SlotAppointment> SlotAppointment { get; set; }
        public virtual DbSet<SlotTime> SlotTime { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<TimeSlot> TimeSlot { get; set; }
        public virtual DbSet<WorkingHour> WorkingHour { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Appointment>()
                .HasMany(e => e.Review)
                .WithRequired(e => e.Appointment)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Appointment>()
                .HasMany(e => e.ServiceAppointment)
                .WithRequired(e => e.Appointment)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<AspNetRoles>()
                .HasMany(e => e.AspNetUsers)
                .WithMany(e => e.AspNetRoles)
                .Map(m => m.ToTable("AspNetUserRoles").MapLeftKey("RoleId").MapRightKey("UserId"));

            modelBuilder.Entity<AspNetUsers>()
                .HasMany(e => e.AspNetUserClaims)
                .WithRequired(e => e.AspNetUsers)
                .HasForeignKey(e => e.UserId);

            modelBuilder.Entity<AspNetUsers>()
                .HasMany(e => e.AspNetUserLogins)
                .WithRequired(e => e.AspNetUsers)
                .HasForeignKey(e => e.UserId);

            modelBuilder.Entity<AspNetUsers>()
                .HasMany(e => e.Customer)
                .WithRequired(e => e.AspNetUsers)
                .HasForeignKey(e => e.AccountId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<AspNetUsers>()
                .HasMany(e => e.Salon)
                .WithRequired(e => e.AspNetUsers)
                .HasForeignKey(e => e.AccountId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .HasMany(e => e.Appointment)
                .WithRequired(e => e.Customer)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Image>()
                .Property(e => e.Url)
                .IsUnicode(false);

            modelBuilder.Entity<Salon>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Salon>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Salon>()
                .HasMany(e => e.ClosedDay)
                .WithRequired(e => e.Salon)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Salon>()
                .HasMany(e => e.Promotion)
                .WithRequired(e => e.Salon)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Salon>()
                .HasMany(e => e.SalonService)
                .WithRequired(e => e.Salon)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Salon>()
                .HasMany(e => e.SlotTime)
                .WithRequired(e => e.Salon)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Salon>()
                .HasMany(e => e.WorkingHour)
                .WithRequired(e => e.Salon)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SalonService>()
                .HasMany(e => e.ServiceAppointment)
                .WithRequired(e => e.SalonService)
                .HasForeignKey(e => e.ServiceId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Service>()
                .HasMany(e => e.SalonService)
                .WithRequired(e => e.Service)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ServiceCategory>()
                .HasMany(e => e.Service)
                .WithRequired(e => e.ServiceCategory)
                .HasForeignKey(e => e.CategoryId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SlotTime>()
                .HasMany(e => e.SlotAppointment)
                .WithOptional(e => e.SlotTime)
                .HasForeignKey(e => e.SlotId);
        }
    }
}
