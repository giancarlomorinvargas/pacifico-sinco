USE [BD_Seguro]
GO
/****** Object:  Table [dbo].[MP_Modelo]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[MP_Modelo] ON
INSERT [dbo].[MP_Modelo] ([MP_Modelo_Id], [Descripcion]) VALUES (1, N'Corona')
INSERT [dbo].[MP_Modelo] ([MP_Modelo_Id], [Descripcion]) VALUES (2, N'Yaris')
INSERT [dbo].[MP_Modelo] ([MP_Modelo_Id], [Descripcion]) VALUES (3, N'TIIDA')
SET IDENTITY_INSERT [dbo].[MP_Modelo] OFF
/****** Object:  Table [dbo].[MP_Marca]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[MP_Marca] ON
INSERT [dbo].[MP_Marca] ([MP_Marca_Id], [Descripcion]) VALUES (1, N'Toyota')
INSERT [dbo].[MP_Marca] ([MP_Marca_Id], [Descripcion]) VALUES (2, N'Audi')INSERT [dbo].[MP_Marca] ([MP_Marca_Id], [Descripcion]) VALUES (3, N'NISSAN')
SET IDENTITY_INSERT [dbo].[MP_Marca] OFF
/****** Object:  Table [dbo].[MP_Asegurado]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[MP_Asegurado] ON
INSERT [dbo].[MP_Asegurado] ([MP_Asegurado_Id], [DniAsegurado], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [FechaNacimiento]) VALUES (1, N'46033128', N'Luis Ricardo', N'Castillejo', N'Luna', CAST(0x00007FCF00000000 AS DateTime))
INSERT [dbo].[MP_Asegurado] ([MP_Asegurado_Id], [DniAsegurado], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [FechaNacimiento]) VALUES (2, N'4588475', N'Jorge', N'Lopez', N'Paredes', CAST(0x0000796F00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[MP_Asegurado] OFF
/****** Object:  Table [dbo].[MS_Servicio]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[MS_Servicio] ON
INSERT [dbo].[MS_Servicio] ([MS_Servicio_Id], [Descripcion]) VALUES (1, N'Reparacion Faros delanteros')
INSERT [dbo].[MS_Servicio] ([MS_Servicio_Id], [Descripcion]) VALUES (2, N'Para Choque')
SET IDENTITY_INSERT [dbo].[MS_Servicio] OFF
/****** Object:  Table [dbo].[MS_Procurador]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[MS_Procurador] ON
INSERT [dbo].[MS_Procurador] ([MS_Procurador_Id], [NumProcurador], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Telefono], [Disponible]) VALUES (1, N'PR20141122190100', N'Christopher', N'Segura', N'Peña', N'1234567', 1)
INSERT [dbo].[MS_Procurador] ([MS_Procurador_Id], [NumProcurador], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Telefono], [Disponible]) VALUES (2, N'PR20141201231400', N'Gian Carlo', N'Mori', N'Vargas', N'1234567', 1)
INSERT [dbo].[MS_Procurador] ([MS_Procurador_Id], [NumProcurador], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Telefono], [Disponible]) VALUES (3, N'PR20141202134900', N'Carlos', N'Romero', N'Gonzales', N'3184144', 1)
SET IDENTITY_INSERT [dbo].[MS_Procurador] OFF
/****** Object:  Table [dbo].[MS_Tecnico]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[MS_Tecnico] ON
INSERT [dbo].[MS_Tecnico] ([MS_Tecnico_Id], [NumTecnico], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Telefono]) VALUES (1, N'TE20141123013100', N'Gian Carlo', N'Morin', N'Vargas', N'123456789')
SET IDENTITY_INSERT [dbo].[MS_Tecnico] OFF
/****** Object:  Table [dbo].[MS_Taller]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[MS_Taller] ON
INSERT [dbo].[MS_Taller] ([MS_Taller_Id], [Nombre], [Distrito], [Direccion]) VALUES (1, N'Taller A', N'Lince', N'Av Arequipa')
SET IDENTITY_INSERT [dbo].[MS_Taller] OFF
/****** Object:  Table [dbo].[MS_Tecnico_Taller]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[MS_Tecnico_Taller] ON
INSERT [dbo].[MS_Tecnico_Taller] ([MS_Tecnico_Taller_Id], [FechaInicio], [FechaFin], [Disponible], [MS_Tecnico_Id], [MS_Taller_Id]) VALUES (2, CAST(0x0000A3EC00000000 AS DateTime), CAST(0x0000A41300000000 AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[MS_Tecnico_Taller] OFF
/****** Object:  Table [dbo].[MS_Lista_Precio]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[MS_Lista_Precio] ON
INSERT [dbo].[MS_Lista_Precio] ([MS_Lista_Precio_Id], [Fecha], [Precio], [MP_Modelo_Id], [MP_Marca_Id], [MS_Servicio_Id]) VALUES (1, CAST(0x0000A3EC00000000 AS DateTime), 250, 1, 1, 1)
INSERT [dbo].[MS_Lista_Precio] ([MS_Lista_Precio_Id], [Fecha], [Precio], [MP_Modelo_Id], [MP_Marca_Id], [MS_Servicio_Id]) VALUES (2, CAST(0x0000A3EC00000000 AS DateTime), 300, 1, 1, 2)
INSERT [dbo].[MS_Lista_Precio] ([MS_Lista_Precio_Id], [Fecha], [Precio], [MP_Modelo_Id], [MP_Marca_Id], [MS_Servicio_Id]) VALUES (7, CAST(0x0000A3EC00000000 AS DateTime), 350, 1, 2, 1)
INSERT [dbo].[MS_Lista_Precio] ([MS_Lista_Precio_Id], [Fecha], [Precio], [MP_Modelo_Id], [MP_Marca_Id], [MS_Servicio_Id]) VALUES (9, CAST(0x0000A3EC00000000 AS DateTime), 450, 1, 2, 2)
SET IDENTITY_INSERT [dbo].[MS_Lista_Precio] OFF
/****** Object:  Table [dbo].[MP_Vehiculo]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[MP_Vehiculo] ON
INSERT [dbo].[MP_Vehiculo] ([MP_Vehiculo_Id], [Placa], [Motor], [Chasis], [MP_Modelo_Id], [MP_Marca_Id]) VALUES (1, N'AB666-D', N'GT-200X', NULL, 1, 1)
INSERT [dbo].[MP_Vehiculo] ([MP_Vehiculo_Id], [Placa], [Motor], [Chasis], [MP_Modelo_Id], [MP_Marca_Id]) VALUES (2, N'CGI-1232', N'MT-2321G', N'CH-04424C', 3, 3)
SET IDENTITY_INSERT [dbo].[MP_Vehiculo] OFF
/****** Object:  Table [dbo].[MP_Poliza]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[MP_Poliza] ON
INSERT [dbo].[MP_Poliza] ([MP_Poliza_Id], [NumPoliza], [FechaInicio], [FechaFin], [MontoCobertura], [Tipo], [UsuarioRegistro], [FechaRegistro], [UsuarioModifico], [FechaModifico], [MP_Asegurado_ID], [MP_Vehiculo_ID]) VALUES (1, N'PO20141122185600', CAST('2012-12-12' AS DateTime), CAST('2014-12-31' AS DateTime), 2400, N'Vehicular', N'sys', CAST(0x0000A12500000000 AS DateTime), N'sys', CAST(0x0000A12500000000 AS DateTime), 1, 1)
INSERT [dbo].[MP_Poliza] ([MP_Poliza_Id], [NumPoliza], [FechaInicio], [FechaFin], [MontoCobertura], [Tipo], [UsuarioRegistro], [FechaRegistro], [UsuarioModifico], [FechaModifico], [MP_Asegurado_ID], [MP_Vehiculo_ID]) VALUES (2, N'PO20141201185600', CAST(0x0000A1BF00000000 AS DateTime), CAST(0x0000A49900000000 AS DateTime), 15000, N'Tipo Poliza 1', N'ADMIN', CAST(0x0000A3E900000000 AS DateTime), N'ADMIN', CAST(0x0000A3E900000000 AS DateTime), 2, 2)
SET IDENTITY_INSERT [dbo].[MP_Poliza] OFF
/****** Object:  Table [dbo].[Estado]    Script Date: 11/23/2014 02:56:12 ******/
INSERT [dbo].[Estado] ([Estado_Id], [Nombre], [Descripcion]) VALUES (21, N'Registrado', N'Registrado')
INSERT [dbo].[Estado] ([Estado_Id], [Nombre], [Descripcion]) VALUES (22, N'Pendiente', N'Pendiente')
INSERT [dbo].[Estado] ([Estado_Id], [Nombre], [Descripcion]) VALUES (23, N'Asistido', N'Asistido')
INSERT [dbo].[Estado] ([Estado_Id], [Nombre], [Descripcion]) VALUES (24, N'Aprobado', N'Aprobado')
INSERT [dbo].[Estado] ([Estado_Id], [Nombre], [Descripcion]) VALUES (31, N'Registrado', N'Registrado')
INSERT [dbo].[Estado] ([Estado_Id], [Nombre], [Descripcion]) VALUES (32, N'Firmado', N'Firmado')
INSERT [dbo].[Estado] ([Estado_Id], [Nombre], [Descripcion]) VALUES (41, N'Registrado', N'Registrado')
INSERT [dbo].[Estado] ([Estado_Id], [Nombre], [Descripcion]) VALUES (42, N'Aprobado', N'Aprobado')
INSERT [dbo].[Estado] ([Estado_Id], [Nombre], [Descripcion]) VALUES (43, N'Rechazado', N'Rechazado')
/****** Object:  Table [dbo].[MS_Siniestro]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[MS_Siniestro] ON
INSERT [dbo].[MS_Siniestro] ([MS_Siniestro_Id], [NumSiniestro], [Tipo], [FechaSiniestro], [FechaAtencion], [Lugar], [Descripcion], [Estado], [UsuarioRegistro], [FechaRegistro], [UsuarioModifico], [FechaModifico], [MP_Poliza_Id], [MS_Procurador_Id]) VALUES (3, N'SI20141122190000', N'Choque', CAST(0x0000A3EB00000000 AS DateTime), CAST(0x0000A3EB00000000 AS DateTime), N'Lince', N'Choque del vehiculo', 23, N'sys', CAST(0x0000A3EB00000000 AS DateTime), N'sys', CAST(0x0000A3EB00000000 AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[MS_Siniestro] OFF
/****** Object:  Table [dbo].[MS_Informe_Accidente]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[MS_Informe_Accidente] ON
INSERT [dbo].[MS_Informe_Accidente] ([MS_Informe_Accidente_Id], [NumInforme], [FechaInforme], [Distrito], [Direccion], [Estado], [UsuarioRegistro], [FechaRegistro], [UsuarioModifico], [FechaModifico], [MS_Siniestro_Id], [MS_Tecnico_Taller_Id]) VALUES (1, N'IA20141123012900', CAST(0x0000A3EC00000000 AS DateTime), N'Lince', N'Manco Segundo 2430', 32, N'sys', CAST(0x0000A3EC00000000 AS DateTime), N'sys', CAST(0x0000A3EC00000000 AS DateTime), 3, 2)
SET IDENTITY_INSERT [dbo].[MS_Informe_Accidente] OFF
/****** Object:  Table [dbo].[MS_Presupuesto]    Script Date: 11/23/2014 02:56:12 ******/
/****** Object:  Table [dbo].[MS_Evidencia]    Script Date: 11/23/2014 02:56:12 ******/
/****** Object:  Table [dbo].[MS_Detalle_Presupuesto]    Script Date: 11/23/2014 02:56:12 ******/
