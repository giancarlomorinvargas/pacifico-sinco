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
    public class TecnicoRN
    {

        private static string MENSAJE_BUSQUEDA_NO_ENCONTRADA = "No existe información que coincida con lo ingresado";
        private static string MENSAJE_ERROR_GENERAL = "Error en el sistema";
        private static string MENSAJE_NO_DISPONIBLE = "Procurador no disponible";

        private static string MENSAJE_DISPONIBILIDAD_ACTUALIZADO = "Disponibilidad Tecnico Actualizado Satisfactoriamente";


        public TecnicoEN Obtener(int id)
        {
            ITecnicoDAO tecnicoDao = new TecnicoDAO();
            TecnicoEN model = tecnicoDao.Get(id);
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
        public List<TecnicoEN> Listar()
        {
            ITecnicoDAO tecnicoDao = new TecnicoDAO();
            List<TecnicoEN> listado = tecnicoDao.GetAll().ToList();

            if (listado.Count() == 0)
            {
                throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
            }

            return listado;
        }

        public List<TecnicoEN> Buscar(string codigoTecnico, string tecnico)
        {
            ITecnicoDAO tecnicoDao = new TecnicoDAO();
            string codigoTecnicoParam = codigoTecnico == null ? "" : codigoTecnico.ToUpper();
            string tecnicoParam = tecnico == null ? "" : tecnico.ToUpper();

            List<TecnicoEN> listado = new List<TecnicoEN>();


            foreach (TecnicoEN item in tecnicoDao.GetAll().Where(
                b => b.NumTecnico.ToUpper().Contains(codigoTecnicoParam)).ToList())
            {
                string nombreCompleto = item.Nombre + " " + item.ApellidoPaterno + " " + item.ApellidoMaterno;
                if (nombreCompleto.ToUpper().Contains(tecnicoParam))
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


        public string ActualizarDisponibilidad(TecnicoEN tecnico)
        {
            ITecnicoDAO tecnicoDao = new TecnicoDAO();

                try
                {
                    tecnicoDao.Modify(tecnico);
                    return MENSAJE_DISPONIBILIDAD_ACTUALIZADO;
                }
                catch (Exception ex)
                {
                    throw new Exception(MENSAJE_ERROR_GENERAL, ex);
                }
        }
    }
}
