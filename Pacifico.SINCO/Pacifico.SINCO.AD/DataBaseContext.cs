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
        
        public DbSet<MarcaEN> MPMarca { get; set; }
        public DbSet<ModeloEN> MPModelo { get; set; }
        public DbSet<ServicioEN> MSServicio { get; set; }
        public DbSet<ListaPrecioEN> MSListaPrecio { get; set; }

        public DbSet<SiniestroEN> MSSiniestro { get; set; }
        public DbSet<InformeAccidenteEN> MSInformeAccidente { get; set; }

        public DbSet<PresupuestoEN> MSPresupuesto { get; set; }
        public DbSet<DetallePresupuestoEN> MSDetallePresupuesto { get; set; }
        public DbSet<EstadoEN> Estado { get; set; }

        public DbSet<ProcuradorEN> MSProcurador { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            Database.SetInitializer<DataBaseContext>(null);

            /**
             * Definimos relaciones complejas
             **/

            modelBuilder.Entity<SiniestroEN>()
            .HasRequired(c => c.EstadoEntity)
            .WithMany()
            .HasForeignKey(c => c.Estado);

            modelBuilder.Entity<PresupuestoEN>()
            .HasRequired(c => c.EstadoEntity)
            .WithMany()
            .HasForeignKey(c => c.Estado);

            modelBuilder.Entity<InformeAccidenteEN>()
            .HasRequired(c => c.EstadoEntity)
            .WithMany()
            .HasForeignKey(c => c.Estado);

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
                .HasForeignKey(t => t.EstadoEN);*/

            base.OnModelCreating(modelBuilder);


        }
    }
}
