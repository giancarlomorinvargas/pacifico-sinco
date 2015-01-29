using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.EN
{
   public class PresupuestoPendienteDetalleEN
    {
        public string Servicio { get; set; }
        public int Cantidad { get; set; }

        public string Precio { get; set; }

        public string Importe { get; set; }
        public string Descuento { get; set; }
    }
}
