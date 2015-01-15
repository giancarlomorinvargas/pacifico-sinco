using Pacifico.SINCO.EN;
using Pacifico.SINCO.WEB.wsInformeAccidente;
using Pacifico.SINCO.WEB.wsSiniestro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace Pacifico.SINCO.WEB.Modulos.Informe
{
    public class InformeFacade
    {

        InformeAccidenteWSClient informeAccidenteWSCliente = new InformeAccidenteWSClient();
        IwsSiniestroClient siniestroWSCliente = new IwsSiniestroClient();

        public string Registrar(InformeAccidente informe)
        {
            enSiniestro siniestroBusqueda = new enSiniestro(){MS_Siniestro_Id = informe.MS_Siniestro_Id};

            enSiniestro siniestroInforme = siniestroWSCliente.ObtenerSiniestro(siniestroBusqueda);

            siniestroWSCliente.ProcesarSiniestro(siniestroInforme);

            string mensaje = informeAccidenteWSCliente.Agregar(informe);

            return mensaje; 
        }


        public string Modificar(InformeAccidente informe)
        {

            string informeSerializado = informeAccidenteWSCliente.Obtener(informe.MS_Informe_Accidente_Id);
            InformeAccidente informeObtenido = new JavaScriptSerializer().Deserialize<InformeAccidente>(informeSerializado);

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