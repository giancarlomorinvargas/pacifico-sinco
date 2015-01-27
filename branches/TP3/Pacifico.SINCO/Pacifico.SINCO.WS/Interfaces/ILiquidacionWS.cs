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
    public interface ILiquidacionWS
    {

        [OperationContract]
        string ObtenerNombreWS();

        [OperationContract]
        string Obtener(int Id);
        [OperationContract]
        string Listar();
        [OperationContract]
        string Buscar(string numLiquidacion, string tipoSiniestro, string fechaLiquidacion);
        [OperationContract]
        string Agregar(LiquidacionEN model);
        [OperationContract]
        string Modificar(LiquidacionEN model);

    }
}
