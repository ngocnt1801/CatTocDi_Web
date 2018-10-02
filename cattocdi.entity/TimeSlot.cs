namespace cattocdi.entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TimeSlot")]
    public partial class TimeSlot
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int SlotId { get; set; }

        public int? ScheduleId { get; set; }

        public TimeSpan? StartHour { get; set; }

        public TimeSpan? EndHour { get; set; }

        public virtual Schedule Schedule { get; set; }
    }
}
