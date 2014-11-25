using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace Pacifico.SINCO.EN
{
    [Table("MS_Lista_Precio")]
    [DataContract]
    public class MSListaPrecio
    {
        [Key]
        [DataMember]
        public int MS_Lista_Precio_Id { get; set; }
        [DataMember]
        public DateTime Fecha { get; set; }
        [DataMember]
        public float Precio { get; set; }

        [DataMember]
        public int MP_Modelo_Id { get; set; }
        [DataMember]
        public virtual MPModelo Modelo { get; set; }

        [DataMember]
        public int MS_Servicio_Id { get; set; }
        [DataMember]
        public virtual MSServicio Servicio { get; set; }


        [DataMember]
        public int MP_Marca_Id { get; set; }
        [DataMember]
        public virtual MPMarca Marca { get; set; }
    }
}