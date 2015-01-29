using Pacifico.SINCO.EN;
using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WEB.wsLiquidacion;
using Pacifico.SINCO.WEB.wsOrden;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pacifico.SINCO.WEB.Facade.Orden
{
    public class OrdenFacade
    {

        OrdenWSClient ordenWSCliente = new OrdenWSClient();
        LiquidacionWSClient liquidacionWSCliente = new LiquidacionWSClient();

        public string ActualizarGenerado(int id, float descuento)
        {
            OrdenEN orden = new OrdenEN();
            string numOrden = Utilitario.getNumDocument(Constantes.lNum_Orden);
            orden.NumOrden = numOrden;
            orden.DescuentoOrden = descuento;
            orden.LiquidacionId = id;
            liquidacionWSCliente.RegistrarGenerado(id);
            string mensaje = ordenWSCliente.Agregar(orden);
            return mensaje;
        }
    }
}