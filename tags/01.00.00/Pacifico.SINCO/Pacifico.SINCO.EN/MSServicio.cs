using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Pacifico.SINCO.EN
{
    [Table("MS_Servicio")]
    public class MSServicio
    {
        [Key]
        public int MS_Servicio_Id { get; set; }
        public string Descripcion { get; set; }
    }
}