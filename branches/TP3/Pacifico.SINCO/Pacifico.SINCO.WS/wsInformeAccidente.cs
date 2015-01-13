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
    public class wsInformeAccidente : IwsInformeAccidente
    {

        /* <summary>
         wsObtenerNombreWS
         </summary>
         <param name="value"></param>
         <returns></returns>*/
        public string wsObtenerNombreWS()
        {
            return string.Format(Constantes.sNombreWS_ListaPrecio);
        }

        private rnInformeAccidente reglaNegocioInformeAccidente;

        public wsInformeAccidente()
         {
             reglaNegocioInformeAccidente = new rnInformeAccidente(); 
         }


        public string Obtener(int Id)
         {
             try
             {
                 MSInformeAccidente model = reglaNegocioInformeAccidente.Obtener(Id);
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
                List<MSInformeAccidente> listado = reglaNegocioInformeAccidente.Listar();
                return new JavaScriptSerializer().Serialize(listado);
             }
             catch (Exception e)
             {
                 throw new FaultException(e.Message);
             }
         }

        public string Buscar(string NumPoliza, string TipoSiniestro, string FechaSiniestro)
         {
            try
            {
                List<MSInformeAccidente> listado = reglaNegocioInformeAccidente.Buscar(NumPoliza, TipoSiniestro, FechaSiniestro);
                return new JavaScriptSerializer().Serialize(listado);
             }
             catch (Exception e)
             {
                 throw new FaultException(e.Message);
             }
         }

        public string Agregar(MSInformeAccidente model)
        {
            try
            {

                enSiniestro siniestro = new rnSiniestro().ObtenerSiniestro(new enSiniestro()
                {
                    MS_Siniestro_Id = model.MS_Siniestro_Id
                });

                if (siniestro.Estado == Constantes.sEstado_Pendiente)
                {
                    siniestro.Estado = Constantes.sEstado_EnProceso;
                    new rnSiniestro().ActualizaEstado(siniestro);
                }

                return reglaNegocioInformeAccidente.Agregar(model);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }
        }

        public string Modificar(MSInformeAccidente model)
        {
            try
            {
                MSInformeAccidente informeActual = new rnInformeAccidente().Obtener(model.MS_Informe_Accidente_Id);
                enSiniestro siniestroActual = new rnSiniestro().ObtenerSiniestro(new enSiniestro()
                {
                    MS_Siniestro_Id = informeActual.MS_Siniestro_Id
                });

                if (siniestroActual.Estado == Constantes.sEstado_EnProceso)
                {
                    siniestroActual.Estado = Constantes.sEstado_Pendiente;
                    new rnSiniestro().ActualizaEstado(siniestroActual);
                }

                enSiniestro siniestro = new rnSiniestro().ObtenerSiniestro(new enSiniestro()
                {
                    MS_Siniestro_Id = model.MS_Siniestro_Id
                });

                if (siniestro.Estado == Constantes.sEstado_Pendiente)
                {
                    siniestro.Estado = Constantes.sEstado_EnProceso;
                    new rnSiniestro().ActualizaEstado(siniestro);
                }

                return new rnInformeAccidente().Modificar(model);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }
        }
    }
}
