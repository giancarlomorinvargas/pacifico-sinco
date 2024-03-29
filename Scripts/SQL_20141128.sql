
/****** Object:  Table [dbo].[MP_Modelo]    Script Date: 11/28/2014 17:27:41 ******/
SET IDENTITY_INSERT [dbo].[MP_Modelo] ON
INSERT [dbo].[MP_Modelo] ([MP_Modelo_Id], [Descripcion]) VALUES (1, N'TIIDA')
SET IDENTITY_INSERT [dbo].[MP_Modelo] OFF
/****** Object:  Table [dbo].[MP_Marca]    Script Date: 11/28/2014 17:27:41 ******/
SET IDENTITY_INSERT [dbo].[MP_Marca] ON
INSERT [dbo].[MP_Marca] ([MP_Marca_Id], [Descripcion]) VALUES (1, N'NISSAN')
SET IDENTITY_INSERT [dbo].[MP_Marca] OFF
/****** Object:  Table [dbo].[MP_Asegurado]    Script Date: 11/28/2014 17:27:41 ******/
SET IDENTITY_INSERT [dbo].[MP_Asegurado] ON
INSERT [dbo].[MP_Asegurado] ([MP_Asegurado_Id], [DniAsegurado], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [FechaNacimiento]) VALUES (1, N'4588475', N'Jorge', N'Lopez', N'Paredes', CAST(0x0000796F00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[MP_Asegurado] OFF
/****** Object:  Table [dbo].[Estado]    Script Date: 11/28/2014 17:27:41 ******/
INSERT [dbo].[Estado] ([Estado_Id], [Nombre], [Descripcion]) VALUES (1, N'Estado 1', N'Descripcion')
INSERT [dbo].[Estado] ([Estado_Id], [Nombre], [Descripcion]) VALUES (2, N'Estado 2', N'Descripcion')
INSERT [dbo].[Estado] ([Estado_Id], [Nombre], [Descripcion]) VALUES (3, N'Estado 3', N'Descripcion')
/****** Object:  Table [dbo].[MS_Servicio]    Script Date: 11/28/2014 17:27:41 ******/
/****** Object:  Table [dbo].[MS_Procurador]    Script Date: 11/28/2014 17:27:41 ******/
SET IDENTITY_INSERT [dbo].[MS_Procurador] ON
INSERT [dbo].[MS_Procurador] ([MS_Procurador_Id], [NumProcurador], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Telefono], [Disponible]) VALUES (1, N'PR-001', N'Carlos', N'Romero', N'Gonzales', N'3184144', 1)
SET IDENTITY_INSERT [dbo].[MS_Procurador] OFF
/****** Object:  Table [dbo].[MS_Tecnico]    Script Date: 11/28/2014 17:27:41 ******/
/****** Object:  Table [dbo].[MS_Taller]    Script Date: 11/28/2014 17:27:41 ******/
/****** Object:  Table [dbo].[MS_Tecnico_Taller]    Script Date: 11/28/2014 17:27:41 ******/
/****** Object:  Table [dbo].[MS_Lista_Precio]    Script Date: 11/28/2014 17:27:41 ******/
/****** Object:  Table [dbo].[MP_Vehiculo]    Script Date: 11/28/2014 17:27:41 ******/
SET IDENTITY_INSERT [dbo].[MP_Vehiculo] ON
INSERT [dbo].[MP_Vehiculo] ([MP_Vehiculo_Id], [Placa], [Motor], [Chasis], [MP_Modelo_Id], [MP_Marca_Id]) VALUES (2, N'CGI-1232', N'MT-2321G', N'CH-04424C', 1, 1)
SET IDENTITY_INSERT [dbo].[MP_Vehiculo] OFF
/****** Object:  Table [dbo].[MP_Poliza]    Script Date: 11/28/2014 17:27:41 ******/
SET IDENTITY_INSERT [dbo].[MP_Poliza] ON
INSERT [dbo].[MP_Poliza] ([MP_Poliza_Id], [NumPoliza], [FechaInicio], [FechaFin], [MontoCobertura], [Tipo], [UsuarioRegistro], [FechaRegistro], [UsuarioModifico], [FechaModifico], [MP_Asegurado_ID], [MP_Vehiculo_ID]) VALUES (7, N'PO-00001', CAST(0x0000A1BF00000000 AS DateTime), CAST(0x0000A49900000000 AS DateTime), 15000, N'Tipo Poliza 1', N'ADMIN', CAST(0x0000A3E900000000 AS DateTime), N'ADMIN', CAST(0x0000A3E900000000 AS DateTime), 1, 2)
SET IDENTITY_INSERT [dbo].[MP_Poliza] OFF
/****** Object:  Table [dbo].[MS_Siniestro]    Script Date: 11/28/2014 17:27:41 ******/
SET IDENTITY_INSERT [dbo].[MS_Siniestro] ON
INSERT [dbo].[MS_Siniestro] ([MS_Siniestro_Id], [NumSiniestro], [Tipo], [FechaSiniestro], [FechaAtencion], [Lugar], [Descripcion], [Estado], [UsuarioRegistro], [FechaRegistro], [UsuarioModifico], [FechaModifico], [MP_Poliza_Id], [MS_Procurador_Id]) VALUES (3, N'SI-0000001', N'2', CAST(0x0000A3F200975630 AS DateTime), CAST(0x0000A3E400000000 AS DateTime), N'RWWW', N'RWWW', 2, N'ADMIN', CAST(0x0000A3DE00000000 AS DateTime), N'ADMIN', CAST(0x0000A3EE00979854 AS DateTime), 7, 1)
INSERT [dbo].[MS_Siniestro] ([MS_Siniestro_Id], [NumSiniestro], [Tipo], [FechaSiniestro], [FechaAtencion], [Lugar], [Descripcion], [Estado], [UsuarioRegistro], [FechaRegistro], [UsuarioModifico], [FechaModifico], [MP_Poliza_Id], [MS_Procurador_Id]) VALUES (5, N'SI-000000', N'1', CAST(0x0000A3E000000000 AS DateTime), CAST(0x0000A3EE00B48E98 AS DateTime), N'BBBBQQ', N'BBBBQQ', 1, N'ADMIN', CAST(0x0000A3EE00B48E98 AS DateTime), N'ADMIN', CAST(0x0000A3EE00C747C7 AS DateTime), 7, 1)
INSERT [dbo].[MS_Siniestro] ([MS_Siniestro_Id], [NumSiniestro], [Tipo], [FechaSiniestro], [FechaAtencion], [Lugar], [Descripcion], [Estado], [UsuarioRegistro], [FechaRegistro], [UsuarioModifico], [FechaModifico], [MP_Poliza_Id], [MS_Procurador_Id]) VALUES (6, N'SI-000000', N'2', CAST(0x0000A3FF00000000 AS DateTime), CAST(0x0000A3EE00BA3CF0 AS DateTime), N'LUGAR', N'TEEWWWWW', 1, N'ADMIN', CAST(0x0000A3EE00BA3CF0 AS DateTime), N'ADMIN', CAST(0x0000A3EE00BA3CF0 AS DateTime), 7, 1)
INSERT [dbo].[MS_Siniestro] ([MS_Siniestro_Id], [NumSiniestro], [Tipo], [FechaSiniestro], [FechaAtencion], [Lugar], [Descripcion], [Estado], [UsuarioRegistro], [FechaRegistro], [UsuarioModifico], [FechaModifico], [MP_Poliza_Id], [MS_Procurador_Id]) VALUES (7, N'SI-000000', N'1', CAST(0x0000A38100000000 AS DateTime), CAST(0x0000A3EE00D55EA1 AS DateTime), N'AAAAAAAAEEEEEEEE', N'ooooooooooooooooooo', 1, N'ADMIN', CAST(0x0000A3EE00D55EA1 AS DateTime), N'ADMIN', CAST(0x0000A3EE00D55EA1 AS DateTime), 7, 1)
INSERT [dbo].[MS_Siniestro] ([MS_Siniestro_Id], [NumSiniestro], [Tipo], [FechaSiniestro], [FechaAtencion], [Lugar], [Descripcion], [Estado], [UsuarioRegistro], [FechaRegistro], [UsuarioModifico], [FechaModifico], [MP_Poliza_Id], [MS_Procurador_Id]) VALUES (8, N'SI-000000', N'1', CAST(0x0000A38100000000 AS DateTime), CAST(0x0000A3EE00D561C2 AS DateTime), N'AAAAAAAAEEEEEEEE', N'ooooooooooooooooooo', 1, N'ADMIN', CAST(0x0000A3EE00D561C2 AS DateTime), N'ADMIN', CAST(0x0000A3EE00D561C2 AS DateTime), 7, 1)
INSERT [dbo].[MS_Siniestro] ([MS_Siniestro_Id], [NumSiniestro], [Tipo], [FechaSiniestro], [FechaAtencion], [Lugar], [Descripcion], [Estado], [UsuarioRegistro], [FechaRegistro], [UsuarioModifico], [FechaModifico], [MP_Poliza_Id], [MS_Procurador_Id]) VALUES (9, N'SI-000000', N'1', CAST(0x0000A38800000000 AS DateTime), CAST(0x0000A3EE00D5933D AS DateTime), N'BBBBQQ 123 555', N'BBBBQQ 123 555', 1, N'ADMIN', CAST(0x0000A3EE00D5933D AS DateTime), N'ADMIN', CAST(0x0000A3EE00D63B17 AS DateTime), 7, 1)
INSERT [dbo].[MS_Siniestro] ([MS_Siniestro_Id], [NumSiniestro], [Tipo], [FechaSiniestro], [FechaAtencion], [Lugar], [Descripcion], [Estado], [UsuarioRegistro], [FechaRegistro], [UsuarioModifico], [FechaModifico], [MP_Poliza_Id], [MS_Procurador_Id]) VALUES (10, N'SI-000000', N'1', CAST(0x0000A41300000000 AS DateTime), CAST(0x0000A3EE00D69785 AS DateTime), N'TICLIO PERU', N'TICLIO PERU', 1, N'ADMIN', CAST(0x0000A3EE00D69785 AS DateTime), N'ADMIN', CAST(0x0000A3EE00D6AAED AS DateTime), 7, 1)
INSERT [dbo].[MS_Siniestro] ([MS_Siniestro_Id], [NumSiniestro], [Tipo], [FechaSiniestro], [FechaAtencion], [Lugar], [Descripcion], [Estado], [UsuarioRegistro], [FechaRegistro], [UsuarioModifico], [FechaModifico], [MP_Poliza_Id], [MS_Procurador_Id]) VALUES (11, N'SI-000000', N'1', CAST(0x0000A3D800000000 AS DateTime), CAST(0x0000A3F10119BB74 AS DateTime), N'BBBBQQ', N'aaa', 1, N'ADMIN', CAST(0x0000A3F10119BB74 AS DateTime), N'ADMIN', CAST(0x0000A3F10119BB74 AS DateTime), 7, 1)
SET IDENTITY_INSERT [dbo].[MS_Siniestro] OFF
/****** Object:  Table [dbo].[MS_Informe_Accidente]    Script Date: 11/28/2014 17:27:41 ******/
/****** Object:  Table [dbo].[MS_Presupuesto]    Script Date: 11/28/2014 17:27:41 ******/
/****** Object:  Table [dbo].[MS_Evidencia]    Script Date: 11/28/2014 17:27:41 ******/
/****** Object:  Table [dbo].[MS_Detalle_Presupuesto]    Script Date: 11/28/2014 17:27:41 ******/
