using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Pacifico.SINCO.EN
{
    [Table("VEHICULO")]
    public class VehiculoEN
    {
        [Key]
        [Column("Vehiculo_Id")]
        public int MP_Vehiculo_Id { get; set; }
        [Column("V_Placa")]
        public string Placa { get; set; }
        [Column("V_Motor")]
        public string Motor { get; set; }
        [Column("V_Chasis")]
        public string Chasis { get; set; }

        [Column("Modelo_Id")]
        public int MP_Modelo_Id  { get; set; }
        public virtual ModeloEN Modelo { get; set; }

        [Column("Marca_Id")]    
        public int MP_Marca_Id { get; set; }
        public virtual MarcaEN Marca { get; set; }
    }
}