using Pacifico.SINCO.AD;
using Pacifico.SINCO.EN;
using Pacifico.SINCO.UTL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.RN
{
    public class rnListaPrecio
    {
        
        private static string MENSAJE_NO_DISPONIBLE = "La Lista de precios no se encuentra disponible";


        private IListaPrecioDAO _ListaPrecioRepositorio;

        public rnListaPrecio()
         {
             _ListaPrecioRepositorio = new ListaPrecioDAO();
         }


        public ListaPrecio Obtener(int Id)
         {
             ListaPrecio model = _ListaPrecioRepositorio.Get(Id);
             if (model == null)
             {
                 throw new Exception(MENSAJE_NO_DISPONIBLE);
             }
             //return new JavaScriptSerializer().Serialize(model);
             return model;
         }

        public List<ListaPrecio> Listar()
         {
             List<ListaPrecio> result = _ListaPrecioRepositorio.GetAll().ToList();
             //return new JavaScriptSerializer().Serialize(result);
             return result;
         }

        public List<ListaPrecio> Buscar(int MarcaId, int ModeloId)
         {
             List<ListaPrecio> listado = new List<ListaPrecio>();

             foreach (ListaPrecio Model in _ListaPrecioRepositorio.GetAll().Where(
                 b => b.MP_Marca_Id == MarcaId && b.MP_Modelo_Id == ModeloId).ToList())
             {
                 listado.Add(Model);
             }
             //return new JavaScriptSerializer().Serialize(listado);
             return listado;
         }
    }
}
