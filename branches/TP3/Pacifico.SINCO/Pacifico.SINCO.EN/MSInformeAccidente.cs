using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;


namespace Pacifico.SINCO.EN
{
    [Table("MS_Informe_Accidente")]
    public class MSInformeAccidente
    {
        [Key]
        public int MS_Informe_Accidente_Id { get; set; }
        public string NumInforme { get; set; }
        public DateTime FechaInforme { get; set; }
        public string Distrito { get; set; }
        public string Direccion { get; set; }
        public int Estado { get; set; }
        public virtual Estado EstadoEntity { get; set; }

        public string UsuarioRegistro { get; set; }
        public DateTime FechaRegistro { get; set; }
        public string UsuarioModifico { get; set; }
        public DateTime FechaModifico { get; set; }


        public int MS_Siniestro_Id { get; set; }
        public virtual MSSiniestro Siniestro { get; set; }


        public int? MS_Tecnico_Taller_Id { get; set; }
        //public virtual MSTecnicoTaller TecnicoTaller { get; set; }
        
    }
}