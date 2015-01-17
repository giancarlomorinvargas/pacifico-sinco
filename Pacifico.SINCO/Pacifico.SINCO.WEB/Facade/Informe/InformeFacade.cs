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
            enSiniestro siniestroBusqueda = new enSiniestro(){MS_Siniestro_Id = informe.MS_Siniestro_Id};

            enSiniestro siniestroInforme = siniestroWSCliente.ObtenerSiniestro(siniestroBusqueda);

            siniestroWSCliente.ProcesarSiniestro(siniestroInforme);

            string mensaje = informeAccidenteWSCliente.Agregar(informe);

            return mensaje; 
        }


        public string Modificar(InformeAccidenteEN informe)
        {

            string informeSerializado = informeAccidenteWSCliente.Obtener(informe.MS_Informe_Accidente_Id);
            InformeAccidenteEN informeObtenido = new JavaScriptSerializer().Deserialize<InformeAccidenteEN>(informeSerializado);

            enSiniestro siniestroBusqueda = new enSiniestro() { MS_Siniestro_Id = informeObtenido.MS_Siniestro_Id };
            enSiniestro siniestroObtenido = siniestroWSCliente.ObtenerSiniestro(siniestroBusqueda);

            siniestroWSCliente.RegistrarSiniestroPendiente(siniestroObtenido);


            siniestroBusqueda = new enSiniestro() { MS_Siniestro_Id = informe.MS_Siniestro_Id };
            siniestroObtenido = siniestroWSCliente.ObtenerSiniestro(siniestroBusqueda);

            siniestroWSCliente.ProcesarSiniestro(siniestroObtenido);

            string mensaje = informeAccidenteWSCliente.Modificar(informe);

            return mensaje;
        }

    }
}