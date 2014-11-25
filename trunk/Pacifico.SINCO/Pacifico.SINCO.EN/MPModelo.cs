using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace Pacifico.SINCO.EN
{
    [Table("MP_Modelo")]
    [DataContract]
    public class MPModelo
    {
        [Key]
        [DataMember]
        public int MP_Modelo_Id { get; set; }
        [DataMember]
        public string Descripcion { get; set; }
    }
}