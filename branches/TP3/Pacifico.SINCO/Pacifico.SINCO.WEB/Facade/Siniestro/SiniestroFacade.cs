using Pacifico.SINCO.EN;
using Pacifico.SINCO.WEB.wsInformeAccidente;
using Pacifico.SINCO.WEB.wsSiniestro;
using Pacifico.SINCO.WEB.wsUtil;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace Pacifico.SINCO.WEB.Facade.Informe
{
    public class SiniestroFacade
    {

        SiniestroWSClient siniestroWSCliente = new SiniestroWSClient();
        UtilWSClient utilWSCliente = new UtilWSClient();

        public string Registrar(SiniestroEN siniestro)
        {
            string mensaje = siniestroWSCliente.Ingresar(siniestro);

            string procuradorSerializado = utilWSCliente.ObtenerProcurador(siniestro.MS_Procurador_Id);
            ProcuradorEN procurador = new JavaScriptSerializer().Deserialize<ProcuradorEN>(procuradorSerializado);

            procurador.Disponible = false;

            utilWSCliente.ActualizaDisponibilidadProcurador(procurador);


            return mensaje; 
        }


        public string Modificar(SiniestroEN siniestro)
        {

            string siniestroSerializado = siniestroWSCliente.Obtener(siniestro.MS_Siniestro_Id);
            SiniestroEN siniestroConsulta = new JavaScriptSerializer().Deserialize<SiniestroEN>(siniestroSerializado);

            string procuradorSerializado = utilWSCliente.ObtenerProcurador(siniestroConsulta.MS_Procurador_Id);
            ProcuradorEN procurador = new JavaScriptSerializer().Deserialize<ProcuradorEN>(procuradorSerializado);
            procurador.Disponible = true;
            utilWSCliente.ActualizaDisponibilidadProcurador(procurador);

            procuradorSerializado = utilWSCliente.ObtenerProcurador(siniestro.MS_Procurador_Id);
            procurador = new JavaScriptSerializer().Deserialize<ProcuradorEN>(procuradorSerializado);
            procurador.Disponible = false;
            utilWSCliente.ActualizaDisponibilidadProcurador(procurador);

            string mensaje = siniestroWSCliente.Actualizar(siniestro);

            return mensaje; 
        }

    }
}