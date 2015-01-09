using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.EN
{
    public class enProcurador : enBase
    {
        public int MS_Procurador_Id { set; get; }
        public string NumProcurador { set; get; }
        public string Nombre { set; get; }
        public string ApellidoPaterno { set; get; }
        public string ApellidoMaterno { set; get; }
        public string Telefono { set; get; }
        public bool Disponible { set; get; }

    }
}
