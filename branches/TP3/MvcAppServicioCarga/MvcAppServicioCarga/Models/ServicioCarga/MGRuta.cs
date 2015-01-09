using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;


namespace MvcAppServicioCarga.Models.ServicioCarga
{
    [Table("MK_RUTA")]
    public class MGRuta
    {
        [Key]
        public int IdRuta { get; set; }
        public string Descripcion { get; set; }
        //Referenciar a la Agencia
        //public string Origen { get; set; }
        public int MG_Agencia_Origen_ID { get; set; }
        public virtual MGAgencia AgenciaOrigen { get; set; }
        //Referenciar a la Agencia
        //public string Destino { get; set; }
        public int MG_Agencia_Destino_ID { get; set; }
        public virtual MGAgencia AgenciaDestino { get; set; }
    }
}