using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.UTL
{
    public class Constantes
    {

        public const string sNombreWS_Util = "wsUtil";
        public const string sNombreWS_Siniestro = "wsSiniestro";
        public const string sNombreWS_Presupuesto = "wsPresupuesto";
        public const string sNombreWS_ListaPrecio = "wsListaPrecio";
        public const string sNombreWS_InformeAccidente = "wsInformeAccidente";
        public const string sNombreWS_Tecnico = "wsTecnico";

        public const string sUsuario_Login = "ADMIN";

        //SINIESTROS
        public const string sNum_Siniestro = "SI";
        public const int sEstado_Registrado = 21;
        public const int sEstado_Pendiente = 22;
        public const int sEstado_EnProceso = 23;
        public const int sEstado_Asignado = 24;
        //public const int sEstado_Terminado = 25;

        //INFORME
        public const string iNum_Informe = "IA";
        public const int iEstado_Registrado = 31;
        public const int iEstado_Firmado = 32;

        //PRESUPUESTOS
        public const string pNum_Presupuesto = "PR";
        public const int pEstado_Registrado = 41;
        public const int pEstado_Aprobado = 42;
        public const int pEstado_Rechazado = 43;
    }
}
