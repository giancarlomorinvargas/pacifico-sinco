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
    public interface ITecnicoWS
    {

        [OperationContract]
        string wsObtenerNombreWS();


        [OperationContract]
        string Obtener(int id);

        [OperationContract]
        string Listar();

        [OperationContract]
        string ConsultarDisponibilidad(string codigoTecnico, string tecnico);

        [OperationContract]
        string ActualizaDisponibilidad(TecnicoEN tecnico);

    }
}
