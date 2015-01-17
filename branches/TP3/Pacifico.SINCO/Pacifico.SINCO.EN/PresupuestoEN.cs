using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Pacifico.SINCO.EN
{
    [Table("PRESUPUESTO")]
    public class PresupuestoEN
    {
        [Key]
        [Column("Presupuesto_Id")]
        public int MS_Presupuesto_Id { get; set; }
        [Column("V_NumPresupuesto")]
        public string NumPresupuesto { get; set; }
        [Column("F_Presupuesto")]
        public DateTime FechaPresupuesto { get; set; }
        [Column("R_SubTotal")]
        public float SubTotal { get; set; }
        [Column("R_IGV")]
        public float IGV { get; set; }
        [Column("R_Total")]
        public float Total { get; set; }
        [Column("Estado_Id")]
        public int Estado { get; set; }
        public virtual EstadoEN EstadoEntity { get; set; }

        [Column("V_UsuarioRegistro")]
        public string UsuarioRegistro { get; set; }
        [Column("F_Registro")]
        public DateTime FechaRegistro { get; set; }
        [Column("V_UsuarioModifico")]
        public string UsuarioModifico { get; set; }
        [Column("F_Modifico")]
        public DateTime FechaModifico { get; set; }

        [Column("Informe_Accidente_Id")]
        public int MS_Informe_Accidente_Id { get; set; }
        public virtual InformeAccidenteEN InformeAccidente { get; set; }

        public virtual ICollection<DetallePresupuestoEN> DetallePresupuesto { get; set; }


    }
}