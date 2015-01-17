using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Pacifico.SINCO.EN
{
    [Table("ESTADO")]
    public class EstadoEN
    {
        [Key]
        [Column("Estado_Id")]
        public int Estado_Id { get; set; }
        [Column("V_Nombre")]
        public string Nombre { get; set; }
        [Column("V_Descripcion")]
        public string Descripcion { get; set; }
    }
}