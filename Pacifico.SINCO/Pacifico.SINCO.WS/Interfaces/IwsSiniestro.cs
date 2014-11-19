using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Runtime.Serialization;
using System.ServiceModel;

namespace Pacifico.SINCO.WS.Interfaces
{
    [ServiceContract]
    public interface IwsSiniestro
    {

        [OperationContract]
        string wsObtenerNombreWS();

    }
}
