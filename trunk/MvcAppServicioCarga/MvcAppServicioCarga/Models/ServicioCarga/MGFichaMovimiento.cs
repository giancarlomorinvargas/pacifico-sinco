using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Models.ServicioCarga
{
    [Table("MG_FICHAMOVIMIENTO")]
    public class MGFichaMovimiento
    {
        [Key]
        public int MG_FichaMovimiento_ID { get; set; }
        public string Observacion { get; set; }

        public int MG_Tipo_Movimiento_ID { get; set; }
        public virtual MGTipoMovimiento TipoMovimiento { get; set; }


        public int MG_FichaCarga_ID { get; set; }
        public virtual MGFichaCarga FichaCarga { get; set; }


        public int MG_Agencia_ID { get; set; }
        public virtual MGAgencia Agencia { get; set; }


        public string UsuarioRegistra { get; set; }
        public DateTime FechaRegistra { get; set; }
        public string UsuarioModifica { get; set; }
        public DateTime FechaModifica { get; set; }
    }
}