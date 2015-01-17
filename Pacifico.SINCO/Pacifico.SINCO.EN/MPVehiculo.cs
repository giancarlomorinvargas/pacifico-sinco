using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Pacifico.SINCO.EN
{
    [Table("MP_Vehiculo")]
    public class MPVehiculo
    {
        [Key]
        public int MP_Vehiculo_Id { get; set; }
        public string Placa { get; set; }
        public string Motor { get; set; }
        public string Chasis { get; set; }

        public int MP_Modelo_Id  { get; set; }
        public virtual Modelo Modelo { get; set; }

        public int MP_Marca_Id { get; set; }
        public virtual Marca Marca { get; set; }
    }
}