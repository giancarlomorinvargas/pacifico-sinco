using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Pacifico.SINCO.EN
{
    [Table("Estado")]
    public class Estado
    {
        [Key]
        public int Estado_Id { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
    }
}