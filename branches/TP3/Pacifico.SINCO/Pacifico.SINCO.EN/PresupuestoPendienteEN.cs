using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.EN
{
   public class PresupuestoPendienteEN
    {

        public int MS_Presupuesto_Id { get; set; }

        public string NumPresupuesto { get; set; }

        public DateTime FechaPresupuesto { get; set; }

        public float SubTotal { get; set; }

        public float IGV { get; set; }

        public float Total { get; set; }

        public int Estado { get; set; }

        public string UsuarioRegistro { get; set; }

        public DateTime FechaRegistro { get; set; }

        public string UsuarioModifico { get; set; }

        public DateTime FechaModifico { get; set; }

        public int MS_Informe_Accidente_Id { get; set; }
    }
}
