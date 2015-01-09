using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;


namespace Pacifico.SINCO.EN
{
    [Table("MS_Siniestro")]
    public class MSSiniestro
    {
        [Key]
        public int MS_Siniestro_Id { get; set; }
        public string NumSiniestro { get; set; }
        public string Tipo { get; set; }
        public DateTime FechaSiniestro { get; set; }
        public DateTime FechaAtencion { get; set; }
        public string Lugar { get; set; }
        public string Descripcion { get; set; }
        public int Estado { get; set; }

        public string UsuarioRegistro { get; set; }
        public DateTime FechaRegistro { get; set; }
        public string UsuarioModifico { get; set; }
        public DateTime FechaModifico { get; set; }

        public int MP_Poliza_Id { get; set; }
        public virtual MPPoliza Poliza { get; set; } 
    }
}