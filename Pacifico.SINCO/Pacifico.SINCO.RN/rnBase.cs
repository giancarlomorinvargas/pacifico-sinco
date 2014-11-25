using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.RN
{
    public class rnBase
    {
        public String sConexion { get; set; }

        public rnBase()
        {
            sConexion = ConfigurationManager.ConnectionStrings["conSINCO"].ConnectionString;
        }
    }

}
