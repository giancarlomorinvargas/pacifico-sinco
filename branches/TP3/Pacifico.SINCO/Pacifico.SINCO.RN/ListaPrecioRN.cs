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
    public class ListaPrecioRN
    {
        
        private static string MENSAJE_NO_DISPONIBLE = "La Lista de precios no se encuentra disponible";


        public ListaPrecioEN Obtener(int Id)
         {
             IListaPrecioDAO listaPrecioDao = new ListaPrecioDAO();
             ListaPrecioEN model = listaPrecioDao.Get(Id);
             if (model == null)
             {
                 throw new Exception(MENSAJE_NO_DISPONIBLE);
             }
             //return new JavaScriptSerializer().Serialize(model);
             return model;
         }

        public List<ListaPrecioEN> Listar()
        {
            IListaPrecioDAO listaPrecioDao = new ListaPrecioDAO();
             List<ListaPrecioEN> result = listaPrecioDao.GetAll().ToList();
             //return new JavaScriptSerializer().Serialize(result);
             return result;
         }

        public List<ListaPrecioEN> Buscar(int MarcaId, int ModeloId)
         {
             List<ListaPrecioEN> listado = new List<ListaPrecioEN>();
             IListaPrecioDAO listaPrecioDao = new ListaPrecioDAO();
             foreach (ListaPrecioEN Model in listaPrecioDao.GetAll().Where(
                 b => b.MP_Marca_Id == MarcaId && b.MP_Modelo_Id == ModeloId).ToList())
             {
                 listado.Add(Model);
             }
             //return new JavaScriptSerializer().Serialize(listado);
             return listado;
         }
    }
}
