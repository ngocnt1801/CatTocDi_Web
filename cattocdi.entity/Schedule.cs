namespace cattocdi.entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Schedule")]
    public partial class Schedule
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Schedule()
        {
            TimeSlots = new HashSet<TimeSlot>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ScheduleId { get; set; }

        public int? RegistrationId { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Date { get; set; }

        public virtual SalonRegistration SalonRegistration { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TimeSlot> TimeSlots { get; set; }
    }
}
