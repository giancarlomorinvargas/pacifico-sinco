using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Runtime.Serialization;
using System.ServiceModel;
using Pacifico.SINCO.EN;

namespace Pacifico.SINCO.WS.Interfaces
{
    [ServiceContract]
    public interface IOrdenWS
    {
        [OperationContract]
        string ObtenerNombreWS();
        [OperationContract]
        string Agregar(OrdenEN model);        
    }
}
