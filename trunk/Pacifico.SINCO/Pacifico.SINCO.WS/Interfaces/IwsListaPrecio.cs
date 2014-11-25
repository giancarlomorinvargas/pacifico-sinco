﻿using System;
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
    public interface IwsListaPrecio
    {

        [OperationContract]
        string wsObtenerNombreWS();

        [OperationContract]
        string Obtener(int Id);
        [OperationContract]
        string Listar();
        [OperationContract]
        string Buscar(int MarcaId, int ModeloId);

    }
}
