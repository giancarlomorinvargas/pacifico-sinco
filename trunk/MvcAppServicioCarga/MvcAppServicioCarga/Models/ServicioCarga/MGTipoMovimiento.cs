using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Models.ServicioCarga
{
    [Table("MG_TIPOMOVIMIENTO")]
    public class MGTipoMovimiento
    {
        [Key]
        public int MG_Tipo_Movimiento_ID { get; set; }
        public string Descripcion { get; set; }
        public string Estado { get; set; }

        //public virtual ICollection<MGFichaCarga> FichasCarga { get; set; }
    }
}