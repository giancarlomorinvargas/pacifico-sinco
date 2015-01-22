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
    public class SiniestroWS : ISiniestroWS
    {

        private static string MENSAJE_ERROR_GENERAL = "Error en el sistema";
        private static string MENSAJE_BUSQUEDA_NO_ENCONTRADA = "No existe información que coincida con lo ingresado";
        private static string MENSAJE_NO_DISPONIBLE = "El Siniestro no se encuentra disponible";


        private static string MENSAJE_ERROR_PROCESAR = "No se puedo procesar el siniestro, porque no está Pendiente";
        private static string MENSAJE_ERROR_PENDIENTE = "No se puedo registrar el siniestro, porque no está en Proceso";

        /*<summary>
        ObtenerNombreWS
        </summary>
        <param name="value"></param>
        <returns></returns>*/
        public string wsObtenerNombreWS()
        {
            return string.Format(Constantes.sNombreWS_Siniestro);
        }
        
        /*<summary>
        ListarSiniestro
        </summary>
        <param name="model"></param>
        <returns></returns>*/
        public string Listar()
        {
            try
            {
                SiniestroRN siniestroRN = new SiniestroRN();
                List<SiniestroEN> listado = siniestroRN.Listar();
                return new JavaScriptSerializer().Serialize(listado);
            }
            catch (Exception ex)
            {
                throw new FaultException(ex.Message);
            }
        }

        public string Buscar(string numPoliza, string tipo, string fecRegistro)
        {
            try
            {
                SiniestroRN siniestroRN = new SiniestroRN();
                List<SiniestroEN> listado = siniestroRN.Buscar(numPoliza, tipo, fecRegistro);
                return new JavaScriptSerializer().Serialize(listado);
            }
            catch (Exception ex)
            {
                throw new FaultException(ex.Message);
            }
        }

        /*<summary>
        ListarSiniestro
        </summary>
        <param name="model"></param>
        <returns></returns>*/
        public string Obtener(int id)
        {
            try
            {
                SiniestroRN siniestroRN = new SiniestroRN();
                SiniestroEN siniestro = siniestroRN.Obtener(id);
                return new JavaScriptSerializer().Serialize(siniestro);
            }
            catch (Exception ex)
            {
                throw new FaultException(ex.Message);
            }
        }

        /*<summary>
        IngresarSiniestro
        </summary>
        <param name="model"></param>
        <returns></returns>*/
        public string Ingresar(SiniestroEN siniestro)
        {
            try
            {
                SiniestroRN siniestroRN = new SiniestroRN();
                return siniestroRN.Ingresar(siniestro);

                /*if (bExito)
                {
                    ProcuradorRN oRnProcurador = new ProcuradorRN();
                    enProcurador pEnProcurador = new enProcurador()
                    {
                        MS_Procurador_Id = model.MS_Procurador_Id,
                        Disponible = false
                    };
                    bExito = oRnProcurador.ActualizarDisponibilidadProcurador(pEnProcurador);
                }*/
            }
            catch (Exception ex)
            {
                throw new FaultException(ex.Message);
            }
        }

        /*<summary>
        ActualizaSiniestro
        </summary>
        <param name="model"></param>
        <returns></returns>*/
        public string Actualizar(SiniestroEN siniestro)
        {
            //bool bExito = false;
            try
            {
                SiniestroRN siniestroRN = new SiniestroRN();

                return siniestroRN.Actualizar(siniestro);

                /*bExito = siniestroRN.ActualizaSiniestro(siniestro);

                if (bExito && siniestroConsulta.MS_Procurador_Id != model.MS_Procurador_Id)
                {
                    ProcuradorRN oRnProcurador = new ProcuradorRN();

                    //Actualizar Disponibilidad de ProcuradorEN (Disponible) asociado al siniestro
                    bool exito1 = oRnProcurador.ActualizarDisponibilidadProcurador(new enProcurador()
                    {
                        MS_Procurador_Id = siniestroConsulta.MS_Procurador_Id,
                        Disponible = true
                    });

                    //Actualizar Disponibilidad de ProcuradorEN (Ocupado) asignado
                    bool exito2 = oRnProcurador.ActualizarDisponibilidadProcurador(new enProcurador()
                    {
                        MS_Procurador_Id = model.MS_Procurador_Id,
                        Disponible = false
                    });

                    bExito = exito1 && exito2;
                }*/
            }
            catch (Exception ex)
            {
                throw new FaultException(ex.Message);
            }
        }

        /*<summary>
        ActualizaSiniestro
        </summary>
        <param name="model"></param>
        <returns></returns>*/
        public string RegistrarProceso(int id)
        {
            try
            {
                SiniestroRN siniestroRN = new SiniestroRN();
                
                return siniestroRN.RegistrarProceso(id);
            }
            catch (Exception ex)
            {
                throw new FaultException(ex.Message);
            }
        }


        /*<summary>
        ActualizaSiniestro
        </summary>
        <param name="model"></param>
        <returns></returns>*/
        public string RegistrarPendiente(int id)
        {
            try
            {
                SiniestroRN siniestroRN = new SiniestroRN();

                return siniestroRN.RegistrarPendiente(id);
            }
            catch (Exception ex)
            {
                throw new FaultException(ex.Message);
            }
        }

        public string Consultar(string numSiniestro, string tipo)
        {
            try
            {
                SiniestroRN siniestroRN = new SiniestroRN();
                List<SiniestroEN> listado = siniestroRN.Consultar(numSiniestro, tipo);
                return new JavaScriptSerializer().Serialize(listado);
            }
            catch (Exception ex)
            {
                throw new FaultException(ex.Message);
            }
        }

        public string Aperturar(SiniestroEN siniestro)
        {
            try
            {
                SiniestroRN siniestroRN = new SiniestroRN();

                return siniestroRN.Aperturar(siniestro);
            }
            catch (Exception ex)
            {
                throw new FaultException(ex.Message);
            }
        }

    }
}