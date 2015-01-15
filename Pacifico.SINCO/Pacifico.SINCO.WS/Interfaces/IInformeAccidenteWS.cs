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
    public interface IInformeAccidenteWS
    {

        [OperationContract]
        string ObtenerNombreWS();

        [OperationContract]
        string Obtener(int Id);
        [OperationContract]
        string Listar();
        [OperationContract]
        string Buscar(string NumPoliza, string TipoSiniestro, string FechaSiniestro);
        [OperationContract]
        string Agregar(InformeAccidente model);
        [OperationContract]
        string Modificar(InformeAccidente model);

    }
}
