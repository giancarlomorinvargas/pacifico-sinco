using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Models.ServicioCarga
{
    [Table("MG_PRODUCTO")]
    public class MGProducto
    {
        [Key]
        public int MG_Producto_ID { get; set; }
        public string Descripcion { get; set; }


        //public virtual ICollection<MGDetalleFCarga> DetalleFichaCarga { get; set; }
    }
}