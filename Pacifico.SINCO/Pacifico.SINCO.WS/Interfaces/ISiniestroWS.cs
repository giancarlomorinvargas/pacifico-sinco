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
    public interface ISiniestroWS
    {

        [OperationContract]
        string wsObtenerNombreWS();

        [OperationContract]
        string Listar();

        [OperationContract]
        string Buscar(string numPoliza, string tipo, string fecRegistro);

        [OperationContract]
        string Obtener(int id);

        [OperationContract]
        string Ingresar(SiniestroEN siniestro);

        [OperationContract]
        string Actualizar(SiniestroEN siniestro);

        [OperationContract]
        string RegistrarProceso(int id);
        
        [OperationContract]
        string RegistrarPendiente(int id);
    }
}
