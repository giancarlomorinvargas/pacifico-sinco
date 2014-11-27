using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Models.ServicioCarga
{
    [Table("MG_COMPROBANTEPAGO")]
    public class MGComprobantePago
    {
        [Key]
        public int MG_Comprobante_FichaCarga_ID { get; set; }
        public string MG_ComprobantePago_ID { get; set; }
        public DateTime FechaRegistro { get; set; }


        public virtual MGFichaCarga FichaCarga { get; set; }
    }
}