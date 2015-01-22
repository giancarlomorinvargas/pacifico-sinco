using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Pacifico.SINCO.EN
{
    [Table("TALLER")]
    public class TallerEN
    {
        [Key]
        [Column("Taller_Id")]
        public int TallerId { get; set; }
        [Column("V_Nombre")]
        public string Nombre { get; set; }
        [Column("V_Distrito")]
        public string Distrito { get; set; }
        [Column("V_Direccion")]
        public string Direccion { get; set; }
    }
}