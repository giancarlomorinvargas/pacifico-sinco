using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;


namespace MvcAppServicioCarga.Models.ServicioCarga
{
    [Table("MG_AGENCIA")]
    public class MGAgencia
    {
        [Key]
        public int MG_Agencia_ID { get; set; }
        public string Descripcion { get; set; }
        public string Direccion { get; set; }


        public virtual ICollection<MGRuta> RutasOrigen { get; set; }
        public virtual ICollection<MGRuta> RutasDestino { get; set; }
    }
}