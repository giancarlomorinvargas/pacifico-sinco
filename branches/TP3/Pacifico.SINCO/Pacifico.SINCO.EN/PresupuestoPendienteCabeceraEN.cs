using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.EN
{
   public class PresupuestoPendienteCabeceraEN
    {
        public int PresupuestoID { get; set; }
        public string NumeroPoliza { get; set; }
        public string MatriculaVehiculo { get; set; }
        public string SubTotal { get; set; }
        public string Total { get; set; }
        public int Estado { get; set; }
    }
}
