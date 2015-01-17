using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Pacifico.SINCO.EN
{
    [Table("MARCA")]
    public class MarcaEN
    {
        [Key]
        [Column("Marca_Id")]
        public int MP_Marca_Id { get; set; }
        [Column("Descripcion")]
        public string Descripcion { get; set; }
    }
}