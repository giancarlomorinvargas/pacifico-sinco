using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Models.ServicioCarga
{
    [Table("MK_UNIDADTRANSPORTE")]
    public class MGVehiculo
    {
        [Key]
        public int IdVehiculo { get; set; }
        public string Placa { get; set; }

    }
}