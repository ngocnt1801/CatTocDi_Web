namespace cattocdi.entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Voucher")]
    public partial class Voucher
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int VoucherId { get; set; }

        [StringLength(50)]
        public string VoucherCode { get; set; }

        public string Description { get; set; }

        public int? SalonId { get; set; }

        public DateTime? StartDate { get; set; }

        public DateTime? EndDate { get; set; }

        public virtual Salon Salon { get; set; }
    }
}
