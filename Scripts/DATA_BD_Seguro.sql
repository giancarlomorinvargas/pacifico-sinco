USE [BD_Seguro]
GO
/****** Object:  Table [dbo].[Modelo]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[Modelo] ON
INSERT [dbo].[Modelo] ([Modelo_Id], [Descripcion]) VALUES (1, N'Corona')
INSERT [dbo].[Modelo] ([Modelo_Id], [Descripcion]) VALUES (2, N'Yaris')
INSERT [dbo].[Modelo] ([Modelo_Id], [Descripcion]) VALUES (3, N'TIIDA')
SET IDENTITY_INSERT [dbo].[Modelo] OFF
/****** Object:  Table [dbo].[MARCA]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[MARCA] ON
INSERT [dbo].[MARCA] ([Marca_Id], [Descripcion]) VALUES (1, N'Toyota')
INSERT [dbo].[MARCA] ([Marca_Id], [Descripcion]) VALUES (2, N'Audi')INSERT [dbo].[MARCA] ([Marca_Id], [Descripcion]) VALUES (3, N'NISSAN')
SET IDENTITY_INSERT [dbo].[MARCA] OFF
/****** Object:  Table [dbo].[ASEGURADO]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[ASEGURADO] ON
INSERT [dbo].[ASEGURADO] ([Asegurado_Id], [DniAsegurado], [V_Nombre], [V_ApellidoPaterno], [V_ApellidoMaterno], [F_Nacimiento]) VALUES (1, N'46033128', N'Luis Ricardo', N'Castillejo', N'Luna', CAST(0x00007FCF00000000 AS DateTime))
INSERT [dbo].[ASEGURADO] ([Asegurado_Id], [DniAsegurado], [V_Nombre], [V_ApellidoPaterno], [V_ApellidoMaterno], [F_Nacimiento]) VALUES (2, N'4588475', N'Jorge', N'Lopez', N'Paredes', CAST(0x0000796F00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[ASEGURADO] OFF
/****** Object:  Table [dbo].[SERVICIO]	    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[SERVICIO] ON
INSERT [dbo].[SERVICIO] ([Servicio_Id], [V_Descripcion]) VALUES (1, N'Reparacion Faros delanteros')
INSERT [dbo].[SERVICIO] ([Servicio_Id], [V_Descripcion]) VALUES (2, N'Para Choque')
SET IDENTITY_INSERT [dbo].[SERVICIO] OFF
/****** Object:  Table [dbo].[PROCURADOR]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[PROCURADOR] ON
INSERT [dbo].[PROCURADOR] ([Procurador_Id], [V_NumProcurador], [V_Nombre], [V_ApellidoPaterno], [V_ApellidoMaterno], [V_Telefono], [B_Disponible]) VALUES (1, N'PR20141122190100', N'Christopher', N'Segura', N'Peña', N'1234567', 1)
INSERT [dbo].[PROCURADOR] ([Procurador_Id], [V_NumProcurador], [V_Nombre], [V_ApellidoPaterno], [V_ApellidoMaterno], [V_Telefono], [B_Disponible]) VALUES (2, N'PR20141201231400', N'Gian Carlo', N'Mori', N'Vargas', N'1234567', 1)
INSERT [dbo].[PROCURADOR] ([Procurador_Id], [V_NumProcurador], [V_Nombre], [V_ApellidoPaterno], [V_ApellidoMaterno], [V_Telefono], [B_Disponible]) VALUES (3, N'PR20141202134900', N'Carlos', N'Romero', N'Gonzales', N'3184144', 1)
INSERT [dbo].[PROCURADOR] ([Procurador_Id], [V_NumProcurador], [V_Nombre], [V_ApellidoPaterno], [V_ApellidoMaterno], [V_Telefono], [B_Disponible]) VALUES (4, N'PR20151202134900', N'Jorge', N'Ruiz', N'Pinto', N'987582321', 1)
INSERT [dbo].[PROCURADOR] ([Procurador_Id], [V_NumProcurador], [V_Nombre], [V_ApellidoPaterno], [V_ApellidoMaterno], [V_Telefono], [B_Disponible]) VALUES (5, N'PR20151202134901', N'Josue', N'Rios', N'Taipe', N'935158254', 1)
SET IDENTITY_INSERT [dbo].[PROCURADOR] OFF
/****** Object:  Table [dbo].[TALLER]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[TALLER] ON
INSERT [dbo].[TALLER] ([Taller_Id], [V_Nombre], [V_Distrito], [V_Direccion]) VALUES (1, N'Taller A', N'Lince', N'Av Arequipa')
INSERT [dbo].[TALLER] ([Taller_Id], [V_Nombre], [V_Distrito], [V_Direccion]) VALUES (2, N'Taller B', N'Lince', N'Av Canevaro')
INSERT [dbo].[TALLER] ([Taller_Id], [V_Nombre], [V_Distrito], [V_Direccion]) VALUES (3, N'Taller C', N'Los Olivos', N'Covida')
SET IDENTITY_INSERT [dbo].[TALLER] OFF
/****** Object:  Table [dbo].[TECNICO]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[TECNICO] ON
INSERT [dbo].[TECNICO] ([Tecnico_Id], [NumTecnico], [V_Nombre], [V_ApellidoPaterno], [V_ApellidoMaterno], [V_Telefono], [B_Disponible], [Taller_Id]) VALUES (1, N'TE20141123013100', N'Gian Carlo', N'Morin', N'Vargas', N'987654256',0,1)
INSERT [dbo].[TECNICO] ([Tecnico_Id], [NumTecnico], [V_Nombre], [V_ApellidoPaterno], [V_ApellidoMaterno], [V_Telefono], [B_Disponible], [Taller_Id]) VALUES (2, N'TE20150123013100', N'Harold', N'Morin', N'Vargas', N'987654321',1,1)
INSERT [dbo].[TECNICO] ([Tecnico_Id], [NumTecnico], [V_Nombre], [V_ApellidoPaterno], [V_ApellidoMaterno], [V_Telefono], [B_Disponible], [Taller_Id]) VALUES (3, N'TE20141223013100', N'Eduardo', N'Galvez', N'Vargas', N'985321456',1,1)
INSERT [dbo].[TECNICO] ([Tecnico_Id], [NumTecnico], [V_Nombre], [V_ApellidoPaterno], [V_ApellidoMaterno], [V_Telefono], [B_Disponible], [Taller_Id]) VALUES (4, N'TE20141223013100', N'Luis', N'Gonzales', N'Sobregon', N'965235654',1,3)
INSERT [dbo].[TECNICO] ([Tecnico_Id], [NumTecnico], [V_Nombre], [V_ApellidoPaterno], [V_ApellidoMaterno], [V_Telefono], [B_Disponible], [Taller_Id]) VALUES (5, N'TE20141223013100', N'Sergio', N'Gómez', N'Cordova', N'963258741',1,2)
INSERT [dbo].[TECNICO] ([Tecnico_Id], [NumTecnico], [V_Nombre], [V_ApellidoPaterno], [V_ApellidoMaterno], [V_Telefono], [B_Disponible], [Taller_Id]) VALUES (6, N'TE20141223013100', N'Abraham', N'Alfaro', N'Luna', N'951357654',1,3)
SET IDENTITY_INSERT [dbo].[TECNICO] OFF
/****** Object:  Table [dbo].[LISTA_PRECIO]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[LISTA_PRECIO] ON
INSERT [dbo].[LISTA_PRECIO] ([Lista_Precio_Id], [F_Creacion], [R_Precio], [Modelo_Id], [Marca_Id], [Servicio_Id]) VALUES (1, CAST(0x0000A3EC00000000 AS DateTime), 250, 1, 1, 1)
INSERT [dbo].[LISTA_PRECIO] ([Lista_Precio_Id], [F_Creacion], [R_Precio], [Modelo_Id], [Marca_Id], [Servicio_Id]) VALUES (2, CAST(0x0000A3EC00000000 AS DateTime), 300, 1, 1, 2)
INSERT [dbo].[LISTA_PRECIO] ([Lista_Precio_Id], [F_Creacion], [R_Precio], [Modelo_Id], [Marca_Id], [Servicio_Id]) VALUES (7, CAST(0x0000A3EC00000000 AS DateTime), 350, 1, 2, 1)
INSERT [dbo].[LISTA_PRECIO] ([Lista_Precio_Id], [F_Creacion], [R_Precio], [Modelo_Id], [Marca_Id], [Servicio_Id]) VALUES (9, CAST(0x0000A3EC00000000 AS DateTime), 450, 1, 2, 2)
SET IDENTITY_INSERT [dbo].[LISTA_PRECIO] OFF
/****** Object:  Table [dbo].[VEHICULO]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[VEHICULO] ON
INSERT [dbo].[VEHICULO] ([Vehiculo_Id], [V_Placa], [V_Motor], [V_Chasis], [Modelo_Id], [Marca_Id]) VALUES (1, N'AB666-D', N'GT-200X', NULL, 1, 1)
INSERT [dbo].[VEHICULO] ([Vehiculo_Id], [V_Placa], [V_Motor], [V_Chasis], [Modelo_Id], [Marca_Id]) VALUES (2, N'CGI-1232', N'MT-2321G', N'CH-04424C', 3, 3)
SET IDENTITY_INSERT [dbo].[VEHICULO] OFF
/****** Object:  Table [dbo].[POLIZA]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[POLIZA] ON
INSERT [dbo].[POLIZA] ([Poliza_Id], [NumPoliza], [F_Inicio], [F_Fin], [MontoCobertura], [Tipo], [UsuarioRegistro], [F_Registro], [UsuarioModifico], [F_Modifico], [Asegurado_ID], [Vehiculo_ID]) VALUES (1, N'PO20141122185600', CAST('2012-12-12' AS DateTime), CAST('2014-12-31' AS DateTime), 2400, N'Vehicular', N'sys', CAST(0x0000A12500000000 AS DateTime), N'sys', CAST(0x0000A12500000000 AS DateTime), 1, 1)
INSERT [dbo].[POLIZA] ([Poliza_Id], [NumPoliza], [F_Inicio], [F_Fin], [MontoCobertura], [Tipo], [UsuarioRegistro], [F_Registro], [UsuarioModifico], [F_Modifico], [Asegurado_ID], [Vehiculo_ID]) VALUES (2, N'PO20141201185600', CAST(0x0000A1BF00000000 AS DateTime), CAST(0x0000A49900000000 AS DateTime), 15000, N'Tipo Poliza 1', N'ADMIN', CAST(0x0000A3E900000000 AS DateTime), N'ADMIN', CAST(0x0000A3E900000000 AS DateTime), 2, 2)
SET IDENTITY_INSERT [dbo].[POLIZA] OFF
/****** Object:  Table [dbo].[ESTADO]    Script Date: 11/23/2014 02:56:12 ******/
INSERT [dbo].[ESTADO] ([Estado_Id], [V_Nombre], [V_Descripcion]) VALUES (21, N'Registrado', N'Registrado')
INSERT [dbo].[ESTADO] ([Estado_Id], [V_Nombre], [V_Descripcion]) VALUES (22, N'Pendiente', N'Pendiente')
INSERT [dbo].[ESTADO] ([Estado_Id], [V_Nombre], [V_Descripcion]) VALUES (23, N'Asistido', N'Asistido')
INSERT [dbo].[ESTADO] ([Estado_Id], [V_Nombre], [V_Descripcion]) VALUES (24, N'Asignado', N'Asignado')
INSERT [dbo].[ESTADO] ([Estado_Id], [V_Nombre], [V_Descripcion]) VALUES (25, N'Aprobado', N'Aprobado')
INSERT [dbo].[ESTADO] ([Estado_Id], [V_Nombre], [V_Descripcion]) VALUES (31, N'Registrado', N'Registrado')
INSERT [dbo].[ESTADO] ([Estado_Id], [V_Nombre], [V_Descripcion]) VALUES (32, N'Pendiente de Evaluar', N'Pendiente de Evaluar')
--INSERT [dbo].[ESTADO] ([Estado_Id], [V_Nombre], [V_Descripcion]) VALUES (33, N'Pendiente de Evaluar', N'Pendiente de Evaluar')
INSERT [dbo].[ESTADO] ([Estado_Id], [V_Nombre], [V_Descripcion]) VALUES (41, N'Registrado', N'Registrado')
INSERT [dbo].[ESTADO] ([Estado_Id], [V_Nombre], [V_Descripcion]) VALUES (42, N'Aprobado', N'Aprobado')
INSERT [dbo].[ESTADO] ([Estado_Id], [V_Nombre], [V_Descripcion]) VALUES (43, N'Rechazado', N'Rechazado')
INSERT [dbo].[ESTADO] ([Estado_Id], [V_Nombre], [V_Descripcion]) VALUES (51, N'Registrado', N'Registrado')
INSERT [dbo].[ESTADO] ([Estado_Id], [V_Nombre], [V_Descripcion]) VALUES (52, N'Generado', N'Generado')
INSERT [dbo].[ESTADO] ([Estado_Id], [V_Nombre], [V_Descripcion]) VALUES (53, N'Rechazado', N'Rechazado')
INSERT [dbo].[ESTADO] ([Estado_Id], [V_Nombre], [V_Descripcion]) VALUES (61, N'Generado', N'Generado')
/****** Object:  Table [dbo].[SINIESTRO]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[SINIESTRO] ON
INSERT [dbo].[SINIESTRO] ([Siniestro_Id], [V_NumSiniestro], [V_Tipo], [F_Siniestro], [F_Atencion], [V_Lugar], [V_Descripcion], [Estado_Id], [V_UsuarioRegistro], [F_Registro], [V_UsuarioModifico], [F_Modifico], [Poliza_Id], [Procurador_Id], [Tecnico_Id]) VALUES (3, N'SI20141122190000', N'Choque', CAST(0x0000A3EB00000000 AS DateTime), CAST(0x0000A3EB00000000 AS DateTime), N'Lince', N'Choque del vehiculo', 24, N'sys', CAST(0x0000A3EB00000000 AS DateTime), N'sys', CAST(0x0000A3EB00000000 AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[SINIESTRO] OFF
/****** Object:  Table [dbo].[INFORME_ACCIDENTE]    Script Date: 11/23/2014 02:56:12 ******/
SET IDENTITY_INSERT [dbo].[INFORME_ACCIDENTE] ON
INSERT [dbo].[INFORME_ACCIDENTE] ([Informe_Accidente_Id], [V_NumInforme], [F_Informe], [V_Distrito], [V_Direccion], [Estado_Id], [V_UsuarioRegistro], [F_Registro], [V_UsuarioModifico], [F_Modifico], [Siniestro_Id], [Tecnico_Id]) VALUES (1, N'IA20141123012900', CAST(0x0000A3EC00000000 AS DateTime), N'Lince', N'Choque con Corredor azul a la altura de Av. Canevaro con Canevaro. Choque parte trasera del vehiculo con la delantera del Corredor Azul.', 32, N'sys', CAST(0x0000A3EC00000000 AS DateTime), N'sys', CAST(0x0000A3EC00000000 AS DateTime), 3, 1)
SET IDENTITY_INSERT [dbo].[INFORME_ACCIDENTE] OFF
/****** Object:  Table [dbo].[MS_Presupuesto]    Script Date: 11/23/2014 02:56:12 ******/
/****** Object:  Table [dbo].[MS_Evidencia]    Script Date: 11/23/2014 02:56:12 ******/
/****** Object:  Table [dbo].[MS_Detalle_Presupuesto]    Script Date: 11/23/2014 02:56:12 ******/
