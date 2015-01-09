using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Models.ServicioCarga
{
    [Table("MK_PROGRAMACIONRUTA")]
    public class MGProgramacionRuta
    {
        [Key]
        public int IdProgramacionRuta { get; set; }
        public DateTime FechaOrigen { get; set; }
        public DateTime FechaDestino { get; set; }


        public int? IdVehiculo { get; set; }
        public virtual MGVehiculo Vehiculo { get; set; }


        public int? IdRuta { get; set; }
        public virtual MGRuta Ruta { get; set; }


        public virtual ICollection<MGGuiaRemision> GuiasRemision { get; set; }

        public virtual ICollection<MGFichaCarga> FichasCarga { get; set; }
    }
}