using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.AD
{
    public interface IBaseDAO<TEntidad> where TEntidad:class
    {
        void Add(TEntidad item);
        void Remove(TEntidad item);
        void Modify(TEntidad item);
        TEntidad Get(int id);
        IEnumerable<TEntidad> GetAll();
    }
}
