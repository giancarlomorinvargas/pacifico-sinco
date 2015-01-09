using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Pacifico.SINCO.EN
{
    [Table("MP_Marca")]
    public class MPMarca
    {
        [Key]
        public int MP_Marca_Id { get; set; }
        public string Descripcion { get; set; }
    }
}