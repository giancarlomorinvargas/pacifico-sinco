CREATE DATABASE [BD_Seguro]
GO
USE [BD_Seguro]
GO
/****** Object:  Table [dbo].[Poliza]    Script Date: 11/19/2014 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POLIZA](
	[Poliza_Id] [int] IDENTITY(1,1) NOT NULL,
	[NumPoliza] [varchar](16) NOT NULL,
	[F_Inicio] [datetime] NOT NULL,
	[F_Fin] [datetime] NOT NULL,
	[MontoCobertura] [real] NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[UsuarioRegistro] [varchar](250) NOT NULL,
	[F_Registro] [datetime] NOT NULL,
	[UsuarioModifico] [varchar](250) NOT NULL,
	[F_Modifico] [datetime] NOT NULL,
	[Asegurado_ID] [int] NOT NULL,
	[Vehiculo_ID] [int] NOT NULL,
 CONSTRAINT [PK_POLIZA] PRIMARY KEY CLUSTERED 
(
	[Poliza_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Modelo]    Script Date: 11/19/2014 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MODELO](
	[Modelo_Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](250) NULL,
 CONSTRAINT [PK_MODELO] PRIMARY KEY CLUSTERED 
(
	[Modelo_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 11/19/2014 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MARCA](
	[Marca_Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[Marca_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Asegurado]    Script Date: 11/19/2014 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ASEGURADO](
	[Asegurado_Id] [int] IDENTITY(1,1) NOT NULL,
	[DniAsegurado] [varchar](8) NOT NULL,
	[V_Nombre] [varchar](250) NOT NULL,
	[V_ApellidoPaterno] [varchar](250) NOT NULL,
	[V_ApellidoMaterno] [varchar](250) NOT NULL,
	[F_Nacimiento] [datetime] NOT NULL,
 CONSTRAINT [PK_Asegurado] PRIMARY KEY CLUSTERED 
(
	[Asegurado_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Siniestro]    Script Date: 11/19/2014 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SINIESTRO](
	[Siniestro_Id] [int] IDENTITY(1,1) NOT NULL,
	[V_NumSiniestro] [varchar](16) NOT NULL,
	[V_Tipo] [varchar](50) NOT NULL,
	[F_Siniestro] [datetime] NOT NULL,
	[F_Atencion] [datetime] NOT NULL,
	[V_Lugar] [varchar](250) NOT NULL,
	[V_Descripcion] [varchar](250) NOT NULL,
	[Estado_Id] [int] NOT NULL,
	[V_UsuarioRegistro] [varchar](250) NOT NULL,
	[F_Registro] [datetime] NOT NULL,
	[V_UsuarioModifico] [varchar](250) NOT NULL,
	[F_Modifico] [datetime] NOT NULL,
	[Poliza_Id] [int] NOT NULL,
	[Procurador_Id] [int] NOT NULL,
	[Tecnico_Id] [int] NULL,
 CONSTRAINT [PK_Siniestro] PRIMARY KEY CLUSTERED 
(
	[Siniestro_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Procurador]    Script Date: 11/19/2014 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROCURADOR](
	[Procurador_Id] [int] IDENTITY(1,1) NOT NULL,
	[V_NumProcurador] [varchar](16) NOT NULL,
	[V_Nombre] [varchar](250) NOT NULL,
	[V_ApellidoPaterno] [varchar](250) NOT NULL,
	[V_ApellidoMaterno] [varchar](250) NOT NULL,
	[V_Telefono] [varchar](12) NOT NULL,
	[B_Disponible] [bit] NOT NULL,
 CONSTRAINT [PK_Procurador] PRIMARY KEY CLUSTERED 
(
	[Procurador_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 11/19/2014 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VEHICULO](
	[Vehiculo_Id] [int] IDENTITY(1,1) NOT NULL,
	[V_Placa] [varchar](50) NOT NULL,
	[V_Motor] [varchar](250) NOT NULL,
	[V_Chasis] [varchar](250) NULL,
	[Modelo_Id] [int] NOT NULL,
	[Marca_Id] [int] NOT NULL,
 CONSTRAINT [PK_Vehiculo] PRIMARY KEY CLUSTERED 
(
	[Vehiculo_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tecnico]    Script Date: 11/21/2014 00:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TECNICO](
	[Tecnico_Id] [int] IDENTITY(1,1) NOT NULL,
	[NumTecnico] [varchar](16) NOT NULL,
	[V_Nombre] [varchar](250) NOT NULL,
	[V_ApellidoPaterno] [varchar](250) NOT NULL,
	[V_ApellidoMaterno] [varchar](250) NOT NULL,
	[V_Telefono] [varchar](250) NOT NULL,
	[B_Disponible] [bit] NOT NULL,
	[Taller_Id] [int] NOT NULL,
 CONSTRAINT [PK_Tecnico] PRIMARY KEY CLUSTERED 
(
	[Tecnico_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Taller]    Script Date: 11/21/2014 00:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TALLER](
	[Taller_Id] [int] IDENTITY(1,1) NOT NULL,
	[V_Nombre] [varchar](250) NOT NULL,
	[V_Distrito] [varchar](250) NOT NULL,
	[V_Direccion] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Taller] PRIMARY KEY CLUSTERED 
(
	[Taller_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Informe_Accidente]    Script Date: 11/21/2014 00:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[INFORME_ACCIDENTE](
	[Informe_Accidente_Id] [int] IDENTITY(1,1) NOT NULL,
	[V_NumInforme] [varchar](16) NOT NULL,
	[F_Informe] [datetime] NOT NULL,
	[V_Distrito] [varchar](250) NOT NULL,
	[V_Direccion] [varchar](250) NOT NULL,
	[Estado_Id] [int] NOT NULL,
	[V_UsuarioRegistro] [varchar](250) NOT NULL,
	[F_Registro] [datetime] NOT NULL,
	[V_UsuarioModifico] [varchar](250) NOT NULL,
	[F_Modifico] [datetime] NOT NULL,
	[Siniestro_Id] [int] NOT NULL,
	[Tecnico_Id] [int] NULL,
 CONSTRAINT [PK_Informe_Accidente] PRIMARY KEY CLUSTERED 
(
	[Informe_Accidente_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Evidencia]    Script Date: 11/21/2014 00:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EVIDENCIA](
	[Evidencia_Id] [int] IDENTITY(1,1) NOT NULL,
	[V_NumEvidencia] [varchar](16) NOT NULL,
	[V_Desripcion] [varchar](250) NOT NULL,
	[V_Ruta] [varchar](250) NOT NULL,
	[Informe_Accidente_Id] [int] NOT NULL,
 CONSTRAINT [PK_Evidencia] PRIMARY KEY CLUSTERED 
(
	[Evidencia_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 11/19/2014 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SERVICIO](
	[Servicio_Id] [int] IDENTITY(1,1) NOT NULL,
	[V_Descripcion] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[Servicio_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lista_Precio]    Script Date: 11/19/2014 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LISTA_PRECIO](
	[Lista_Precio_Id] [int] IDENTITY(1,1) NOT NULL,
	[F_Creacion] [datetime] NOT NULL,
	[R_Precio] [real] NOT NULL,
	[Modelo_Id] [int] NOT NULL,
	[Marca_Id] [int] NOT NULL,
	[Servicio_Id] [int] NOT NULL,
 CONSTRAINT [PK_Lista_Precio] PRIMARY KEY CLUSTERED 
(
	[Lista_Precio_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Presupuesto]    Script Date: 11/21/2014 00:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRESUPUESTO](
	[Presupuesto_Id] [int] IDENTITY(1,1) NOT NULL,
	[V_NumPresupuesto] [varchar](16) NOT NULL,
	[F_Presupuesto] [datetime] NOT NULL,
	[R_SubTotal] [real]  NOT NULL,
	[R_IGV] [real] NOT NULL,
	[R_Total] [real] NOT NULL,
	[Estado_Id] [int] NOT NULL,
	[V_UsuarioRegistro] [varchar](250) NOT NULL,
	[F_Registro] [datetime] NOT NULL,
	[V_UsuarioModifico] [varchar](250) NOT NULL,
	[F_Modifico] [datetime] NOT NULL,
	[Informe_Accidente_Id] [int] NOT NULL,
	[V_Observacion_Rechazo] [varchar](max) NULL,
 CONSTRAINT [PK_Presupuesto] PRIMARY KEY CLUSTERED 
(
	[Presupuesto_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Detalle_Presupuesto]    Script Date: 11/21/2014 00:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRESUPUESTO_DETALLE](
	[Presupuesto_Detalle_Id] [int] IDENTITY(1,1) NOT NULL,
	[R_Importe] [real]  NOT NULL,
	[R_Descuento] [real] NOT NULL,
	[V_Observacion] [varchar](250) NULL,
	[Presupuesto_Id] [int] NOT NULL,
	[Lista_Precio_Id] [int] NOT NULL,
 CONSTRAINT [PK_Presupuesto_Detalle] PRIMARY KEY CLUSTERED 
(
	[Presupuesto_Detalle_Id] ASC
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
CREATE TABLE [dbo].[ESTADO](
	[Estado_Id] [int] NOT NULL,
	[V_Nombre] [varchar](250) NOT NULL,
	[V_Descripcion] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[Estado_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LIQUIDACION]    Script Date: 11/21/2014 00:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LIQUIDACION](
	[Liquidacion_Id] [int] IDENTITY(1,1) NOT NULL,
	[V_NumLiquidacion] [varchar](16) NOT NULL,
	[F_Liquidacion] [datetime] NOT NULL,
	[V_Descripcion] [varchar](250) NOT NULL,
	[R_MontoLiquidacion] [real] NOT NULL,
	[Estado_Id] [int] NOT NULL,
	[V_UsuarioRegistro] [varchar](250) NOT NULL,
	[F_Registro] [datetime] NOT NULL,
	[V_UsuarioModifico] [varchar](250) NOT NULL,
	[F_Modifico] [datetime] NOT NULL,
	[Siniestro_Id] [int] NOT NULL,
 CONSTRAINT [PK_Liquidacion] PRIMARY KEY CLUSTERED 
(
	[Liquidacion_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ORDEN]    Script Date: 11/21/2014 00:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORDEN](
	[Orden_Id] [int] IDENTITY(1,1) NOT NULL,
	[V_NumOrden] [varchar](16) NOT NULL,
	[R_DescuentoOrden] [real] NOT NULL,
	[F_Orden] [datetime] NOT NULL,
	[Estado_Id] [int] NOT NULL,
	[V_UsuarioRegistro] [varchar](250) NOT NULL,
	[F_Registro] [datetime] NOT NULL,
	[V_UsuarioModifico] [varchar](250) NOT NULL,
	[F_Modifico] [datetime] NOT NULL,
	[Liquidacion_Id] [int] NOT NULL,
 CONSTRAINT [PK_Orden] PRIMARY KEY CLUSTERED 
(
	[Orden_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Modelo]    Script Date: 11/19/2014 21:35:27 ******/
ALTER TABLE [dbo].[VEHICULO]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Modelo] FOREIGN KEY([Modelo_Id])
REFERENCES [dbo].[MODELO] ([Modelo_Id])
GO
ALTER TABLE [dbo].[VEHICULO] CHECK CONSTRAINT [FK_Vehiculo_Modelo]
GO
/****** Object:  ForeignKey [FK_Modelo]    Script Date: 11/19/2014 21:35:27 ******/
ALTER TABLE [dbo].[VEHICULO]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Marca] FOREIGN KEY([Marca_Id])
REFERENCES [dbo].[MARCA] ([Marca_Id])
GO
ALTER TABLE [dbo].[VEHICULO] CHECK CONSTRAINT [FK_Vehiculo_Marca]
GO
/****** Object:  ForeignKey [FK_Poliza_Asegurado]    Script Date: 11/19/2014 21:35:27 ******/
ALTER TABLE [dbo].[POLIZA]  WITH CHECK ADD  CONSTRAINT [FK_Poliza_Asegurado] FOREIGN KEY([Asegurado_ID])
REFERENCES [dbo].[ASEGURADO] ([Asegurado_Id])
GO
ALTER TABLE [dbo].[POLIZA] CHECK CONSTRAINT [FK_Poliza_Asegurado]
GO
/****** Object:  ForeignKey [FK_Poliza_Asegurado]    Script Date: 11/19/2014 21:35:27 ******/
ALTER TABLE [dbo].[POLIZA]  WITH CHECK ADD  CONSTRAINT [FK_Poliza_Vehiculo] FOREIGN KEY([Vehiculo_ID])
REFERENCES [dbo].[VEHICULO] ([Vehiculo_Id])
GO
ALTER TABLE [dbo].[POLIZA] CHECK CONSTRAINT [FK_Poliza_Vehiculo]
GO
/****** Object:  ForeignKey [FK_Siniestro_Procurador]    Script Date: 11/19/2014 21:35:27 ******/
ALTER TABLE [dbo].[SINIESTRO]  WITH CHECK ADD  CONSTRAINT FK_Siniestro_Procurador FOREIGN KEY([Procurador_Id])
REFERENCES [dbo].[PROCURADOR] ([Procurador_Id])
GO
ALTER TABLE [dbo].[SINIESTRO] CHECK CONSTRAINT FK_Siniestro_Procurador
GO
/****** Object:  ForeignKey [FK_Siniestro_Poliza]    Script Date: 11/19/2014 21:35:27 ******/
ALTER TABLE [dbo].[SINIESTRO]  WITH CHECK ADD  CONSTRAINT [FK_Siniestro_Poliza] FOREIGN KEY([Poliza_Id])
REFERENCES [dbo].[POLIZA] ([Poliza_Id])
GO
ALTER TABLE [dbo].[SINIESTRO] CHECK CONSTRAINT [FK_Siniestro_Poliza]
GO
/****** Object:  ForeignKey [FK_Evidencia_Informe]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[EVIDENCIA]  WITH CHECK ADD  CONSTRAINT [FK_Evidencia_Informe_Accidente] FOREIGN KEY([Informe_Accidente_Id])
REFERENCES [dbo].[INFORME_ACCIDENTE] ([Informe_Accidente_Id])
GO
ALTER TABLE [dbo].[EVIDENCIA] CHECK CONSTRAINT [FK_Evidencia_Informe_Accidente]
GO
/****** Object:  ForeignKey [FK_Tecnico_Taller]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[TECNICO]  WITH CHECK ADD  CONSTRAINT [FK_Tecnico_Taller] FOREIGN KEY([Taller_Id])
REFERENCES [dbo].[TALLER] ([Taller_Id])
GO
ALTER TABLE [dbo].[TECNICO] CHECK CONSTRAINT [FK_Tecnico_Taller]
GO
/****** Object:  ForeignKey [FK_Informe_Siniestro]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[INFORME_ACCIDENTE]  WITH CHECK ADD  CONSTRAINT [FK_Informe_Accidente_Siniestro] FOREIGN KEY([Siniestro_Id])
REFERENCES [dbo].[SINIESTRO] ([Siniestro_Id])
GO
ALTER TABLE [dbo].[INFORME_ACCIDENTE] CHECK CONSTRAINT [FK_Informe_Accidente_Siniestro]
GO
/****** Object:  ForeignKey [FK_Informe_Tecnico]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[INFORME_ACCIDENTE]  WITH CHECK ADD  CONSTRAINT [FK_Informe_Tecnico] FOREIGN KEY([Tecnico_Id])
REFERENCES [dbo].[TECNICO] ([Tecnico_Id])
GO
ALTER TABLE [dbo].[INFORME_ACCIDENTE] CHECK CONSTRAINT [FK_Informe_Tecnico]
GO
/****** Object:  ForeignKey [FK_ListaPrecio_Modelo]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[LISTA_PRECIO]  WITH CHECK ADD  CONSTRAINT [FK_Lista_Precio_Modelo] FOREIGN KEY([Modelo_Id])
REFERENCES [dbo].[MODELO] ([Modelo_Id])
GO
ALTER TABLE [dbo].[LISTA_PRECIO] CHECK CONSTRAINT [FK_Lista_Precio_Modelo]
GO
/****** Object:  ForeignKey [FK_ListaPrecio_Marca]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[LISTA_PRECIO]  WITH CHECK ADD  CONSTRAINT [FK_Lista_Precio_Marca] FOREIGN KEY([Marca_Id])
REFERENCES [dbo].[MARCA] ([Marca_Id])
GO
ALTER TABLE [dbo].[LISTA_PRECIO] CHECK CONSTRAINT [FK_Lista_Precio_Marca]
GO
/****** Object:  ForeignKey [FK_ListaPrecio_Servicio]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[LISTA_PRECIO]  WITH CHECK ADD  CONSTRAINT [FK_Lista_Precio_Servicio] FOREIGN KEY([Servicio_Id])
REFERENCES [dbo].[SERVICIO] ([Servicio_Id])
GO
ALTER TABLE [dbo].[LISTA_PRECIO] CHECK CONSTRAINT [FK_Lista_Precio_Servicio]
GO
/****** Object:  ForeignKey [FK_Presupuesto_Informe]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[PRESUPUESTO]  WITH CHECK ADD  CONSTRAINT [FK_Presupuesto_Informe_Accidente] FOREIGN KEY([Informe_Accidente_Id])
REFERENCES [dbo].[INFORME_ACCIDENTE] ([Informe_Accidente_Id])
GO
ALTER TABLE [dbo].[PRESUPUESTO] CHECK CONSTRAINT [FK_Presupuesto_Informe_Accidente]
GO
/****** Object:  ForeignKey [FK_DetallePresupuesto_Presupuesto]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[PRESUPUESTO_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_Presupuesto_Detalle_Presupuesto] FOREIGN KEY([Presupuesto_Id])
REFERENCES [dbo].[PRESUPUESTO] ([Presupuesto_Id])
GO
ALTER TABLE [dbo].[PRESUPUESTO_DETALLE] CHECK CONSTRAINT [FK_Presupuesto_Detalle_Presupuesto]
GO
/****** Object:  ForeignKey [FK_DetallePresupuesto_ListaPrecio]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[PRESUPUESTO_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_Presupuesto_Detalle_Lista_Precio] FOREIGN KEY([Lista_Precio_Id])
REFERENCES [dbo].[LISTA_PRECIO] ([Lista_Precio_Id])
GO
ALTER TABLE [dbo].[PRESUPUESTO_DETALLE] CHECK CONSTRAINT [FK_Presupuesto_Detalle_Lista_Precio]
GO
/****** Object:  ForeignKey [FK_Siniestro_Estado]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[SINIESTRO]  WITH CHECK ADD  CONSTRAINT [FK_Siniestro_Estado] FOREIGN KEY([Estado_Id])
REFERENCES [dbo].[ESTADO] ([Estado_Id])
GO
ALTER TABLE [dbo].[SINIESTRO] CHECK CONSTRAINT [FK_Siniestro_Estado]
GO
/****** Object:  ForeignKey [FK_Informe_Estado]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[INFORME_ACCIDENTE]  WITH CHECK ADD  CONSTRAINT [FK_Informe_Accidente_Estado] FOREIGN KEY([Estado_Id])
REFERENCES [dbo].[ESTADO] ([Estado_Id])
GO
ALTER TABLE [dbo].[INFORME_ACCIDENTE] CHECK CONSTRAINT [FK_Informe_Accidente_Estado]
GO
/****** Object:  ForeignKey [FK_Presupuesto_Estado]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[PRESUPUESTO]  WITH CHECK ADD  CONSTRAINT [FK_Presupuesto_Estado] FOREIGN KEY([Estado_Id])
REFERENCES [dbo].[ESTADO] ([Estado_Id])
GO
ALTER TABLE [dbo].[PRESUPUESTO] CHECK CONSTRAINT [FK_Presupuesto_Estado]
GO
/****** Object:  ForeignKey [FK_Liquidacion_Siniestro]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[LIQUIDACION]  WITH CHECK ADD  CONSTRAINT [FK_Liquidacion_Siniestro] FOREIGN KEY([Siniestro_Id])
REFERENCES [dbo].[SINIESTRO] ([Siniestro_Id])
GO
ALTER TABLE [dbo].[LIQUIDACION] CHECK CONSTRAINT [FK_Liquidacion_Siniestro]
GO
/****** Object:  ForeignKey [FK_Liquidacion_Estado]    Script Date: 11/21/2014 00:40:17 ******/
ALTER TABLE [dbo].[LIQUIDACION]  WITH CHECK ADD  CONSTRAINT [FK_Liquidacion_Estado] FOREIGN KEY([Estado_Id])
REFERENCES [dbo].[ESTADO] ([Estado_Id])
GO
ALTER TABLE [dbo].[LIQUIDACION] CHECK CONSTRAINT [FK_Liquidacion_Estado]
GO
/****** Object:  ForeignKey [FK_Orden_Estado]    Script Date: 28/01/2015 00:40:17 ******/
ALTER TABLE [dbo].[ORDEN]  WITH CHECK ADD  CONSTRAINT [FK_Orden_Estado] FOREIGN KEY([Estado_Id])
REFERENCES [dbo].[ESTADO] ([Estado_Id])
GO
ALTER TABLE [dbo].[ORDEN] CHECK CONSTRAINT [FK_Orden_Estado]
GO
/****** Object:  ForeignKey [FK_Orden_Liquidacion]    Script Date: 28/01/2015 00:40:17 ******/
ALTER TABLE [dbo].[ORDEN]  WITH CHECK ADD  CONSTRAINT [FK_Orden_Liquidacion] FOREIGN KEY([Liquidacion_Id])
REFERENCES [dbo].[LIQUIDACION] ([Liquidacion_Id])
GO
ALTER TABLE [dbo].[ORDEN] CHECK CONSTRAINT [FK_Orden_Liquidacion]
GO