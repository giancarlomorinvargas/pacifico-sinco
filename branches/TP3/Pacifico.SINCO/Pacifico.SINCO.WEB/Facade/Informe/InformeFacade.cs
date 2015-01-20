using Pacifico.SINCO.EN;
using Pacifico.SINCO.WEB.wsInformeAccidente;
using Pacifico.SINCO.WEB.wsSiniestro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace Pacifico.SINCO.WEB.Facade.Informe
{
    public class InformeFacade
    {

        InformeAccidenteWSClient informeAccidenteWSCliente = new InformeAccidenteWSClient();
        SiniestroWSClient siniestroWSCliente = new SiniestroWSClient();

        public string Registrar(InformeAccidenteEN informe)
        {

            siniestroWSCliente.RegistrarProceso(informe.MS_Siniestro_Id);

            string mensaje = informeAccidenteWSCliente.Agregar(informe);

            return mensaje; 
        }


        public string Modificar(InformeAccidenteEN informe)
        {

            string informeSerializado = informeAccidenteWSCliente.Obtener(informe.MS_Informe_Accidente_Id);
            InformeAccidenteEN informeObtenido = new JavaScriptSerializer().Deserialize<InformeAccidenteEN>(informeSerializado);
            
            siniestroWSCliente.RegistrarPendiente(informeObtenido.MS_Siniestro_Id);

            siniestroWSCliente.RegistrarProceso(informe.MS_Siniestro_Id);

            string mensaje = informeAccidenteWSCliente.Modificar(informe);

            return mensaje;
        }

    }
}