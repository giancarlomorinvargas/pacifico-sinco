using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.EN
{
    public class enSiniestro : enBase
    {

        public int MS_Siniestro_Id { set; get; }
        public string NumSiniestro { set; get; }
        public string Tipo { set; get; }
        public DateTime FechaSiniestro { set; get; }
        public DateTime FechaAtencion { set; get; }
        public string Lugar { set; get; }
        public string Descripcion { set; get; }
        public int Estado { set; get; }
        
        public int MP_Poliza_Id { set; get; }
        public int MS_Procurador_Id { set; get; }

        public string NumPoliza { set; get; }
        public string NombreAsegurado { set; get; }
        public string vEstado { set; get; }

        public string vFechaSiniestro { set; get; }
        public string vFechaAtencion { set; get; }


        public string vFechaInicio { set; get; }
        public string vFechaFin { set; get; }
        public string NumProcurador { set; get; }
        public string NombreProcurador { set; get; }

    }
}
