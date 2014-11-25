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
    public interface IwsPresupuesto
    {

        [OperationContract]
        string wsObtenerNombreWS();

        [OperationContract]
        MSPresupuesto ObtenerPresupuesto(int Id);
        [OperationContract]
        List<MSPresupuesto> ListarPresupuesto();
        [OperationContract]
        List<MSPresupuesto> BuscarPresupuesto(string NumPresupuesto, string NumInforme, string NumPoliza);
        [OperationContract]
        string AgregarPresupuesto(MSPresupuesto FichaCarga);
        [OperationContract]
        string ModificarPresupuesto(MSPresupuesto FichaCarga, List<MSDetallePresupuesto> DestalleFichaCarga);

    }
}
