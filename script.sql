USE [Marbel]
GO
/****** Object:  Table [dbo].[ArticulosServicios]    Script Date: 24/02/2021 5:05:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticulosServicios](
	[idArticuloServicio] [int] NOT NULL,
	[NombreArticuloServicio] [varchar](50) NOT NULL,
	[Tipo] [varchar](15) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [float] NOT NULL,
 CONSTRAINT [PK_ArticulosServicios] PRIMARY KEY CLUSTERED 
(
	[idArticuloServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 24/02/2021 5:05:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [varchar](10) NOT NULL,
	[PrimerNombre] [varchar](25) NOT NULL,
	[SegundoNombre] [varchar](25) NOT NULL,
	[PrimerApellido] [varchar](25) NOT NULL,
	[SegundoApellido] [nchar](10) NOT NULL,
	[TipoDocumento] [varchar](25) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Celular] [varchar](13) NOT NULL,
	[CorreoElectronico] [varchar](150) NOT NULL,
	[TipoVehiculo] [varchar](10) NOT NULL,
	[PlacaVehiculo] [varchar](6) NOT NULL,
	[DescripcionSolicitud] [varchar](150) NOT NULL,
	[FechaSolicitud] [date] NOT NULL,
	[Presupuesto] [float] NOT NULL,
	[idSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[EstadoSolicitud] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC,
	[TipoVehiculo] ASC,
	[idSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesServicios]    Script Date: 24/02/2021 5:05:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesServicios](
	[idDetalle] [int] NOT NULL,
	[idCliente] [varchar](10) NOT NULL,
	[idMecanico] [varchar](10) NULL,
	[idSolicitud] [int] NOT NULL,
	[idArticulo_Servicio] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [float] NOT NULL,
 CONSTRAINT [PK_DetallesServicios] PRIMARY KEY CLUSTERED 
(
	[idDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 24/02/2021 5:05:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[idFactura] [int] IDENTITY(1,1) NOT NULL,
	[idDetalle] [int] NOT NULL,
	[SubTotal] [float] NOT NULL,
	[Descuentos] [float] NOT NULL,
	[TotalSinIva] [float] NOT NULL,
	[TotalNeto] [float] NOT NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC,
	[idDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mecanicos]    Script Date: 24/02/2021 5:05:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mecanicos](
	[IdMecanico] [varchar](10) NOT NULL,
	[PrimerNombre] [varchar](25) NOT NULL,
	[SegundoNombre] [varchar](25) NOT NULL,
	[PrimerApellido] [varchar](25) NOT NULL,
	[SegundoApellido] [varchar](25) NOT NULL,
	[TipoDocumento] [varchar](25) NOT NULL,
	[Celular] [varchar](13) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[CorreoElectronico] [varchar](150) NOT NULL,
	[idTienda] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Mecanicos] PRIMARY KEY CLUSTERED 
(
	[IdMecanico] ASC,
	[idTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tiendas]    Script Date: 24/02/2021 5:05:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiendas](
	[idTienda] [int] IDENTITY(1,1) NOT NULL,
	[NombreTienda] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Tiendas] PRIMARY KEY CLUSTERED 
(
	[idTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ArticulosServicios] ([idArticuloServicio], [NombreArticuloServicio], [Tipo], [Cantidad], [Precio]) VALUES (1, N'MANTENIMIENTO CARRO', N'SERVICIO', 1, 150000)
INSERT [dbo].[ArticulosServicios] ([idArticuloServicio], [NombreArticuloServicio], [Tipo], [Cantidad], [Precio]) VALUES (2, N'MANTENIMIENTO MOTO', N'SERVICIO', 1, 80000)
INSERT [dbo].[ArticulosServicios] ([idArticuloServicio], [NombreArticuloServicio], [Tipo], [Cantidad], [Precio]) VALUES (3, N'REVISION CARRO', N'SERVICIO', 1, 120000)
INSERT [dbo].[ArticulosServicios] ([idArticuloServicio], [NombreArticuloServicio], [Tipo], [Cantidad], [Precio]) VALUES (4, N'REVISION MOTO', N'SERVICIO', 1, 40000)
INSERT [dbo].[ArticulosServicios] ([idArticuloServicio], [NombreArticuloServicio], [Tipo], [Cantidad], [Precio]) VALUES (5, N'VALORACION CARRO', N'SERVICIO', 1, 60000)
INSERT [dbo].[ArticulosServicios] ([idArticuloServicio], [NombreArticuloServicio], [Tipo], [Cantidad], [Precio]) VALUES (6, N'VALORACION MOTO', N'SERVICIO', 1, 30000)
INSERT [dbo].[ArticulosServicios] ([idArticuloServicio], [NombreArticuloServicio], [Tipo], [Cantidad], [Precio]) VALUES (7, N'DISCOS FRENOS CARRO', N'ARTICULO', 10, 150000)
INSERT [dbo].[ArticulosServicios] ([idArticuloServicio], [NombreArticuloServicio], [Tipo], [Cantidad], [Precio]) VALUES (8, N'AMORTIGUADORES CARRO', N'ARTICULO', 10, 80000)
INSERT [dbo].[ArticulosServicios] ([idArticuloServicio], [NombreArticuloServicio], [Tipo], [Cantidad], [Precio]) VALUES (9, N'EMBRAGUES CARROS', N'ARTICULO', 10, 95000)
INSERT [dbo].[ArticulosServicios] ([idArticuloServicio], [NombreArticuloServicio], [Tipo], [Cantidad], [Precio]) VALUES (10, N'PASTAS DE FRENOS CARRO', N'ARTICULO', 10, 50000)
INSERT [dbo].[ArticulosServicios] ([idArticuloServicio], [NombreArticuloServicio], [Tipo], [Cantidad], [Precio]) VALUES (11, N'DISCOS FRENO MOTO', N'ARTICULO', 10, 85000)
INSERT [dbo].[ArticulosServicios] ([idArticuloServicio], [NombreArticuloServicio], [Tipo], [Cantidad], [Precio]) VALUES (12, N'AMORTIGUADORES MOTO', N'ARTICULO', 10, 60000)
INSERT [dbo].[ArticulosServicios] ([idArticuloServicio], [NombreArticuloServicio], [Tipo], [Cantidad], [Precio]) VALUES (13, N'EMBRAGUES MOTO', N'ARTICULO', 10, 75000)
INSERT [dbo].[ArticulosServicios] ([idArticuloServicio], [NombreArticuloServicio], [Tipo], [Cantidad], [Precio]) VALUES (14, N'PASTAS DE FRENOS MOTO', N'ARTICULO', 10, 45000)
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([IdCliente], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [TipoDocumento], [Direccion], [Celular], [CorreoElectronico], [TipoVehiculo], [PlacaVehiculo], [DescripcionSolicitud], [FechaSolicitud], [Presupuesto], [idSolicitud], [EstadoSolicitud]) VALUES (N'1036598000', N'JULIAN', N'DAVID', N'TOBON', N'          ', N'CEDULA', N'CALI', N'3112224499', N'JULIAN@CORREO.COM', N'CARRO', N'AAA11F', N'MANTIMIENTO CARRO', CAST(N'2021-02-24' AS Date), 160000, 4, N'SOLICITADO')
INSERT [dbo].[Clientes] ([IdCliente], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [TipoDocumento], [Direccion], [Celular], [CorreoElectronico], [TipoVehiculo], [PlacaVehiculo], [DescripcionSolicitud], [FechaSolicitud], [Presupuesto], [idSolicitud], [EstadoSolicitud]) VALUES (N'1036598111', N'SANTIAGO', N'', N'RAMIREZ', N'JIMENEZ   ', N'CEDULA', N'MEDELLIN', N'3112224400', N'SANTI@CORREO.COM', N'MOTO', N'AAA11E', N'MANTIMIENTO CARRO', CAST(N'2021-02-24' AS Date), 180000, 3, N'SOLICITADO')
INSERT [dbo].[Clientes] ([IdCliente], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [TipoDocumento], [Direccion], [Celular], [CorreoElectronico], [TipoVehiculo], [PlacaVehiculo], [DescripcionSolicitud], [FechaSolicitud], [Presupuesto], [idSolicitud], [EstadoSolicitud]) VALUES (N'1036598222', N'MAXIMILIANO', N'', N'RAMIREZ', N'HIGUITA   ', N'CEDULA', N'ITAGUI', N'3112224422', N'MAXI@CORREO.COM', N'CARRO', N'AAA11C', N'REVISION CARRO', CAST(N'2021-02-24' AS Date), 180000, 2, N'SOLICITADO')
INSERT [dbo].[Clientes] ([IdCliente], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [TipoDocumento], [Direccion], [Celular], [CorreoElectronico], [TipoVehiculo], [PlacaVehiculo], [DescripcionSolicitud], [FechaSolicitud], [Presupuesto], [idSolicitud], [EstadoSolicitud]) VALUES (N'1036598333', N'NICOLAS', N'', N'RAMIREZ', N'HIGUITA   ', N'CEDULA', N'ITAGUI', N'3112224433', N'NICOLAS@CORREO.COM', N'MOTO', N'AAA11B', N'REVISION MOTO', CAST(N'2021-02-24' AS Date), 60000, 1, N'SOLICITADO')
INSERT [dbo].[Clientes] ([IdCliente], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [TipoDocumento], [Direccion], [Celular], [CorreoElectronico], [TipoVehiculo], [PlacaVehiculo], [DescripcionSolicitud], [FechaSolicitud], [Presupuesto], [idSolicitud], [EstadoSolicitud]) VALUES (N'1036598999', N'SONIA', N'', N'ORTEGA', N'          ', N'CEDULA', N'MEDELLIN', N'3112224444', N'SONIA@CORREO.COM', N'MOTO', N'AAA11G', N'MANTENIMIENTO MOTO', CAST(N'2021-02-24' AS Date), 100000, 6, N'SOLICITADO')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
INSERT [dbo].[DetallesServicios] ([idDetalle], [idCliente], [idMecanico], [idSolicitud], [idArticulo_Servicio], [Cantidad], [Precio]) VALUES (1, N'1036598333', N'1036598444', 1, 4, 1, 40000)
INSERT [dbo].[DetallesServicios] ([idDetalle], [idCliente], [idMecanico], [idSolicitud], [idArticulo_Servicio], [Cantidad], [Precio]) VALUES (2, N'1036598222', N'1128433392', 2, 3, 1, 120000)
INSERT [dbo].[DetallesServicios] ([idDetalle], [idCliente], [idMecanico], [idSolicitud], [idArticulo_Servicio], [Cantidad], [Precio]) VALUES (3, N'1036598111', N'70122996', 3, 1, 1, 150000)
INSERT [dbo].[DetallesServicios] ([idDetalle], [idCliente], [idMecanico], [idSolicitud], [idArticulo_Servicio], [Cantidad], [Precio]) VALUES (4, N'1036598000', N'1036598444', 4, 1, 1, 150000)
INSERT [dbo].[DetallesServicios] ([idDetalle], [idCliente], [idMecanico], [idSolicitud], [idArticulo_Servicio], [Cantidad], [Precio]) VALUES (5, N'1036598000', N'1128433392', 6, 2, 1, 80000)
INSERT [dbo].[Mecanicos] ([IdMecanico], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [TipoDocumento], [Celular], [Direccion], [CorreoElectronico], [idTienda], [Estado]) VALUES (N'1036598444', N'ADRIAN', N'ESTEBAN', N'RAMIREZ', N'JIMENEZ', N'CEDULA', N'3014881243', N'LA ESTRELLA', N'adrian.ramirez23@hotmail.com', 1, 1)
INSERT [dbo].[Mecanicos] ([IdMecanico], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [TipoDocumento], [Celular], [Direccion], [CorreoElectronico], [idTienda], [Estado]) VALUES (N'1128433392', N'NATALIA', N'ANDREA', N'HIGUITA', N'ORTEGA', N'CEDULA', N'3192341346', N'BOGOTA DC', N'correo@correo.com', 2, 1)
INSERT [dbo].[Mecanicos] ([IdMecanico], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [TipoDocumento], [Celular], [Direccion], [CorreoElectronico], [idTienda], [Estado]) VALUES (N'70122996', N'GUISTAVO', N'DE JESUS', N'RAMIREZ', N'CACANTE', N'CEDULA', N'3017345868', N'SANTIAGO DE CALI', N'guraca2@correo.com', 4, 1)
SET IDENTITY_INSERT [dbo].[Tiendas] ON 

INSERT [dbo].[Tiendas] ([idTienda], [NombreTienda]) VALUES (1, N'MEDELLIN')
INSERT [dbo].[Tiendas] ([idTienda], [NombreTienda]) VALUES (2, N'BOGOTA')
INSERT [dbo].[Tiendas] ([idTienda], [NombreTienda]) VALUES (4, N'CALI')
INSERT [dbo].[Tiendas] ([idTienda], [NombreTienda]) VALUES (5, N'BARRANQUILLA')
INSERT [dbo].[Tiendas] ([idTienda], [NombreTienda]) VALUES (6, N'LETICIA')
INSERT [dbo].[Tiendas] ([idTienda], [NombreTienda]) VALUES (7, N'BUCARAMANGA')
SET IDENTITY_INSERT [dbo].[Tiendas] OFF
/****** Object:  Index [IX_ArticulosServicios]    Script Date: 24/02/2021 5:05:11 p. m. ******/
ALTER TABLE [dbo].[ArticulosServicios] ADD  CONSTRAINT [IX_ArticulosServicios] UNIQUE NONCLUSTERED 
(
	[idArticuloServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Clientes]    Script Date: 24/02/2021 5:05:11 p. m. ******/
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [IX_Clientes] UNIQUE NONCLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Clientes_1]    Script Date: 24/02/2021 5:05:11 p. m. ******/
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [IX_Clientes_1] UNIQUE NONCLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Clientes_2]    Script Date: 24/02/2021 5:05:11 p. m. ******/
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [IX_Clientes_2] UNIQUE NONCLUSTERED 
(
	[idSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Facturas]    Script Date: 24/02/2021 5:05:11 p. m. ******/
ALTER TABLE [dbo].[Facturas] ADD  CONSTRAINT [IX_Facturas] UNIQUE NONCLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Mecanicos]    Script Date: 24/02/2021 5:05:11 p. m. ******/
ALTER TABLE [dbo].[Mecanicos] ADD  CONSTRAINT [IX_Mecanicos] UNIQUE NONCLUSTERED 
(
	[IdMecanico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tiendas]    Script Date: 24/02/2021 5:05:11 p. m. ******/
ALTER TABLE [dbo].[Tiendas] ADD  CONSTRAINT [IX_Tiendas] UNIQUE NONCLUSTERED 
(
	[idTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DetallesServicios]  WITH CHECK ADD  CONSTRAINT [FK_DetallesServicios_ArticulosServicios] FOREIGN KEY([idArticulo_Servicio])
REFERENCES [dbo].[ArticulosServicios] ([idArticuloServicio])
GO
ALTER TABLE [dbo].[DetallesServicios] CHECK CONSTRAINT [FK_DetallesServicios_ArticulosServicios]
GO
ALTER TABLE [dbo].[DetallesServicios]  WITH CHECK ADD  CONSTRAINT [FK_DetallesServicios_Clientes] FOREIGN KEY([idSolicitud])
REFERENCES [dbo].[Clientes] ([idSolicitud])
GO
ALTER TABLE [dbo].[DetallesServicios] CHECK CONSTRAINT [FK_DetallesServicios_Clientes]
GO
ALTER TABLE [dbo].[DetallesServicios]  WITH CHECK ADD  CONSTRAINT [FK_DetallesServicios_Mecanicos] FOREIGN KEY([idMecanico])
REFERENCES [dbo].[Mecanicos] ([IdMecanico])
GO
ALTER TABLE [dbo].[DetallesServicios] CHECK CONSTRAINT [FK_DetallesServicios_Mecanicos]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_DetallesServicios] FOREIGN KEY([idDetalle])
REFERENCES [dbo].[DetallesServicios] ([idDetalle])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_DetallesServicios]
GO
ALTER TABLE [dbo].[Mecanicos]  WITH CHECK ADD  CONSTRAINT [FK_Mecanicos_Tiendas] FOREIGN KEY([idTienda])
REFERENCES [dbo].[Tiendas] ([idTienda])
GO
ALTER TABLE [dbo].[Mecanicos] CHECK CONSTRAINT [FK_Mecanicos_Tiendas]
GO
/****** Object:  StoredProcedure [dbo].[Marbel_Clientes_CRUD]    Script Date: 24/02/2021 5:05:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Marbel_Clientes_CRUD](
@opc int,
@id varchar(10),
@PrimerNombre varchar(25),
@SegundoNombre varchar(25),
@PrimerApellido varchar(25),
@SegundoApellido varchar(25),
@TipoDoc varchar(25),
@Direccion varchar(100),
@Celular varchar(13),
@Email varchar(150),
@TipoVehiculo varchar(20),
@PlacaVehiculo varchar(6),
@DescripcionSol varchar(150),
@Presupuesto float,
@idSol int,
@EstadoSol varchar(25),
@IdMecanico varchar(10) )
AS
/*CREAR CLIENTE*/
IF @opc=1 BEGIN

    INSERT INTO Clientes
	SELECT @id, @PrimerNombre, @SegundoNombre, @PrimerApellido, @SegundoApellido, @TipoDoc, @Direccion,
	@Celular, @Email, @TipoVehiculo, @PlacaVehiculo, @DescripcionSol, GETDATE(), @Presupuesto,@EstadoSol

	
	INSERT INTO DetallesServicios
	--declare @id varchar(10)='1036598000',@idMecanico varchar(10)='1128433392', @DescripcionSol varchar(100)='MANTENIMIENTO CARRO', @PlacaVehiculo varchar(6)='AAA11F'
	SELECT (SELECT MAX(idDetalle) FROM DetallesServicios)+1 IdDetalle, @id idCliente, (SELECT IdMecanico FROM Mecanicos WHERE IdMecanico=@IdMecanico) idMecanico, 
	(SELECT MAX(idSolicitud) FROM Clientes WHERE IdCliente=@id AND PlacaVehiculo=@PlacaVehiculo) idSol,
	(SELECT idArticuloServicio FROM ArticulosServicios WHERE NombreArticuloServicio=@DescripcionSol) idArticulo, 1 Cantidad, 
    (SELECT Precio FROM ArticulosServicios WHERE NombreArticuloServicio=@DescripcionSol) Precio

END
/*LISTAR TODOS LOS CLIENTES*/
IF @opc=2 BEGIN

   SELECT * FROM Clientes
 
END
/*LISTAR CLIENTES POR ID*/
IF @opc=3 BEGIN

   SELECT * FROM Clientes WHERE IdCliente=@id

END
/*ACTUALIZAR CLIENTE*/
IF @opc=4 BEGIN


   UPDATE Clientes
   SET PlacaVehiculo=@PlacaVehiculo, PrimerNombre=@PrimerNombre, SegundoNombre=@SegundoNombre, PrimerApellido=@PrimerApellido, 
   SegundoApellido=@SegundoApellido, Direccion=@Direccion, Celular=@Celular, CorreoElectronico=@Email, Presupuesto=@Presupuesto, EstadoSolicitud=@EstadoSol
   where IdCliente=@id and idSolicitud=@idSol


END
/*ELIMINAR CLIENTE*/
IF @opc=5 BEGIN

  
   DELETE Clientes WHERE IdCliente=@id AND idSolicitud=@idSol AND EstadoSolicitud<>'Finalizado'
   DELETE DetallesServicios WHERE IdCliente=@id AND idSolicitud=@idSol

END



GO
/****** Object:  StoredProcedure [dbo].[Marbel_Funciones]    Script Date: 24/02/2021 5:05:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Marbel_Funciones](
@opc int,
@id varchar(10),
@DescripcionArtServ varchar(150),
@idSol int,
@EstadoSol varchar(25),
@Cantidad int,
@IdDetalle int)
AS
/*AGREGAR DETALLE CLIENTE*/
IF @opc=1 BEGIN

  IF (SELECT EstadoSolicitud FROM Clientes WHERE IdCliente=@id AND idSolicitud=@idSol)<> 'Finalizado' BEGIN
      INSERT INTO DetallesServicios
	  SELECT (SELECT idDetalle FROM DetallesServicios WHERE IdCliente=@id AND idSolicitud=@idSol), @id, (SELECT idMecanico FROM DetallesServicios WHERE IdCliente=@id AND idSolicitud=@idSol),
	  @idSol, (SELECT idArticuloServicio FROM ArticulosServicios WHERE NombreArticuloServicio=@DescripcionArtServ and Tipo='Articulo'),
	  @Cantidad, (SELECT Precio FROM ArticulosServicios WHERE NombreArticuloServicio=@DescripcionArtServ and Tipo='Articulo')

	  SELECT 'Detalle agregado a la solicitud'
  END ELSE BEGIN

     SELECT 'La Solicitud ya se encuentra finalizada.'
  END

END
/*FACTURAR*/
IF @opc=2 BEGIN

   DECLARE @SUBTOTAL FLOAT=(SELECT SUM(Precio*Cantidad) FROM DetallesServicios WHERE IdCliente=@id AND idSolicitud=@idSol AND idDetalle=@IdDetalle )
   DECLARE @TOTALREPUESTOS FLOAT=(SELECT SUM(D.Precio*D.Cantidad) FROM DetallesServicios D INNER JOIN ArticulosServicios A ON D.idArticulo_Servicio=A.idArticuloServicio
                                  WHERE D.IdCliente=@id AND D.idSolicitud=@idSol AND D.idDetalle=@IdDetalle AND A.Tipo='Articulo')
   DECLARE @DESCUENTOS FLOAT= CASE WHEN @TOTALREPUESTOS>3000000 THEN (SELECT SUM(D.Precio*D.Cantidad)/0.5 FROM DetallesServicios D INNER JOIN ArticulosServicios A ON D.idArticulo_Servicio=A.idArticuloServicio
                                  WHERE D.IdCliente=@id AND D.idSolicitud=@idSol AND D.idDetalle=@IdDetalle AND A.Tipo='Servicio') ELSE 0 END
   DECLARE @TOTAL FLOAT=(@SUBTOTAL-@DESCUENTOS)+(@SUBTOTAL-@DESCUENTOS)*0.19

  IF @EstadoSol='Finalizado' AND @TOTAL<=(SELECT Presupuesto FROM Clientes WHERE IdCliente=@id AND idSolicitud=@idSol) BEGIN

     UPDATE Clientes
	 SET EstadoSolicitud=@EstadoSol
	 WHERE IdCliente=@id AND idSolicitud=@idSol

	 INSERT INTO Facturas
	 SELECT @IdDetalle, @SUBTOTAL, @DESCUENTOS, (@SUBTOTAL-@DESCUENTOS), @TOTAL

	 UPDATE A
	 SET A.Cantidad=A.Cantidad-D.Cantidad
	 FROM ArticulosServicios A INNER JOIN DetallesServicios D ON A.idArticuloServicio=D.idArticulo_Servicio
	 WHERE IdCliente=@id AND idSolicitud=@idSol
	 

	 SELECT 'Factura generada correctamente'
  END ELSE BEGIN

    SELECT 'La factura supera el valor del presupuesto indicado por el cliente'
  END
 
END
/*CONSULTA DE CLIENTES QUE HAN PAGADO UN ACUMULADO DE $ 100.000 EN LOS ULTIMOS 60 DIAS*/
IF @opc=3 BEGIN

   SELECT C.* FROM Clientes C INNER JOIN 
   (select idDetalle, idSolicitud, idCliente, SUM(D.Precio*D.Cantidad) SumaArticulos  from DetallesServicios D INNER JOIN ArticulosServicios A ON D.idArticulo_Servicio=A.idArticuloServicio
    WHERE A.Tipo='Articulo' GROUP BY   idDetalle, idSolicitud, idCliente) B ON C.IdCliente=B.idCliente AND C.idSolicitud=B.idSolicitud
    WHERE C.FechaSolicitud BETWEEN GETDATE()-60 AND GETDATE() AND B.SumaArticulos>=100000 AND C.EstadoSolicitud='FINALIZADO'

END
/*CONSULTA DE LOS 100 PRODUCTOS MAS VENDIDOS EN LOS ULTIMOS 30 DIAS*/
IF @opc=4 BEGIN


   SELECT TOP 100 A.* FROM ArticulosServicios A INNER JOIN 
   (SELECT D.idArticulo_Servicio, SUM(Cantidad) Cantidad FROM DetallesServicios D INNER JOIN Clientes C ON D.idCliente=C.IdCliente AND C.idSolicitud=D.idSolicitud
   WHERE C.EstadoSolicitud='Finalizado' AND C.FechaSolicitud BETWEEN GETDATE()-30 AND GETDATE() GROUP BY D.idArticulo_Servicio) B ON A.idArticuloServicio=B.idArticulo_Servicio
   ORDER BY B.Cantidad DESC


END
/*CONSULTA DE LAS TIENDAS QUE HAN VENDIDO MAS DE 100 UND DEL PRODUCTO 100 EN LOS ULTIMOS 60 DIAS*/
IF @opc=5 BEGIN

  
  SELECT T.* FROM Tiendas T INNER JOIN
  (SELECT M.idTienda FROM Mecanicos M INNER JOIN DetallesServicios D ON M.IdMecanico=D.idMecanico 
  INNER JOIN  Clientes C ON D.idSolicitud=C.idSolicitud AND D.idCliente=C.IdCliente WHERE D.idArticulo_Servicio=700 
  AND D.Cantidad>100 AND C.EstadoSolicitud='Finalizado' AND C.FechaSolicitud BETWEEN GETDATE()-60 AND GETDATE() )A ON T.idTienda=A.idTienda

END



GO
