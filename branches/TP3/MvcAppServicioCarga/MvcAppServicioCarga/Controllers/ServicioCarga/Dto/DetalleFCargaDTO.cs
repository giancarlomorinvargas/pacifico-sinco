using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Controllers.ServicioCarga.Dto
{
    public class DetalleFCargaDTO
    {

        public int IdFichaCarga { get; set; }
        public int IdProducto { get; set; }
        public string Producto { get; set; }
        public string Descripcion { get; set; }
        public string TipoCarga { get; set; }
        public int Cantidad { get; set; }
        public int Peso { get; set; }
        public double Importe { get; set; }
    }
}