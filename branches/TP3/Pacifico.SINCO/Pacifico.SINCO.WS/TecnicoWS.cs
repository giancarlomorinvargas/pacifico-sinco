using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WS.Interfaces;
using Pacifico.SINCO.EN;
using Pacifico.SINCO.RN;
using System.ServiceModel;
using System.Web.Script.Serialization;

namespace Pacifico.SINCO.WS
{
    public class TecnicoWS : ITecnicoWS
    {
        /*<summary>
        ObtenerNombreWS
        </summary>
        <param name="value"></param>
        <returns></returns>*/
        public string wsObtenerNombreWS()
        {
            return string.Format(Constantes.sNombreWS_Tecnico);
        }

        public string Obtener(int id)
        {
            try
            {
                TecnicoRN tecnicoRN = new TecnicoRN();
                TecnicoEN model = tecnicoRN.Obtener(id);
                return new JavaScriptSerializer().Serialize(model);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }
        }

        public string Listar()
        {
            try
            {
                TecnicoRN tecnicoRN = new TecnicoRN();
                List<TecnicoEN> listado = tecnicoRN.Listar();
                return new JavaScriptSerializer().Serialize(listado);
            }
            catch (Exception ex)
            {
                throw new FaultException(ex.Message);
            }
        }


        public string ConsultarDisponibilidad(string codigoTecnico, string tecnico)
        {
            try
            {
                TecnicoRN tecnicoRN = new TecnicoRN();
                List<TecnicoEN> listado = tecnicoRN.Buscar(codigoTecnico, tecnico);
                return new JavaScriptSerializer().Serialize(listado);
            }
            catch (Exception ex)
            {
                throw new FaultException(ex.Message);
            }
        }

        public string ActualizaDisponibilidad(TecnicoEN tecnico)
        {
            try
            {
                TecnicoRN tecnicoRN = new TecnicoRN();
                return tecnicoRN.ActualizarDisponibilidad(tecnico);
            }
            catch (Exception ex)
            {
                throw new FaultException(ex.Message);
            }
        }
    }
}
