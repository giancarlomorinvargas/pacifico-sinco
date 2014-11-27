using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Models.ServicioCarga
{
    public class GuiaRemisionDTO
    {
        public int ID { get; set; }
        public string GuiaRemision { get; set; }
        public DateTime FechaTraslado { get; set; }
    }
}