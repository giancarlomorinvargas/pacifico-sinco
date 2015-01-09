using MvcAppServicioCarga.Models.ServicioCarga;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Controllers.ServicioCarga.Dto
{
    public class FichaCargaDTO
    {
        public int ID { get; set; }
        public string Ficha { get; set; }
        public DateTime FechaRegistro { get; set; }
        public ClienteDTO Remitente { get; set; }
        /*public int IdClienteRemi { get; set; }
        public string Remitente { get; set; }
        public string RemitDni { get; set; }*/
        public ClienteDTO Destinatario { get; set; }
        /*public int IdClienteDest { get; set; }
        public string Destinatario { get; set; }
        public string DestiDni { get; set; }*/
        public string TipoPago { get; set; }
        public Decimal PesoTotal { get; set; }
        public Decimal ImporteTotal { get; set; }
        public string Observacion { get; set; }
        public string EstadoPago { get; set; }
        public string ClaveSeguridad { get; set; }

        public GuiaRemisionDTO GuiaRemision { get; set; }


        public string EstadoFicha { get; set; }
        public string UsuarioRegistra { get; set; }
        public DateTime FechaRegistra { get; set; }
        public string UsuarioModifica { get; set; }
        public DateTime FechaModifica { get; set; }
    }
}