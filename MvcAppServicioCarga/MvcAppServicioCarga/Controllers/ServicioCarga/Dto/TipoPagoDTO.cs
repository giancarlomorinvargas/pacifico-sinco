using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Models.ServicioCarga
{
    public class TipoPagoDTO
    {
        public string Id { get; set; }
        public string Descripcion { get; set; }
    }
}