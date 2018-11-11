namespace cattocdi.entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Image")]
    public partial class Image
    {
        public int Id { get; set; }

        [Required]
        public string Url { get; set; }

        public int? SalonId { get; set; }

        public virtual Salon Salon { get; set; }
    }
}
