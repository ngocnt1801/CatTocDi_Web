namespace cattocdi.entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Promotion")]
    public partial class Promotion
    {
        [Key]
        [Column(Order = 0)]
        public int Id { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int SalonId { get; set; }

        [Key]
        [Column(Order = 2)]
        public DateTime StartTime { get; set; }

        [Key]
        [Column(Order = 3)]
        public DateTime EndTime { get; set; }

        [Key]
        [Column(Order = 4)]
        public double DiscountPercent { get; set; }

        public string Description { get; set; }

        public virtual Salon Salon { get; set; }
    }
}
