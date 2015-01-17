using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace Pacifico.SINCO.EN
{
    [Table("MODELO")]
    public class ModeloEN
    {
        [Key]
        [Column("Modelo_Id")]
        public int MP_Modelo_Id { get; set; }
        [Column("Descripcion")]
        public string Descripcion { get; set; }
    }
}