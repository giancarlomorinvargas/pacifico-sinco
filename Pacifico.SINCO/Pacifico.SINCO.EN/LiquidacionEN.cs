using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.EN
{
    [Table("LIQUIDACION")]
    public class LiquidacionEN
    {
        [Key]
        [Column("Liquidacion_Id")]
        public int LiquidacionId { get; set; }
        [Column("V_NumLiquidacion")]
        public string NumLiquidacion { get; set; }
        [Column("F_Liquidacion")]
        public DateTime FechaLiquidacion { get; set; }
        [Column("V_Descripcion")]
        public string Descripcion { get; set; }
        [Column("R_MontoLiquidacion")]
        public float MontoLiquidacion { get; set; }
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

        [Column("Siniestro_Id")]
        public int SiniestroId { get; set; }
        public virtual SiniestroEN Siniestro { get; set; }
    }
}
