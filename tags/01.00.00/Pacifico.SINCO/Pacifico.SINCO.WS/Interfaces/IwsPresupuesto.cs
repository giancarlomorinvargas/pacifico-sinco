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
        string ObtenerPresupuesto(int Id);
        [OperationContract]
        string ListarPresupuesto();
        [OperationContract]
        string BuscarPresupuesto(string NumPresupuesto, string NumInforme, string NumPoliza, string FechaPresupuesto);
        [OperationContract]
        string AgregarPresupuesto(MSPresupuesto Presupuesto);
        [OperationContract]
        string ModificarPresupuesto(MSPresupuesto Presupuesto, List<MSDetallePresupuesto> DestallePresupuesto);

    }
}
