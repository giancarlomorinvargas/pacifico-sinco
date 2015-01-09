using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.EN
{
    public class enVehiculo : enBase
    {
        public int MP_Vehiculo_Id { set; get; }
        public string Placa { set; get; }
        public string Motor { set; get; }
        public string Chasis { set; get; }
        public int MP_Modelo_Id { set; get; }
        public int MP_Marca_Id { set; get; }

    }
}
