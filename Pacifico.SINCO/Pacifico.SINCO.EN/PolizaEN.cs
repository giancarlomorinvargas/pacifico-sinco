using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;


namespace Pacifico.SINCO.EN
{
    [Table("POLIZA")]
    public class PolizaEN
    {
        [Key]
        [Column("Poliza_Id")]
        public int MP_Poliza_Id { get; set; }
        [Column("NumPoliza")]
        public string NumPoliza { get; set; }
        [Column("F_Inicio")]
        public DateTime FechaInicio { get; set; }
        [Column("F_Fin")]
        public DateTime FechaFin { get; set; }
        [Column("MontoCobertura")]
        public float MontoCobertura { get; set; }

        [Column("UsuarioRegistro")]
        public string UsuarioRegistro { get; set; }
        [Column("F_Registro")]
        public DateTime FechaRegistro { get; set; }
        [Column("UsuarioModifico")]
        public string UsuarioModifico { get; set; }
        [Column("F_Modifico")]
        public DateTime FechaModifico { get; set; }

        [Column("Asegurado_ID")]
        public int MP_Asegurado_ID { get; set; }
        public virtual AseguradoEN Asegurado { get; set; }

        [Column("Vehiculo_ID")]
        public int MP_Vehiculo_ID { get; set; }
        public virtual VehiculoEN Vehiculo { get; set; }
    }
}