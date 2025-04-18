USE [master]
GO
/****** Object:  Database [Master_Pol]    Script Date: 13.12.2024 14:39:09 ******/
CREATE DATABASE [Master_Pol]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Master_Pol', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLSERVER04\MSSQL\DATA\Master_Pol.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Master_Pol_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLSERVER04\MSSQL\DATA\Master_Pol_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Master_Pol] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Master_Pol].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Master_Pol] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Master_Pol] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Master_Pol] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Master_Pol] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Master_Pol] SET ARITHABORT OFF 
GO
ALTER DATABASE [Master_Pol] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Master_Pol] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Master_Pol] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Master_Pol] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Master_Pol] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Master_Pol] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Master_Pol] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Master_Pol] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Master_Pol] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Master_Pol] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Master_Pol] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Master_Pol] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Master_Pol] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Master_Pol] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Master_Pol] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Master_Pol] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Master_Pol] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Master_Pol] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Master_Pol] SET  MULTI_USER 
GO
ALTER DATABASE [Master_Pol] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Master_Pol] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Master_Pol] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Master_Pol] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Master_Pol]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 13.12.2024 14:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[DefectPercent] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerProducts]    Script Date: 13.12.2024 14:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProduct] [int] NOT NULL,
	[IdPartner] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_PartnerProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 13.12.2024 14:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPartnersType] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Director] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](16) NOT NULL,
	[Address] [nvarchar](70) NOT NULL,
	[INN] [nvarchar](10) NOT NULL,
	[Rating] [int] NOT NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnersType]    Script Date: 13.12.2024 14:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnersType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_PartnersType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 13.12.2024 14:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProductType] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Article] [int] NOT NULL,
	[MinCost] [float] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 13.12.2024 14:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](40) NOT NULL,
	[Coefficient] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([Id], [Type], [DefectPercent]) VALUES (1, N'Тип материала 1', 0.001)
INSERT [dbo].[MaterialType] ([Id], [Type], [DefectPercent]) VALUES (2, N'Тип материала 2', 0.0095)
INSERT [dbo].[MaterialType] ([Id], [Type], [DefectPercent]) VALUES (3, N'Тип материала 3', 0.0028)
INSERT [dbo].[MaterialType] ([Id], [Type], [DefectPercent]) VALUES (4, N'Тип материала 4', 0.0055)
INSERT [dbo].[MaterialType] ([Id], [Type], [DefectPercent]) VALUES (5, N'Тип материала 5', 0.0034)
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerProducts] ON 

INSERT [dbo].[PartnerProducts] ([Id], [IdProduct], [IdPartner], [Quantity], [Date]) VALUES (1, 1, 1, 15500, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [IdProduct], [IdPartner], [Quantity], [Date]) VALUES (2, 3, 1, 12350, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [IdProduct], [IdPartner], [Quantity], [Date]) VALUES (3, 4, 1, 37400, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [IdProduct], [IdPartner], [Quantity], [Date]) VALUES (4, 2, 2, 35000, CAST(N'2022-12-02' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [IdProduct], [IdPartner], [Quantity], [Date]) VALUES (5, 5, 2, 1250, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [IdProduct], [IdPartner], [Quantity], [Date]) VALUES (6, 3, 2, 1000, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [IdProduct], [IdPartner], [Quantity], [Date]) VALUES (7, 1, 2, 7550, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [IdProduct], [IdPartner], [Quantity], [Date]) VALUES (8, 1, 3, 7250, CAST(N'2023-01-22' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [IdProduct], [IdPartner], [Quantity], [Date]) VALUES (9, 2, 3, 2500, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [IdProduct], [IdPartner], [Quantity], [Date]) VALUES (10, 4, 4, 59050, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [IdProduct], [IdPartner], [Quantity], [Date]) VALUES (11, 3, 4, 37200, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [IdProduct], [IdPartner], [Quantity], [Date]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [IdProduct], [IdPartner], [Quantity], [Date]) VALUES (13, 3, 5, 50000, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [IdProduct], [IdPartner], [Quantity], [Date]) VALUES (14, 4, 5, 670000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [IdProduct], [IdPartner], [Quantity], [Date]) VALUES (15, 1, 5, 35000, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [IdProduct], [IdPartner], [Quantity], [Date]) VALUES (16, 2, 5, 25000, CAST(N'2024-06-12' AS Date))
SET IDENTITY_INSERT [dbo].[PartnerProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([Id], [IdPartnersType], [Name], [Director], [Email], [PhoneNumber], [Address], [INN], [Rating]) VALUES (1, 1, N'База Строитель', N'Иванова Александра Ивановна', N'aleksandraivanova@ml.ru', N'+74931234567', N'652050, Кемеровская область, город Юрга, ул. Лесная, 15', N'2222455179', 7)
INSERT [dbo].[Partners] ([Id], [IdPartnersType], [Name], [Director], [Email], [PhoneNumber], [Address], [INN], [Rating]) VALUES (2, 2, N'Паркет 29', N'Петров Василий Петрович', N'vppetrov@vl.ru', N'+79871235678', N'164500, Архангельская область, город Северодвинск, ул. Строителей, 18', N'3333888520', 7)
INSERT [dbo].[Partners] ([Id], [IdPartnersType], [Name], [Director], [Email], [PhoneNumber], [Address], [INN], [Rating]) VALUES (3, 3, N'Стройсервис', N'Соловьев Андрей Николаевич', N'ansolovev@st.ru', N'+78122233200', N'188910, Ленинградская область, город Приморск, ул. Парковая, 21', N'4440391035', 7)
INSERT [dbo].[Partners] ([Id], [IdPartnersType], [Name], [Director], [Email], [PhoneNumber], [Address], [INN], [Rating]) VALUES (4, 4, N'Ремонт и отделка', N'Воробьева Екатерина Валерьевна', N'ekaterina.vorobeva@ml.ru', N'+74442223311', N'143960, Московская область, город Реутов, ул. Свободы, 51', N'1111520857', 5)
INSERT [dbo].[Partners] ([Id], [IdPartnersType], [Name], [Director], [Email], [PhoneNumber], [Address], [INN], [Rating]) VALUES (5, 1, N'МонтажПро', N'Степанов Степан Сергеевич', N'stepanov@stepan.ru', N'+79128883333', N'309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122', N'5552431140', 10)
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnersType] ON 

INSERT [dbo].[PartnersType] ([Id], [Type]) VALUES (1, N'ЗАО')
INSERT [dbo].[PartnersType] ([Id], [Type]) VALUES (2, N'ООО')
INSERT [dbo].[PartnersType] ([Id], [Type]) VALUES (3, N'ПАО')
INSERT [dbo].[PartnersType] ([Id], [Type]) VALUES (4, N'ОАО')
SET IDENTITY_INSERT [dbo].[PartnersType] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [IdProductType], [Name], [Article], [MinCost]) VALUES (1, 3, N'Паркетная доска Ясень темный однополосная 14 мм', 8758385, 4456.9)
INSERT [dbo].[Products] ([Id], [IdProductType], [Name], [Article], [MinCost]) VALUES (2, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', 8858958, 7330.99)
INSERT [dbo].[Products] ([Id], [IdProductType], [Name], [Article], [MinCost]) VALUES (3, 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', 7750282, 1799.33)
INSERT [dbo].[Products] ([Id], [IdProductType], [Name], [Article], [MinCost]) VALUES (4, 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', 7028748, 3890.41)
INSERT [dbo].[Products] ([Id], [IdProductType], [Name], [Article], [MinCost]) VALUES (5, 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', 5012543, 5450.59)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([Id], [Type], [Coefficient]) VALUES (1, N'Ламинат', 2.35)
INSERT [dbo].[ProductType] ([Id], [Type], [Coefficient]) VALUES (2, N'Массивная доска', 5.15)
INSERT [dbo].[ProductType] ([Id], [Type], [Coefficient]) VALUES (3, N'Паркетная доска', 4.34)
INSERT [dbo].[ProductType] ([Id], [Type], [Coefficient]) VALUES (4, N'Пробковое покрытие', 1.5)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
ALTER TABLE [dbo].[PartnerProducts]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProducts_Partners] FOREIGN KEY([IdPartner])
REFERENCES [dbo].[Partners] ([Id])
GO
ALTER TABLE [dbo].[PartnerProducts] CHECK CONSTRAINT [FK_PartnerProducts_Partners]
GO
ALTER TABLE [dbo].[PartnerProducts]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProducts_Products] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[PartnerProducts] CHECK CONSTRAINT [FK_PartnerProducts_Products]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_PartnersType] FOREIGN KEY([IdPartnersType])
REFERENCES [dbo].[PartnersType] ([Id])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_PartnersType]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductType] FOREIGN KEY([IdProductType])
REFERENCES [dbo].[ProductType] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductType]
GO
USE [master]
GO
ALTER DATABASE [Master_Pol] SET  READ_WRITE 
GO
