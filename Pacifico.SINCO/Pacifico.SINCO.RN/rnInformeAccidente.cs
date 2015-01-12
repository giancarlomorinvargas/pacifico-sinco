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
    public class rnInformeAccidente
    {
        private static string MENSAJE_NO_DISPONIBLE = "El Informe accidente vehicular no se encuentra disponible";


        IInformeAccidenteDAO _InformeAccidenteRepositorio;

        public rnInformeAccidente()
         {
             _InformeAccidenteRepositorio = new InformeAccidenteDAO();
         }


        public MSInformeAccidente Obtener(int Id)
         {
             MSInformeAccidente model = _InformeAccidenteRepositorio.Get(Id);
             if (model == null)
             {
                 throw new Exception(MENSAJE_NO_DISPONIBLE);
             }
            return model;
         }

        public List<MSInformeAccidente> Listar()
         {
             List<MSInformeAccidente> listado;
             listado = _InformeAccidenteRepositorio.GetAll().ToList();
             return listado;
         }

        /*public List<MSInformeAccidente> Buscar(int MarcaId, int ModeloId)
         {
             List<MSInformeAccidente> listado = new List<MSInformeAccidente>();

             foreach (MSInformeAccidente Model in _InformeAccidenteRepositorio.GetAll().Where(
                 b => b.MP_Marca_Id == MarcaId && b.MP_Modelo_Id == ModeloId).ToList())
             {
                 listado.Add(Model);
             }
             return listado;
         }*/

    }
}
