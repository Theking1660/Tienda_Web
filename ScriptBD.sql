USE [master]
GO
/****** Object:  Database [TiendaBD]    Script Date: 11/6/2023 5:55:05 p. m. ******/

ALTER DATABASE [TiendaBD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TiendaBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TiendaBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TiendaBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TiendaBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TiendaBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TiendaBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [TiendaBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TiendaBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TiendaBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TiendaBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TiendaBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TiendaBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TiendaBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TiendaBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TiendaBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TiendaBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TiendaBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TiendaBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TiendaBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TiendaBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TiendaBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TiendaBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TiendaBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TiendaBD] SET RECOVERY FULL 
GO
ALTER DATABASE [TiendaBD] SET  MULTI_USER 
GO
ALTER DATABASE [TiendaBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TiendaBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TiendaBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TiendaBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TiendaBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TiendaBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TiendaBD', N'ON'
GO
ALTER DATABASE [TiendaBD] SET QUERY_STORE = ON
GO
ALTER DATABASE [TiendaBD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TiendaBD]
GO
/****** Object:  Schema [Tienda]    Script Date: 11/6/2023 5:55:06 p. m. ******/
CREATE SCHEMA [Tienda]
GO
/****** Object:  Table [Tienda].[Categoria]    Script Date: 11/6/2023 5:55:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tienda].[Categoria](
	[Categoria_id] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Categoria_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Tienda].[Ciudad]    Script Date: 11/6/2023 5:55:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tienda].[Ciudad](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ciudad_id] [char](2) NOT NULL,
	[Pais_id] [char](2) NOT NULL,
	[Ciudad] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Tienda].[Comentario]    Script Date: 11/6/2023 5:55:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tienda].[Comentario](
	[Comentario_id] [int] NOT NULL,
	[Producto_id] [int] NOT NULL,
	[Perfil_id] [int] NOT NULL,
	[Estrella] [smallint] NOT NULL,
	[Comentario] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Comentario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Tienda].[Comentario_Producto]    Script Date: 11/6/2023 5:55:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tienda].[Comentario_Producto](
	[Comentario_Producto_id] [int] IDENTITY(1,1) NOT NULL,
	[Producto_id] [int] NOT NULL,
	[Comentario_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Comentario_Producto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Tienda].[Cuenta]    Script Date: 11/6/2023 5:55:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tienda].[Cuenta](
	[Cuenta_id] [int] NOT NULL,
	[Perfil_id] [int] NOT NULL,
	[MetodoP_id] [int] NOT NULL,
	[Direccion_id] [int] NOT NULL,
	[Cuenta] [char](5) NOT NULL,
	[Fecha_creacion] [datetime] NOT NULL,
	[Fecha_actualizacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cuenta_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Tienda].[Cupones]    Script Date: 11/6/2023 5:55:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tienda].[Cupones](
	[Cupones_id] [int] IDENTITY(1,1) NOT NULL,
	[Producto_id] [int] NOT NULL,
	[Codigo] [char](8) NOT NULL,
	[Descuento] [decimal](3, 2) NOT NULL,
	[Activado] [bit] NOT NULL,
	[Fecha_inicio] [datetime] NOT NULL,
	[Fecha_fin] [datetime] NOT NULL,
	[Fecha_creacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cupones_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Tienda].[Direccion]    Script Date: 11/6/2023 5:55:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tienda].[Direccion](
	[Direccion_id] [int] IDENTITY(1,1) NOT NULL,
	[Pais_id] [char](2) NOT NULL,
	[Ubicacion] [nvarchar](200) NOT NULL,
	[Codigo_Postal] [int] NOT NULL,
	[Ciudad_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Direccion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Tienda].[Metodo_Pago]    Script Date: 11/6/2023 5:55:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tienda].[Metodo_Pago](
	[MetodoP_id] [int] IDENTITY(1,1) NOT NULL,
	[Metodo] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MetodoP_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Tienda].[Pais]    Script Date: 11/6/2023 5:55:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tienda].[Pais](
	[Pais_id] [char](2) NOT NULL,
	[Pais] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pais_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Tienda].[Pedido]    Script Date: 11/6/2023 5:55:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tienda].[Pedido](
	[Pedido_id] [int] IDENTITY(1,1) NOT NULL,
	[Cuenta_id] [int] NOT NULL,
	[Producto_id] [int] NOT NULL,
	[MetodoP_id] [int] NOT NULL,
	[Direccion_id] [int] NOT NULL,
	[Pedido] [nvarchar](6) NOT NULL,
	[Precio_total] [decimal](10, 2) NOT NULL,
	[Precio_envio] [decimal](10, 2) NOT NULL,
	[ITBIS] [decimal](10, 2) NOT NULL,
	[Descuento] [decimal](10, 2) NULL,
	[Fpedido_realizado] [datetime] NOT NULL,
	[FPEDIDO_enviado] [datetime] NOT NULL,
	[Reembolsado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Pedido_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Tienda].[Perfil]    Script Date: 11/6/2023 5:55:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tienda].[Perfil](
	[Perfil_id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo_perfil_id] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[Numero] [int] NOT NULL,
	[Correo] [nvarchar](100) NOT NULL,
	[Contraseña] [nvarchar](16) NOT NULL,
	[Fecha_Nacimiento] [date] NOT NULL,
	[ActivacionDP] [bit] NULL,
	[Membresia] [bit] NULL,
	[Fecha_creacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Perfil_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Tienda].[Producto]    Script Date: 11/6/2023 5:55:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tienda].[Producto](
	[Producto_id] [int] IDENTITY(1,1) NOT NULL,
	[Categoria_id] [int] NOT NULL,
	[Producto] [nvarchar](100) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Descuento] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Producto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Tienda].[Subcategoria]    Script Date: 11/6/2023 5:55:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tienda].[Subcategoria](
	[Subcategoria_id] [int] IDENTITY(1,1) NOT NULL,
	[Categoria_id] [int] NOT NULL,
	[Subcategoria] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Subcategoria_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Tienda].[Tipo_Perfil]    Script Date: 11/6/2023 5:55:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tienda].[Tipo_Perfil](
	[Tipo_perfil_id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo_perfil] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Tipo_perfil_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Tienda].[Vendedor]    Script Date: 11/6/2023 5:55:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tienda].[Vendedor](
	[Vendedor_id] [int] NOT NULL,
	[Perfil_id] [int] NOT NULL,
	[Producto_id] [int] NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Informacion] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Vendedor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Tienda].[Categoria] ON 
GO
INSERT [Tienda].[Categoria] ([Categoria_id], [Categoria]) VALUES (1, N'Ropa,Zapatos y Joyeria')
GO
INSERT [Tienda].[Categoria] ([Categoria_id], [Categoria]) VALUES (2, N'Libros')
GO
INSERT [Tienda].[Categoria] ([Categoria_id], [Categoria]) VALUES (3, N'Películas, Música y Juegos')
GO
INSERT [Tienda].[Categoria] ([Categoria_id], [Categoria]) VALUES (4, N'Electrónicos')
GO
INSERT [Tienda].[Categoria] ([Categoria_id], [Categoria]) VALUES (5, N'Computadoras')
GO
INSERT [Tienda].[Categoria] ([Categoria_id], [Categoria]) VALUES (6, N'Smart Home')
GO
INSERT [Tienda].[Categoria] ([Categoria_id], [Categoria]) VALUES (7, N'Hogar, Jardin y Herramientas')
GO
INSERT [Tienda].[Categoria] ([Categoria_id], [Categoria]) VALUES (8, N'Articulos para Mascotas')
GO
INSERT [Tienda].[Categoria] ([Categoria_id], [Categoria]) VALUES (9, N'Alimentos y Abarrotes')
GO
INSERT [Tienda].[Categoria] ([Categoria_id], [Categoria]) VALUES (10, N'Belleza y Salud')
GO
INSERT [Tienda].[Categoria] ([Categoria_id], [Categoria]) VALUES (11, N'Juquetes y Bebé')
GO
INSERT [Tienda].[Categoria] ([Categoria_id], [Categoria]) VALUES (12, N'Handmade')
GO
INSERT [Tienda].[Categoria] ([Categoria_id], [Categoria]) VALUES (13, N'Deportes')
GO
INSERT [Tienda].[Categoria] ([Categoria_id], [Categoria]) VALUES (14, N'Exteriores')
GO
INSERT [Tienda].[Categoria] ([Categoria_id], [Categoria]) VALUES (15, N'Automotriz e Industrial')
GO
INSERT [Tienda].[Categoria] ([Categoria_id], [Categoria]) VALUES (16, N'Industrial y Cientifico')
GO
SET IDENTITY_INSERT [Tienda].[Categoria] OFF
GO
SET IDENTITY_INSERT [Tienda].[Ciudad] ON 
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (1, N'AL', N'US', N'Alabama')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (2, N'AK', N'US', N'Alaska')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (3, N'AS', N'US', N'American Samoa')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (4, N'AZ', N'US', N'Arizona')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (5, N'AR', N'US', N'Arkansas')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (6, N'CA', N'US', N'California')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (7, N'CO', N'US', N'Colorado')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (8, N'CT', N'US', N'Connecticut')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (9, N'DE', N'US', N'Delaware')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (10, N'DC', N'US', N'Disctrict of Columbia')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (11, N'FM', N'US', N'Federated States of Micronesia')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (12, N'FL', N'US', N'Florida')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (13, N'GA', N'US', N'Georgia')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (14, N'GU', N'US', N'Guam')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (15, N'HI', N'US', N'Hawaii')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (16, N'ID', N'US', N'Idaho')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (17, N'IL', N'US', N'Illinois')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (18, N'IN', N'US', N'Indiana')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (19, N'IA', N'US', N'Iowa')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (20, N'KS', N'US', N'Kansas')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (21, N'KY', N'US', N'Kentucky')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (22, N'LA', N'US', N'Louisana')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (23, N'ME', N'US', N'Maine')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (24, N'MH', N'US', N'Marshall Islands')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (25, N'MD', N'US', N'Maryland')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (26, N'MA', N'US', N'Massachusetts')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (27, N'MI', N'US', N'Michigan')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (28, N'MN', N'US', N'Minnesota')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (29, N'MS', N'US', N'Mississippi')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (30, N'MT', N'US', N'Montana')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (31, N'NE', N'US', N'Nebraska')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (32, N'NV', N'US', N'Nevada')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (33, N'NH', N'US', N'New Hampshire')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (34, N'NJ', N'US', N'New Jersey')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (35, N'NM', N'US', N'New Mexico')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (36, N'NY', N'US', N'New York')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (37, N'NC', N'US', N'North Carolina')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (38, N'ND', N'US', N'North Dakota')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (39, N'MP', N'US', N'Northern Mariana Islands')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (40, N'OH', N'US', N'Ohio')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (41, N'OK', N'US', N'Oklahoma')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (42, N'OR', N'US', N'Oregon')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (43, N'PW', N'US', N'Palau')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (44, N'PA', N'US', N'Pennsylvania')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (45, N'PR', N'US', N'Puerto Rico')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (46, N'RI', N'US', N'Rhode Island')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (47, N'SC', N'US', N'South Carolina')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (48, N'SD', N'US', N'South Dakota')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (49, N'TN', N'US', N'Tennesse')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (50, N'TX', N'US', N'Texas')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (51, N'UT', N'US', N'Utah')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (52, N'VT', N'US', N'Vermont')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (53, N'VI', N'US', N'Virgin Islands')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (54, N'VA', N'US', N'Virginia')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (55, N'WA', N'US', N'Washington')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (56, N'WV', N'US', N'West Virginia')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (57, N'WI', N'US', N'Wisconsin')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (58, N'WY', N'US', N'Wyoming')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (59, N'AZ', N'DO', N'Azua')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (60, N'BH', N'DO', N'Bahoruco')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (61, N'BR', N'DO', N'Barahona')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (62, N'DJ', N'DO', N'Dajabon')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (63, N'DU', N'DO', N'Duarte')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (64, N'EP', N'DO', N'Elías Piña')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (65, N'ES', N'DO', N'El Seibo')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (66, N'ET', N'DO', N'Espaillat')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (67, N'HM', N'DO', N'Hato Mayor')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (68, N'SM', N'DO', N'Hermanas Mirabal')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (69, N'IN', N'DO', N'Independencia')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (70, N'LA', N'DO', N'La Altagracia')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (71, N'LR', N'DO', N'La Romana')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (72, N'LV', N'DO', N'La Vega')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (73, N'MT', N'DO', N'María Trinidad Sánchez')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (74, N'MN', N'DO', N'Monseñor Nouel')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (75, N'MC', N'DO', N'Monte Cristi')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (76, N'MP', N'DO', N'Monte Plata ')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (77, N'PE', N'DO', N'Perdenales')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (78, N'PV', N'DO', N'Peravia')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (79, N'PP', N'DO', N'Puerto Plata')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (80, N'SA', N'DO', N'Samaná')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (81, N'SC', N'DO', N'San Cristóbal ')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (82, N'JO', N'DO', N'San José de Ocoa')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (83, N'SJ', N'DO', N'San Juan')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (84, N'SP', N'DO', N'San Pedro de Macorís')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (85, N'SR', N'DO', N'Sánchez Ramírez')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (86, N'SO', N'DO', N'Santiago')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (87, N'RO', N'DO', N'Santiago Rodríguez')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (88, N'SD', N'DO', N'Santo Domingo')
GO
INSERT [Tienda].[Ciudad] ([ID], [Ciudad_id], [Pais_id], [Ciudad]) VALUES (89, N'VA', N'DO', N'Valverde')
GO
SET IDENTITY_INSERT [Tienda].[Ciudad] OFF
GO
SET IDENTITY_INSERT [Tienda].[Metodo_Pago] ON 
GO
INSERT [Tienda].[Metodo_Pago] ([MetodoP_id], [Metodo]) VALUES (1, N'Tarjeta de credito/debito')
GO
INSERT [Tienda].[Metodo_Pago] ([MetodoP_id], [Metodo]) VALUES (2, N'Efectivo')
GO
INSERT [Tienda].[Metodo_Pago] ([MetodoP_id], [Metodo]) VALUES (3, N'Paypal')
GO
SET IDENTITY_INSERT [Tienda].[Metodo_Pago] OFF
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'AD', N'ANDORRA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'AE', N'EMIRATOS ÁRABES UNIDOS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'AF', N'AFGANISTÁN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'AG', N'ANTIGUA Y BARBUDA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'AI', N'ANGUILA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'AL', N'ALBANIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'AM', N'ARMENIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'AO', N'ANGOLA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'AQ', N'ANTÁRTIDA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'AR', N'ARGENTINA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'AS', N'SAMOA AMERICANA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'AT', N'AUSTRIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'AU', N'AUSTRALIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'AW', N'ARUBA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'AX', N'ISLAS ÅLAND')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'AZ', N'AZERBAIYÁN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BA', N'BOSNIA Y HERCEGOVINA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BB', N'BARBADOS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BD', N'BANGLADESH')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BE', N'BÉLGICA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BF', N'BURKINA FASO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BG', N'BULGARIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BH', N'BAHREIN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BI', N'BURUNDI')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BJ', N'BENÍN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BL', N'SAN BARTOLOMÉ')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BM', N'BERMUDAS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BN', N'BRUNÉI')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BO', N'BOLIVIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BQ', N'CARIBE NEERLANDÉS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BR', N'BRASIL')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BS', N'BAHAMAS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BT', N'BUTÁN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BV', N'ISLA BOUVET')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BW', N'BOTSUANA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BY', N'BELARÚS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'BZ', N'BELICE')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CA', N'CANADÁ')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CC', N'ISLAS COCOS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CD', N'REPÚBLICA DEMOCRÁTICA DEL CONGO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CF', N'REPÚBLICA CENTROAFRICANA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CG', N'REPÚBLICA DEL CONGO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CH', N'SUIZA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CI', N'COSTA DE MARFIL')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CK', N'ISLAS COOK')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CL', N'CHILE')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CM', N'CAMERÚN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CN', N'CHINA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CO', N'COLOMBIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CR', N'COSTA RICA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CU', N'CUBA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CV', N'CABO VERDE')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CW', N'CURAÇAO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CX', N'ISLA DE NAVIDAD')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CY', N'CHIPRE')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'CZ', N'CHEQUIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'DE', N'ALEMANIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'DJ', N'YIBUTI')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'DK', N'DINAMARCA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'DM', N'DOMINICA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'DO', N'REPÚBLICA DOMINICANA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'DZ', N'ARGELIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'EC', N'ECUADOR')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'EE', N'ESTONIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'EG', N'EGIPTO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'EH', N'SÁHARA OCCIDENTAL')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'ER', N'ERITREA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'ES', N'ESPAÑA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'ET', N'ETIOPÍA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'FI', N'FINLANDIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'FJ', N'FIYI')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'FK', N'ISLAS MALVINAS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'FM', N'ESTADOS FEDERADOS DE MICRONESIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'FO', N'ISLAS FEROE')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'FR', N'FRANCIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GA', N'GABÓN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GB', N'REINO UNIDO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GD', N'GRANADA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GE', N'GEORGIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GF', N'GUAYANA FRANCESA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GG', N'BAILÍA DE GUERNSEY')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GH', N'GHANA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GI', N'GIBRALTAR')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GL', N'GROENLANDIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GM', N'GAMBIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GN', N'GUINEA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GP', N'GUADALUPE')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GQ', N'GUINEA ECUATORIAL')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GR', N'GRECIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GS', N'GEORGIA DEL SUR Y LAS ISLAS SANDWICH DEL SUR')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GT', N'GUATEMALA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GU', N'GUAM')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GW', N'GUINEA-BISSAU')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'GY', N'GUAYANA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'HK', N'HONG KONG')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'HM', N'ISLAS HEARD Y MCDONALD')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'HN', N'HONDURAS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'HR', N'CROACIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'HT', N'HAITÍ')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'HU', N'HUNGRÍA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'ID', N'INDONESIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'IE', N'IRLANDA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'IL', N'ISRAEL')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'IM', N'ISLA DE MAN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'IN', N'INDIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'IO', N'TERRITORIO BRITÁNICO DEL OCÉANO ÍNDICO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'IQ', N'IRAQ')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'IR', N'IRÁN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'IS', N'ISLANDIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'IT', N'ITALIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'JE', N'JERSEY')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'JM', N'JAMAICA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'JO', N'JORDANIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'JP', N'JAPÓN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'KE', N'KENIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'KG', N'KIRGUISTÁN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'KH', N'CAMBOYA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'KI', N'KIRIBATI')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'KM', N'COMORES')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'KN', N'SAN CRISTÓBAL Y NIEVES')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'KP', N'COREA DEL NORTE')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'KR', N'COREA DEL SUR')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'KW', N'KUWAIT')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'KY', N'ISLAS CAIMÁN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'KZ', N'KAZAJISTÁN???')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'LA', N'LAOS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'LB', N'LÍBANO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'LC', N'SANTA LUCÍA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'LI', N'LIECHTENSTEIN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'LK', N'SRI LANKA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'LR', N'LIBERIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'LS', N'LESOTHO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'LT', N'LITUANIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'LU', N'LUXEMBURGO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'LV', N'LETONIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'LY', N'LIBIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MA', N'MARRUECOS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MC', N'PRINCIPADO DE MÓNACO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MD', N'MOLDAVIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'ME', N'MONTENEGRO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MF', N'ISLA DE SAN MARTÍN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MG', N'MADAGASCAR')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MH', N'ISLAS MARSHALL')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MK', N'MACEDONIA DEL NORTE')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'ML', N'MALÍ')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MM', N'MYANMAR')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MN', N'MONGOLIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MO', N'MACAO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MP', N'ISLAS MARIANAS DEL NORTE')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MQ', N'MARTINICA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MR', N'MAURITANIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MS', N'MONTSERRAT')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MT', N'MALTA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MU', N'ISLA MAURICIO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MV', N'MALDIVAS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MW', N'MALAUI')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MX', N'MÉXICO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MY', N'MALASIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'MZ', N'MOZAMBIQUE')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'NA', N'NAMIBIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'NC', N'NUEVA CALEDONIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'NE', N'NÍGER')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'NF', N'ISLA NORFOLK')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'NG', N'NIGERIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'NI', N'NICARAGUA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'NL', N'PAÍSES BAJOS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'NO', N'NORUEGA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'NP', N'NEPAL')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'NR', N'NAURU')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'NU', N'NIUE')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'NZ', N'NUEVA ZELANDIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'OM', N'OMÁN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'PA', N'PANAMÁ')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'PE', N'PERÚ')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'PF', N'POLINESIA FRANCESA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'PG', N'PAPÚA NUEVA GUINEA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'PH', N'FILIPINAS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'PK', N'PAKISTÁN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'PL', N'POLONIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'PM', N'SAN PEDRO Y MIQUELÓN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'PN', N'ISLAS PITCAIRN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'PR', N'PUERTO RICO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'PS', N'PALESTINA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'PT', N'PORTUGAL')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'PW', N'PALAOS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'PY', N'PARAGUAY')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'QA', N'CATAR')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'RE', N'REUNIÓN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'RO', N'RUMANIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'RS', N'SERBIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'RU', N'RUSIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'RW', N'RUANDA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SA', N'ARABIA SAUDITA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SB', N'ISLAS SALOMÓN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SC', N'SEYCHELLES')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SD', N'SUDÁN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SE', N'SUECIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SG', N'SINGAPUR')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SH', N'SANTA ELENA, ASCENSIÓN Y TRISTÁN DE ACUÑA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SI', N'ESLOVENIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SJ', N'SVALBARD Y JAN MAYEN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SK', N'ESLOVAQUIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SL', N'SIERRA LEONA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SM', N'SAN MARINO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SN', N'SENEGAL')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SO', N'SOMALIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SR', N'SURINAM')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SS', N'SUDÁN DEL SUR')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'ST', N'SANTO TOMÉ Y PRÍNCIPE')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SV', N'EL SALVADOR')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SX', N'SINT MAARTEN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SY', N'SIRIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'SZ', N'ESUATINI')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'TC', N'ISLAS TURCAS Y CAICOS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'TD', N'CHAD')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'TF', N'TERRITORIOS AUSTRALES Y ANTÁRTICOS FRANCESES')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'TG', N'TOGO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'TH', N'TAILANDIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'TJ', N'TAYIKISTÁN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'TK', N'TOKELAU')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'TL', N'TIMOR ORIENTAL')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'TM', N'TURKMENISTÁN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'TN', N'TÚNEZ')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'TO', N'TONGA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'TR', N'TURQUÍA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'TT', N'TRINIDAD Y TOBAGO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'TV', N'TUVALU')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'TW', N'TAIWÁN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'TZ', N'TANZANIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'UA', N'UCRANIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'UG', N'UGANDA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'UM', N'ISLAS ULTRAMARINAS MENORES DE LOS ESTADOS UNIDOS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'US', N'ESTADOS UNIDOS DE AMÉRICA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'UY', N'URUGUAY')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'UZ', N'UZBEKISTÁN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'VA', N'CIUDAD DEL VATICANO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'VC', N'SAN VICENTE Y LAS GRANADINAS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'VE', N'VENEZUELA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'VG', N'ISLAS VÍRGENES (UK)')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'VI', N'ISLAS VÍRGENES AMERICANAS')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'VN', N'VIETNAM')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'VU', N'VANUATU')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'WF', N'WALLIS Y FUTUNA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'WS', N'SAMOA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'XK', N'KOSOVO')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'YE', N'YEMEN')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'YT', N'MAYOTTE')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'ZA', N'SUDÁFRICA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'ZM', N'ZAMBIA')
GO
INSERT [Tienda].[Pais] ([Pais_id], [Pais]) VALUES (N'ZW', N'ZIMBABUE')
GO
SET IDENTITY_INSERT [Tienda].[Subcategoria] ON 
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (1, 1, N'Mujeres')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (2, 1, N'Hombres')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (3, 1, N'Niñas')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (4, 1, N'Niños')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (5, 1, N'Para Bebés')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (6, 1, N'Equipaje')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (7, 1, N'Tiendas de Lujo')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (8, 2, N'Libros')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (9, 2, N'Libros en Español')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (10, 2, N'Libros para Niños')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (11, 2, N'Libros de Textos')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (12, 2, N'Libros Electronicos')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (13, 3, N'Cine y TV')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (14, 3, N'Blu-ray')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (15, 3, N'CD y Vinilos')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (16, 3, N'Musica Digital')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (17, 3, N'Instrumentos Musicales')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (18, 3, N'Audifonoes')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (19, 3, N'Videojuegos')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (20, 3, N'Videojuegos para PC')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (21, 3, N'Descargas de Juegos')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (22, 3, N'Coleccionables de Entretenimiento')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (23, 3, N'Videojuegos de intercambio')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (24, 4, N'TV y Video')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (25, 4, N'Equipos de Home Theater y Audio')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (26, 4, N'Cámaras, Fotografía y Video')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (27, 4, N'Celulares y Accesorios')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (28, 4, N'Audífonos')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (29, 4, N'Videojuegos')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (30, 4, N'Altavoces Inalámbricas y Bluetooth')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (31, 4, N'Electrónicos para Automóvil y GPS')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (32, 4, N'Instrumentos Musicales')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (33, 4, N'Tecnología Vestible')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (34, 4, N'Electrónicos')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (35, 5, N'Computadoras, Tablets, y Productos para PC')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (36, 5, N'Monitores')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (37, 5, N'Accesorios')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (38, 5, N'Dispositivos para Redes')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (39, 5, N'Dispositivos y Almacenamiento')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (40, 5, N'Partes y Componentes de Computadora')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (41, 5, N'Impresoras y Tinta')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (42, 5, N'Software')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (43, 5, N'Artículos Escolares y de Oficina')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (44, 5, N'Intercambia tus Aparatos Electrónicos')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (45, 6, N'Iluminacion de Smart Home')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (46, 6, N'Cerraduras Inteligentes y Entrada')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (47, 6, N'Cámaras y Sistemas de Seguridad')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (48, 6, N'Enchufes')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (49, 6, N'Nuevos Dispositivos Inteligentes')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (50, 6, N'Calefacción y Refrigeración')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (51, 6, N'Detectores y Sensores')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (52, 6, N'Entretenimiento del Hogar')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (53, 6, N'Mascotas')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (54, 6, N'Asistentes de Voz y Hubs')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (55, 6, N'Cocina')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (56, 6, N'Aspiradoras y Trapeadores')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (57, 6, N'Patio y Jardín')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (58, 6, N'WiFi y Conexiones de Red')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (59, 6, N'Otras Soluciones')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (60, 7, N'Comprar por habitación')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (61, 7, N'Decoración del hogar')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (62, 7, N'Muebles')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (63, 7, N'Cocina y Comedor')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (64, 7, N'Ropa de Cama y Baño')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (65, 7, N'Jardín y Exteriores')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (66, 7, N'Colchones')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (67, 7, N'Iluminación')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (68, 7, N'Almacenamiento y Organización')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (69, 7, N'Electrodomésticos')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (70, 7, N'Bellas Artes')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (71, 7, N'Coleccionables y bellas artes')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (72, 7, N'Arte, Manualidades y Costura')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (73, 7, N'Artículos para Actividades y Fiestas')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (74, 7, N'Accesorios para Mascotas')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (75, 7, N'Herramientas Eléctricas y Manuales')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (76, 7, N'Lámparas y Accesorios de Iluminación')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (77, 7, N'Accesorios de Cocina y Baño')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (78, 7, N'Utensilios de cocina')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (79, 7, N'Ferretería')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (80, 7, N'Smart Home')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (81, 8, N'Accesorios para Perros')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (82, 8, N'Comida de Perros')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (83, 8, N'Accesorios para Gatos')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (84, 8, N'Comida de Gatos')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (85, 8, N'Peces y Artículos para Acuarios')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (86, 8, N'Animales Pequeños')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (87, 8, N'Aves')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (88, 9, N'Alimentos y Productos Gourmet')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (89, 10, N'Cuidado Profesional de la Piel')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (90, 10, N'Salón de Belleza y Spa')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (91, 10, N'Grooming para Hombres')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (92, 10, N'Salud, Hogar y Cuidado para el Bebé')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (93, 10, N'Vitaminas y Suplementos Alimenticios')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (94, 10, N'Artículos para el Hogar')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (95, 10, N'Cuidado de la Salud')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (96, 10, N'Nutrición para los Deportes')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (97, 10, N'Bebé y Cuidado Infantil')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (98, 10, N'Suministros Médicos y Equipo')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (99, 10, N'Salud y Bienestar')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (100, 11, N'Juguetes y Juegos de Mesa')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (101, 11, N'Bebé')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (102, 11, N'Pañales y Accesorios')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (103, 11, N'Videojuegos Infantiles')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (104, 11, N'Para Niñas')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (105, 11, N'Para Niños')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (106, 11, N'Para Bebés')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (107, 11, N'Para adolescentes')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (108, 12, N'Handmade')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (109, 12, N'Regalos')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (110, 12, N'Joyería')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (111, 12, N'Hogar y cocina')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (112, 12, N'Boda')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (113, 12, N'Ropa y Zapatos')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (114, 12, N'Bolsos y Accesorios')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (115, 12, N'Belleza y Cuidado Personal')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (116, 12, N'Papelería y Suministros para Fiesta')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (117, 12, N'Juguetes y Juegos de Mesa')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (118, 12, N'Accesorios para mascotas')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (119, 12, N'Decoración del hogar')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (120, 12, N'Trabajo de Arte')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (121, 12, N'Cocina y Comedor ')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (122, 12, N'Muebles')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (123, 12, N'Bebé')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (124, 13, N'Ropa Deportiva')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (125, 13, N'Ejercicio y Gimnasia')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (126, 13, N'Caza')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (127, 13, N'Pesca')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (128, 13, N'Deportes de Equipo')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (129, 13, N'Golf')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (130, 13, N'Tienda del Fan')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (131, 13, N'Ciclismo')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (132, 13, N'Deportes de Recreación y Sala de Juegos')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (133, 13, N'Coleccionables Deportivos')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (134, 13, N'Todo Deportes y Fitness')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (135, 13, N'Innovaciones del nuevo equipo')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (136, 14, N'Ropa de Exteriores')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (137, 14, N'Campamento y Excursionismo')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (138, 14, N'Montañismo')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (139, 14, N'Ciclo')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (140, 14, N'Monopatines, Patinetas y Patines')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (141, 14, N'Deportes Acuáticos')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (142, 14, N'Deportes de Invierno')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (143, 14, N'Accesorios')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (144, 15, N'Partes y Accesorios Automotrices')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (145, 15, N'Equipo y Herramientas Automotrices')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (146, 15, N'Electrónicos para Autos y Vehículos y GPS')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (147, 15, N'Llantas y Ruedas')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (148, 15, N'Motocicletas y Deportes Motorizados')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (149, 15, N'Piezas y Accesorios para Casas Rodantes')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (150, 15, N'Suministros Industriales')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (151, 15, N'Laboratorio y Científico')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (152, 15, N'Limpieza')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (153, 15, N'Seguridad')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (154, 15, N'Servicio de Comida')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (155, 15, N'Manejo de Materiales')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (156, 16, N'Industrial y Científico')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (157, 16, N'Doctores y Personal Médico')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (158, 16, N'Profesores y Educadores')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (159, 16, N'Propietarios de Restaurantes y Chefs')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (160, 16, N'Minoristas y Pequeñas Empresas')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (161, 16, N'Mudanza, Empaquetado, Organización')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (162, 16, N'Administradores de Propiedades')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (163, 16, N'Dentistas e Higienistas')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (164, 16, N'Científicos y Técnicos de Laboratorio')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (165, 16, N'Profesionales de MRO')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (166, 16, N'Diseñadores e Ingenieros de Producto')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (167, 16, N'Automotriz y Mantenimiento de Flotas')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (168, 16, N'Construcción y Contratistas Generales')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (169, 16, N'Profesionales en Belleza')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (170, 16, N'Hotelería y Hospitalidad')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (171, 16, N'Fitness y Nutrición')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (172, 16, N'Profesionales en Paisajismo')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (173, 16, N'Granjeros y Agricultores')
GO
INSERT [Tienda].[Subcategoria] ([Subcategoria_id], [Categoria_id], [Subcategoria]) VALUES (174, 16, N'Esenciales de Sala de Descanso')
GO
SET IDENTITY_INSERT [Tienda].[Subcategoria] OFF
GO
SET IDENTITY_INSERT [Tienda].[Tipo_Perfil] ON 
GO
INSERT [Tienda].[Tipo_Perfil] ([Tipo_perfil_id], [Tipo_perfil]) VALUES (1, N'Cliente')
GO
INSERT [Tienda].[Tipo_Perfil] ([Tipo_perfil_id], [Tipo_perfil]) VALUES (2, N'Vendedor')
GO
SET IDENTITY_INSERT [Tienda].[Tipo_Perfil] OFF
GO
ALTER TABLE [Tienda].[Cuenta] ADD  DEFAULT (getdate()) FOR [Fecha_creacion]
GO
ALTER TABLE [Tienda].[Cupones] ADD  DEFAULT (getdate()) FOR [Fecha_creacion]
GO
ALTER TABLE [Tienda].[Perfil] ADD  DEFAULT (getdate()) FOR [Fecha_creacion]
GO
ALTER TABLE [Tienda].[Ciudad]  WITH CHECK ADD FOREIGN KEY([Pais_id])
REFERENCES [Tienda].[Pais] ([Pais_id])
GO
ALTER TABLE [Tienda].[Comentario]  WITH CHECK ADD FOREIGN KEY([Perfil_id])
REFERENCES [Tienda].[Perfil] ([Perfil_id])
GO
ALTER TABLE [Tienda].[Comentario]  WITH CHECK ADD FOREIGN KEY([Producto_id])
REFERENCES [Tienda].[Producto] ([Producto_id])
GO
ALTER TABLE [Tienda].[Comentario_Producto]  WITH CHECK ADD FOREIGN KEY([Comentario_id])
REFERENCES [Tienda].[Comentario] ([Comentario_id])
GO
ALTER TABLE [Tienda].[Comentario_Producto]  WITH CHECK ADD FOREIGN KEY([Producto_id])
REFERENCES [Tienda].[Producto] ([Producto_id])
GO
ALTER TABLE [Tienda].[Cuenta]  WITH CHECK ADD FOREIGN KEY([Direccion_id])
REFERENCES [Tienda].[Direccion] ([Direccion_id])
GO
ALTER TABLE [Tienda].[Cuenta]  WITH CHECK ADD FOREIGN KEY([MetodoP_id])
REFERENCES [Tienda].[Metodo_Pago] ([MetodoP_id])
GO
ALTER TABLE [Tienda].[Cuenta]  WITH CHECK ADD FOREIGN KEY([Perfil_id])
REFERENCES [Tienda].[Perfil] ([Perfil_id])
GO
ALTER TABLE [Tienda].[Cupones]  WITH CHECK ADD FOREIGN KEY([Producto_id])
REFERENCES [Tienda].[Producto] ([Producto_id])
GO
ALTER TABLE [Tienda].[Direccion]  WITH CHECK ADD FOREIGN KEY([Pais_id])
REFERENCES [Tienda].[Pais] ([Pais_id])
GO
ALTER TABLE [Tienda].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Ciudad] FOREIGN KEY([Ciudad_id])
REFERENCES [Tienda].[Ciudad] ([ID])
GO
ALTER TABLE [Tienda].[Direccion] CHECK CONSTRAINT [FK_Direccion_Ciudad]
GO
ALTER TABLE [Tienda].[Pedido]  WITH CHECK ADD FOREIGN KEY([Cuenta_id])
REFERENCES [Tienda].[Cuenta] ([Cuenta_id])
GO
ALTER TABLE [Tienda].[Pedido]  WITH CHECK ADD FOREIGN KEY([Direccion_id])
REFERENCES [Tienda].[Direccion] ([Direccion_id])
GO
ALTER TABLE [Tienda].[Pedido]  WITH CHECK ADD FOREIGN KEY([MetodoP_id])
REFERENCES [Tienda].[Metodo_Pago] ([MetodoP_id])
GO
ALTER TABLE [Tienda].[Pedido]  WITH CHECK ADD FOREIGN KEY([Producto_id])
REFERENCES [Tienda].[Producto] ([Producto_id])
GO
ALTER TABLE [Tienda].[Perfil]  WITH CHECK ADD FOREIGN KEY([Tipo_perfil_id])
REFERENCES [Tienda].[Tipo_Perfil] ([Tipo_perfil_id])
GO
ALTER TABLE [Tienda].[Producto]  WITH CHECK ADD FOREIGN KEY([Categoria_id])
REFERENCES [Tienda].[Categoria] ([Categoria_id])
GO
ALTER TABLE [Tienda].[Subcategoria]  WITH CHECK ADD FOREIGN KEY([Categoria_id])
REFERENCES [Tienda].[Categoria] ([Categoria_id])
GO
ALTER TABLE [Tienda].[Vendedor]  WITH CHECK ADD FOREIGN KEY([Perfil_id])
REFERENCES [Tienda].[Perfil] ([Perfil_id])
GO
ALTER TABLE [Tienda].[Vendedor]  WITH CHECK ADD FOREIGN KEY([Producto_id])
REFERENCES [Tienda].[Producto] ([Producto_id])
GO
USE [master]
GO
ALTER DATABASE [TiendaBD] SET  READ_WRITE 
GO
