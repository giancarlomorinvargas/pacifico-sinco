using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WS.Interfaces;
using Pacifico.SINCO.EN;
using Pacifico.SINCO.RN;
using System.ServiceModel;

namespace Pacifico.SINCO.WS
{
    public class OrdenWS : IOrdenWS
    {
        public string ObtenerNombreWS()
        {
            return string.Format(Constantes.sNombreWS_Orden);
        }

        public OrdenWS()
        {
        }

        public string Agregar(OrdenEN orden)
        {
            try
            {
                OrdenRN ordenRN = new OrdenRN();
                return ordenRN.Agregar(orden);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }               
        }        
    }
}
