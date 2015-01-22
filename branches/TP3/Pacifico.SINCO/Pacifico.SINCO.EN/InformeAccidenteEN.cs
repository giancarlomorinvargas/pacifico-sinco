using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;


namespace Pacifico.SINCO.EN
{
    [Table("INFORME_ACCIDENTE")]
    public class InformeAccidenteEN
    {
        [Key]
        [Column("Informe_Accidente_Id")]
        public int MS_Informe_Accidente_Id { get; set; }
        [Column("V_NumInforme")]
        public string NumInforme { get; set; }
        [Column("F_Informe")]
        public DateTime FechaInforme { get; set; }
        [Column("V_Distrito")]
        public string Distrito { get; set; }
        [Column("V_Direccion")]
        public string Direccion { get; set; }
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
        public int MS_Siniestro_Id { get; set; }
        public virtual SiniestroEN Siniestro { get; set; }


        [Column("Tecnico_Id")]
        public int? TecnicoId { get; set; }
        public virtual TecnicoEN Tecnico { get; set; }
        
    }
}