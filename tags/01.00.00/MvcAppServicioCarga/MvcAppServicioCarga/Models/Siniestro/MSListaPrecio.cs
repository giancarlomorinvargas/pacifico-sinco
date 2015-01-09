using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Models.Siniestro
{
    [Table("MS_Lista_Precio")]
    public class MSListaPrecio
    {
        [Key]
        public int MS_Lista_Precio_Id { get; set; }
        public DateTime Fecha { get; set; }
        public float Precio { get; set; }

        public int MP_Modelo_Id { get; set; }
        public virtual MPModelo Modelo { get; set; }

        public int MS_Servicio_Id { get; set; }
        public virtual MSServicio Servicio { get; set; }


        public int MP_Marca_Id { get; set; }
        public virtual MPMarca Marca { get; set; }
    }
}