using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Models.Siniestro
{
    [Table("MS_Detalle_Presupuesto")]
    public class MSDetallePresupuesto
    {
        [Key]
        public int MS_Detalle_Presupuesto_Id { get; set; }
        public float Importe { get; set; }
        public float Descuento { get; set; }
        public string Observacion { get; set; }

        public int MS_Presupuesto_Id { get; set; }


        public int MS_Lista_Precio_Id { get; set; }
        public virtual MSListaPrecio ListaPrecio { get; set; }
    }
}