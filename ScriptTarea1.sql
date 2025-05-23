USE [LaEsquina]
GO
/****** Object:  Table [dbo].[Cajero]    Script Date: 20-05-2025 22:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cajero](
	[run_cajero] [varchar](10) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[salario_mensual] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[run_cajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cajero_Turno]    Script Date: 20-05-2025 22:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cajero_Turno](
	[id_cajero_turno] [int] IDENTITY(1,1) NOT NULL,
	[run_cajero] [varchar](10) NULL,
	[id_turno] [int] NULL,
	[dia_trabajado] [date] NOT NULL,
	[horas_trabajadas] [int] NOT NULL,
	[es_domingo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cajero_turno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 20-05-2025 22:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[run_cliente] [varchar](10) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[telefono] [varchar](15) NULL,
	[correo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cotizacion]    Script Date: 20-05-2025 22:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cotizacion](
	[id_cotizacion] [int] IDENTITY(1,1) NOT NULL,
	[run_proveedor] [varchar](10) NULL,
	[codigo_barra] [varchar](20) NULL,
	[precio_ofertado] [decimal](10, 2) NOT NULL,
	[fecha_validez] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cotizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cupon]    Script Date: 20-05-2025 22:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cupon](
	[numero_cupon] [varchar](10) NOT NULL,
	[porcentaje_desc] [decimal](5, 2) NOT NULL,
	[fecha_validez] [date] NOT NULL,
	[id_cliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[numero_cupon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Venta]    Script Date: 20-05-2025 22:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Venta](
	[id_detalle] [int] IDENTITY(1,1) NOT NULL,
	[numero_venta] [int] NULL,
	[codigo_barra] [varchar](20) NULL,
	[cantidad_vendida] [int] NOT NULL,
	[subtotal] [decimal](10, 2) NOT NULL,
	[descuento_aplicado] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 20-05-2025 22:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 20-05-2025 22:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[codigo_barra] [varchar](20) NOT NULL,
	[descripcion] [varchar](255) NOT NULL,
	[precio_unitario] [decimal](10, 2) NOT NULL,
	[clasificacion] [varchar](50) NULL,
	[fecha_vencimiento] [date] NULL,
	[capacidad_envase] [decimal](10, 2) NULL,
	[id_marca] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_barra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto_Promocion]    Script Date: 20-05-2025 22:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto_Promocion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo_barra] [varchar](20) NULL,
	[id_promocion] [int] NULL,
	[porcentaje_descuento] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promocion]    Script Date: 20-05-2025 22:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promocion](
	[id_promocion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NOT NULL,
	[estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_promocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 20-05-2025 22:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[run_proveedor] [varchar](10) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[telefono] [varchar](15) NULL,
	[direccion] [varchar](255) NULL,
	[comuna] [varchar](50) NULL,
	[provincia] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[run_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turno]    Script Date: 20-05-2025 22:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[id_turno] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[hora_inicio] [time](7) NOT NULL,
	[hora_salida] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_turno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 20-05-2025 22:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[numero_venta] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[total_venta] [decimal](10, 2) NOT NULL,
	[descuento_total] [decimal](10, 2) NULL,
	[numero_cupon] [varchar](10) NULL,
	[run_cajero] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[numero_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cajero] ([run_cajero], [nombre], [apellido], [salario_mensual]) VALUES (N'11223344-5', N'Ana', N'Contreras', CAST(400000.00 AS Decimal(10, 2)))
INSERT [dbo].[Cajero] ([run_cajero], [nombre], [apellido], [salario_mensual]) VALUES (N'55667788-9', N'Luis', N'Figueroa', CAST(420000.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Cajero_Turno] ON 

INSERT [dbo].[Cajero_Turno] ([id_cajero_turno], [run_cajero], [id_turno], [dia_trabajado], [horas_trabajadas], [es_domingo]) VALUES (1, N'11223344-5', 1, CAST(N'2025-05-06' AS Date), 6, 0)
INSERT [dbo].[Cajero_Turno] ([id_cajero_turno], [run_cajero], [id_turno], [dia_trabajado], [horas_trabajadas], [es_domingo]) VALUES (2, N'55667788-9', 3, CAST(N'2025-05-04' AS Date), 6, 1)
SET IDENTITY_INSERT [dbo].[Cajero_Turno] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id_cliente], [run_cliente], [nombre], [apellido], [telefono], [correo]) VALUES (1, N'11111111-1', N'Carlos', N'Rojas', N'912345678', N'carlos.rojas@email.com')
INSERT [dbo].[Cliente] ([id_cliente], [run_cliente], [nombre], [apellido], [telefono], [correo]) VALUES (2, N'22222222-2', N'María', N'Pérez', N'987654321', NULL)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Cotizacion] ON 

INSERT [dbo].[Cotizacion] ([id_cotizacion], [run_proveedor], [codigo_barra], [precio_ofertado], [fecha_validez]) VALUES (1, N'12345678-9', N'1000000001', CAST(850.00 AS Decimal(10, 2)), CAST(N'2025-12-01' AS Date))
INSERT [dbo].[Cotizacion] ([id_cotizacion], [run_proveedor], [codigo_barra], [precio_ofertado], [fecha_validez]) VALUES (2, N'98765432-1', N'1000000002', CAST(830.00 AS Decimal(10, 2)), CAST(N'2025-11-30' AS Date))
SET IDENTITY_INSERT [dbo].[Cotizacion] OFF
GO
INSERT [dbo].[Cupon] ([numero_cupon], [porcentaje_desc], [fecha_validez], [id_cliente]) VALUES (N'CUP10', CAST(10.00 AS Decimal(5, 2)), CAST(N'2025-05-06' AS Date), 1)
INSERT [dbo].[Cupon] ([numero_cupon], [porcentaje_desc], [fecha_validez], [id_cliente]) VALUES (N'CUP15', CAST(15.00 AS Decimal(5, 2)), CAST(N'2025-05-06' AS Date), 2)
GO
SET IDENTITY_INSERT [dbo].[Detalle_Venta] ON 

INSERT [dbo].[Detalle_Venta] ([id_detalle], [numero_venta], [codigo_barra], [cantidad_vendida], [subtotal], [descuento_aplicado]) VALUES (1, 1, N'1000000001', 1, CAST(900.00 AS Decimal(10, 2)), CAST(90.00 AS Decimal(10, 2)))
INSERT [dbo].[Detalle_Venta] ([id_detalle], [numero_venta], [codigo_barra], [cantidad_vendida], [subtotal], [descuento_aplicado]) VALUES (2, 1, N'1000000003', 2, CAST(400.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Detalle_Venta] OFF
GO
SET IDENTITY_INSERT [dbo].[Marca] ON 

INSERT [dbo].[Marca] ([id_marca], [nombre]) VALUES (1, N'Soprole')
INSERT [dbo].[Marca] ([id_marca], [nombre]) VALUES (2, N'Colun')
INSERT [dbo].[Marca] ([id_marca], [nombre]) VALUES (3, N'Nestlé')
INSERT [dbo].[Marca] ([id_marca], [nombre]) VALUES (4, N'Faber-Castell')
SET IDENTITY_INSERT [dbo].[Marca] OFF
GO
INSERT [dbo].[Producto] ([codigo_barra], [descripcion], [precio_unitario], [clasificacion], [fecha_vencimiento], [capacidad_envase], [id_marca]) VALUES (N'1000000001', N'Leche Entera 1L', CAST(900.00 AS Decimal(10, 2)), N'Lácteos', CAST(N'2025-12-01' AS Date), CAST(1.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Producto] ([codigo_barra], [descripcion], [precio_unitario], [clasificacion], [fecha_vencimiento], [capacidad_envase], [id_marca]) VALUES (N'1000000002', N'Leche Descremada 1L', CAST(880.00 AS Decimal(10, 2)), N'Lácteos', CAST(N'2025-11-15' AS Date), CAST(1.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Producto] ([codigo_barra], [descripcion], [precio_unitario], [clasificacion], [fecha_vencimiento], [capacidad_envase], [id_marca]) VALUES (N'1000000003', N'Lápiz grafito HB', CAST(200.00 AS Decimal(10, 2)), N'Escritorio', NULL, NULL, 4)
GO
SET IDENTITY_INSERT [dbo].[Producto_Promocion] ON 

INSERT [dbo].[Producto_Promocion] ([id], [codigo_barra], [id_promocion], [porcentaje_descuento]) VALUES (1, N'1000000001', 1, CAST(10.00 AS Decimal(5, 2)))
INSERT [dbo].[Producto_Promocion] ([id], [codigo_barra], [id_promocion], [porcentaje_descuento]) VALUES (2, N'1000000002', 1, CAST(10.00 AS Decimal(5, 2)))
INSERT [dbo].[Producto_Promocion] ([id], [codigo_barra], [id_promocion], [porcentaje_descuento]) VALUES (3, N'1000000003', 2, CAST(5.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[Producto_Promocion] OFF
GO
SET IDENTITY_INSERT [dbo].[Promocion] ON 

INSERT [dbo].[Promocion] ([id_promocion], [nombre], [fecha_inicio], [fecha_fin], [estado]) VALUES (1, N'Día de la Leche', CAST(N'2025-05-01' AS Date), CAST(N'2025-05-10' AS Date), 1)
INSERT [dbo].[Promocion] ([id_promocion], [nombre], [fecha_inicio], [fecha_fin], [estado]) VALUES (2, N'Día del Estudiante', CAST(N'2025-05-05' AS Date), CAST(N'2025-05-15' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Promocion] OFF
GO
INSERT [dbo].[Proveedor] ([run_proveedor], [nombre], [telefono], [direccion], [comuna], [provincia]) VALUES (N'12345678-9', N'Distribuidora Central', N'987654321', N'Av. Central 123', N'Viña del Mar', N'Valparaíso')
INSERT [dbo].[Proveedor] ([run_proveedor], [nombre], [telefono], [direccion], [comuna], [provincia]) VALUES (N'98765432-1', N'Lácteos del Norte', N'912345678', N'Camino Rural 45', N'Villa Alemana', N'Valparaíso')
GO
SET IDENTITY_INSERT [dbo].[Turno] ON 

INSERT [dbo].[Turno] ([id_turno], [nombre], [hora_inicio], [hora_salida]) VALUES (1, N'Mañana', CAST(N'08:00:00' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[Turno] ([id_turno], [nombre], [hora_inicio], [hora_salida]) VALUES (2, N'Tarde', CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
INSERT [dbo].[Turno] ([id_turno], [nombre], [hora_inicio], [hora_salida]) VALUES (3, N'Domingo Especial', CAST(N'10:00:00' AS Time), CAST(N'16:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Turno] OFF
GO
SET IDENTITY_INSERT [dbo].[Venta] ON 

INSERT [dbo].[Venta] ([numero_venta], [fecha], [total_venta], [descuento_total], [numero_cupon], [run_cajero]) VALUES (1, CAST(N'2025-05-06' AS Date), CAST(1890.00 AS Decimal(10, 2)), CAST(189.00 AS Decimal(10, 2)), N'CUP10', N'11223344-5')
SET IDENTITY_INSERT [dbo].[Venta] OFF
GO
ALTER TABLE [dbo].[Cajero_Turno] ADD  DEFAULT ((0)) FOR [es_domingo]
GO
ALTER TABLE [dbo].[Promocion] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[Cajero_Turno]  WITH CHECK ADD FOREIGN KEY([id_turno])
REFERENCES [dbo].[Turno] ([id_turno])
GO
ALTER TABLE [dbo].[Cajero_Turno]  WITH CHECK ADD FOREIGN KEY([run_cajero])
REFERENCES [dbo].[Cajero] ([run_cajero])
GO
ALTER TABLE [dbo].[Cotizacion]  WITH CHECK ADD FOREIGN KEY([codigo_barra])
REFERENCES [dbo].[Producto] ([codigo_barra])
GO
ALTER TABLE [dbo].[Cotizacion]  WITH CHECK ADD FOREIGN KEY([run_proveedor])
REFERENCES [dbo].[Proveedor] ([run_proveedor])
GO
ALTER TABLE [dbo].[Cupon]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[Detalle_Venta]  WITH CHECK ADD FOREIGN KEY([codigo_barra])
REFERENCES [dbo].[Producto] ([codigo_barra])
GO
ALTER TABLE [dbo].[Detalle_Venta]  WITH CHECK ADD FOREIGN KEY([numero_venta])
REFERENCES [dbo].[Venta] ([numero_venta])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([id_marca])
REFERENCES [dbo].[Marca] ([id_marca])
GO
ALTER TABLE [dbo].[Producto_Promocion]  WITH CHECK ADD FOREIGN KEY([codigo_barra])
REFERENCES [dbo].[Producto] ([codigo_barra])
GO
ALTER TABLE [dbo].[Producto_Promocion]  WITH CHECK ADD FOREIGN KEY([id_promocion])
REFERENCES [dbo].[Promocion] ([id_promocion])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([numero_cupon])
REFERENCES [dbo].[Cupon] ([numero_cupon])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([run_cajero])
REFERENCES [dbo].[Cajero] ([run_cajero])
GO
