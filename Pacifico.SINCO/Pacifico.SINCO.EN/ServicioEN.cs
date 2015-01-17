using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Pacifico.SINCO.EN
{
    [Table("SERVICIO")]
    public class ServicioEN
    {
        [Key]
        [Column("Servicio_Id")]
        public int MS_Servicio_Id { get; set; }
        [Column("V_Descripcion")]
        public string Descripcion { get; set; }
    }
}