using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WS.Interfaces;
using Pacifico.SINCO.EN;
using Pacifico.SINCO.RN;
using System.ServiceModel;

namespace Pacifico.SINCO.WS
{
    public class InformeAccidenteWS : IInformeAccidenteWS
    {

        /* <summary>
         ObtenerNombreWS
         </summary>
         <param name="value"></param>
         <returns></returns>*/
        public string ObtenerNombreWS()
        {
            return string.Format(Constantes.sNombreWS_ListaPrecio);
        }

        private InformeAccidenteRN reglaNegocioInformeAccidente;

        public InformeAccidenteWS()
         {
             reglaNegocioInformeAccidente = new InformeAccidenteRN(); 
         }


        public string Obtener(int id)
         {
             try
             {
                 InformeAccidenteEN model = reglaNegocioInformeAccidente.Obtener(id);
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
                List<InformeAccidenteEN> listado = reglaNegocioInformeAccidente.Listar();
                return new JavaScriptSerializer().Serialize(listado);
             }
             catch (Exception e)
             {
                 throw new FaultException(e.Message);
             }
         }

        public string Buscar(string numPoliza, string tipoSiniestro, string fechaSiniestro)
         {
            try
            {
                List<InformeAccidenteEN> listado = reglaNegocioInformeAccidente.Buscar(numPoliza, tipoSiniestro, fechaSiniestro);
                return new JavaScriptSerializer().Serialize(listado);
             }
             catch (Exception e)
             {
                 throw new FaultException(e.Message);
             }
         }

        public string BuscarParaPresupuesto(string numInforme, string asegurado)
        {
            try
            {
                List<InformeAccidenteEN> listado = reglaNegocioInformeAccidente.Buscar(numInforme, asegurado);
                return new JavaScriptSerializer().Serialize(listado);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }
        }

        public string Agregar(InformeAccidenteEN model)
        {
            try
            {

                /*enSiniestro siniestro = new rnSiniestro().ObtenerSiniestro(new enSiniestro()
                {
                    MS_Siniestro_Id = model.MS_Siniestro_Id
                });

                if (siniestro.EstadoEN == Constantes.sEstado_Pendiente)
                {
                    siniestro.EstadoEN = Constantes.sEstado_EnProceso;
                    new rnSiniestro().ActualizaEstado(siniestro);
                }*/

                return reglaNegocioInformeAccidente.Agregar(model);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }
        }

        public string Modificar(InformeAccidenteEN model)
        {
            try
            {
                /*InformeAccidenteEN informeActual = new InformeAccidenteRN().Obtener(model.MS_Informe_Accidente_Id);
                enSiniestro siniestroActual = new rnSiniestro().ObtenerSiniestro(new enSiniestro()
                {
                    MS_Siniestro_Id = informeActual.MS_Siniestro_Id
                });

                if (siniestroActual.EstadoEN == Constantes.sEstado_EnProceso)
                {
                    siniestroActual.EstadoEN = Constantes.sEstado_Pendiente;
                    new rnSiniestro().ActualizaEstado(siniestroActual);
                }

                enSiniestro siniestro = new rnSiniestro().ObtenerSiniestro(new enSiniestro()
                {
                    MS_Siniestro_Id = model.MS_Siniestro_Id
                });

                if (siniestro.EstadoEN == Constantes.sEstado_Pendiente)
                {
                    siniestro.EstadoEN = Constantes.sEstado_EnProceso;
                    new rnSiniestro().ActualizaEstado(siniestro);
                }*/

                return new InformeAccidenteRN().Modificar(model);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }
        }


        public string PendienteEvaluar(int siniestroId, int informeid)
        {
            try
            {
                return new InformeAccidenteRN().PendienteEvaluar(siniestroId, informeid);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }
        }

        public string ReversaPendienteEvaluar(int siniestroId)
        {
            try
            {
                return new InformeAccidenteRN().ReversaPendienteEvaluar(siniestroId);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }
        }
    }
}
