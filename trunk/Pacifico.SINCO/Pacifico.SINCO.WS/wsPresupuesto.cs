using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WS.Interfaces;

namespace Pacifico.SINCO.WS
{
    public class wsPresupuesto : IwsPresupuesto
    {

        /// <summary>
        /// wsObtenerNombreWS
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public string wsObtenerNombreWS()
        {
            return string.Format(Constantes.sNombreWS_Presupuesto);
        }

    }
}
