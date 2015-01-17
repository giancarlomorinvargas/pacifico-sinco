using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Pacifico.SINCO.EN
{
    [Table("ASEGURADO")]
    public class Asegurado
    {
        [Key]
        [Column("Asegurado_Id")]
        public int MP_Asegurado_Id { get; set; }
        [Column("DniAsegurado")]
        public string DniAsegurado { get; set; }
        [Column("V_Nombre")]
        public string Nombre { get; set; }
        [Column("V_ApellidoPaterno")]
        public string ApellidoPaterno { get; set; }
        [Column("V_ApellidoMaterno")]
        public string ApellidoMaterno { get; set; }
        [Column("F_Nacimiento")]
        public DateTime FechaNacimiento { get; set; }
    }
}