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

