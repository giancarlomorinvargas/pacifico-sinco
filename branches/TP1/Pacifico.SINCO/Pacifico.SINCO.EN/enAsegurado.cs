using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.EN
{
    public class enAsegurado : enBase
    {
        public int MP_Asegurado_Id { set; get; }
        public string DniAsegurado { set; get; }
        public string Nombre { set; get; }
        public string ApellidoPaterno { set; get; }
        public string ApellidoMaterno { set; get; }
        public DateTime FechaNacimiento { set; get; }
        
    }
}
