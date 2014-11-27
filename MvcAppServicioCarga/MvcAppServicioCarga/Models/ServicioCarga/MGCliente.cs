using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Models.ServicioCarga
{
    [Table("MG_CLIENTE")]
    public class MGCliente
    {
        [Key]
        public int MG_Cliente_ID { get; set; }
        public string Nombres { get; set; }
        public string ApellidosPaterno { get; set; }
        public string ApellidosMaterno { get; set; }
        public string Direccion { get; set; }
        public string TipoDocumento { get; set; }
        public string Documento { get; set; }

        public virtual ICollection<MGFichaCarga> FichasCargaRemitente { get; set; }
        public virtual ICollection<MGFichaCarga> FichasCargaDestinatario { get; set; }
    }
}