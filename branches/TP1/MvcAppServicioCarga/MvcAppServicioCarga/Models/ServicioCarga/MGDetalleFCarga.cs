using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Models.ServicioCarga
{
    [Table("MG_DETALLEFCARGA")]
    public class MGDetalleFCarga
    {
        [Key]
        public int MG_FichaCarga_MG_FichaCarga_ID { get; set; }

        //Borrar estos atributos
        /*[Column("Producto")]
        public string ProductoTemp { get; set; }
        public string Descripcion { get; set; }*/


        public string TipoCarga { get; set; }
        public int Cantidad { get; set; }
        public float Peso { get; set; }
        public float Importe { get; set; }

        public int MG_FichaCarga_ID { get; set; }
        //public virtual MGFichaCarga FichaMovimiento { get; set; }


        public int MG_Producto_ID { get; set; }
        public virtual MGProducto Producto { get; set; }
    }
}