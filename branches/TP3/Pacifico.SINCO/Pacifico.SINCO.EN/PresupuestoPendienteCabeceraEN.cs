using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.EN
{
   public class PresupuestoPendienteCabeceraEN
    {

        public string NumeroPresupuesto { get; set; }
        public string NumeroInforme { get; set; }
        public string FechaPresupuesto { get; set; }

        public int PresupuestoID { get; set; }
        public string NumeroPoliza { get; set; }
        public string MatriculaVehiculo { get; set; }
        public string SubTotal { get; set; }
        public string Total { get; set; }
        public string Estado { get; set; }
    }
}
