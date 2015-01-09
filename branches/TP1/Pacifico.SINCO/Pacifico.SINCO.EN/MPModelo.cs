using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace Pacifico.SINCO.EN
{
    [Table("MP_Modelo")]
    public class MPModelo
    {
        [Key]
        public int MP_Modelo_Id { get; set; }
        public string Descripcion { get; set; }
    }
}