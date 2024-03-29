CREATE DATABASE [BD_Seguro]
GO
USE [BD_Seguro]
GO
/****** Object:  Table [dbo].[MP_Poliza]    Script Date: 11/19/2014 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MP_Poliza](
	[MP_Poliza_Id] [int] IDENTITY(1,1) NOT NULL,
	[NumPoliza] [varchar](16) NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[FechaFin] [datetime] NOT NULL,
	[MontoCobertura] [real] NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[UsuarioRegistro] [varchar](250) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[UsuarioModifico] [varchar](250) NOT NULL,
	[FechaModifico] [datetime] NOT NULL,
	[MP_Asegurado_ID] [int] NOT NULL,
	[MP_Vehiculo_ID] [int] NOT NULL,
 CONSTRAINT [PK_MP_Poliza] PRIMARY KEY CLUSTERED 
(
	[MP_Poliza_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MP_Modelo]    Script Date: 11/19/2014 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MP_Modelo](
	[MP_Modelo_Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](255) NULL,
 CONSTRAINT [PK_MP_Modelo] PRIMARY KEY CLUSTERED 
(
	[MP_Modelo_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MP_Marca]    Script Date: 11/19/2014 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MP_Marca](
	[MP_Marca_Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](255) NOT NULL,
 CONSTRAINT [PK_MP_Marca] PRIMARY KEY CLUSTERED 
(
	[MP_Marca_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MP_Asegurado]    Script Date: 11/19/2014 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MP_Asegurado](
	[MP_Asegurado_Id] [int] IDENTITY(1,1) NOT NULL,
	[DniAsegurado] [varchar](8) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[ApellidoPaterno] [varchar](255) NOT NULL,
	[ApellidoMaterno] [varchar](255) NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
 CONSTRAINT [PK_MP_Asegurado] PRIMARY KEY CLUSTERED 
(
	[MP_Asegurado_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MS_Siniestro]    Script Date: 11/19/2014 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MS_Siniestro](
	[MS_Siniestro_Id] [int] IDENTITY(1,1) NOT NULL,
	[NumSiniestro] [varchar](16) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[FechaSiniestro] [datetime] NOT NULL,
	[FechaAtencion] [datetime] NOT NULL,
	[Lugar] [varchar](250) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[Estado] [int] NOT NULL,
	[UsuarioRegistro] [varchar](250) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[UsuarioModifico] [varchar](250) NOT NULL,
	[FechaModifico] [datetime] NOT NULL,
	[MP_Poliza_Id] [int] NOT NULL,
	[MS_Procurador_Id] [int] NOT NULL,
 CONSTRAINT [PK_MS_Siniestro] PRIMARY KEY CLUSTERED 
(
	[MS_Siniestro_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MS_Procurador]    Script Date: 11/19/2014 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MS_Procurador](
	[MS_Procurador_Id] [int] IDENTITY(1,1) NOT NULL,
	[NumProcurador] [varchar](16) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[ApellidoPaterno] [varchar](255) NOT NULL,
	[ApellidoMaterno] [varchar](255) NOT NULL,
	[Telefono] [varchar](12) NOT NULL,
	[Disponible] [bit] NOT NULL,
 CONSTRAINT [PK_MS_Procurador] PRIMARY KEY CLUSTERED 
(
	[MS_Procurador_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MP_Vehiculo]    Script Date: 11/19/2014 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MP_Vehiculo](
	[MP_Vehiculo_Id] [int] IDENTITY(1,1) NOT NULL,
	[Placa] [varchar](50) NOT NULL,
	[Motor] [varchar](255) NOT NULL,
	[Chasis] [varchar](255) NULL,
	[MP_Modelo_Id] [int] NOT NULL,
	[MP_Marca_Id] [int] NOT NULL,
 CONSTRAINT [PK_MP_Vehiculo] PRIMARY KEY CLUSTERED 
(
	[MP_Vehiculo_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MS_Tecnico_Taller]    Script Date: 11/21/2014 00:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MS_Tecnico_Taller](
	[MS_Tecnico_Taller_Id] [int] IDENTITY(1,1) NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[FechaFin] [datetime] NOT NULL,
	[Disponible] [bit] NOT NULL,
	[MS_Tecnico_Id] [int] NOT NULL,
	[MS_Taller_Id] [int] NOT NULL,
 CONSTRAINT [PK_MS_Tecnico_Taller] PRIMARY KEY CLUSTERED 
(
	[MS_Tecnico_Taller_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MS_Tecnico]    Script Date: 11/21/2014 00:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MS_Tecnico](
	[MS_Tecnico_Id] [int] IDENTITY(1,1) NOT NULL,
	[NumTecnico] [varchar](16) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[ApellidoPaterno] [varchar](250) NOT NULL,
	[ApellidoMaterno] [varchar](250) NOT NULL,
	[Telefono] [varchar](250) NOT NULL,
 CONSTRAINT [PK_MS_Tecnico] PRIMARY KEY CLUSTERED 
(
	[MS_Tecnico_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MS_Taller]    Script Date: 11/21/2014 00:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MS_Taller](
	[MS_Taller_Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Distrito] [varchar](250) NOT NULL,
	[Direccion] [varchar](250) NOT NULL,
 CONSTRAINT [PK_MS_Taller] PRIMARY KEY CLUSTERED 
(
	[MS_Taller_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MS_Informe_Accidente]    Script Date: 11/21/2014 00:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MS_Informe_Accidente](
	[MS_Informe_Accidente_Id] [int] IDENTITY(1,1) NOT NULL,
	[NumInforme] [varchar](16) NOT NULL,
	[FechaInforme] [datetime] NOT NULL,
	[Distrito] [varchar](250) NOT NULL,
	[Direccion] [varchar](250) NOT NULL,
	[Estado] [int] NOT NULL,
	[UsuarioRegistro] [varchar](250) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[UsuarioModifico] [varchar](250) NOT NULL,
	[FechaModifico] [datetime] NOT NULL,
	[MS_Siniestro_Id] [int] NOT NULL,
	[MS_Tecnico_Taller_Id] [int] NOT NULL,
 CONSTRAINT [PK_MS_Informe_Accidente] PRIMARY KEY CLUSTERED 
(
	[MS_Informe_Accidente_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MS_Evidencia]    Script Date: 11/21/2014 00:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MS_Evidencia](
	[MS_Evidencia_Id] [int] IDENTITY(1,1) NOT NULL,
	[NumEvidencia] [varchar](16) NOT NULL,
	[Desripcion] [varchar](250) NOT NULL,
	[Ruta] [varchar](250) NOT NULL,
	[MS_Informe_Accidente_Id] [int] NOT NULL,
 CONSTRAINT [PK_MS_Evidencia] PRIMARY KEY CLUSTERED 
(
	[MS_Evidencia_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MS_Servicio]    Script Date: 11/19/2014 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MS_Servicio](
	[MS_Servicio_Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](255) NOT NULL,
 CONSTRAINT [PK_MS_Servicio] PRIMARY KEY CLUSTERED 
(
	[MS_Servicio_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MS_Lista_Precio]    Script Date: 11/19/2014 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MS_Lista_Precio](
	[MS_Lista_Precio_Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Precio] [real] NOT NULL,
	[MP_Modelo_Id] [int] NOT NULL,
	[MP_Marca_Id] [int] NOT NULL,
	[MS_Servicio_Id] [int] NOT NULL,
 CONSTRAINT [PK_MS_Lista_Precio] PRIMARY KEY CLUSTERED 
(
	[MS_Lista_Precio_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MS_Presupuesto]    Script Date: 11/21/2014 00:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MS_Presupuesto](
	[MS_Presupuesto_Id] [int] IDENTITY(1,1) NOT NULL,
	[NumPresupuesto] [varchar](16) NOT NULL,
	[FechaPresupuesto] [datetime] NOT NULL,
	[SubTotal] [real]  NOT NULL,
	[IGV] [real] NOT NULL,
	[Total] [real] NOT NULL,
	[Estado] [int] NOT NULL,
	[UsuarioRegistro] [varchar](250) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[UsuarioModifico] [varchar](250) NOT NULL,
	[FechaModifico] [datetime] NOT NULL,
	[MS_Informe_Accidente_Id] [int] NOT NULL,
 CONSTRAINT [PK_MS_Presupuesto] PRIMARY KEY CLUSTERED 
(
	[MS_Presupuesto_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MS_Detalle_Presupuesto]    Script Date: 11/21/2014 00:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MS_Detalle_Presupuesto](
	[MS_Detalle_Presupuesto_Id] [int] IDENTITY(1,1) NOT NULL,
	[Importe] [real]  NOT NULL,
	[Descuento] [real] NOT NULL,
	[Observacion] [varchar](250) NULL,
	[MS_Presupuesto_Id] [int] NOT NULL,
	[MS_Lista_Precio_Id] [int] NOT NULL,
 CONSTRAINT [PK_MS_Detalle_Presupuesto] PRIMARY KEY CLUSTERED 
(
	[MS_Detalle_Presupuesto_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 11/23/2014 03:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estado](
	[Estado_Id] [int] NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[Estado_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  ForeignKey [FK_MP_Modelo]    Script Date: 11/19/2014 21:35:27 ******/
ALTER TABLE [dbo].[MP_Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_MP_Vehiculo_MP_Modelo] FOREIGN KEY([MP_Modelo_Id])
REFERENCES [dbo].[MP_Modelo] ([MP_Modelo_Id])
GO
ALTER TABLE [dbo].[MP_Vehiculo] CHECK CONSTRAINT [FK_MP_Vehiculo_MP_Modelo]
GO
/****** Object:  ForeignKey [FK_MP_Modelo]    Script Date: 11/19/2014 21:35:27 ******/
ALTER TABLE [dbo].[MP_Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_MP_Vehiculo_MP_Marca] FOREIGN KEY([MP_Marca_Id])
REFERENCES [dbo].[MP_Marca] ([MP_Marca_Id])
GO
ALTER TABLE [dbo].[MP_Vehiculo] CHECK CONSTRAINT [FK_MP_Vehiculo_MP_Marca]
GO
/****** Object:  ForeignKey [FK_MP_Poliza_MP_Asegurado]    Script Date: 11/19/2014 21:35:27 ******/
ALTER TABLE [dbo].[MP_Poliza]  WITH CHECK ADD  CONSTRAINT [FK_MP_Poliza_MP_Asegurado] FOREIGN KEY([MP_Asegurado_Id])
REFERENCES [dbo].[MP_Asegurado] ([MP_Asegurado_Id])
GO
ALTER TABLE [dbo].[MP_Poliza] CHECK CONSTRAINT [FK_MP_Poliza_MP_Asegurado]
GO
/****** Object:  ForeignKey [FK_MP_Poliza_MP_Asegurado]    Script Date: 11/19/2014 21:35:27 ******/
ALTER TABLE [dbo].[MP_Poliza]  WITH CHECK ADD  CONSTRAINT [FK_MP_Poliza_MP_Vehiculo] FOREIGN KEY([MP_Vehiculo_Id])
REFERENCES [dbo].[MP_Vehiculo] ([MP_Vehiculo_Id])
GO
ALTER TABLE [dbo].[MP_Poliza] CHECK CONSTRAINT [FK_MP_Poliza_MP_Vehiculo]
GO
/****** Object:  ForeignKey [FK_MS_Siniestro_MS_Procurador]    Script Date: 11/19/2014 21:35:27 ******/
ALTER TABLE [dbo].[MS_Siniestro]  WITH CHECK ADD  CONSTRAINT FK_MS_Siniestro_MS_Procurador FOREIGN KEY([MS_Procurador_Id])
REFERENCES [dbo].[MS_Procurador] ([MS_Procurador_Id])
GO
ALTER TABLE [dbo].[MS_Siniestro] CHECK CONSTRAINT FK_MS_Siniestro_MS_Procurador
GO
/****** Object:  ForeignKey [FK_MS_Siniestro_MP_Poliza]    Script Date: 11/19/2014 21:35:27 ******/
ALTER TABLE [dbo].[MS_Siniestro]  WITH CHECK ADD  CONSTRAINT [FK_MS_Siniestro_MP_Poliza] FOREIGN KEY([MP_Poliza_Id])
REFERENCES [dbo].[MP_Poliza] ([MP_Poliza_Id])
GO
ALTER TABLE [dbo].[MS_Siniestro] CHECK CONSTRAINT [FK_MS_Siniestro_MP_Poliza]
GO
/****** Object:  ForeignKey [FK_MS_Evidencia_MS_Informe]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[MS_Evidencia]  WITH CHECK ADD  CONSTRAINT [FK_MS_Evidencia_MS_Informe] FOREIGN KEY([MS_Informe_Accidente_Id])
REFERENCES [dbo].[MS_Informe_Accidente] ([MS_Informe_Accidente_Id])
GO
ALTER TABLE [dbo].[MS_Evidencia] CHECK CONSTRAINT [FK_MS_Evidencia_MS_Informe]
GO
/****** Object:  ForeignKey [FK_MS_TecnicoTaller_MS_Tecnico]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[MS_Tecnico_Taller]  WITH CHECK ADD  CONSTRAINT [FK_MS_TecnicoTaller_MS_Tecnico] FOREIGN KEY([MS_Tecnico_Id])
REFERENCES [dbo].[MS_Tecnico] ([MS_Tecnico_Id])
GO
ALTER TABLE [dbo].[MS_Tecnico_Taller] CHECK CONSTRAINT [FK_MS_TecnicoTaller_MS_Tecnico]
GO
/****** Object:  ForeignKey [FK_MS_TecnicoTaller_MS_Taller]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[MS_Tecnico_Taller]  WITH CHECK ADD  CONSTRAINT [FK_MS_TecnicoTaller_MS_Taller] FOREIGN KEY([MS_Taller_Id])
REFERENCES [dbo].[MS_Taller] ([MS_Taller_Id])
GO
ALTER TABLE [dbo].[MS_Tecnico_Taller] CHECK CONSTRAINT [FK_MS_TecnicoTaller_MS_Taller]
GO
/****** Object:  ForeignKey [FK_MS_Informe_MS_Siniestro]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[MS_Informe_Accidente]  WITH CHECK ADD  CONSTRAINT [FK_MS_Informe_MS_Siniestro] FOREIGN KEY([MS_Siniestro_Id])
REFERENCES [dbo].[MS_Siniestro] ([MS_Siniestro_Id])
GO
ALTER TABLE [dbo].[MS_Informe_Accidente] CHECK CONSTRAINT [FK_MS_Informe_MS_Siniestro]
GO
/****** Object:  ForeignKey [FK_MS_Informe_MS_TecnicoTaller]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[MS_Informe_Accidente]  WITH CHECK ADD  CONSTRAINT [FK_MS_Informe_MS_TecnicoTaller] FOREIGN KEY([MS_Tecnico_Taller_Id])
REFERENCES [dbo].[MS_Tecnico_Taller] ([MS_Tecnico_Taller_Id])
GO
ALTER TABLE [dbo].[MS_Informe_Accidente] CHECK CONSTRAINT [FK_MS_Informe_MS_TecnicoTaller]
GO
/****** Object:  ForeignKey [FK_MS_ListaPrecio_MP_Modelo]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[MS_Lista_Precio]  WITH CHECK ADD  CONSTRAINT [FK_MS_ListaPrecio_MP_Modelo] FOREIGN KEY([MP_Modelo_Id])
REFERENCES [dbo].[MP_Modelo] ([MP_Modelo_Id])
GO
ALTER TABLE [dbo].[MS_Lista_Precio] CHECK CONSTRAINT [FK_MS_ListaPrecio_MP_Modelo]
GO
/****** Object:  ForeignKey [FK_MS_ListaPrecio_MP_Marca]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[MS_Lista_Precio]  WITH CHECK ADD  CONSTRAINT [FK_MS_ListaPrecio_MP_Marca] FOREIGN KEY([MP_Marca_Id])
REFERENCES [dbo].[MP_Marca] ([MP_Marca_Id])
GO
ALTER TABLE [dbo].[MS_Lista_Precio] CHECK CONSTRAINT [FK_MS_ListaPrecio_MP_Marca]
GO
/****** Object:  ForeignKey [FK_MS_ListaPrecio_MS_Servicio]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[MS_Lista_Precio]  WITH CHECK ADD  CONSTRAINT [FK_MS_ListaPrecio_MS_Servicio] FOREIGN KEY([MS_Servicio_Id])
REFERENCES [dbo].[MS_Servicio] ([MS_Servicio_Id])
GO
ALTER TABLE [dbo].[MS_Lista_Precio] CHECK CONSTRAINT [FK_MS_ListaPrecio_MS_Servicio]
GO
/****** Object:  ForeignKey [FK_MS_Presupuesto_MS_Informe]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[MS_Presupuesto]  WITH CHECK ADD  CONSTRAINT [FK_MS_Presupuesto_MS_Informe] FOREIGN KEY([MS_Informe_Accidente_Id])
REFERENCES [dbo].[MS_Informe_Accidente] ([MS_Informe_Accidente_Id])
GO
ALTER TABLE [dbo].[MS_Presupuesto] CHECK CONSTRAINT [FK_MS_Presupuesto_MS_Informe]
GO
/****** Object:  ForeignKey [FK_MS_DetallePresupuesto_MS_Presupuesto]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[MS_Detalle_Presupuesto]  WITH CHECK ADD  CONSTRAINT [FK_MS_DetallePresupuesto_MS_Presupuesto] FOREIGN KEY([MS_Presupuesto_Id])
REFERENCES [dbo].[MS_Presupuesto] ([MS_Presupuesto_Id])
GO
ALTER TABLE [dbo].[MS_Detalle_Presupuesto] CHECK CONSTRAINT [FK_MS_DetallePresupuesto_MS_Presupuesto]
GO
/****** Object:  ForeignKey [FK_MS_DetallePresupuesto_MS_ListaPrecio]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[MS_Detalle_Presupuesto]  WITH CHECK ADD  CONSTRAINT [FK_MS_DetallePresupuesto_MS_ListaPrecio] FOREIGN KEY([MS_Lista_Precio_Id])
REFERENCES [dbo].[MS_Lista_Precio] ([MS_Lista_Precio_Id])
GO
ALTER TABLE [dbo].[MS_Detalle_Presupuesto] CHECK CONSTRAINT [FK_MS_DetallePresupuesto_MS_ListaPrecio]
GO
/****** Object:  ForeignKey [FK_MS_Siniestro_Estado]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[MS_Siniestro]  WITH CHECK ADD  CONSTRAINT [FK_MS_Siniestro_Estado] FOREIGN KEY([Estado])
REFERENCES [dbo].[Estado] ([Estado_Id])
GO
ALTER TABLE [dbo].[MS_Siniestro] CHECK CONSTRAINT [FK_MS_Siniestro_Estado]
GO
/****** Object:  ForeignKey [FK_MS_Informe_Estado]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[MS_Informe_Accidente]  WITH CHECK ADD  CONSTRAINT [FK_MS_Informe_Estado] FOREIGN KEY([Estado])
REFERENCES [dbo].[Estado] ([Estado_Id])
GO
ALTER TABLE [dbo].[MS_Informe_Accidente] CHECK CONSTRAINT [FK_MS_Informe_Estado]
GO
/****** Object:  ForeignKey [FK_MS_Presupuesto_Estado]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[MS_Presupuesto]  WITH CHECK ADD  CONSTRAINT [FK_MS_Presupuesto_Estado] FOREIGN KEY([Estado])
REFERENCES [dbo].[Estado] ([Estado_Id])
GO
ALTER TABLE [dbo].[MS_Presupuesto] CHECK CONSTRAINT [FK_MS_Presupuesto_Estado]
GO