using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;


namespace MvcAppServicioCarga.Models.ServicioCarga
{
    [Table("MG_FICHACARGA")]
    public class MGFichaCarga
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int MG_FichaCarga_ID { get; set; }
        //public string Ficha { get; set; }
        public DateTime FechaRegistro { get; set; }

        public int MG_Remitente_ID { get; set; }
        public virtual MGCliente Remitente { get; set; }

        /*public int MG_Remitente_ID { get; set; }
        public string Remitente { get; set; }
        public string RemitDni { get; set; }*/

        public int MG_Destinatario_ID { get; set; }
        public virtual MGCliente Destinatario { get; set; }
        /*public int MG_Destinatario_ID { get; set; }
        public string Destinatario { get; set; }
        public string DestiDni { get; set; }*/

        public string TipoPago { get; set; }
        public float PesoTotal { get; set; }
        public float ImporteTotal { get; set; }
        public string Observacion { get; set; }
        public bool EstadoPago { get; set; }
        public string ClaveSeguridad { get; set; }
        public DateTime FechaEntrega { get; set; }

        [NotMapped]
        public string ClaveSeguridadIngresada { get; set; }
        [NotMapped]
        public string ComprobantePagoIDIngresado { get; set; }


        /*public int MG_GuiaRemision_ID { get; set; }
        public virtual MGGuiaRemision GuiaRemision { get; set; }*/


        public int MK_ProgramacionRuta_ID { get; set; }
        public virtual MGProgramacionRuta ProgramacionRuta { get; set; }

        public virtual ICollection<MGDetalleFCarga> DetalleFichaCarga { get; set; }


        //public int MG_Comprobante_FichaCarga_ID { get; set; }
        public virtual MGComprobantePago ComprobantePago { get; set; }

        public int Estado { get; set; }
        public virtual MGTipoMovimiento MGTipoMovimiento { get; set; }

        public string UsuarioRegistra { get; set; }
        public DateTime FechaRegistra { get; set; }
        public string UsuarioModifica { get; set; }
        public DateTime FechaModifica { get; set; }
        
    }
}