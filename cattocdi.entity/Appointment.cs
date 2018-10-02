namespace cattocdi.entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Appointment")]
    public partial class Appointment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Appointment()
        {
            ServiceAppointments = new HashSet<ServiceAppointment>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int AppointmentId { get; set; }

        public int? CustomerId { get; set; }

        public int? StaffId { get; set; }

        [Column(TypeName = "date")]
        public DateTime? BookedDate { get; set; }

        public TimeSpan? StartHour { get; set; }

        public TimeSpan? EndHour { get; set; }

        public bool? IsCompleted { get; set; }

        public int? StatusId { get; set; }

        public virtual AppointmentStatu AppointmentStatu { get; set; }

        public virtual Customer Customer { get; set; }

        public virtual Staff Staff { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ServiceAppointment> ServiceAppointments { get; set; }
    }
}
