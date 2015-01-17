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
    public interface IPresupuestoWS
    {

        [OperationContract]
        string wsObtenerNombreWS();

        [OperationContract]
        string ObtenerPresupuesto(int id);
        [OperationContract]
        string ListarPresupuesto();
        [OperationContract]
        string BuscarPresupuesto(string numPresupuesto, string numInforme, string numPoliza, string fechaPresupuesto);
        [OperationContract]
        string AgregarPresupuesto(PresupuestoEN presupuesto);
        [OperationContract]
        string ModificarPresupuesto(PresupuestoEN presupuesto, List<DetallePresupuestoEN> destallePresupuesto);

    }
}
