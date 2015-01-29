using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Pacifico.SINCO.EN
{
    [Table("ORDEN")]
    public class OrdenEN
    {
        [Key]
        [Column("Orden_Id")]
        public int OrdenId { get; set; }
        [Column("V_NumOrden")]
        public string NumOrden { get; set; }
        [Column("R_DescuentoOrden")]
        public float DescuentoOrden { get; set; }
        [Column("F_Orden")]
        public DateTime FechaOrden { get; set; }

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

        [Column("Liquidacion_Id")]
        public int LiquidacionId { get; set; }
        public virtual LiquidacionEN Liquidacion { get; set; }
    }
}

