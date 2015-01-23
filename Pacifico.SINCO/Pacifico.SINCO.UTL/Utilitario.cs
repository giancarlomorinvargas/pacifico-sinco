using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.UTL
{
    public class Utilitario
    {


        public static string getNumDocument(String codDoc)
        {
            return codDoc + DateTime.Now.ToString("yyyyMMddHHmmss");
        }


        public static List<String> getTipoSiniestro()
        {
            List<String> tipos = new List<string>();
            tipos.Add("Choque");
            tipos.Add("Robo Total");
            return tipos;
        }


        public static List<String> getDistritos()
        {
            List<String> tipos = new List<string>();
            tipos.Add("Barranco");
            tipos.Add("Breña");
            tipos.Add("Chorrillos"); 
            tipos.Add("Jesus María");
            tipos.Add("La Victoria");
            tipos.Add("La Molina");
            tipos.Add("Lince");
            tipos.Add("Los Olivos");
            tipos.Add("San Martín");
            tipos.Add("San Borja");
            tipos.Add("San Isidro");
            tipos.Add("San Miguel");
            tipos.Add("Surco");
            return tipos;
        }
    }
}
