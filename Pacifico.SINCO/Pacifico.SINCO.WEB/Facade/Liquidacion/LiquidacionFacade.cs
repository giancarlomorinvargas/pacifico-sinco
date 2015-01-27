using Pacifico.SINCO.EN;
using Pacifico.SINCO.WEB.wsLiquidacion;
using Pacifico.SINCO.WEB.wsSiniestro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace Pacifico.SINCO.WEB.Facade.Liquidacion
{
    public class LiquidacionFacade
    {

        LiquidacionWSClient liquidacionWSCliente = new LiquidacionWSClient();
        SiniestroWSClient siniestroWSCliente = new SiniestroWSClient();

        public string Registrar(LiquidacionEN liquidacion)
        {

            siniestroWSCliente.RegistrarAprobado(liquidacion.SiniestroId);

            string mensaje = liquidacionWSCliente.Agregar(liquidacion);

            return mensaje; 
        }


        public string Modificar(LiquidacionEN liquidacion)
        {

            string liquidacionSerializado = liquidacionWSCliente.Obtener(liquidacion.LiquidacionId);
            LiquidacionEN liquidacionObtenido = new JavaScriptSerializer().Deserialize<LiquidacionEN>(liquidacionSerializado);

            siniestroWSCliente.RegistrarAsistido(liquidacionObtenido.SiniestroId);

            siniestroWSCliente.RegistrarAprobado(liquidacion.SiniestroId);

            string mensaje = liquidacionWSCliente.Modificar(liquidacion);

            return mensaje;
        }

    }
}