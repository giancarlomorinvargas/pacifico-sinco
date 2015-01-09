using MvcAppServicioCarga.Models.Siniestro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MvcAppServicioCarga.Controllers.Siniestro.Service
{
    interface IPresupuestoAppService
    {



        //CU01_Actualizar_Ficha_Carga
        MSPresupuesto ObtenerPresupuesto(int Id);
        List<MSPresupuesto> ListarPresupuesto();
        List<MSPresupuesto> BuscarPresupuesto(string NumPresupuesto, string NumInforme, string NumPoliza);
        string AgregarPresupuesto(MSPresupuesto FichaCarga);
        string ModificarPresupuesto(MSPresupuesto FichaCarga, List<MSDetallePresupuesto> DestalleFichaCarga);
        //string EliminarFichaCarga(MSPresupuesto FichaMovimiento);
        /*
        //CUS13_Actualizar_Clave_Seguridad
        string EncriptarClaveSeguridad(string ClaveSeguridad);
        string DesencriptarClaveSeguridad(string ClaveSeguridad);

        //CUS03_VALIDAR ENTREGA CARGA
        string ValidarFichaCarga(string ClaveSeguridadIngresada, MGFichaCarga FichaCarga);

        string ValidarPagoFichaCarga(string ComprobantePagoIDIngresado, MGFichaCarga FichaCarga);



        MGFichaMovimiento ObtenerFichaMovimiento(int Id);
        List<MGFichaMovimiento> ListarFichaMovimiento();
        List<MGFichaMovimiento> BuscarFichaMovimiento(string FichaMovimientoID, string FichaCargaID, string TipoMovimiento, string Agencia);

        string ModificarFichaMovimiento(MGFichaMovimiento FichaMovimiento);*/

    }
}
