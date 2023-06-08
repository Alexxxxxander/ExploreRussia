USE [master]
GO
/****** Object:  Database [ExploreRussiaDB]    Script Date: 09.06.2023 0:01:17 ******/
CREATE DATABASE [ExploreRussiaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExploreRussiaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ExploreRussiaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExploreRussiaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ExploreRussiaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ExploreRussiaDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExploreRussiaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExploreRussiaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExploreRussiaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExploreRussiaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExploreRussiaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExploreRussiaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ExploreRussiaDB] SET  MULTI_USER 
GO
ALTER DATABASE [ExploreRussiaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExploreRussiaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExploreRussiaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExploreRussiaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExploreRussiaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExploreRussiaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ExploreRussiaDB', N'ON'
GO
ALTER DATABASE [ExploreRussiaDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ExploreRussiaDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [User]    Script Date: 09.06.2023 0:01:17 ******/
CREATE LOGIN [User] WITH PASSWORD=N'qoyD68a5cECIXMesfIVlB3vhSjaucSHPglYTSZSRmpU=', DEFAULT_DATABASE=[ExploreRussiaDB], DEFAULT_LANGUAGE=[русский], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [User] DISABLE
GO
/****** Object:  Login [TUMBA\Alex]    Script Date: 09.06.2023 0:01:17 ******/
CREATE LOGIN [TUMBA\Alex] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 09.06.2023 0:01:17 ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 09.06.2023 0:01:17 ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 09.06.2023 0:01:17 ******/
CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 09.06.2023 0:01:17 ******/
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 09.06.2023 0:01:17 ******/
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT AUTHORITY\СИСТЕМА]    Script Date: 09.06.2023 0:01:17 ******/
CREATE LOGIN [NT AUTHORITY\СИСТЕМА] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 09.06.2023 0:01:17 ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'WTunP1gPdX1tPzCZfFIniRo5ZLVDN9IMgc3JRjOqJJw=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 09.06.2023 0:01:17 ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'MHm0P80GD2YcvX9vwuJDGPJN7/nyD2aFstAgvqqKt+Q=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [User]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [TUMBA\Alex]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLSERVERAGENT]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQLSERVER]
GO
USE [ExploreRussiaDB]
GO
/****** Object:  User [User]    Script Date: 09.06.2023 0:01:18 ******/
CREATE USER [User] FOR LOGIN [User] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ExploreRussiaUser]    Script Date: 09.06.2023 0:01:18 ******/
CREATE USER [ExploreRussiaUser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ExploreRussia]    Script Date: 09.06.2023 0:01:18 ******/
CREATE USER [ExploreRussia] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [User]
GO
ALTER ROLE [db_owner] ADD MEMBER [ExploreRussiaUser]
GO
ALTER ROLE [db_owner] ADD MEMBER [ExploreRussia]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 09.06.2023 0:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[Id] [int] NOT NULL,
	[TourId] [int] NOT NULL,
	[FName] [nvarchar](50) NOT NULL,
	[SName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](13) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationClientsAdd]    Script Date: 09.06.2023 0:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationClientsAdd](
	[Id] [int] NOT NULL,
	[ApplicationId] [int] NOT NULL,
	[FName] [nvarchar](50) NOT NULL,
	[SName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ApplicationClientsAdd] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Difficulty]    Script Date: 09.06.2023 0:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Difficulty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Difficulty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guide]    Script Date: 09.06.2023 0:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guide](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](50) NOT NULL,
	[SName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[Bithday] [date] NOT NULL,
	[Phone] [nvarchar](13) NOT NULL,
	[Expirience] [int] NOT NULL,
 CONSTRAINT [PK_Guide] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuidesTours]    Script Date: 09.06.2023 0:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuidesTours](
	[GuideId] [int] NOT NULL,
	[TourId] [int] NOT NULL,
 CONSTRAINT [PK_GuidesTours] PRIMARY KEY CLUSTERED 
(
	[GuideId] ASC,
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 09.06.2023 0:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 09.06.2023 0:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DateStart] [date] NOT NULL,
	[DateEnd] [date] NOT NULL,
	[Cost] [money] NOT NULL,
	[Rate] [real] NOT NULL,
	[ImageMain] [nvarchar](500) NULL,
	[Route] [nvarchar](max) NOT NULL,
	[PeopleMin] [int] NOT NULL,
	[PeopleMax] [int] NOT NULL,
	[Lenght] [int] NOT NULL,
	[DifficultyId] [int] NOT NULL,
	[AgeMin] [int] NOT NULL,
	[Actual] [bit] NOT NULL,
	[RegionId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourResponse]    Script Date: 09.06.2023 0:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourResponse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TourId] [int] NOT NULL,
	[Response] [nvarchar](max) NULL,
	[Rate] [real] NOT NULL,
 CONSTRAINT [PK_TourResponse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypesTours]    Script Date: 09.06.2023 0:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypesTours](
	[TourId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_TypesTours] PRIMARY KEY CLUSTERED 
(
	[TourId] ASC,
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeTour]    Script Date: 09.06.2023 0:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeTour](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeTour] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09.06.2023 0:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Paswword] [nvarchar](50) NOT NULL,
	[FName] [nvarchar](50) NULL,
	[LName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Difficulty] ON 

INSERT [dbo].[Difficulty] ([Id], [Name]) VALUES (1, N'Легко')
INSERT [dbo].[Difficulty] ([Id], [Name]) VALUES (2, N'Минимальная подготовка')
INSERT [dbo].[Difficulty] ([Id], [Name]) VALUES (3, N'С опытом')
INSERT [dbo].[Difficulty] ([Id], [Name]) VALUES (4, N'Экстрим')
SET IDENTITY_INSERT [dbo].[Difficulty] OFF
GO
SET IDENTITY_INSERT [dbo].[Guide] ON 

INSERT [dbo].[Guide] ([Id], [FName], [SName], [Patronymic], [Bithday], [Phone], [Expirience]) VALUES (1, N'Емельян', N'Тимофеев', N'Фролович', CAST(N'1987-12-24' AS Date), N'964493309878', 1)
INSERT [dbo].[Guide] ([Id], [FName], [SName], [Patronymic], [Bithday], [Phone], [Expirience]) VALUES (2, N'Иван', N'Бирюков', N'Никитевич', CAST(N'1994-10-01' AS Date), N'118785373012', 2)
INSERT [dbo].[Guide] ([Id], [FName], [SName], [Patronymic], [Bithday], [Phone], [Expirience]) VALUES (3, N'Григорий', N'Суворов', N'Павлович', CAST(N'1989-01-12' AS Date), N'9134831671559', 3)
INSERT [dbo].[Guide] ([Id], [FName], [SName], [Patronymic], [Bithday], [Phone], [Expirience]) VALUES (4, N'Алексей', N'Жданов', N'Богданович', CAST(N'1997-04-28' AS Date), N'6988232972', 1)
SET IDENTITY_INSERT [dbo].[Guide] OFF
GO
SET IDENTITY_INSERT [dbo].[Regions] ON 

INSERT [dbo].[Regions] ([Id], [Name]) VALUES (1, N'Алтай')
INSERT [dbo].[Regions] ([Id], [Name]) VALUES (2, N'Байкал')
INSERT [dbo].[Regions] ([Id], [Name]) VALUES (3, N'Дагестан')
SET IDENTITY_INSERT [dbo].[Regions] OFF
GO
SET IDENTITY_INSERT [dbo].[Tour] ON 

INSERT [dbo].[Tour] ([Id], [Title], [DateStart], [DateEnd], [Cost], [Rate], [ImageMain], [Route], [PeopleMin], [PeopleMax], [Lenght], [DifficultyId], [AgeMin], [Actual], [RegionId], [Description]) VALUES (1, N'Тропы Алтая', CAST(N'2023-09-03' AS Date), CAST(N'2023-09-07' AS Date), 24000.0000, 4.7, N'image.jpeg', N'База - База', 4, 16, 80, 2, 18, 1, 1, NULL)
INSERT [dbo].[Tour] ([Id], [Title], [DateStart], [DateEnd], [Cost], [Rate], [ImageMain], [Route], [PeopleMin], [PeopleMax], [Lenght], [DifficultyId], [AgeMin], [Actual], [RegionId], [Description]) VALUES (2, N'Вокруг Байкала', CAST(N'2023-08-23' AS Date), CAST(N'2023-08-25' AS Date), 18400.0000, 4.9, N'image.jpeg', N'Озеро - Озеро', 4, 20, 20, 1, 9, 1, 2, NULL)
SET IDENTITY_INSERT [dbo].[Tour] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeTour] ON 

INSERT [dbo].[TypeTour] ([Id], [Name]) VALUES (1, N'Поход выходного дня')
INSERT [dbo].[TypeTour] ([Id], [Name]) VALUES (2, N'Вело поход')
INSERT [dbo].[TypeTour] ([Id], [Name]) VALUES (3, N'Пеший поход')
INSERT [dbo].[TypeTour] ([Id], [Name]) VALUES (4, N'Поход на рафтах')
SET IDENTITY_INSERT [dbo].[TypeTour] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Login], [Paswword], [FName], [LName]) VALUES (1, N'admin', N'admin', N'Иван', N'Иванович')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([Id])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_Tour]
GO
ALTER TABLE [dbo].[ApplicationClientsAdd]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationClientsAdd_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Application] ([Id])
GO
ALTER TABLE [dbo].[ApplicationClientsAdd] CHECK CONSTRAINT [FK_ApplicationClientsAdd_Application]
GO
ALTER TABLE [dbo].[GuidesTours]  WITH CHECK ADD  CONSTRAINT [FK_GuidesTours_Guide] FOREIGN KEY([GuideId])
REFERENCES [dbo].[Guide] ([Id])
GO
ALTER TABLE [dbo].[GuidesTours] CHECK CONSTRAINT [FK_GuidesTours_Guide]
GO
ALTER TABLE [dbo].[GuidesTours]  WITH CHECK ADD  CONSTRAINT [FK_GuidesTours_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([Id])
GO
ALTER TABLE [dbo].[GuidesTours] CHECK CONSTRAINT [FK_GuidesTours_Tour]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_Difficulty] FOREIGN KEY([DifficultyId])
REFERENCES [dbo].[Difficulty] ([Id])
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_Difficulty]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_Regions] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Regions] ([Id])
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_Regions]
GO
ALTER TABLE [dbo].[TourResponse]  WITH CHECK ADD  CONSTRAINT [FK_TourResponse_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([Id])
GO
ALTER TABLE [dbo].[TourResponse] CHECK CONSTRAINT [FK_TourResponse_Tour]
GO
ALTER TABLE [dbo].[TypesTours]  WITH CHECK ADD  CONSTRAINT [FK_TypesTours_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([Id])
GO
ALTER TABLE [dbo].[TypesTours] CHECK CONSTRAINT [FK_TypesTours_Tour]
GO
ALTER TABLE [dbo].[TypesTours]  WITH CHECK ADD  CONSTRAINT [FK_TypesTours_TypeTour] FOREIGN KEY([TypeId])
REFERENCES [dbo].[TypeTour] ([Id])
GO
ALTER TABLE [dbo].[TypesTours] CHECK CONSTRAINT [FK_TypesTours_TypeTour]
GO
USE [master]
GO
ALTER DATABASE [ExploreRussiaDB] SET  READ_WRITE 
GO
