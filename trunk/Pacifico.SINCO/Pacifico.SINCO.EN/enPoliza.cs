using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.EN
{
    public class enPoliza : enBase
    {

        public int MP_Poliza_Id { set; get; }
        public string NumPoliza { set; get; }
        public DateTime FechaInicio { set; get; }
        public DateTime FechaFin { set; get; }
        public float MontoCobertura { set; get; }
        public string Tipo { set; get; }
        public int MP_Asegurado_ID { set; get; }
        public int MP_Vehiculo_ID { set; get; }


        public string vFechaInicio { set; get; }
        public string vFechaFin { set; get; }

        public String NombreAsegurado { set; get; }
        public string Placa { set; get; }
        public string vMarca { set; get; }
        public string vModelo { set; get; }

    }
}
