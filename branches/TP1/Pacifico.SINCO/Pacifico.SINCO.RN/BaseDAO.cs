using Pacifico.SINCO.AD;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace Pacifico.SINCO.RN
{
    public class BaseDAO<TEntidad>:IBaseDAO<TEntidad> where TEntidad:class
    {
        protected DataBaseContext Contexto;
        protected DbSet<TEntidad> DbSet; 

        protected BaseDAO()
        {
            DataBaseContext context = new DataBaseContext();
            Contexto = context;
            DbSet = context.Set<TEntidad>();
        }

        protected BaseDAO(DataBaseContext context)
        {
            Contexto = context;
            DbSet = context.Set<TEntidad>();
        }

        public void Add(TEntidad item)
        {
            DbSet.Add(item);

            try
            {
                Contexto.SaveChanges();
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        Trace.TraceInformation("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
            }
        }

        public void Remove(TEntidad item)
        {
            if (Contexto.Entry(item).State == EntityState.Detached)
            {
                DbSet.Attach(item);
            }
            Contexto.Entry(item).State = EntityState.Deleted;
            DbSet.Remove(item);
            Contexto.SaveChanges();
        }

        public void Modify(TEntidad item)
        {
            if (Contexto.Entry(item).State == EntityState.Detached)
            {
                DbSet.Attach(item);
                
            }
            Contexto.Entry(item).State = EntityState.Modified;            
            Contexto.SaveChanges();
        }

        public TEntidad Get(int id)
        {
            return DbSet.Find(id);
        }

        public virtual void EliminarLogicamente(int id)
        {
            TEntidad entidad = Get(id);
            Modify(entidad);
            var entry = Contexto.Entry(entidad);
            foreach (var name in entry.CurrentValues.PropertyNames)
            {
                try
                {
                    if (name == "EstadoRegistro")
                        entry.Property(name).IsModified = true;
                    else
                        entry.Property(name).IsModified = false;
                }
                catch { }
            }
            Contexto.SaveChanges();
        }
        
        public virtual void Grabar()
        {
            Contexto.SaveChanges();
        }

        public IEnumerable<TEntidad> GetAll()
        {
            return DbSet.ToList();
        }
    }
}