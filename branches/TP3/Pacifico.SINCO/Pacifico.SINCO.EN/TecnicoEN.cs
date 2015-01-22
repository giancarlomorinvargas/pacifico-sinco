using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Pacifico.SINCO.EN
{
    [Table("TECNICO")]
    public class TecnicoEN
    {
        [Key]
        [Column("Tecnico_Id")]
        public int TecnicoId { get; set; }
        [Column("NumTecnico")]
        public string NumTecnico { get; set; }
        [Column("V_Nombre")]
        public string Nombre { get; set; }
        [Column("V_ApellidoPaterno")]
        public string ApellidoPaterno { get; set; }
        [Column("V_ApellidoMaterno")]
        public string ApellidoMaterno { get; set; }
        [Column("V_Telefono")]
        public string Telefono { get; set; }
        [Column("B_Disponible")]
        public bool Disponible { get; set; }

        [Column("Taller_Id")]
        public int TallerId { get; set; }
        public virtual TallerEN Taller { get; set; }
    }
}