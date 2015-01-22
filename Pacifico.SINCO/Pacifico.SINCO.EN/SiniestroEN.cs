using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;


namespace Pacifico.SINCO.EN
{
    [Table("SINIESTRO")]
    public class SiniestroEN
    {
        [Key]
        [Column("Siniestro_Id")]
        public int MS_Siniestro_Id { get; set; }
        [Column("V_NumSiniestro")]
        public string NumSiniestro { get; set; }
        [Column("V_Tipo")]
        public string Tipo { get; set; }
        [Column("F_Siniestro")]
        public DateTime FechaSiniestro { get; set; }
        [Column("F_Atencion")]
        public DateTime FechaAtencion { get; set; }
        [Column("V_Lugar")]
        public string Lugar { get; set; }
        [Column("V_Descripcion")]
        public string Descripcion { get; set; }
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

        [Column("Poliza_Id")]
        public int MP_Poliza_Id { get; set; }
        public virtual PolizaEN Poliza { get; set; }

        [Column("Procurador_Id")]
        public int MS_Procurador_Id { get; set; }
        public virtual ProcuradorEN Procurador { get; set; }

        [Column("Tecnico_Id")]
        public int? TecnicoId { get; set; }
    }
}