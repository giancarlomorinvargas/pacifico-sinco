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
        string Buscar(string numPoliza, string tipoSiniestro, string fechaSiniestro);
        [OperationContract]
        string BuscarParaPresupuesto(string numInforme, string asegurado);       
        [OperationContract]
        string Agregar(InformeAccidenteEN model);
        [OperationContract]
        string Modificar(InformeAccidenteEN model);
        [OperationContract]
        string PendienteEvaluar(int siniestroId, int tecnicoid);
        [OperationContract]
        string ReversaPendienteEvaluar(int siniestroId);

    }
}
