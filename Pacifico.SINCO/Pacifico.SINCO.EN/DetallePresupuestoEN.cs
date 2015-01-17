using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Pacifico.SINCO.EN
{
    [Table("PRESUPUESTO_DETALLE")]
    public class DetallePresupuestoEN
    {
        [Key]
        [Column("Presupuesto_Detalle_Id")]
        public int MS_Detalle_Presupuesto_Id { get; set; }
        [Column("R_Importe")]
        public float Importe { get; set; }
        [Column("R_Descuento")]
        public float Descuento { get; set; }
        [Column("V_Observacion")]
        public string Observacion { get; set; }
        [Column("Presupuesto_Id")]
        public int MS_Presupuesto_Id { get; set; }

        [Column("Lista_Precio_Id")]
        public int MS_Lista_Precio_Id { get; set; }
        public virtual ListaPrecioEN ListaPrecio { get; set; }
    }
}