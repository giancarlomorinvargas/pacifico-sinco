using Pacifico.SINCO.EN;
using Pacifico.SINCO.AD;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.RN
{
    public class ProcuradorRN
    {

        private static string MENSAJE_BUSQUEDA_NO_ENCONTRADA = "No existe información que coincida con lo ingresado";
        private static string MENSAJE_ERROR_GENERAL = "Error en el sistema";
        private static string MENSAJE_NO_DISPONIBLE = "Procurador no disponible";

        private static string MENSAJE_DISPONIBILIDAD_ACTUALIZADO = "Disponibilidad Procurador Actualizado Satisfactoriamente";


        public ProcuradorEN Obtener(int id)
        {
            IProcuradorDAO InformeAccidenteDao = new ProcuradorDAO();
            ProcuradorEN model = InformeAccidenteDao.Get(id);
            if (model == null)
            {
                throw new Exception(MENSAJE_NO_DISPONIBLE);
            }
            return model;
        }


        /// <summary>
        /// ListarProcurador
        /// </summary>
        /// <param name="procurador"></param>
        /// <returns></returns>
        public List<ProcuradorEN> Listar()
        {
            IProcuradorDAO procuradorDao = new ProcuradorDAO();
            List<ProcuradorEN> listado = procuradorDao.GetAll().ToList();

            if (listado.Count() == 0)
            {
                throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
            }

            return listado;
        }

        public List<ProcuradorEN> Buscar(string numProcurador, string procurador)
        {
            IProcuradorDAO procuradorDao = new ProcuradorDAO();
            string numProcuradorParam = numProcurador == null ? "" : numProcurador.ToUpper();
            string procuradorParam = procurador == null ? "" : procurador.ToUpper();

            List<ProcuradorEN> listado = new List<ProcuradorEN>();


            foreach (ProcuradorEN item in procuradorDao.GetAll().Where(
                b => b.NumProcurador.ToUpper().Contains(numProcuradorParam)).ToList())
            {
                string nombreCompletoProcurador = item.Nombre + " " + item.ApellidoPaterno + " " + item.ApellidoMaterno;
                if (nombreCompletoProcurador.ToUpper().Contains(procuradorParam))
                {
                    listado.Add(item);
                }
            }

            if (listado.Count() == 0)
            {
                throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
            }

            return listado;
        }


        public string ActualizarDisponibilidad(ProcuradorEN procurador)
        {
            IProcuradorDAO procuradorDao = new ProcuradorDAO();

                try
                {
                    procuradorDao.Modify(procurador);
                    return MENSAJE_DISPONIBILIDAD_ACTUALIZADO;
                }
                catch (Exception ex)
                {
                    throw new Exception(MENSAJE_ERROR_GENERAL, ex);
                }
        }
    }
}
