using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;


namespace Pacifico.SINCO.EN
{
    [Table("MP_Poliza")]
    public class MPPoliza
    {
        [Key]
        public int MP_Poliza_Id { get; set; }
        public string NumPoliza { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public float MontoCobertura { get; set; }

        public string UsuarioRegistro { get; set; }
        public DateTime FechaRegistro { get; set; }
        public string UsuarioModifico { get; set; }
        public DateTime FechaModifico { get; set; }

        public int MP_Asegurado_ID { get; set; }
        public virtual MPAsegurado Asegurado { get; set; }

        public int MP_Vehiculo_ID { get; set; }
        public virtual MPVehiculo Vehiculo { get; set; }
    }
}