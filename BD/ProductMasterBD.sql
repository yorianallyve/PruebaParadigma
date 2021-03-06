USE [master]
GO
/****** Object:  Database [ProductMaster]    Script Date: 10/2/2018 8:48:38 PM ******/
CREATE DATABASE [ProductMaster]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductMaster', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\ProductMaster.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProductMaster_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\ProductMaster_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProductMaster] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductMaster].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductMaster] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductMaster] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductMaster] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductMaster] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductMaster] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductMaster] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProductMaster] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductMaster] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductMaster] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductMaster] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductMaster] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductMaster] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductMaster] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductMaster] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductMaster] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProductMaster] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductMaster] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductMaster] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductMaster] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductMaster] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductMaster] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProductMaster] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductMaster] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductMaster] SET  MULTI_USER 
GO
ALTER DATABASE [ProductMaster] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductMaster] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductMaster] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductMaster] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProductMaster] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProductMaster] SET QUERY_STORE = OFF
GO
USE [ProductMaster]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ProductMaster]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 10/2/2018 8:48:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[IdCountry] [int] IDENTITY(1,1) NOT NULL,
	[NameCountry] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[IdCountry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/2/2018 8:48:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[IdProduct] [int] IDENTITY(1,1) NOT NULL,
	[NameProduct] [nvarchar](150) NOT NULL,
	[ReleaseDate] [date] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[IdCountry] [int] NOT NULL,
	[Cost] [nvarchar](50) NOT NULL,
	[UnitsAvailable] [nvarchar](50) NOT NULL,
	[SoldUnits] [nvarchar](50) NOT NULL,
	[StateProduct] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([IdCountry], [NameCountry]) VALUES (1, N'COLOMBIA')
INSERT [dbo].[Country] ([IdCountry], [NameCountry]) VALUES (2, N'CHINA')
INSERT [dbo].[Country] ([IdCountry], [NameCountry]) VALUES (3, N'JAPON')
INSERT [dbo].[Country] ([IdCountry], [NameCountry]) VALUES (4, N'RUSIA')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([IdProduct], [NameProduct], [ReleaseDate], [Email], [IdCountry], [Cost], [UnitsAvailable], [SoldUnits], [StateProduct]) VALUES (1, N'AIO C300zzzzz', CAST(N'2019-05-01' AS Date), N'del@hotmaiSl.com', 3, N'2000A0', N'56', N'31', 1)
INSERT [dbo].[Product] ([IdProduct], [NameProduct], [ReleaseDate], [Email], [IdCountry], [Cost], [UnitsAvailable], [SoldUnits], [StateProduct]) VALUES (2, N'IBM PCD', CAST(N'2018-03-02' AS Date), N'del@gmail.com', 1, N'500', N'3', N'2', 1)
INSERT [dbo].[Product] ([IdProduct], [NameProduct], [ReleaseDate], [Email], [IdCountry], [Cost], [UnitsAvailable], [SoldUnits], [StateProduct]) VALUES (3, N'IBM PCD', CAST(N'2018-03-02' AS Date), N'del@gmail.com', 1, N'455', N'3', N'2', 0)
INSERT [dbo].[Product] ([IdProduct], [NameProduct], [ReleaseDate], [Email], [IdCountry], [Cost], [UnitsAvailable], [SoldUnits], [StateProduct]) VALUES (4, N'Portátil HP Probook', CAST(N'2018-10-10' AS Date), N'adadad', 2, N'100000', N'44', N'24244', 1)
INSERT [dbo].[Product] ([IdProduct], [NameProduct], [ReleaseDate], [Email], [IdCountry], [Cost], [UnitsAvailable], [SoldUnits], [StateProduct]) VALUES (6, N'Portátil 1', CAST(N'2018-10-11' AS Date), N'twwrw', 2, N'50000', N'19', N'12', 1)
INSERT [dbo].[Product] ([IdProduct], [NameProduct], [ReleaseDate], [Email], [IdCountry], [Cost], [UnitsAvailable], [SoldUnits], [StateProduct]) VALUES (7, N'Portátil 3', CAST(N'2018-10-10' AS Date), N'adadad', 2, N'70000', N'78', N'11', 1)
INSERT [dbo].[Product] ([IdProduct], [NameProduct], [ReleaseDate], [Email], [IdCountry], [Cost], [UnitsAvailable], [SoldUnits], [StateProduct]) VALUES (8, N'IBM 9', CAST(N'2018-10-10' AS Date), N'adadad', 3, N'900000', N'90', N'11', 1)
INSERT [dbo].[Product] ([IdProduct], [NameProduct], [ReleaseDate], [Email], [IdCountry], [Cost], [UnitsAvailable], [SoldUnits], [StateProduct]) VALUES (9, N'Portátil 4', CAST(N'2018-10-10' AS Date), N'adadad', 2, N'1000', N'76', N'24244', 1)
INSERT [dbo].[Product] ([IdProduct], [NameProduct], [ReleaseDate], [Email], [IdCountry], [Cost], [UnitsAvailable], [SoldUnits], [StateProduct]) VALUES (10, N'Portátil 4', CAST(N'2018-10-10' AS Date), N'adadad', 2, N'15552', N'16', N'144', 1)
INSERT [dbo].[Product] ([IdProduct], [NameProduct], [ReleaseDate], [Email], [IdCountry], [Cost], [UnitsAvailable], [SoldUnits], [StateProduct]) VALUES (11, N'Portátil 4', CAST(N'2018-10-10' AS Date), N'adadad', 2, N'15555', N'5353', N'24244', 1)
INSERT [dbo].[Product] ([IdProduct], [NameProduct], [ReleaseDate], [Email], [IdCountry], [Cost], [UnitsAvailable], [SoldUnits], [StateProduct]) VALUES (12, N'IBM 7', CAST(N'2018-10-10' AS Date), N'adadad', 3, N'122222', N'5353', N'24244', 1)
INSERT [dbo].[Product] ([IdProduct], [NameProduct], [ReleaseDate], [Email], [IdCountry], [Cost], [UnitsAvailable], [SoldUnits], [StateProduct]) VALUES (13, N'Portátil 4', CAST(N'2018-10-10' AS Date), N'adadad', 2, N'11234444', N'1222', N'24244', 1)
INSERT [dbo].[Product] ([IdProduct], [NameProduct], [ReleaseDate], [Email], [IdCountry], [Cost], [UnitsAvailable], [SoldUnits], [StateProduct]) VALUES (14, N'Portátil 4', CAST(N'2018-10-10' AS Date), N'adadad', 4, N'11333', N'5433', N'21', 1)
INSERT [dbo].[Product] ([IdProduct], [NameProduct], [ReleaseDate], [Email], [IdCountry], [Cost], [UnitsAvailable], [SoldUnits], [StateProduct]) VALUES (15, N'Portátil 4', CAST(N'2018-10-10' AS Date), N'adadad', 2, N'1123333', N'15', N'67', 1)
INSERT [dbo].[Product] ([IdProduct], [NameProduct], [ReleaseDate], [Email], [IdCountry], [Cost], [UnitsAvailable], [SoldUnits], [StateProduct]) VALUES (16, N'Portátil 4', CAST(N'2018-10-10' AS Date), N'adadad', 3, N'1333', N'5353', N'11', 1)
INSERT [dbo].[Product] ([IdProduct], [NameProduct], [ReleaseDate], [Email], [IdCountry], [Cost], [UnitsAvailable], [SoldUnits], [StateProduct]) VALUES (17, N'IBM 5', CAST(N'2018-10-10' AS Date), N'adadad', 2, N'661131666', N'15', N'113', 0)
INSERT [dbo].[Product] ([IdProduct], [NameProduct], [ReleaseDate], [Email], [IdCountry], [Cost], [UnitsAvailable], [SoldUnits], [StateProduct]) VALUES (18, N'Lenovo', CAST(N'2018-10-10' AS Date), N'adadad', 1, N'66133666', N'5353', N'156', 0)
INSERT [dbo].[Product] ([IdProduct], [NameProduct], [ReleaseDate], [Email], [IdCountry], [Cost], [UnitsAvailable], [SoldUnits], [StateProduct]) VALUES (19, N'Cualquiera', CAST(N'2018-10-09' AS Date), N'nr_@hotmail.com', 2, N'600', N'670', N'56', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_StateProduct]  DEFAULT ((1)) FOR [StateProduct]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Country] FOREIGN KEY([IdCountry])
REFERENCES [dbo].[Country] ([IdCountry])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Country]
GO
USE [master]
GO
ALTER DATABASE [ProductMaster] SET  READ_WRITE 
GO
