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
    public interface IUtilWS
    {

        [OperationContract]
        string wsObtenerNombreWS();
        
        [OperationContract]
        string ListarPoliza();

        [OperationContract]
        string BuscarPoliza(string dniAsegurado, string numPoliza, string placa);

        [OperationContract]
        string ListarProcurador();

        [OperationContract]
        string BuscarProcurador(string numProcurador, string procurador);

        [OperationContract]
        string ActualizaDisponibilidadProcurador(ProcuradorEN pEnProcurador);

        [OperationContract]
        string ObtenerProcurador(int id);
    }

}
