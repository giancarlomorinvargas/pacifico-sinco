﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WS.Interfaces;
using Pacifico.SINCO.EN;
using Pacifico.SINCO.RN;
using System.ServiceModel;

namespace Pacifico.SINCO.WS
{
    public class SiniestroWS : ISiniestroWS
    {

        private static string MENSAJE_ERROR_GENERAL = "Error en el sistema";
        private static string MENSAJE_BUSQUEDA_NO_ENCONTRADA = "No existe información que coincida con lo ingresado";
        private static string MENSAJE_NO_DISPONIBLE = "El Siniestro no se encuentra disponible";

        private static string MENSAJE_REGISTRADO = "La presupuesto se registró con éxito: {0}";
        private static string MENSAJE_ACTUALIZADO = "La presupuesto se actualizó con éxito: {0}";

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
        <param name="pEnSiniestro"></param>
        <returns></returns>*/
        public List<enSiniestro> ListarSiniestro(enSiniestro pEnSiniestro)
        {
            List<enSiniestro> loEnSiniestro = null;
            try
            {
                rnSiniestro oRnSiniestro = new rnSiniestro();
                loEnSiniestro = oRnSiniestro.ListarSiniestro(pEnSiniestro);
            }
            catch (Exception ex)
            {
                loEnSiniestro = null;
                throw new FaultException(MENSAJE_ERROR_GENERAL);
            }
            if (loEnSiniestro == null || loEnSiniestro.Count() == 0)
            {
                throw new FaultException(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
            }
            return loEnSiniestro;
        }

        /*<summary>
        ListarSiniestro
        </summary>
        <param name="pEnSiniestro"></param>
        <returns></returns>*/
        public enSiniestro ObtenerSiniestro(enSiniestro pEnSiniestro)
        {
            enSiniestro oEnSiniestro = null;
            try
            {
                rnSiniestro oRnSiniestro = new rnSiniestro();
                oEnSiniestro = oRnSiniestro.ObtenerSiniestro(pEnSiniestro);
            }
            catch (Exception ex)
            {
                oEnSiniestro = null;
                throw new FaultException(MENSAJE_ERROR_GENERAL);
            }
            if (oEnSiniestro == null)
            {
                throw new FaultException(MENSAJE_NO_DISPONIBLE);
            }
            return oEnSiniestro;
        }

        /*<summary>
        IngresarSiniestro
        </summary>
        <param name="pEnSiniestro"></param>
        <returns></returns>*/
        public bool IngresarSiniestro(enSiniestro pEnSiniestro)
        {
            bool bExito = false;
            try
            {
                rnSiniestro oRnSiniestro = new rnSiniestro();
                bExito = oRnSiniestro.IngresarSiniestro(pEnSiniestro);

                if (bExito)
                {
                    rnProcurador oRnProcurador = new rnProcurador();
                    enProcurador pEnProcurador = new enProcurador()
                    {
                        MS_Procurador_Id = pEnSiniestro.MS_Procurador_Id,
                        Disponible = false
                    };
                    bExito = oRnProcurador.ActualizarDisponibilidadProcurador(pEnProcurador);
                }
            }
            catch (Exception ex)
            {
                bExito = false;
                throw new FaultException(MENSAJE_ERROR_GENERAL);
            }
            return bExito;
        }

        /*<summary>
        ActualizaSiniestro
        </summary>
        <param name="pEnSiniestro"></param>
        <returns></returns>*/
        public bool ActualizaSiniestro(enSiniestro pEnSiniestro)
        {
            bool bExito = false;
            try
            {
                rnSiniestro oRnSiniestro = new rnSiniestro();

                enSiniestro pEnSiniestroConsulta = oRnSiniestro.ObtenerSiniestro(pEnSiniestro);

                bExito = oRnSiniestro.ActualizaSiniestro(pEnSiniestro);

                if (bExito && pEnSiniestroConsulta.MS_Procurador_Id != pEnSiniestro.MS_Procurador_Id)
                {
                    rnProcurador oRnProcurador = new rnProcurador();

                    //Actualizar Disponibilidad de ProcuradorEN (Disponible) asociado al siniestro
                    bool exito1 = oRnProcurador.ActualizarDisponibilidadProcurador(new enProcurador()
                    {
                        MS_Procurador_Id = pEnSiniestroConsulta.MS_Procurador_Id,
                        Disponible = true
                    });

                    //Actualizar Disponibilidad de ProcuradorEN (Ocupado) asignado
                    bool exito2 = oRnProcurador.ActualizarDisponibilidadProcurador(new enProcurador()
                    {
                        MS_Procurador_Id = pEnSiniestro.MS_Procurador_Id,
                        Disponible = false
                    });

                    bExito = exito1 && exito2;
                }
            }
            catch (Exception ex)
            {
                bExito = false;
                throw new FaultException(MENSAJE_ERROR_GENERAL);
            }
            return bExito;
        }

        /*<summary>
        ActualizaSiniestro
        </summary>
        <param name="pEnSiniestro"></param>
        <returns></returns>*/
        public bool ProcesarSiniestro(enSiniestro pEnSiniestro)
        {
            bool bExito = false;
            try
            {
                rnSiniestro oRnSiniestro = new rnSiniestro();
                
                enSiniestro pEnSiniestroConsulta = oRnSiniestro.ObtenerSiniestro(pEnSiniestro);

                if (pEnSiniestroConsulta.Estado == Constantes.sEstado_Pendiente)
                {
                    pEnSiniestroConsulta.Estado = Constantes.sEstado_EnProceso;
                    bExito = oRnSiniestro.ActualizaEstado(pEnSiniestroConsulta);
                }
                else
                {
                    throw new FaultException(MENSAJE_ERROR_PROCESAR);
                }

            }
            catch (FaultException ex)
            {
                bExito = false;
                throw ex;
            }
            catch (Exception ex)
            {
                bExito = false;
                throw new FaultException(MENSAJE_ERROR_GENERAL);
            }
            return bExito;
        }


        /*<summary>
        ActualizaSiniestro
        </summary>
        <param name="pEnSiniestro"></param>
        <returns></returns>*/
        public bool RegistrarSiniestroPendiente(enSiniestro pEnSiniestro)
        {
            bool bExito = false;
            try
            {
                rnSiniestro oRnSiniestro = new rnSiniestro();

                enSiniestro pEnSiniestroConsulta = oRnSiniestro.ObtenerSiniestro(pEnSiniestro);

                if (pEnSiniestroConsulta.Estado == Constantes.sEstado_EnProceso)
                {
                    pEnSiniestroConsulta.Estado = Constantes.sEstado_Pendiente;
                    bExito = oRnSiniestro.ActualizaEstado(pEnSiniestroConsulta);
                }
                else
                {
                    throw new FaultException(MENSAJE_ERROR_PENDIENTE);
                }

            }
            catch (FaultException ex)
            {
                bExito = false;
                throw ex;
            }
            catch (Exception ex)
            {
                bExito = false;
                throw new FaultException(MENSAJE_ERROR_GENERAL);
            }
            return bExito;
        }

    }
}