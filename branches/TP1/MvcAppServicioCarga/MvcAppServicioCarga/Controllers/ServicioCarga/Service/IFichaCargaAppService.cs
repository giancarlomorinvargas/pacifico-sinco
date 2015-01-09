using MvcAppServicioCarga.Models.ServicioCarga;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MvcAppServicioCarga.Controllers.ServicioCarga.Service
{
    interface IFichaCargaAppService
    {


        List<TipoCargaDTO> ListarTipoCarga();
        List<TipoPagoDTO> ListarTipoPago();

        MGFichaCarga ObtenerFichaCarga(int Id);
        List<MGFichaCarga> ListarFichaCarga();
        List<MGFichaCarga> BuscarFichaCarga(string Nombre, string Dni);
        List<MGFichaCarga> BuscarFichaCarga(string Nombre, string Dni, string ApellidoPaterno, string ApellidoMaterno);

        //CU01_Actualizar_Ficha_Carga
        string AgregarFichaCarga(MGFichaCarga FichaCarga);
        string ModificarFichaCarga(MGFichaCarga FichaCarga, List<MGDetalleFCarga> DestalleFichaCarga);
        //string EliminarFichaCarga(MGFichaCarga FichaMovimiento);
        string AnularFichaCarga(MGFichaCarga FichaCarga);

        //CUS13_Actualizar_Clave_Seguridad
        string EncriptarClaveSeguridad(string ClaveSeguridad);
        string DesencriptarClaveSeguridad(string ClaveSeguridad);

        //CUS03_VALIDAR ENTREGA CARGA
        string ValidarFichaCarga(string ClaveSeguridadIngresada, MGFichaCarga FichaCarga);

        string ValidarPagoFichaCarga(string ComprobantePagoIDIngresado, MGFichaCarga FichaCarga);



        MGFichaMovimiento ObtenerFichaMovimiento(int Id);
        List<MGFichaMovimiento> ListarFichaMovimiento();
        List<MGFichaMovimiento> BuscarFichaMovimiento(string FichaMovimientoID, string FichaCargaID, string TipoMovimiento, string Agencia);

        string ModificarFichaMovimiento(MGFichaMovimiento FichaMovimiento);

    }
}
