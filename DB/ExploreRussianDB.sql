USE [master]
GO
/****** Object:  Database [ExploreRussiaDB]    Script Date: 16.06.2023 0:18:43 ******/
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
USE [ExploreRussiaDB]
GO
/****** Object:  User [User]    Script Date: 16.06.2023 0:18:43 ******/
CREATE USER [User] FOR LOGIN [User] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ExploreRussiaUser]    Script Date: 16.06.2023 0:18:43 ******/
CREATE USER [ExploreRussiaUser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ExploreRussia]    Script Date: 16.06.2023 0:18:43 ******/
CREATE USER [ExploreRussia] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [User]
GO
ALTER ROLE [db_owner] ADD MEMBER [ExploreRussiaUser]
GO
ALTER ROLE [db_owner] ADD MEMBER [ExploreRussia]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 16.06.2023 0:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TourId] [int] NOT NULL,
	[FName] [nvarchar](50) NOT NULL,
	[SName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](13) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationClientsAdd]    Script Date: 16.06.2023 0:18:43 ******/
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
/****** Object:  Table [dbo].[Difficulty]    Script Date: 16.06.2023 0:18:43 ******/
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
/****** Object:  Table [dbo].[Guide]    Script Date: 16.06.2023 0:18:43 ******/
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
/****** Object:  Table [dbo].[GuidesTours]    Script Date: 16.06.2023 0:18:43 ******/
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
/****** Object:  Table [dbo].[LogAutho]    Script Date: 16.06.2023 0:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogAutho](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogAutho] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 16.06.2023 0:18:43 ******/
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
/****** Object:  Table [dbo].[Tour]    Script Date: 16.06.2023 0:18:43 ******/
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
/****** Object:  Table [dbo].[TourResponse]    Script Date: 16.06.2023 0:18:43 ******/
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
/****** Object:  Table [dbo].[TypesTours]    Script Date: 16.06.2023 0:18:43 ******/
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
/****** Object:  Table [dbo].[TypeTour]    Script Date: 16.06.2023 0:18:43 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 16.06.2023 0:18:43 ******/
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
SET IDENTITY_INSERT [dbo].[Application] ON 

INSERT [dbo].[Application] ([Id], [TourId], [FName], [SName], [Patronymic], [Phone], [Email], [DateCreated]) VALUES (1, 1, N'Иванов', N'Иван', N'Иванович', N'89384175713', N'ivaniow@mail.com', CAST(N'2023-06-13T17:58:00.000' AS DateTime))
INSERT [dbo].[Application] ([Id], [TourId], [FName], [SName], [Patronymic], [Phone], [Email], [DateCreated]) VALUES (2, 2, N'Александрова', N'Александра', N'Александровна', N'86476574721', N'alex.alexa@mail.com', CAST(N'2023-06-13T18:30:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Application] OFF
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
SET IDENTITY_INSERT [dbo].[LogAutho] ON 

INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (1, 1, CAST(N'2023-06-13T00:49:52.177' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (2, 1, CAST(N'2023-06-13T00:51:32.943' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (3, 1, CAST(N'2023-06-13T00:52:52.560' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (4, 1, CAST(N'2023-06-13T00:53:54.913' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (5, 1, CAST(N'2023-06-13T17:48:47.993' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (6, 1, CAST(N'2023-06-13T17:56:48.893' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (7, 1, CAST(N'2023-06-13T17:59:02.950' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (8, 1, CAST(N'2023-06-13T18:01:18.470' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (9, 1, CAST(N'2023-06-13T18:02:06.267' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (10, 1, CAST(N'2023-06-13T18:04:13.353' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (11, 1, CAST(N'2023-06-13T18:04:36.520' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (12, 1, CAST(N'2023-06-13T18:20:56.350' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (13, 1, CAST(N'2023-06-13T18:22:18.307' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (14, 1, CAST(N'2023-06-13T18:23:00.643' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (15, 1, CAST(N'2023-06-13T18:26:36.527' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (16, 1, CAST(N'2023-06-13T18:31:13.703' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (17, 1, CAST(N'2023-06-13T18:33:20.497' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (18, 1, CAST(N'2023-06-13T18:36:07.780' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (19, 1, CAST(N'2023-06-13T18:52:11.100' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (20, 1, CAST(N'2023-06-13T18:58:40.083' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (21, 1, CAST(N'2023-06-13T19:06:09.933' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (22, 1, CAST(N'2023-06-13T19:11:53.930' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (23, 1, CAST(N'2023-06-13T19:12:26.953' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (24, 1, CAST(N'2023-06-13T19:13:32.613' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (25, 1, CAST(N'2023-06-13T19:17:31.280' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (26, 1, CAST(N'2023-06-13T19:55:40.163' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (27, 1, CAST(N'2023-06-13T19:56:39.550' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (28, 1, CAST(N'2023-06-13T19:58:09.653' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (29, 1, CAST(N'2023-06-13T20:02:52.300' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (30, 1, CAST(N'2023-06-14T19:41:40.630' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (31, 1, CAST(N'2023-06-14T22:18:45.627' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (32, 1, CAST(N'2023-06-14T22:22:23.230' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (33, 1, CAST(N'2023-06-14T22:24:32.900' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (34, 1, CAST(N'2023-06-14T22:25:03.560' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (35, 1, CAST(N'2023-06-14T22:28:28.547' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (36, 1, CAST(N'2023-06-14T22:29:11.190' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (37, 1, CAST(N'2023-06-14T22:29:59.407' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (38, 1, CAST(N'2023-06-14T22:30:22.837' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (39, 1, CAST(N'2023-06-14T22:34:53.507' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (40, 1, CAST(N'2023-06-14T22:36:22.500' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (41, 1, CAST(N'2023-06-14T22:40:09.747' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (42, 1, CAST(N'2023-06-14T22:40:53.260' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (43, 1, CAST(N'2023-06-14T22:44:27.797' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (44, 1, CAST(N'2023-06-14T22:46:41.013' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (45, 1, CAST(N'2023-06-14T22:48:28.603' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (46, 1, CAST(N'2023-06-14T22:50:47.860' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (47, 1, CAST(N'2023-06-14T22:52:00.407' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (48, 1, CAST(N'2023-06-14T22:56:00.417' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (49, 1, CAST(N'2023-06-14T22:57:03.827' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (50, 1, CAST(N'2023-06-14T23:02:32.960' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (51, 1, CAST(N'2023-06-14T23:06:29.190' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (52, 1, CAST(N'2023-06-14T23:22:45.383' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (53, 1, CAST(N'2023-06-14T23:32:17.147' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (54, 1, CAST(N'2023-06-14T23:44:59.717' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (55, 1, CAST(N'2023-06-14T23:50:02.063' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (56, 1, CAST(N'2023-06-15T00:12:25.787' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (57, 1, CAST(N'2023-06-15T00:13:41.290' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (58, 1, CAST(N'2023-06-15T00:45:58.590' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (59, 1, CAST(N'2023-06-15T00:51:05.847' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (60, 1, CAST(N'2023-06-15T00:52:43.303' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (61, 1, CAST(N'2023-06-15T00:57:01.073' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (62, 1, CAST(N'2023-06-15T00:57:42.713' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (63, 1, CAST(N'2023-06-15T00:59:48.793' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (64, 1, CAST(N'2023-06-15T20:39:22.473' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (65, 1, CAST(N'2023-06-15T20:44:28.030' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (66, 1, CAST(N'2023-06-15T20:45:04.833' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (67, 1, CAST(N'2023-06-15T20:46:47.910' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (68, 1, CAST(N'2023-06-15T20:47:53.473' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (69, 1, CAST(N'2023-06-15T20:49:12.683' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (70, 1, CAST(N'2023-06-15T20:50:15.267' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (71, 1, CAST(N'2023-06-15T20:52:07.523' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (72, 1, CAST(N'2023-06-15T20:53:33.650' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (73, 1, CAST(N'2023-06-15T20:54:15.497' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (74, 1, CAST(N'2023-06-15T21:07:09.263' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (75, 1, CAST(N'2023-06-15T21:07:26.473' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (76, 1, CAST(N'2023-06-15T21:08:25.430' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (77, 1, CAST(N'2023-06-15T21:09:33.023' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (78, 1, CAST(N'2023-06-15T21:10:28.457' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (79, 1, CAST(N'2023-06-15T21:20:07.547' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (80, 1, CAST(N'2023-06-15T21:20:53.393' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (81, 1, CAST(N'2023-06-15T21:22:08.053' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (82, 1, CAST(N'2023-06-15T21:23:13.110' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (83, 1, CAST(N'2023-06-15T21:26:06.373' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (84, 1, CAST(N'2023-06-15T21:26:54.547' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (85, 1, CAST(N'2023-06-15T21:27:42.957' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (86, 1, CAST(N'2023-06-15T21:31:48.793' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (87, 1, CAST(N'2023-06-15T21:33:30.223' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (88, 1, CAST(N'2023-06-15T21:34:49.563' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (89, 1, CAST(N'2023-06-15T21:35:31.070' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (90, 1, CAST(N'2023-06-15T21:38:00.703' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (91, 1, CAST(N'2023-06-15T21:45:24.047' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (92, 1, CAST(N'2023-06-15T21:46:52.983' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (93, 1, CAST(N'2023-06-15T21:49:01.180' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (94, 1, CAST(N'2023-06-15T21:49:58.977' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (95, 1, CAST(N'2023-06-15T21:53:33.553' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (96, 1, CAST(N'2023-06-15T22:03:36.757' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (97, 1, CAST(N'2023-06-15T23:55:18.053' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (98, 1, CAST(N'2023-06-15T23:56:29.103' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (99, 1, CAST(N'2023-06-15T23:56:55.643' AS DateTime))
GO
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (100, 1, CAST(N'2023-06-15T23:57:06.150' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (101, 1, CAST(N'2023-06-15T23:58:20.880' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (102, 1, CAST(N'2023-06-15T23:58:29.240' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (103, 1, CAST(N'2023-06-16T00:08:57.140' AS DateTime))
INSERT [dbo].[LogAutho] ([Id], [UserId], [Time]) VALUES (104, 2, CAST(N'2023-06-16T00:12:16.263' AS DateTime))
SET IDENTITY_INSERT [dbo].[LogAutho] OFF
GO
SET IDENTITY_INSERT [dbo].[Regions] ON 

INSERT [dbo].[Regions] ([Id], [Name]) VALUES (1, N'Алтай')
INSERT [dbo].[Regions] ([Id], [Name]) VALUES (2, N'Байкал')
INSERT [dbo].[Regions] ([Id], [Name]) VALUES (3, N'Дагестан')
SET IDENTITY_INSERT [dbo].[Regions] OFF
GO
SET IDENTITY_INSERT [dbo].[Tour] ON 

INSERT [dbo].[Tour] ([Id], [Title], [DateStart], [DateEnd], [Cost], [Rate], [ImageMain], [Route], [PeopleMin], [PeopleMax], [Lenght], [DifficultyId], [AgeMin], [Actual], [RegionId], [Description]) VALUES (1, N'Тропы Алтая', CAST(N'2023-09-03' AS Date), CAST(N'2023-09-07' AS Date), 24000.0000, 4.7, N'image.jpeg', N'База - База', 4, 16, 80, 2, 18, 1, 1, NULL)
INSERT [dbo].[Tour] ([Id], [Title], [DateStart], [DateEnd], [Cost], [Rate], [ImageMain], [Route], [PeopleMin], [PeopleMax], [Lenght], [DifficultyId], [AgeMin], [Actual], [RegionId], [Description]) VALUES (2, N'Вокруг Байкала', CAST(N'2023-08-23' AS Date), CAST(N'2023-08-25' AS Date), 18400.0000, 4.9, N'image.jpeg', N'Озеро - Озеро', 4, 20, 30, 1, 9, 1, 2, N'')
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
INSERT [dbo].[Users] ([Id], [Login], [Paswword], [FName], [LName]) VALUES (2, N'g_001', N'user', N'Александр', N'Александрович')
INSERT [dbo].[Users] ([Id], [Login], [Paswword], [FName], [LName]) VALUES (3, N'g_002', N'user', N'Иван', N'Александрович')
INSERT [dbo].[Users] ([Id], [Login], [Paswword], [FName], [LName]) VALUES (4, N'g_003', N'user', N'Александр', N'Иванович')
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
ALTER TABLE [dbo].[LogAutho]  WITH CHECK ADD  CONSTRAINT [FK_LogAutho_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[LogAutho] CHECK CONSTRAINT [FK_LogAutho_Users]
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
