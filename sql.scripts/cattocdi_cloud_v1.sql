USE [master]
GO
/****** Object:  Database [CatTocDi]    Script Date: 02/07/2019 3:14:51 CH ******/
CREATE DATABASE [CatTocDi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CatTocDi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CatTocDi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CatTocDi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CatTocDi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CatTocDi] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CatTocDi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CatTocDi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CatTocDi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CatTocDi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CatTocDi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CatTocDi] SET ARITHABORT OFF 
GO
ALTER DATABASE [CatTocDi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CatTocDi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CatTocDi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CatTocDi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CatTocDi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CatTocDi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CatTocDi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CatTocDi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CatTocDi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CatTocDi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CatTocDi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CatTocDi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CatTocDi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CatTocDi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CatTocDi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CatTocDi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CatTocDi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CatTocDi] SET RECOVERY FULL 
GO
ALTER DATABASE [CatTocDi] SET  MULTI_USER 
GO
ALTER DATABASE [CatTocDi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CatTocDi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CatTocDi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CatTocDi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CatTocDi] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CatTocDi', N'ON'
GO
ALTER DATABASE [CatTocDi] SET QUERY_STORE = OFF
GO
USE [CatTocDi]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 02/07/2019 3:14:51 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 02/07/2019 3:14:51 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[BookedDate] [date] NOT NULL,
	[Duration] [int] NOT NULL,
	[PromotionId] [int] NULL,
	[StartTime] [datetime] NOT NULL,
	[CancelledReason] [nvarchar](max) NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 02/07/2019 3:14:51 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 02/07/2019 3:14:51 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 02/07/2019 3:14:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 02/07/2019 3:14:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 02/07/2019 3:14:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClosedDay]    Script Date: 02/07/2019 3:14:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClosedDay](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Description] [nvarchar](max) NULL,
	[SalonId] [int] NOT NULL,
 CONSTRAINT [PK_ClosedDay] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 02/07/2019 3:14:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Phone] [varchar](20) NULL,
	[AccountId] [nvarchar](128) NOT NULL,
	[Gender] [bit] NULL,
	[Email] [varchar](150) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 02/07/2019 3:14:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [varchar](max) NOT NULL,
	[SalonId] [int] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 02/07/2019 3:14:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalonId] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[DiscountPercent] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[PostDate] [datetime] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Promotion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 02/07/2019 3:14:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[RateNumber] [tinyint] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salon]    Script Date: 02/07/2019 3:14:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [varchar](20) NULL,
	[IsForMen] [bit] NULL,
	[IsForWomen] [bit] NULL,
	[RatingAverage] [float] NULL,
	[AccountId] [nvarchar](128) NOT NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[Email] [varchar](150) NULL,
	[Capacity] [int] NULL,
 CONSTRAINT [PK_Salon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalonService]    Script Date: 02/07/2019 3:14:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalonService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalonId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[Price] [float] NULL,
	[AvarageTime] [int] NULL,
	[Disabled] [bit] NOT NULL,
 CONSTRAINT [PK_SalonService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 02/07/2019 3:14:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceAppointment]    Script Date: 02/07/2019 3:14:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceAppointment](
	[AppointmentId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[CancelledReason] [nvarchar](max) NULL,
 CONSTRAINT [PK_ServiceAppointment] PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC,
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceCategory]    Script Date: 02/07/2019 3:14:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_ServiceCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlotAppointment]    Script Date: 02/07/2019 3:14:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlotAppointment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SlotId] [int] NULL,
	[AppointmentId] [int] NULL,
 CONSTRAINT [PK_SlotAppointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlotTime]    Script Date: 02/07/2019 3:14:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlotTime](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalonId] [int] NOT NULL,
	[SlotDate] [datetime] NOT NULL,
	[Slot1] [tinyint] NULL,
	[Slot2] [tinyint] NULL,
	[Slot3] [tinyint] NULL,
	[Slot4] [tinyint] NULL,
	[Slot5] [tinyint] NULL,
	[Slot6] [tinyint] NULL,
	[Slot7] [tinyint] NULL,
	[Slot8] [tinyint] NULL,
	[Slot9] [tinyint] NULL,
	[Slot10] [tinyint] NULL,
	[Slot11] [tinyint] NULL,
	[Slot12] [tinyint] NULL,
	[Slot13] [tinyint] NULL,
	[Slot14] [tinyint] NULL,
	[Slot15] [tinyint] NULL,
	[Slot16] [tinyint] NULL,
	[Slot17] [tinyint] NULL,
	[Slot18] [tinyint] NULL,
	[Slot19] [tinyint] NULL,
	[Slot20] [tinyint] NULL,
	[Slot21] [tinyint] NULL,
	[Slot22] [tinyint] NULL,
	[Slot23] [tinyint] NULL,
	[Slot24] [tinyint] NULL,
	[Slot25] [tinyint] NULL,
	[Slot26] [tinyint] NULL,
	[Slot27] [tinyint] NULL,
	[Slot28] [tinyint] NULL,
	[Slot29] [tinyint] NULL,
	[Slot30] [tinyint] NULL,
	[Slot31] [tinyint] NULL,
	[Slot32] [tinyint] NULL,
	[Slot33] [tinyint] NULL,
	[Slot34] [tinyint] NULL,
	[Slot35] [tinyint] NULL,
	[Slot36] [tinyint] NULL,
	[Slot37] [tinyint] NULL,
	[Slot38] [tinyint] NULL,
	[Slot39] [tinyint] NULL,
	[Slot40] [tinyint] NULL,
	[Slot41] [tinyint] NULL,
	[Slot42] [tinyint] NULL,
	[Slot43] [tinyint] NULL,
	[Slot44] [tinyint] NULL,
	[Slot45] [tinyint] NULL,
	[Slot46] [tinyint] NULL,
	[Slot47] [tinyint] NULL,
	[Slot48] [tinyint] NULL,
	[Slot49] [tinyint] NULL,
	[Slot50] [tinyint] NULL,
	[Slot51] [tinyint] NULL,
	[Slot52] [tinyint] NULL,
	[Slot53] [tinyint] NULL,
	[Slot54] [tinyint] NULL,
	[Slot55] [tinyint] NULL,
	[Slot56] [tinyint] NULL,
	[Slot57] [tinyint] NULL,
	[Slot58] [tinyint] NULL,
	[Slot59] [tinyint] NULL,
	[Slot60] [tinyint] NULL,
	[Slot61] [tinyint] NULL,
	[Slot62] [tinyint] NULL,
	[Slot63] [tinyint] NULL,
	[Slot64] [tinyint] NULL,
	[Slot65] [tinyint] NULL,
	[Slot66] [tinyint] NULL,
	[Slot67] [tinyint] NULL,
	[Slot68] [tinyint] NULL,
	[Slot69] [tinyint] NULL,
	[Slot70] [tinyint] NULL,
	[Slot71] [tinyint] NULL,
	[Slot72] [tinyint] NULL,
	[Slot73] [tinyint] NULL,
	[Slot74] [tinyint] NULL,
	[Slot75] [tinyint] NULL,
	[Slot76] [tinyint] NULL,
	[Slot77] [tinyint] NULL,
	[Slot78] [tinyint] NULL,
	[Slot79] [tinyint] NULL,
	[Slot80] [tinyint] NULL,
	[Slot81] [tinyint] NULL,
	[Slot82] [tinyint] NULL,
	[Slot83] [tinyint] NULL,
	[Slot84] [tinyint] NULL,
	[Slot85] [tinyint] NULL,
	[Slot86] [tinyint] NULL,
	[Slot87] [tinyint] NULL,
	[Slot88] [tinyint] NULL,
	[Slot89] [tinyint] NULL,
	[Slot90] [tinyint] NULL,
	[Slot91] [tinyint] NULL,
	[Slot92] [tinyint] NULL,
	[Slot93] [tinyint] NULL,
	[Slot94] [tinyint] NULL,
	[Slot95] [tinyint] NULL,
	[Slot96] [tinyint] NULL,
 CONSTRAINT [PK_SlotTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 02/07/2019 3:14:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalonId] [int] NULL,
	[SlotDate] [date] NULL,
	[SlotTime] [time](7) NULL,
	[DayOfWeek] [int] NULL,
	[SlotType] [bit] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkingHour]    Script Date: 02/07/2019 3:14:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkingHour](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalonId] [int] NOT NULL,
	[DayOfWeek] [tinyint] NOT NULL,
	[StartHour] [time](7) NOT NULL,
	[EndHour] [time](7) NOT NULL,
	[IsClosed] [bit] NOT NULL,
 CONSTRAINT [PK_WorkingHour] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201809271436039_InitialCreate', N'cattocdi.webapi.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E3F40FF83A0A7D383D4CAE5EC624F60EF2275929EA09B0BD6D9E2BC2D68897688952855A2B2098AFEB23EF427F52F9CA144C9122FBAD88AED140B2C2272F8CD70382487C3A1FFFAE3CFF187A7C0B71E719C90904EECA3D1A16D61EA861EA1CB899DB2C50FEFEC0FEFBFFBC7F8C20B9EAC5F0ABA134E072D6932B11F188B4E1D27711F7080925140DC384CC2051BB961E0202F748E0F0FFFE31C1D3918206CC0B2ACF1A7943212E0EC033EA7217571C452E45F871EF613510E35B30CD5BA41014E22E4E289ED22C642D723A36F788E2232CA5BD8D6994F104833C3FEC2B610A521430C643DFD9CE0198B43BA9C455080FCFBE70803DD02F909167D385D9177EDCEE131EF8EB36A5840B969C2C2A027E0D189D08F23375F4BCB76A93FD0E005689A3DF35E675A9CD8571ECE8A3E853E284066783AF5634E3CB1AF4B1667497483D9A86838CA212F6380FB16C65F4755C403AB73BB83D29E8E4787FCDF81354D7D96C6784271CA62E41F5877E9DC27EECFF8F93EFC8AE9E4E468BE3879F7E62DF24EDEFE1B9FBCA9F614FA0A74B50228BA8BC308C7201B5E94FDB72DA7DECE911B96CD2A6D72AD802DC1D4B0AD6BF4F411D3257B804973FCCEB62EC913F68A12615C9F298199048D589CC2E74DEAFB68EEE3B2DE69E4C9FF6FE07AFCE6ED205C6FD0235966432FF1878913C3BCFA84FDAC367920513EBD6AE3FD45905DC661C0BFEBF695D77E998569ECF2CE8446927B142F31AB4B377656C6DBC9A439D4F0665DA0EEBF69734955F3D692F20EAD33130A16DB9E0D85BC2FCBB7B3C59D45110C5E665A5C234D06A7DFB04612C28125D1AD4CE8A8AB0951E8DADF7945BC0810F10758123B70018F6441E20097BDFC31040344B4B7CC7728496045F0FE8B928706D1E1CF01449F61378DC150670C05D18B73BB7B0829BE498339B7FFEDF11A6C68EEBF8597C865617C4179AB8DF13E86EED7306517D43B470C7F666E01C83FEF49D01D601071CE5C1727C9251833F6A62138DC05E0156527C7BDE1F822B56B9764EA2312E87D126939FD5290AEFC123D85E29B18C874FE4993A81FC325A1DD442D48CDA2E614ADA20AB2BEA272B06E920A4AB3A01941AB9C39D5601E5F3642C3BB7C19ECFEFB7C9B6DDEA6B5A0A2C619AC90F8274C710CCB9877075E0A8EE96A04BAAC1BBB7016B2E1E34C5F7C6FCA38FD82FC7468566BCD866C11187E3664B0FB3F1B3231A1F89178DC2BE970102A8801BE13BDFE8CD53EE724C9B63D1D6ADDDC36F3EDAC01A6E9729624A14BB259A009818900465D7EF0E1ACF66846DE1B3922021D0343277CCB8312E89B2D1BD52D3DC73E66D83A73F310E114252EF254354287BC1E82153BAA46B05564A42EDCBF149E60E938E68D103F042530530965EAB420D42511F25BB524B5ECB885F1BE973CE49A731C61CA19B66AA20B737D20840B50F29106A54D4363A76271CD8668F05A4D63DEE6C2AEC65D894F6CC5265B7C67835D0AFFED450CB359635B30CE66957411C018D4DB85818AB34A5703900F2EFB66A0D289C960A0C2A5DA8A81D635B60303ADABE4D519687E44ED3AFED27975DFCCB37E50DEFEB6DEA8AE1DD8664D1F7B669AB9EF096D18B4C0B16A9EE7735E899F98E67006728AF359225C5DD94438F80CB37AC866E5EF6AFD50A7194436A226C095A1B5808AEB40054899503D842B62798DD2092FA2076C11776B84156BBF045BB10115BB7A2D5A21345F9ECAC6D9E9F451F6ACB406C5C83B1D162A381A839017AF7AC73B28C514975515D3C517EEE30D573A2606A341412D9EAB4149456706D752619AED5AD239647D5CB28DB424B94F062D159D195C4BC246DB95A4710A7AB8051BA9A8BE850F34D98A4847B9DB94756327CF98120563C7905A35BE465144E8B2926A254AAC599E6735FD61D63FF928C8311C37D1E42095D2969C5818A325966A8135487A49E2849D2386E688C779A65EA09069F756C3F25FB0AC6E9FEA2016FB4041CDFFCE5B182EF16BFBADEA90089C4BE865C0BD9A2C94AEB1017D738BA7BF211FC59AE8FD34F4D3809A9D2C73EBFC0EAFDA3E2F5111C68E24BFE244291A535CDDBAFA3B0D8E3A31061CA8D28F597FB0CC102695175E6855E926CFD48C5204AAAA28A6E0D5CE06CFE4D0F41E30D95FEC3F5EAD082F33BF44924A154014F5C4A8E439286095BAEEA8F554942A66BDA63BA2946F528594AA7A4859CD2AA90959AD580BCFA0513D45770E6A1E49155DADED8EACC928A9426BAAD7C0D6C82CD77547D5249D548135D5DDB1571928F242BAC73B98F114B3D116961F7637DBC30C182FB32A0EB30556EEF4AB4095E29E58E2D65E0113E57B6951C613DF461695C73936B32803867905AADD88D717A0C66B7C3366ED9ABBB6C8375DF39BF1FAD9ED8B5A8772E893494AEEE5E14F3AE48DC581ABFD918D7202CB496CAB50236CF0CF09C3C188138C66BFFA539F60BE9C1704D78892054E589EDA611F1F1E1D4B6F74F6E7BD8C93249EAF39B09A1ECDD4C76C0B595AF411C5EE038AD59C890DDE94AC409570F415F5F0D3C4FE2D6B759A4536F85F59F18175957CA6E4D7142AEEE3145BBFAB39A0C3E4D8371FB8F6F4454477AD5EFDEF4BDEF4C0BA8D61C69C5A87922ED719E1FA3B895ED2E44D379066EDD713AF7742D59E246851A509B1FE0B84396183BC3E28A4FC67809EBEEF2B9AF685C146889A570443E10DA242D32B8175B08C2F043CF864D90B817E9DD5BF18584734E36B0142FB83C96F05BA2F4345CB1D6E359A73D13696A44CCFADB9D61B255EEE7A6F5252B2379AE86ADA750FB80D52ABD7B08C5796953CD8EEA8493A1E0C7B97A6FDE299C6FB925CBC4AFBD86D4EF136D3881BAE88FE56D9C37B90EFA6C9DFD97D8EF0B66DCD14CBDDF344CB7E99C07B666C22AB6BF7F9BEDB3636539877CF8DAD5756EF9ED9DAAEF6CF1D5B5AE72D74E739BA6ABA91E14E46170B6ECBC1CD03E770C29F876004B947993F9DD4277D3525ACB6305C9198999AB3CD64C6CAC451F82A14CD6CFBF5556CF88D9D1534CD6C0D399A4DBCC5FADFC85BD034F336643EEE227B589B7BA8CBE86E59C79A12A25E53B670AD272DC9E96D3E6BE305FB6B4A0E1E4429B5D963B8237E3DB9C083A864C8A9D323F757BDEE85BDB3F2CB8BB07F2764B982E0BFC348B15BDB354B9A2BBA088BCD5B92A820912234D798210FB6D4B3989105721954F31873F6F63B8BDBF19B8E39F6AEE86DCAA29441977130F76B012FEE0434F1CF129CEB328F6FA3EC674C86E8028849786CFE96FE9812DF2BE5BED4C4840C10DCBB10115D3E968C477697CF25D24D483B0209F5954ED13D0E221FC0925B3A438F781DD9C0FC3EE225729F5711401348FB40D4D53E3E276819A3201118ABF6F00936EC054FEFFF0FED27596680540000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (2, 1, 1, CAST(N'2018-11-07' AS Date), 30, NULL, CAST(N'2018-11-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (3, 1, 0, CAST(N'2018-11-07' AS Date), 45, NULL, CAST(N'2018-11-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (4, 1, 0, CAST(N'2018-11-08' AS Date), 30, NULL, CAST(N'2018-12-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (5, 1, 0, CAST(N'2018-11-09' AS Date), 30, NULL, CAST(N'2018-12-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (6, 1, 0, CAST(N'2018-11-10' AS Date), 90, NULL, CAST(N'2018-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (7, 1, 0, CAST(N'2018-11-11' AS Date), 60, NULL, CAST(N'2018-12-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (8, 1, 0, CAST(N'2018-11-12' AS Date), 30, NULL, CAST(N'2018-12-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (9, 1, 0, CAST(N'2018-11-13' AS Date), 45, NULL, CAST(N'2018-12-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (13, 1, 0, CAST(N'2018-11-08' AS Date), 16, NULL, CAST(N'2018-11-15T08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (14, 1, 0, CAST(N'2018-11-08' AS Date), 16, NULL, CAST(N'2018-11-15T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (15, 1, 0, CAST(N'2018-11-08' AS Date), 16, NULL, CAST(N'2018-11-15T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (16, 1, 0, CAST(N'2018-11-08' AS Date), 16, NULL, CAST(N'2018-11-15T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (17, 1, 0, CAST(N'2018-11-08' AS Date), 16, NULL, CAST(N'2018-11-15T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (18, 1, 0, CAST(N'2018-11-08' AS Date), 16, NULL, CAST(N'2018-11-15T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (19, 1, 0, CAST(N'2018-11-08' AS Date), 16, NULL, CAST(N'2018-11-15T08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (20, 1, 0, CAST(N'2018-11-09' AS Date), 16, NULL, CAST(N'2018-11-12T05:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (21, 1, 2, CAST(N'2019-07-02' AS Date), 15, NULL, CAST(N'2019-07-02T14:00:00.000' AS DateTime), N'Thích thì hủy')
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (22, 1, 1, CAST(N'2019-07-02' AS Date), 15, NULL, CAST(N'2019-07-02T14:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (23, 1, 0, CAST(N'2019-07-02' AS Date), 15, NULL, CAST(N'2019-07-02T14:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerId], [Status], [BookedDate], [Duration], [PromotionId], [StartTime], [CancelledReason]) VALUES (24, 1, 0, CAST(N'2019-07-02' AS Date), 60, NULL, CAST(N'2019-07-03T08:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'Salon')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'User')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'114141825114713698554', N'3c684753-567c-40ca-b467-ff181f94db4c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'00ae6bb2-d8b1-4cf7-8445-c6d095becce7', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'00ce07e1-fff4-4a55-a2d3-d5b0174e1c94', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0b62464f-83a9-46b7-9085-102b830246e0', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0dd91ec1-a643-4d7d-bd46-9047698e24f1', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0fdd3342-3144-4892-9565-cb85461ed260', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1a0e725d-d934-4738-b5fc-72e76a39706b', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'345b5515-e330-454d-ac9d-570a12e08e31', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'347371f8-471f-45a6-bf78-8cd78be136e1', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3480aba8-8605-4a21-a2ca-f9b061f53f9d', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'34877506-34d2-43ce-a6cd-e7df938c2d63', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'37a3cb67-3d1a-48d6-b5e0-ec5b9090e90d', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3aa60233-bad9-44d9-88f4-6ae3cf707bcf', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4127e7ed-d988-4e13-98d2-45846d537253', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4383a90c-b83f-4791-98d7-c5141d0e4968', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'47af57e4-62cd-428f-98b5-9a957a7d724a', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'494c3e42-7ea9-41d7-8aa4-e6627f2dac2c', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'503a2ed2-5d07-4e61-963d-e03082167023', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'516bfaf7-e18b-473e-a698-5b880034f30d', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5267649e-a997-4314-a283-29b913a8f91d', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'532795a5-d283-438a-a98c-fa0c63d26e5d', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'59507513-05cc-4628-a66e-42da8bb0fb53', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5966b84c-2f1d-48ad-b686-9df5c6b20b6e', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5d9ceea0-ec4a-4d37-a4f2-ed64a31119f3', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'61758182-baa4-47d2-a742-d1c97f6edc09', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6273521b-1333-4184-95d2-51b5c05611b7', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'62a28c71-64e6-4b76-97e6-4c65acaf8e85', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6535a664-5d85-4285-8720-bfeef0a59100', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7208a15e-0f0b-4209-adb9-ebe2d9d08a79', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'75df30f3-f3fb-424e-845e-6a50c0ca314b', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7ec2ae46-30b4-40df-b8b1-c5afbeed3cec', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'817512c7-605c-42b8-849b-120c89b5750f', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8266ffd8-c6e3-44d9-8c88-0bdbaeb0a7a1', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'967a1bee-b6c8-40db-ab8d-d2ea2cd4bb95', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9d70badd-8c8d-4ccf-88c3-28bfdb1c5a5c', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a07fbf24-04e0-4120-9ed9-5b9eb4647aaa', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a0e525bf-9201-4036-aab8-f52a29871aca', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ab1b4196-bf85-4d88-9872-7d5ea5f94466', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ab244d06-9131-42dc-aa43-6bdf75a532a0', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b07fba81-9fa4-4796-a232-2a3312a60228', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b1c02aeb-3edd-44ca-b860-5ce72bb641d8', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b224835c-1cee-43da-81a9-fc8c8b7bdc3c', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b65b96b3-d4fe-409e-a4a1-43215d164af1', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b9ed1e76-2fa8-4901-933c-1ef52e9a58eb', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bd55449c-b311-4490-9488-de815b7f3b6d', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bebcdfe6-55b4-4ac6-a789-676d66bd59c7', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c02e16ae-a37e-4847-8544-420f315db718', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c08bbfec-e872-4448-a41f-274f67ce5eb5', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c1026326-0926-400c-a3d8-74e5e5f16b57', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c8c7a523-9d35-4062-b0e7-5ab06f23cc25', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c90ecce7-6917-4a49-ac8b-e52ea9d82dce', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cc12f343-023d-4ec9-a46d-922a47212718', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ced801b5-c665-47e5-9298-9542db5ce143', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd15bb79e-fa9d-43a2-95ce-99c6e9f04150', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd1d085d8-2bba-4712-8d7f-c77cf503fb0b', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd6854394-9aa0-49ae-ac55-9c0d33e640f5', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'dbe33d97-41c0-4efd-9b1a-0b797a8fdb80', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e04e3781-ae66-46e4-99cb-bc1bbf61b96f', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e16e764a-e44b-4ba0-bc35-124117dba335', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e4f92b27-eb9b-478e-b261-11d602158ab4', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e5f95bdb-e8da-4e70-bdb1-a3d6dc05bb6f', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e6ab717f-1642-4ae8-a7ff-a8a6e2b38bd9', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e9fcdc7a-f5f8-4951-a99c-e7543bfa5f52', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ecd60616-88f0-496e-b855-95aa836518cd', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ed388cff-742a-44ee-81a4-a5b085b95552', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ee5daaab-11e1-47d1-a914-84e7dd8f0356', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f21218e5-5165-4582-b982-6f519d0f96a5', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f2cf9394-4f8e-4728-be06-88d5a52c3cd5', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f741a255-9265-4476-a0d8-aac90c1a40d2', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fab21236-8033-489c-9612-5c82a74d50e0', N'3')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'00ae6bb2-d8b1-4cf7-8445-c6d095becce7', N'nhi@gmail.com', 0, N'AAC4tbJTZxvZ7G+jAN4rRJ7IxIh2VWWhaE+Zoua0vphKZtk9IsqUYh+23DhNWJ5kOA==', N'f92c9a94-84ad-4a35-8a87-7fb6e28d74a6', NULL, 0, 0, NULL, 0, 0, N'odjdnd')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'00ce07e1-fff4-4a55-a2d3-d5b0174e1c94', N'nhi@gmail.com', 0, N'AKgN8haYNNTuzAm+fq5lOC6n3wplOBhqPDk/5dDL67pVVfH3Rbt/4MJ/LSxlbyzSaw==', N'8a917341-717a-4311-89ef-527a2c34a962', NULL, 0, 0, NULL, 0, 0, N'testne')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0b62464f-83a9-46b7-9085-102b830246e0', N'nhi@gmail.com', 0, N'AGst8pBrKQIiJnpXUmLgwD/vqbTYkuVRghu73dV8bjB/LrgXW2fA7i16Arbkc5kINA==', N'f7611291-d44b-4bcf-9a64-dc380cb18c06', NULL, 0, 0, NULL, 0, 0, N'099999667')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0dd91ec1-a643-4d7d-bd46-9047698e24f1', N'nhi@gmail.com', 0, N'ABIFtbOCqvzb8n1bMnx5D/G1k/MTFHaQf+24zjF0ykHqVcG9cFFHztK4lYG2PiQ8GA==', N'3795bde4-2c4f-45be-a798-fd0628db994a', NULL, 0, 0, NULL, 0, 0, N'sjsu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0fdd3342-3144-4892-9565-cb85461ed260', NULL, 0, N'AID9PQWbUO3mmsWLG3BVgm03o9jRqKbe+H0Bo7WszrtiSaqgl4BhpHPY0RuxEEtB3A==', N'3e1aa1f4-cdb7-4c0f-921b-0ec37db34934', NULL, 0, 0, NULL, 0, 0, N'0123')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1a0e725d-d934-4738-b5fc-72e76a39706b', N'tiendat@gmail.com', 1, N'APKRekyOBD21kPhCAtxt9Tkj4FqzwOEY6VF2L0dLRQZ1+jEfnJluQ3a8J9AnP+68LQ==', N'a7b9a00f-7a73-43c1-b74e-71c90a183acf', NULL, 0, 0, NULL, 0, 0, N'tiendat@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'345b5515-e330-454d-ac9d-570a12e08e31', NULL, 0, N'AO4os7IoR7Z2iqFIkKBSNPvv4iEQjrkazwT7vbMby4xPacIxB2ECzHV2xryk8VqCMg==', N'1ab21c30-5c85-4b65-a5bd-801c00505813', NULL, 0, 0, NULL, 0, 0, N'1111')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'347371f8-471f-45a6-bf78-8cd78be136e1', N'nhi@gmail.com', 0, N'AHH3Tq/3a7q/U8xeo0O3ikQcPSl9wmXdtl8LpNcOukRyIY3X32ZDCrFILOe5o+1taA==', N'f3dfb2cb-89e8-42a3-8a30-a0c75524e5e6', NULL, 0, 0, NULL, 0, 0, N'QuocCuonghhh')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3480aba8-8605-4a21-a2ca-f9b061f53f9d', N'nhi@gmail.com', 0, N'ALqk5f3PxaeZH1NpNkWSOkTssMWogYauZfxY2yhyNsGJRyV6sVMlrO5/vQOS82Xvbw==', N'e1bb1d47-e759-4e1a-b941-b43ddd8c4874', N'0123456789', 0, 0, NULL, 0, 0, N'muadong202')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'34877506-34d2-43ce-a6cd-e7df938c2d63', N'nhi@gmail.com', 0, N'ADNs00sJTckmJUHggY3286cW16gYrndLe/X5wxn/AZaOMaacH6l6I9t7sueAp/M3pg==', N'66f6ba2b-8546-444e-9675-ecece052f3f5', NULL, 0, 0, NULL, 0, 0, N'Nhi')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'37a3cb67-3d1a-48d6-b5e0-ec5b9090e90d', N'nhi@gmail.com', 0, N'AGcUjD0bLONg0c0FtHcJckjbq64aA1KD4Y8vyXF2ZzFUNxWQdB+1VcxfVmsprncYhQ==', N'98f996d7-fc15-40e6-b76b-391aa205bda9', NULL, 0, 0, NULL, 0, 0, N'cccjruu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3aa60233-bad9-44d9-88f4-6ae3cf707bcf', N'nhi@gmail.com', 0, N'AKf/l9AtR3Rg4YRHxtEbO4OzzWVOXuSLgUzHNN44Ni4Th77R4NSqVCGaWSPOHiuxqg==', N'74cf506c-b7d8-4d62-993a-c765a6158b72', NULL, 0, 0, NULL, 0, 0, N'oft')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3c684753-567c-40ca-b467-ff181f94db4c', N'tiendatdeveloper1997@gmail.com', 0, NULL, N'93bbe6ff-d535-42ab-8993-3995257ee5f9', NULL, 0, 0, NULL, 0, 0, N'tiendatdeveloper1997@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4127e7ed-d988-4e13-98d2-45846d537253', N'nhi@gmail.com', 0, N'ANSby7QanoH6WvGWvSadwskUnjwGcBmmQszUGFVsTr66IwgNhdpn1nR77Y6wSPXwZQ==', N'fbc59917-7a59-4c08-8821-c68d447520c4', NULL, 0, 0, NULL, 0, 0, N'QuocCuonghds')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4383a90c-b83f-4791-98d7-c5141d0e4968', N'nhi@gmail.com', 0, N'ALIFzevV73g6m21AKbXCGADabuTS8zx6KmBYyjvgdTs9Wrkg6/OJh3VC8DdiGqn9bA==', N'3e6d6d1d-2be6-4c05-bc8b-56bb2c1ca001', NULL, 0, 0, NULL, 0, 0, N'QuocCubhhhong')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'47af57e4-62cd-428f-98b5-9a957a7d724a', N'nhi@gmail.com', 0, N'AFBKgCdIrBQR1wEvWIV9621IMraavZRs/fer2R+Z4wqCL6JFNIP8fofr6sWJMXsZwA==', N'863295df-7d60-4249-b507-ad6d150d21f9', NULL, 0, 0, NULL, 0, 0, N'alaui')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'494c3e42-7ea9-41d7-8aa4-e6627f2dac2c', N'thuyngoc@gmail.com', 0, N'AFUHAekP9uiDtfiENOGqpLicYsuQeDfZ98Np6+Pcx6+UzknAnY7NjBp2Mb6WGQ84aQ==', N'ef61c256-3738-4b32-aabe-341f52067c7b', NULL, 0, 0, NULL, 0, 0, N'thuyngoc')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'503a2ed2-5d07-4e61-963d-e03082167023', N'nhi@gmail.com', 0, N'AKixQgLCvCdyaYgdMzAaDDCdJ7di8zQDdnfWkmCh5C8dfCcPJFvyun3R5IeiMnlI2w==', N'fff94418-16cd-47f3-b836-b2143518acf7', N'0123456789', 0, 0, NULL, 0, 0, N'Cat')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'516bfaf7-e18b-473e-a698-5b880034f30d', N'nhi@gmail.com', 0, N'AH4RDC+ddteMt8g8KymTBs3bA6TEc0AOA1h+tTopZkw0lkiVRzYqanAxHTcbIK1EYg==', N'7f25a6a9-22ea-46ab-aaca-ff5e1560c292', NULL, 0, 0, NULL, 0, 0, N'QuocCuongrfg')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5267649e-a997-4314-a283-29b913a8f91d', N'nhi@gmail.com', 0, N'AIBLiyU0awXtdADPxY11cb8bO1W/au0+xvhnUar0fWygawJ3eQOm4SpftXKW4OqfeQ==', N'98d417d7-a05a-482c-9f21-2c4b066efe88', NULL, 0, 0, NULL, 0, 0, N'473')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'532795a5-d283-438a-a98c-fa0c63d26e5d', N'nhi@gmail.com', 0, N'AB3/hYU71/5X69wTp+E5XaBjLrmvFegtFCwKapyUT1rlyCu/k8n/+NUfKObUK+RY7Q==', N'390357d8-5ecf-4ebf-bc66-29436a7adebb', NULL, 0, 0, NULL, 0, 0, N'729')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'59507513-05cc-4628-a66e-42da8bb0fb53', N'nhi@gmail.com', 0, N'AA6rQ5hsx5PfNPYr0sbHZxAuEkoVPgQCmLkn1nFGP21uNkTKTJQGPOUMLImBeUOeag==', N'053f1756-70a9-43fd-9c8a-6728b2979937', NULL, 0, 0, NULL, 0, 0, N'5736')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5966b84c-2f1d-48ad-b686-9df5c6b20b6e', N'nhi@gmail.com', 0, N'ADQXSZhPhfVqLUOvkIiP1mN7ImZNxpGtroP9/O682vIGnpo3SZUXb+aHf6JOn20BSw==', N'650b08f9-aa23-4468-afe5-5354c00bd4eb', NULL, 0, 0, NULL, 0, 0, N'QuocCuong')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5d9ceea0-ec4a-4d37-a4f2-ed64a31119f3', N'nhi@gmail.com', 0, N'AF74nJ+evI4dbZOEOYDUsSqRoCW5VH0iQVmRe2KifcIp96oUv/oSDIN3JvMnnnnOjw==', N'e928c003-865d-41ac-b0fa-227b8bf3fb79', NULL, 0, 0, NULL, 0, 0, N'ttttt')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'61758182-baa4-47d2-a742-d1c97f6edc09', N'nhi@gmail.com', 0, N'AJuGqtC3OtGm5+jCe9eYuBM9Tq44MKOCuH7zAjNjgWy6cJp6uUMKUQM38QLCOCoFMQ==', N'a38af110-b325-4ddb-8ad5-21a911e2296a', NULL, 0, 0, NULL, 0, 0, N'ppppp')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6273521b-1333-4184-95d2-51b5c05611b7', N'nhi@gmail.com', 0, N'AIx5LSwg0EMr/OkLmSx4oe7nzncX5jgWXPLtEOkWswoZX6n/CTmAAssoidupWWKaNw==', N'b4705660-4b99-4442-80af-b846525f4531', NULL, 0, 0, NULL, 0, 0, N'QuocCuongjjy')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'62a28c71-64e6-4b76-97e6-4c65acaf8e85', N'nhi@gmail.com', 0, N'ACHolnhfRqNlXZ44frinfwTcOUiXtgZBQAE82WQxLHWUUZqfRRKbxZVnNznjJPIdsw==', N'73f2315a-f2c8-4a54-9fa5-0c1df0593617', NULL, 0, 0, NULL, 0, 0, N'huawei')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6535a664-5d85-4285-8720-bfeef0a59100', N'nhi@gmail.com', 0, N'ANhDYajCnngoSXo1c869ukotiJZbGY8QT+vNHWuHTKeU8hyMad1xmFIxHJ2Sc+OQHA==', N'1b0f3485-c0ac-4f46-8af5-77b663c1862b', NULL, 0, 0, NULL, 0, 0, N'QuocCuongjfjfjh')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7208a15e-0f0b-4209-adb9-ebe2d9d08a79', N'nhi@gmail.com', 0, N'ALqDvZH7+Mikw+RfVvOZtNhqkiXoxrQkOa8LedAktaMuGKE9FKwu83qNelTYTGKNQQ==', N'41c843c4-6611-45c1-96f2-3cbc858c1cb0', N'0123456789', 0, 0, NULL, 0, 0, N'muadong')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'75df30f3-f3fb-424e-845e-6a50c0ca314b', N'dylan@gmail.com', 0, N'ADUg9PMuiFQUp5RDWgg56Du/S2ZkaqeIaG5NvcKrIiY4E2b3iiLcI5MnrZBiosHhMw==', N'f646ee1b-7094-47a0-b28b-142d6d2df38e', N'01234412424', 0, 0, NULL, 0, 0, N'ngocuser')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7ec2ae46-30b4-40df-b8b1-c5afbeed3cec', N'nhi@gmail.com', 0, N'AAqGOHF/jMHkxfw3x3LUzsXEnWbN9srnC9XZL1jsLd7LB4je8Z/sJ8jHOcB3zYMtVA==', N'd4fe9f6d-f0bd-4b69-a742-6e3da8f4506c', NULL, 0, 0, NULL, 0, 0, N'ha')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'817512c7-605c-42b8-849b-120c89b5750f', N'nhi@gmail.com', 0, N'AOQ7C3gdSvK+EH+6asUVZKBjxA+ZYOKZogC0RxzCiW08ZRCITxOXfe3DITst7XhbeQ==', N'3b4a3730-e658-457f-8a4f-de642e4a541d', NULL, 0, 0, NULL, 0, 0, N'uuuuu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8266ffd8-c6e3-44d9-8c88-0bdbaeb0a7a1', N'nhi@gmail.com', 0, N'AIDdT3z5LOa82DYDywjXKXHVh0PDqgxtv1pertTLC4S9YsNaFuQ0Ief1cQHyoobggA==', N'bcb37081-278e-4724-9d70-93558459b030', NULL, 0, 0, NULL, 0, 0, N'huaweit')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'967a1bee-b6c8-40db-ab8d-d2ea2cd4bb95', N'nhi@gmail.com', 0, N'ADmhEOkmdTWfMwjKqdcBsjTNUj6UfdpqS7co4oflwAuGhYJQLJkmD6lwkx5c7apO0Q==', N'8b158682-476e-4b91-87ad-3c0f409fbb10', NULL, 0, 0, NULL, 0, 0, N'Qtyuu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9d70badd-8c8d-4ccf-88c3-28bfdb1c5a5c', N'test@123', 0, N'AMvimOiU6Lo651d3j0IuGqsPiWNN7Lb6ZMs+L/swBttnOl97Wm7WyFjUH9JTsHF4JA==', N'35682eee-7f2e-4b69-91ce-acdda4ce55ee', NULL, 0, 0, NULL, 0, 0, N'datphong')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a07fbf24-04e0-4120-9ed9-5b9eb4647aaa', N'nhi@gmail.com', 0, N'AKfAR4NfQoKHPpCCOM2dEnzY8MmJJ5sz3UUcuORqBcewDRPXCy68Y4WK9V6n+rqMMA==', N'2003e902-9d3a-4957-81ec-2c44c2f643c8', NULL, 0, 0, NULL, 0, 0, N'QuocCuodhdid')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a0e525bf-9201-4036-aab8-f52a29871aca', N'nhi@gmail.com', 0, N'ADaKoRI34FyJXTdWzK2fTpy9lk9xSAtQE0R5ZyXZ5wC4mM3xCE509/8ILNEVdpwDVQ==', N'd5d0c783-2bfb-4ee5-9b22-24383d0bb091', NULL, 0, 0, NULL, 0, 0, N'cccjr')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ab1b4196-bf85-4d88-9872-7d5ea5f94466', N'nhi@gmail.com', 0, N'AG35wmwzNY2y4A+vQLVuZqah7U4DgUR0TMyNhMC/ORVc8HunZFhM7tp/8aokDUUhQA==', N'046b1035-58fa-431c-878a-3a3b4200295c', NULL, 0, 0, NULL, 0, 0, N'Nhi2')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ab244d06-9131-42dc-aa43-6bdf75a532a0', N'nhi@gmail.com', 0, N'AOzeLoaAh5l5BqwdV0AiVRbKQUro6h9AHEdc3R2QKZsNpW8rBauy30b3or31ipX2bA==', N'b54e5f15-6eac-4a1a-b02b-ef27a4531db7', NULL, 0, 0, NULL, 0, 0, N'QuocCuongrjdjjd')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b07fba81-9fa4-4796-a232-2a3312a60228', N'nhi@gmail.com', 0, N'ACTk1kD2caW6zWuIErHc8HqDQ/O4RrnPCVn48cXt4E6QZNtMhMDdQR4iGNuZ/Q+XFQ==', N'90b86f7e-85e7-4852-b2b5-f21101614a8e', N'0123456789', 0, 0, NULL, 0, 0, N'muadong204')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b1c02aeb-3edd-44ca-b860-5ce72bb641d8', N'nhi@gmail.com', 0, N'AMCnw/oL1YLhwPTtCvIQ/YKh5jIExLyN+bX6cfWhBDcde4tT+AFxyLmSu7ifxuBlRA==', N'5f3fb7b0-48de-45dd-bd27-dedefbf231dc', NULL, 0, 0, NULL, 0, 0, N'Quududhdh')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b224835c-1cee-43da-81a9-fc8c8b7bdc3c', N'nhi@gmail.com', 0, N'AH9wglXlgpVlar+tyCqqY1+1nCF0EwkyoQXZRlP6fmgvVAa6XteEStRQHeEjfnOuWQ==', N'17a783f8-0801-4382-bcf1-919371768727', NULL, 0, 0, NULL, 0, 0, N'QuocCuonghd')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b65b96b3-d4fe-409e-a4a1-43215d164af1', N'nhi@gmail.com', 0, N'AHTxomYKS/mBD7grdhtnnq+k6fE2vcZmY8691co1kFjdP0eKCQT5eer8Crm5W8hxTQ==', N'c375d9c0-e296-4368-a473-9c3bc200af8f', NULL, 0, 0, NULL, 0, 0, N'Quoddd')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b9ed1e76-2fa8-4901-933c-1ef52e9a58eb', N'nhi@gmail.com', 0, N'AHogVdt+oX8s44DPqpJ3ii1uTg+47LQATgs7cb96kEsNmAg7RRJTScEN5ABqYO7WNg==', N'4b24f54d-6357-4375-9d21-802628e99a25', N'0123456789', 0, 0, NULL, 0, 0, N'Dog')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bd55449c-b311-4490-9488-de815b7f3b6d', N'nhi@gmail.com', 0, N'ANoemcGdHh8zwjob4KHz0wiy/k0HkpXKe7W1fnUcVoN8eCrDLV8KHmWwFqS0/CwKew==', N'c11db50e-1ef3-4462-b3a7-cda06276bb06', NULL, 0, 0, NULL, 0, 0, N'QuocCuongdff')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bebcdfe6-55b4-4ac6-a789-676d66bd59c7', N'nhi@gmail.com', 0, N'AFKBR8Tb8h98YpBZjLy/kXfxtSfuwsYvC9nHCnps6kPz4FoAzCKywNztfyhLNTiGaA==', N'b486a533-e62c-42b6-a875-24d1c9587727', NULL, 0, 0, NULL, 0, 0, N'4729')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c02e16ae-a37e-4847-8544-420f315db718', N'nhi@gmail.com', 0, N'AEBDYaiNAxXk7y+THClVUBA4mYEHTZQYjjaKLvEOajwrm05nnFfOTA6hBv7qz5U1Ug==', N'fed43b53-3e10-4322-9aa0-8aef6d442341', NULL, 0, 0, NULL, 0, 0, N'iiii')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c08bbfec-e872-4448-a41f-274f67ce5eb5', N'nhi@gmail.com', 0, N'AOcOz8mQsB7AisGcropJTwzd899C/PaQ9RQ7whcb3ek8qkYJmE2zpXNJ+doEHgurkA==', N'8e19e3b9-597d-44c7-9df1-ab85c43b8598', NULL, 0, 0, NULL, 0, 0, N'tttttfg')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c1026326-0926-400c-a3d8-74e5e5f16b57', N'nhi@gmail.com', 0, N'ALrU+eQQyO44nAIn/gpSirdQmP22kbI0lFwk9mWURwAcucnmeIsVlxUYnijGzFVCww==', N'28f3a451-7501-45dd-b6eb-edab1ba927ce', N'0123456789', 0, 0, NULL, 0, 0, N'QuocCuongjxjdkdk')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c8c7a523-9d35-4062-b0e7-5ab06f23cc25', N'nhi@gmail.com', 0, N'AFd7rVoX9dt7uxwN085hHsZGj2RrJCBq1DChOhYZP5Yzg7JIE4uUj5shfrF5j0fckw==', N'b103a7be-5525-4ade-8153-1149956029e8', NULL, 0, 0, NULL, 0, 0, N'QuocCuongoooooo')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c90ecce7-6917-4a49-ac8b-e52ea9d82dce', N'thuyngoc@gmail.com', 0, N'ALsEWnahJJSxKcaXsxNl6ENeIEpSLmtiBx2Go6vxz1ZRRipLlzEeW1tUseeakgesow==', N'19162e43-016d-4172-8381-7c3a1d7b55a3', NULL, 0, 0, NULL, 0, 0, N'datngoc')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'cc12f343-023d-4ec9-a46d-922a47212718', N'nhi@gmail.com', 0, N'AM2XsrFv0zQjddJNs4pNvZEEhSD05W+hOQac0C7H8uj0QGbGgxNvlaDhFaMWPooIGQ==', N'b4a4059f-0dd7-4de7-9e10-972dd05cd896', NULL, 0, 0, NULL, 0, 0, N'QuocCuongedgh')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ced801b5-c665-47e5-9298-9542db5ce143', N'nhi@gmail.com', 0, N'ADi8P+tk7juKDXth+axGJkgzYYFgPRLvm30onpk8Fp+IFSjD/nbHMfC5RrB8NOMROg==', N'3adaade1-d052-4f06-b645-1ef981066fba', NULL, 0, 0, NULL, 0, 0, N'NhiNhi')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd15bb79e-fa9d-43a2-95ce-99c6e9f04150', N'nhi@gmail.com', 0, N'AKa6lsithnOBIZyl3NsF+EBqtp90JMZcA90XPkjlkaYP4BiUyTS5Bl52LoTnVjR8Vg==', N'f1645905-20aa-499e-83e7-ed77a2e32303', N'0123456789', 0, 0, NULL, 0, 0, N'muadong201')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd1d085d8-2bba-4712-8d7f-c77cf503fb0b', N'abc@gmail.com', 0, N'AJDKYxhI1DIFrxYbLFl90qf6dY2vd/93HsLPA/Yih8cmqK53hQRiyyqO9VKs4Hha6Q==', N'def7a422-2ea4-426e-ac78-7a22c014d858', NULL, 0, 0, NULL, 0, 0, N'test')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd6854394-9aa0-49ae-ac55-9c0d33e640f5', N'nhi@gmail.com', 0, N'AM7VB9gedBS2ofcQROItlnioolrjkzJw1VAJUZ4VboT4zEjxaQmZah5y8FmPAzAyDw==', N'03a4b036-d7f9-411a-8a56-decc894c03dc', NULL, 0, 0, NULL, 0, 0, N'Quocpppppp')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'dbe33d97-41c0-4efd-9b1a-0b797a8fdb80', N'dylan@gmail.com', 0, N'AHbX1A3zaH58h80MclVqobu7HPXgy/4MaS8B6HSuZwcbGibRroG9yDjUV3EFx/WyOQ==', N'02183046-c1eb-4d37-9dc3-e12168628995', N'01234412424', 0, 0, NULL, 0, 0, N'ngocuser123')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e04e3781-ae66-46e4-99cb-bc1bbf61b96f', N'nhi@gmail.com', 0, N'AI4aV92nkGSd0dfjVQPjKhmnaYgc1ZYU3puVTN81XM730shi/x7Rd5bkOeFwLUJpbw==', N'30664c24-c08c-4725-ac54-b99052895f78', NULL, 0, 0, NULL, 0, 0, N'ovl')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e16e764a-e44b-4ba0-bc35-124117dba335', N'nhi@gmail.com', 0, N'AKpuw/91fnhEa5CqoL0BqynOKr5dWSjXLSvPFUwZ2LJqp72w1J+ejH4DqKgh8ww3pg==', N'cdec9537-ef55-45aa-8458-37b82a6b11a0', NULL, 0, 0, NULL, 0, 0, N'ala')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e4f92b27-eb9b-478e-b261-11d602158ab4', N'nhi@gmail.com', 0, N'AJcU2E+BMJ0FGNFqkRlosRNSPS3dZ1n+8saerFvG5333jcXnU86rk0AR04SIIm8ApA==', N'f220002f-5245-4237-96a9-3cbf2829a0d5', N'0123456789', 0, 0, NULL, 0, 0, N'muadong203')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e5f95bdb-e8da-4e70-bdb1-a3d6dc05bb6f', N'nhi@gmail.com', 0, N'AJ3e94cnX7YXJGSJz5qkzUZs+0XNlSPNJ2dO8jOYW94B6oFKGGCIgG+UqIdkXrc1TA==', N'78d05edb-9122-4e3a-9543-7bca6786a2a1', NULL, 0, 0, NULL, 0, 0, N'Phong')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e6ab717f-1642-4ae8-a7ff-a8a6e2b38bd9', N'nhi@gmail.com', 0, N'AGUeR2xAJNHFAkHLPrNsktxkj6VS/02JJhnIxUuc2A+MkQ9skgOAYv+UyxYowUEsmA==', N'62bef670-75eb-4a43-9d31-d19bc322b52c', NULL, 0, 0, NULL, 0, 0, N'QuocCuonghshshd')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e9fcdc7a-f5f8-4951-a99c-e7543bfa5f52', N'nhi@gmail.com', 0, N'AJdo8ynj4H+LFVKShj0sdU3vt35Jxs+wfJ7bCq2xTHMiFnEAbqBn+vbSvkTKLOYcng==', N'295c826a-8cb7-4b3c-992f-700a16e61088', NULL, 0, 0, NULL, 0, 0, N'NhiNguyen')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ecd60616-88f0-496e-b855-95aa836518cd', N'nhi@gmail.com', 0, N'AMc5GW2IZFlfgmDVVybH0fJvtIDKwp9PVonVhiqBDDcgGMf3+PLH06B4rRYh4rXQiw==', N'd3a70379-e6c0-4eff-ad1f-25c662288814', NULL, 0, 0, NULL, 0, 0, N'ppppp2')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ed388cff-742a-44ee-81a4-a5b085b95552', N'nhi@gmail.com', 0, N'AMZ2LzRPygQCNmimvufNNADKpiYwM4ojnSJjSDYCYAiPvbjIVznIjYiWgHc/LXhiQg==', N'11f08e64-c9db-491e-bd9f-eefafb43bdea', NULL, 0, 0, NULL, 0, 0, N'57365')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ee5daaab-11e1-47d1-a914-84e7dd8f0356', N'nhi@gmail.com', 0, N'AGMAx6pGNl+1seLE/y7PmAmFKMSoXjB7CjBYTzM+bIcwOP1aCj7YNDcwj15nw6U6og==', N'dfd3c56e-b50b-4e34-8277-03e2b21bb800', NULL, 0, 0, NULL, 0, 0, N'post')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f21218e5-5165-4582-b982-6f519d0f96a5', N'nhi@gmail.com', 0, N'AKjte2+no+iCSEOc9+MPrpRLYe73vzu5jzjnhTv1ufMO0g8G0xLY001WMlgHCIgpPA==', N'143a8c2b-293b-47df-ade3-41d0b0a10d83', NULL, 0, 0, NULL, 0, 0, N'Quohdudu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f2cf9394-4f8e-4728-be06-88d5a52c3cd5', N'nhi@gmail.com', 0, N'ADAJpvq6SiNISdTd3cCzoJSdoWf/tRlKpAlFCUfUsypwbAcrVjbn6bX9jnjUPL4Buw==', N'90cfbc30-e567-4905-a07f-9f36de233e15', NULL, 0, 0, NULL, 0, 0, N'47376')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f741a255-9265-4476-a0d8-aac90c1a40d2', N'nhi@gmail.com', 0, N'AP4OovcStuqJGyuKBLLLhkODKkI+g4bIeaQjKK3age+oxybbs02VHw8ryVTxgG9OzA==', N'a7fbe1cd-318b-4c9d-a2ea-e1efd8983e84', N'0123456789', 0, 0, NULL, 0, 0, N'muadong200')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fab21236-8033-489c-9612-5c82a74d50e0', N'nhi@gmail.com', 0, N'ADy284KUrUilODELoNn96mVIWsy+gATu0nplpqEv6Bvzj3Npo0AdlI6jpxEdYypBrg==', N'02fc5e77-2e13-4971-a105-468a31e303de', NULL, 0, 0, NULL, 0, 0, N'pppp')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ff08a226-fb3a-4509-a0f4-407b307da323', N'user@gmail.com', 0, N'AAaa3uTWXJNiHRmBbqN0qd6Kx143//Dds2XKj/0PWAueojpFmirMLRsVxz9zxrp0HQ==', N'4fafc699-573a-4975-a0a3-15e71ee2bfbf', NULL, 0, 0, NULL, 0, 0, N'testuser')
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Phone], [AccountId], [Gender], [Email]) VALUES (0, N'sample string 1', N'sample string 2', NULL, N'9d70badd-8c8d-4ccf-88c3-28bfdb1c5a5c', 1, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Phone], [AccountId], [Gender], [Email]) VALUES (1, N'ngoc', N'nguyen', N'0123', N'0fdd3342-3144-4892-9565-cb85461ed260', 1, N'ngoc@mail.com')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Phone], [AccountId], [Gender], [Email]) VALUES (2, N'ngoc', N'ngoc', N'1111', N'345b5515-e330-454d-ac9d-570a12e08e31', 1, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([Id], [Url], [SalonId]) VALUES (4, N'https://firebasestorage.googleapis.com/v0/b/cattocdipro.appspot.com/o/e5c85435-049b-42a1-a9af-4cf70bd75a24?alt=media&token=a8e1a471-7d6f-4c9f-b3c0-fa3e9f07a9d8', 74)
INSERT [dbo].[Image] ([Id], [Url], [SalonId]) VALUES (5, N'https://firebasestorage.googleapis.com/v0/b/cattocdipro.appspot.com/o/06a44f44-6d2b-4ed6-8031-b2b494fcd487?alt=media&token=5191860c-e0a2-40cf-9411-3324b0d8d0fb', 74)
INSERT [dbo].[Image] ([Id], [Url], [SalonId]) VALUES (6, N'https://firebasestorage.googleapis.com/v0/b/cattocdipro.appspot.com/o/9fb1a214-45dd-46ac-8553-efc6c8539172?alt=media&token=1d296586-1d0a-4c21-bb72-7d1d6f976d6d', 74)
INSERT [dbo].[Image] ([Id], [Url], [SalonId]) VALUES (7, N'https://firebasestorage.googleapis.com/v0/b/cattocdipro.appspot.com/o/2d4c0a6a-7691-4226-a2fb-665650cfb6fc?alt=media&token=89a368c5-bacd-48c5-ba56-490f8ff2894e', 74)
INSERT [dbo].[Image] ([Id], [Url], [SalonId]) VALUES (8, N'https://firebasestorage.googleapis.com/v0/b/cattocdipro.appspot.com/o/1af67ff8-f28c-4f5a-ac92-e2c4a224501b?alt=media&token=e06bcae3-062c-4e6d-b8e8-d62441de386e', 74)
SET IDENTITY_INSERT [dbo].[Image] OFF
SET IDENTITY_INSERT [dbo].[Promotion] ON 

INSERT [dbo].[Promotion] ([Id], [SalonId], [StartTime], [EndTime], [DiscountPercent], [Description], [PostDate], [Status]) VALUES (13, 74, CAST(N'2019-07-06T00:00:00.000' AS DateTime), CAST(N'2019-07-20T00:00:00.000' AS DateTime), 50, N'Summer Discount', CAST(N'2019-07-02T13:30:57.180' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Promotion] OFF
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([Id], [AppointmentId], [Date], [RateNumber], [Comment]) VALUES (1, 22, CAST(N'2019-07-02T14:18:30.070' AS DateTime), 5, N'nice :)))')
SET IDENTITY_INSERT [dbo].[Review] OFF
SET IDENTITY_INSERT [dbo].[Salon] ON 

INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (74, N'Mùa Đông', N'Quang Trung, Gò Vấp, null', N'0123456789', 0, 0, 0, N'7208a15e-0f0b-4209-adb9-ebe2d9d08a79', 106.6440515, 10.8363395, N'nhi@gmail.com', 5)
SET IDENTITY_INSERT [dbo].[Salon] OFF
SET IDENTITY_INSERT [dbo].[SalonService] ON 

INSERT [dbo].[SalonService] ([Id], [SalonId], [ServiceId], [Price], [AvarageTime], [Disabled]) VALUES (21, 74, 1, 30000, 15, 0)
INSERT [dbo].[SalonService] ([Id], [SalonId], [ServiceId], [Price], [AvarageTime], [Disabled]) VALUES (22, 74, 3, 30000, 15, 0)
INSERT [dbo].[SalonService] ([Id], [SalonId], [ServiceId], [Price], [AvarageTime], [Disabled]) VALUES (23, 74, 8, 200000, 60, 0)
SET IDENTITY_INSERT [dbo].[SalonService] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (1, N'Cắt tóc nam', 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (3, N'Cắt tóc nữ', 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (4, N'Cắt tóc', 2)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (5, N'Gội đầu', 2)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (6, N'Bính tóc', 2)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (7, N'Nhuộm tóc nam', 3)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (8, N'Nhuộc tóc nữ', 3)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (9, N'Phủ bóng', 3)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (10, N'Nhuộm Hena ( Thuốc nhuộm dạng bột )', 3)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (11, N'Móc Light', 3)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (12, N'Uốn tóc lạnh', 4)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (13, N'Uốn tóc nóng', 4)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (14, N'Duỗi tóc', 4)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (15, N'Nhuộm 1 điểm trên tóc', 4)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (16, N'Uốn duỗi 1 điểm trên tóc', 4)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (17, N'Phục hồi ( Phủ nano )', 5)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (18, N'Milbon ( Phủ nano ) ', 5)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (19, N'Massage đầu', 6)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (20, N'Massage thư giãn ( gội , massege mặt, đầu )', 6)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (21, N'Massage đặc biệt ( sản phẩm chuyển dụng ) ', 6)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (22, N'Làm móng', 7)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (23, N'Sơn móng ', 7)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (24, N'Rửa mặt', 8)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (25, N'Tỉa chân mày', 8)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (26, N'Cạo râu ', 8)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId]) VALUES (27, N'Ráy tai', 8)
SET IDENTITY_INSERT [dbo].[Service] OFF
INSERT [dbo].[ServiceAppointment] ([AppointmentId], [ServiceId], [Price], [CancelledReason]) VALUES (21, 21, 30000, NULL)
INSERT [dbo].[ServiceAppointment] ([AppointmentId], [ServiceId], [Price], [CancelledReason]) VALUES (22, 21, 30000, NULL)
INSERT [dbo].[ServiceAppointment] ([AppointmentId], [ServiceId], [Price], [CancelledReason]) VALUES (23, 21, 30000, NULL)
INSERT [dbo].[ServiceAppointment] ([AppointmentId], [ServiceId], [Price], [CancelledReason]) VALUES (24, 23, 200000, NULL)
SET IDENTITY_INSERT [dbo].[ServiceCategory] ON 

INSERT [dbo].[ServiceCategory] ([Id], [Name]) VALUES (1, N'Cắt tóc')
INSERT [dbo].[ServiceCategory] ([Id], [Name]) VALUES (2, N'Trẻ em')
INSERT [dbo].[ServiceCategory] ([Id], [Name]) VALUES (3, N'Nhuộm màu')
INSERT [dbo].[ServiceCategory] ([Id], [Name]) VALUES (4, N'Uốn và duỗi ')
INSERT [dbo].[ServiceCategory] ([Id], [Name]) VALUES (5, N'Phục hồi tóc')
INSERT [dbo].[ServiceCategory] ([Id], [Name]) VALUES (6, N'Massage ')
INSERT [dbo].[ServiceCategory] ([Id], [Name]) VALUES (7, N'Nail')
INSERT [dbo].[ServiceCategory] ([Id], [Name]) VALUES (8, N'Dịch vụ khác')
SET IDENTITY_INSERT [dbo].[ServiceCategory] OFF
SET IDENTITY_INSERT [dbo].[SlotTime] ON 

INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6139, 74, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6140, 74, CAST(N'2019-07-08T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6141, 74, CAST(N'2019-07-15T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6142, 74, CAST(N'2019-07-22T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6143, 74, CAST(N'2019-07-29T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6144, 74, CAST(N'2019-07-02T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6145, 74, CAST(N'2019-07-09T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6146, 74, CAST(N'2019-07-16T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6147, 74, CAST(N'2019-07-23T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6148, 74, CAST(N'2019-07-30T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6149, 74, CAST(N'2019-07-03T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6150, 74, CAST(N'2019-07-10T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6151, 74, CAST(N'2019-07-17T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6152, 74, CAST(N'2019-07-24T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6153, 74, CAST(N'2019-07-31T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6154, 74, CAST(N'2019-07-04T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6155, 74, CAST(N'2019-07-11T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6156, 74, CAST(N'2019-07-18T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6157, 74, CAST(N'2019-07-25T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6158, 74, CAST(N'2019-07-05T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6159, 74, CAST(N'2019-07-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6160, 74, CAST(N'2019-07-19T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6161, 74, CAST(N'2019-07-26T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6162, 74, CAST(N'2019-07-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6163, 74, CAST(N'2019-07-13T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6164, 74, CAST(N'2019-07-20T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [SalonId], [SlotDate], [Slot1], [Slot2], [Slot3], [Slot4], [Slot5], [Slot6], [Slot7], [Slot8], [Slot9], [Slot10], [Slot11], [Slot12], [Slot13], [Slot14], [Slot15], [Slot16], [Slot17], [Slot18], [Slot19], [Slot20], [Slot21], [Slot22], [Slot23], [Slot24], [Slot25], [Slot26], [Slot27], [Slot28], [Slot29], [Slot30], [Slot31], [Slot32], [Slot33], [Slot34], [Slot35], [Slot36], [Slot37], [Slot38], [Slot39], [Slot40], [Slot41], [Slot42], [Slot43], [Slot44], [Slot45], [Slot46], [Slot47], [Slot48], [Slot49], [Slot50], [Slot51], [Slot52], [Slot53], [Slot54], [Slot55], [Slot56], [Slot57], [Slot58], [Slot59], [Slot60], [Slot61], [Slot62], [Slot63], [Slot64], [Slot65], [Slot66], [Slot67], [Slot68], [Slot69], [Slot70], [Slot71], [Slot72], [Slot73], [Slot74], [Slot75], [Slot76], [Slot77], [Slot78], [Slot79], [Slot80], [Slot81], [Slot82], [Slot83], [Slot84], [Slot85], [Slot86], [Slot87], [Slot88], [Slot89], [Slot90], [Slot91], [Slot92], [Slot93], [Slot94], [Slot95], [Slot96]) VALUES (6165, 74, CAST(N'2019-07-27T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SlotTime] OFF
SET IDENTITY_INSERT [dbo].[WorkingHour] ON 

INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (38, 74, 0, CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (39, 74, 1, CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (40, 74, 2, CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), 0)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (41, 74, 3, CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), 0)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (42, 74, 4, CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), 0)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (43, 74, 5, CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), 0)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (44, 74, 6, CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), 0)
SET IDENTITY_INSERT [dbo].[WorkingHour] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 02/07/2019 3:14:52 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 02/07/2019 3:14:52 CH ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 02/07/2019 3:14:52 CH ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 02/07/2019 3:14:52 CH ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 02/07/2019 3:14:52 CH ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 02/07/2019 3:14:52 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Customer]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Promotion] FOREIGN KEY([PromotionId])
REFERENCES [dbo].[Promotion] ([Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Promotion]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ClosedDay]  WITH CHECK ADD  CONSTRAINT [FK_ClosedDay_Salon] FOREIGN KEY([SalonId])
REFERENCES [dbo].[Salon] ([Id])
GO
ALTER TABLE [dbo].[ClosedDay] CHECK CONSTRAINT [FK_ClosedDay_Salon]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_AspNetUsers] FOREIGN KEY([AccountId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_AspNetUsers]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Salon] FOREIGN KEY([SalonId])
REFERENCES [dbo].[Salon] ([Id])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Salon]
GO
ALTER TABLE [dbo].[Promotion]  WITH CHECK ADD  CONSTRAINT [FK_Promotion_Salon] FOREIGN KEY([SalonId])
REFERENCES [dbo].[Salon] ([Id])
GO
ALTER TABLE [dbo].[Promotion] CHECK CONSTRAINT [FK_Promotion_Salon]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Appointment] FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointment] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Appointment]
GO
ALTER TABLE [dbo].[Salon]  WITH CHECK ADD  CONSTRAINT [FK_Salon_AspNetUsers] FOREIGN KEY([AccountId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Salon] CHECK CONSTRAINT [FK_Salon_AspNetUsers]
GO
ALTER TABLE [dbo].[SalonService]  WITH CHECK ADD  CONSTRAINT [FK_SalonService_Salon] FOREIGN KEY([SalonId])
REFERENCES [dbo].[Salon] ([Id])
GO
ALTER TABLE [dbo].[SalonService] CHECK CONSTRAINT [FK_SalonService_Salon]
GO
ALTER TABLE [dbo].[SalonService]  WITH CHECK ADD  CONSTRAINT [FK_SalonService_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[SalonService] CHECK CONSTRAINT [FK_SalonService_Service]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_ServiceCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[ServiceCategory] ([Id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_ServiceCategory]
GO
ALTER TABLE [dbo].[ServiceAppointment]  WITH CHECK ADD  CONSTRAINT [FK_ServiceAppointment_Appointment] FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointment] ([Id])
GO
ALTER TABLE [dbo].[ServiceAppointment] CHECK CONSTRAINT [FK_ServiceAppointment_Appointment]
GO
ALTER TABLE [dbo].[ServiceAppointment]  WITH CHECK ADD  CONSTRAINT [FK_ServiceAppointment_SalonService] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[SalonService] ([Id])
GO
ALTER TABLE [dbo].[ServiceAppointment] CHECK CONSTRAINT [FK_ServiceAppointment_SalonService]
GO
ALTER TABLE [dbo].[SlotAppointment]  WITH CHECK ADD  CONSTRAINT [FK_SlotAppointment_Appointment] FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointment] ([Id])
GO
ALTER TABLE [dbo].[SlotAppointment] CHECK CONSTRAINT [FK_SlotAppointment_Appointment]
GO
ALTER TABLE [dbo].[SlotAppointment]  WITH CHECK ADD  CONSTRAINT [FK_SlotAppointment_SlotTime] FOREIGN KEY([SlotId])
REFERENCES [dbo].[SlotTime] ([Id])
GO
ALTER TABLE [dbo].[SlotAppointment] CHECK CONSTRAINT [FK_SlotAppointment_SlotTime]
GO
ALTER TABLE [dbo].[SlotTime]  WITH CHECK ADD  CONSTRAINT [FK_SlotTime_Salon] FOREIGN KEY([SalonId])
REFERENCES [dbo].[Salon] ([Id])
GO
ALTER TABLE [dbo].[SlotTime] CHECK CONSTRAINT [FK_SlotTime_Salon]
GO
ALTER TABLE [dbo].[WorkingHour]  WITH CHECK ADD  CONSTRAINT [FK_WorkingHour_Salon] FOREIGN KEY([SalonId])
REFERENCES [dbo].[Salon] ([Id])
GO
ALTER TABLE [dbo].[WorkingHour] CHECK CONSTRAINT [FK_WorkingHour_Salon]
GO
USE [master]
GO
ALTER DATABASE [CatTocDi] SET  READ_WRITE 
GO
