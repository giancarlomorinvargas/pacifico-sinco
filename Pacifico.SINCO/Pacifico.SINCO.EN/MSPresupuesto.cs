using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Pacifico.SINCO.EN
{
    [Table("MS_Presupuesto")]
    public class MSPresupuesto
    {
        [Key]
        public int MS_Presupuesto_Id { get; set; }
        public string NumPresupuesto { get; set; }
        //[DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime FechaPresupuesto { get; set; }
        public float SubTotal { get; set; }
        public float IGV { get; set; }
        public float Total { get; set; }
        public int Estado { get; set; }
        public virtual Estado EstadoEntity { get; set; }

        public string UsuarioRegistro { get; set; }
        public DateTime FechaRegistro { get; set; }
        public string UsuarioModifico { get; set; }
        public DateTime FechaModifico { get; set; }

        public int MS_Informe_Accidente_Id { get; set; }
        public virtual MSInformeAccidente InformeAccidente { get; set; }

        public virtual ICollection<MSDetallePresupuesto> DetallePresupuesto { get; set; }


    }
}