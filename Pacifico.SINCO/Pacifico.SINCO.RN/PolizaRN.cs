using Pacifico.SINCO.AD;
using Pacifico.SINCO.EN;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.RN
{
    public class PolizaRN
    {
        private static string MENSAJE_BUSQUEDA_NO_ENCONTRADA = "No existe información que coincida con lo ingresado";

        /// <summary>
        /// ListarPoliza
        /// </summary>
        /// <param name="pEnPoliza"></param>
        /// <returns></returns>
        public List<PolizaEN> Listar()
        {
            IPolizaDAO procuradorDao = new PolizaDAO();
            List<PolizaEN> listado = new List<PolizaEN>();
            DateTime Now = DateTime.Now;

            foreach (PolizaEN item in procuradorDao.GetAll().ToList())
            {
                item.Vigente = item.FechaInicio <= Now && Now <= item.FechaFin;
                listado.Add(item);
            }

            if (listado.Count() == 0)
            {
                throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
            }

            return listado;
        }

        /// <summary>
        /// ListarPoliza
        /// </summary>
        /// <param name="pEnPoliza"></param>
        /// <returns></returns>
        public List<PolizaEN> Buscar(string dniAsegurado, string numPoliza, string placa)
        {
            IPolizaDAO procuradorDao = new PolizaDAO();
            string dniAseguradoParam = dniAsegurado == null ? "" : dniAsegurado;
            string numPolizaParam = numPoliza == null ? "" : numPoliza.ToUpper();
            string placaParam = placa == null ? "" : placa.ToUpper();

            List<PolizaEN> listado = new List<PolizaEN>();

            DateTime Now = DateTime.Now;

            foreach (PolizaEN item in procuradorDao.GetAll().Where(
                b => b.Asegurado.DniAsegurado.Contains(dniAseguradoParam)
                    && b.NumPoliza.Contains(numPolizaParam)
                    && b.Vehiculo.Placa.ToUpper().Contains(placaParam)).ToList())
            {
                item.Vigente = item.FechaInicio <= Now && Now <= item.FechaFin;
                listado.Add(item);
            }

            if (listado.Count() == 0)
            {
                throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
            }

            return listado;
        }

    }
}
