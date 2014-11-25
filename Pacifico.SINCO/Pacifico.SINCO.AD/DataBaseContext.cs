using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using Pacifico.SINCO.EN;

namespace Pacifico.SINCO.AD
{
    public class DataBaseContext:DbContext
    {
        public DataBaseContext()
            : base("DBSeguro")
        {
            
        }
        
        //Aquí se definen todas los DBSets de las Entidades que serán transformadas en tablas
        /*
        public DbSet<MGAgencia> MGAgencias { get; set; }
        public DbSet<MGGuiaRemision> MGGuiaRemision { get; set; }
        public DbSet<MGProgramacionRuta> MGProgramacionRuta { get; set; }
        public DbSet<MGCliente> MGCliente { get; set; }
        public DbSet<MGVehiculo> MGVehiculo { get; set; }
        public DbSet<MGRuta> MGRuta { get; set; }
        
        public DbSet<MGProducto> MGProducto { get; set; }
        public DbSet<MGFichaCarga> MGFichaCarga { get; set; }
        public DbSet<MGDetalleFCarga> MGDetalleFCarga { get; set; }

        public DbSet<MGComprobantePago> MGComprobantePago { get; set; }

        public DbSet<MGTipoMovimiento> MGTipoMovimiento { get; set; }
        public DbSet<MGFichaMovimiento> MGFichaMovimiento { get; set; }
        */

        public DbSet<MPMarca> MPMarca { get; set; }
        public DbSet<MPModelo> MPModelo { get; set; }
        public DbSet<MSServicio> MSServicio { get; set; }
        public DbSet<MSListaPrecio> MSListaPrecio { get; set; }

        public DbSet<MSSiniestro> MSSiniestro { get; set; }
        public DbSet<MSInformeAccidente> MSInformeAccidente { get; set; }

        public DbSet<MSPresupuesto> MSPresupuesto { get; set; }
        public DbSet<MSDetallePresupuesto> MSDetallePresupuesto { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            Database.SetInitializer<DataBaseContext>(null);

            /**
             * Definimos relaciones complejas
             **/
            /*modelBuilder.Entity<MGFichaCarga>()
            .HasRequired(c => c.Remitente)
            .WithMany(p => p.FichasCargaRemitente)
            .HasForeignKey(c => c.MG_Remitente_ID);


            modelBuilder.Entity<MGFichaCarga>()
            .HasRequired(c1 => c1.Destinatario)
            .WithMany(p1 => p1.FichasCargaDestinatario)
            .HasForeignKey(c1 => c1.MG_Destinatario_ID);


            modelBuilder.Entity<MGGuiaRemision>()
            .HasRequired(c => c.ProgramacionRuta)
            .WithMany(p => p.GuiasRemision)
            .HasForeignKey(c => c.MK_ProgramacionRuta_ID);



            modelBuilder.Entity<MGFichaCarga>()
            .HasRequired(c => c.ProgramacionRuta)
            .WithMany(p => p.FichasCarga)
            .HasForeignKey(c => c.MK_ProgramacionRuta_ID);



            modelBuilder.Entity<MGComprobantePago>()
                .HasRequired(t => t.FichaCarga)
                .WithOptional(c => c.ComprobantePago);*/


            /**
             * Relacion Entre RUta y Agencia
             */

           /* modelBuilder.Entity<MGRuta>()
            .HasRequired(c => c.AgenciaOrigen)
            .WithMany(p=>p.RutasOrigen)
            .HasForeignKey(c => c.MG_Agencia_Origen_ID);


            modelBuilder.Entity<MGRuta>()
            .HasRequired(c1 => c1.AgenciaDestino)
            .WithMany(p => p.RutasDestino)
            .HasForeignKey(c1 => c1.MG_Agencia_Destino_ID);


            modelBuilder.Entity<MGFichaCarga>()
                .HasRequired(t => t.MGTipoMovimiento)
                .WithMany()
                .HasForeignKey(t => t.Estado);*/

            base.OnModelCreating(modelBuilder);


        }
    }
}
