USE [master]
IF EXISTS 
   (
     SELECT name FROM master.dbo.sysdatabases 
    WHERE name = N'CatTocDi'
    )
BEGIN
    DROP DATABASE [CatTocDi]
END 
GO
/****** Object:  Database [CatTocDi]    Script Date: 11/5/2018 10:59:06 AM ******/
CREATE DATABASE [CatTocDi]
GO 
USE [CatTocDi]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/5/2018 10:59:06 AM ******/
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
/****** Object:  Table [dbo].[Appointment]    Script Date: 11/5/2018 10:59:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppointmentId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[BookedDate] [date] NOT NULL,
	[Duration] [int] NOT NULL,
	[TimeSlot] [time](7) NOT NULL,
	[PromotionId] [int] NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/5/2018 10:59:07 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/5/2018 10:59:07 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/5/2018 10:59:07 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/5/2018 10:59:07 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/5/2018 10:59:07 AM ******/
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
/****** Object:  Table [dbo].[ClosedDay]    Script Date: 11/5/2018 10:59:07 AM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 11/5/2018 10:59:07 AM ******/
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
/****** Object:  Table [dbo].[Image]    Script Date: 11/5/2018 10:59:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [varchar](max) NOT NULL,
	[Type] [bit] NOT NULL,
	[SalonId] [int] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 11/5/2018 10:59:07 AM ******/
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
	[PostDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 11/5/2018 10:59:07 AM ******/
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
/****** Object:  Table [dbo].[Salon]    Script Date: 11/5/2018 10:59:07 AM ******/
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
/****** Object:  Table [dbo].[SalonService]    Script Date: 11/5/2018 10:59:07 AM ******/
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
/****** Object:  Table [dbo].[Service]    Script Date: 11/5/2018 10:59:07 AM ******/
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
/****** Object:  Table [dbo].[ServiceAppointment]    Script Date: 11/5/2018 10:59:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceAppointment](
	[AppointmentId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_ServiceAppointment] PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC,
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceCategory]    Script Date: 11/5/2018 10:59:07 AM ******/
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
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 11/5/2018 10:59:07 AM ******/
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
/****** Object:  Table [dbo].[WorkingHour]    Script Date: 11/5/2018 10:59:07 AM ******/
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
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'Salon')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'User')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'114141825114713698554', N'3c684753-567c-40ca-b467-ff181f94db4c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c90ecce7-6917-4a49-ac8b-e52ea9d82dce', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1a0e725d-d934-4738-b5fc-72e76a39706b', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'494c3e42-7ea9-41d7-8aa4-e6627f2dac2c', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9d70badd-8c8d-4ccf-88c3-28bfdb1c5a5c', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'00ae6bb2-d8b1-4cf7-8445-c6d095becce7', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'00ce07e1-fff4-4a55-a2d3-d5b0174e1c94', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0253e164-a120-453f-b8f0-6ee9b8feef7d', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0a8c9868-1c6d-4331-b11c-80df878f8893', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0b62464f-83a9-46b7-9085-102b830246e0', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0dd91ec1-a643-4d7d-bd46-9047698e24f1', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1074ea52-cbb2-4b6a-8963-deb043bb0146', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'195bcc19-14f1-4dd0-9332-5a841831da27', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'287ba2a2-1cf2-42f9-8659-e1d684db55be', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2b543c30-11f4-4e1b-8898-b31f7a844cac', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2daed559-0690-4b48-9afa-22f12e58f562', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2e818e95-9231-4b5c-bf77-0457247ca97a', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'347371f8-471f-45a6-bf78-8cd78be136e1', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'34877506-34d2-43ce-a6cd-e7df938c2d63', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'37a3cb67-3d1a-48d6-b5e0-ec5b9090e90d', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3aa60233-bad9-44d9-88f4-6ae3cf707bcf', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3d2ac2dc-e3fc-490e-85ac-6c2a5614b787', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3f5576b5-b4f4-4d36-a901-12974ffd4d86', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'40a42fca-8eef-4ba7-8780-2c818f89eceb', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'410f904e-b141-4ed7-a72f-4b6a32fb1cb7', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4127e7ed-d988-4e13-98d2-45846d537253', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4383a90c-b83f-4791-98d7-c5141d0e4968', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'44f73d00-9d86-4862-bc2e-5acb390055c3', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'46d18674-3595-44a0-81f8-2226c38ed015', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'47af57e4-62cd-428f-98b5-9a957a7d724a', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'48fcf80a-6249-471a-a5dc-7385e74be23d', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4ae64dab-1a56-4158-8759-4ade5d9aa325', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4f864a91-9aaa-4532-bba0-59c4253e8357', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'50124999-cc87-4343-a212-4ed6a925130f', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'503a2ed2-5d07-4e61-963d-e03082167023', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'516bfaf7-e18b-473e-a698-5b880034f30d', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5267649e-a997-4314-a283-29b913a8f91d', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'52d1991f-1667-4ff3-a4da-5cf67f49bb3e', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'532795a5-d283-438a-a98c-fa0c63d26e5d', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'537ac022-67f2-4709-9f3c-63002268ae4b', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'55837e83-152e-4d06-bbaa-0ec41d5559ad', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'581bb89a-82e7-47f7-89fb-32b894b2ce04', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'59507513-05cc-4628-a66e-42da8bb0fb53', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5966b84c-2f1d-48ad-b686-9df5c6b20b6e', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5d9ceea0-ec4a-4d37-a4f2-ed64a31119f3', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5e8da849-9bfa-4174-b0be-a419c814f307', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'61758182-baa4-47d2-a742-d1c97f6edc09', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6273521b-1333-4184-95d2-51b5c05611b7', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'627d2c7c-c335-47c3-8779-d78e29cd0a10', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'62a28c71-64e6-4b76-97e6-4c65acaf8e85', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6535a664-5d85-4285-8720-bfeef0a59100', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6587f4d8-8f04-4ea3-8eea-dc4b64c6861b', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'65ff9fbe-b112-42e8-aa4b-7eea2ff3f074', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6bf3751f-55d6-49eb-941b-62a3924e7bd3', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6c0e1245-3334-4ea0-b2d5-0f9b2cff2415', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'70256ad6-f61a-48c5-ad9c-eeced32be1fe', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7219390c-5e7b-43e2-9476-231794083158', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7277bb9b-0fa1-4bcf-8ffc-23d4a42edd15', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'75df30f3-f3fb-424e-845e-6a50c0ca314b', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'77ed440f-ce2a-4c49-bde5-0d173252b376', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'79ef531d-9a9b-4539-a643-ba4b00347a84', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7dfbb46a-154b-4ff5-b166-326c940a1ec2', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7ec2ae46-30b4-40df-b8b1-c5afbeed3cec', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7efbf916-9c05-4cc7-a081-05e70f736e07', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'817512c7-605c-42b8-849b-120c89b5750f', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8266ffd8-c6e3-44d9-8c88-0bdbaeb0a7a1', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8619fcb9-409a-4a37-ac66-e2b16c0b4592', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8765644e-ab2a-4cf5-b3f6-5c00a1ac06c7', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8d6c3be1-04ed-460b-be67-d9012031b00b', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'925908ae-3474-4837-b47c-e706831b887e', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9291d9cc-b4c6-437d-ade1-87d652c3b841', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'95dae862-dfca-471c-8e2b-b8c700c664c4', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9656d9ea-483b-490f-abc7-b2b5abe7ce42', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'967a1bee-b6c8-40db-ab8d-d2ea2cd4bb95', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a00abed3-0243-4dc0-b86f-9972b06649b2', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a07fbf24-04e0-4120-9ed9-5b9eb4647aaa', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a0e525bf-9201-4036-aab8-f52a29871aca', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a18c8e42-45c3-4fb0-be2b-b91ae09a1920', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a3879bfe-f151-46a7-8d67-da066a08d70d', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a5adf3d4-8d63-4f20-8b95-637e2b481b75', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a6e183f7-09ad-402e-b6ea-cac0718a0cd8', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a7f38b16-65b9-42d7-a7f5-7ce1c8ba1cd7', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a9393ca5-216d-4fdb-a687-82c330ea2b44', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'aa8f8719-107f-4cd9-aa3e-5c71a562dca6', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ab1b4196-bf85-4d88-9872-7d5ea5f94466', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ab244d06-9131-42dc-aa43-6bdf75a532a0', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'aba0a3c0-1e78-400a-a0c9-94fa3c85a4e1', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b1c02aeb-3edd-44ca-b860-5ce72bb641d8', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b224835c-1cee-43da-81a9-fc8c8b7bdc3c', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b29a4d63-69a7-44ed-962e-948d70880263', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b65b96b3-d4fe-409e-a4a1-43215d164af1', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b8488729-991e-461d-bb86-d0794a9723cd', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b9ed1e76-2fa8-4901-933c-1ef52e9a58eb', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ba34a8b1-f5e7-4fbd-afa4-775bfb4054c4', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bd4a5dfc-d73c-42f1-874b-7c19bfdec5f8', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bd55449c-b311-4490-9488-de815b7f3b6d', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'be175e21-d91b-4c97-86a2-4766498f2966', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bebcdfe6-55b4-4ac6-a789-676d66bd59c7', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c02e16ae-a37e-4847-8544-420f315db718', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c079aabb-3016-4cb8-a9c2-bb71e4ed60d9', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c08bbfec-e872-4448-a41f-274f67ce5eb5', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c1026326-0926-400c-a3d8-74e5e5f16b57', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c4335bb4-5cd7-4bcc-87ef-8bd97fa577c8', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c8c7a523-9d35-4062-b0e7-5ab06f23cc25', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cc12f343-023d-4ec9-a46d-922a47212718', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ced801b5-c665-47e5-9298-9542db5ce143', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd1d085d8-2bba-4712-8d7f-c77cf503fb0b', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd33572a6-c5d7-4e63-a9cc-9562d399d08a', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd4f237dd-5fbb-4ec0-94b8-9b4c14c7939f', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd6854394-9aa0-49ae-ac55-9c0d33e640f5', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'db281539-e855-4780-a28b-11b6e419f1ef', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'dbe33d97-41c0-4efd-9b1a-0b797a8fdb80', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ddb6500c-7a88-47bb-a761-f505d0e46e4b', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'df7c8436-d602-4405-b5a1-df3bd8a198b6', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e04e3781-ae66-46e4-99cb-bc1bbf61b96f', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e0a230ad-7533-442e-8525-a021c03f8117', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e16e764a-e44b-4ba0-bc35-124117dba335', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e5f95bdb-e8da-4e70-bdb1-a3d6dc05bb6f', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e6ab717f-1642-4ae8-a7ff-a8a6e2b38bd9', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e9fcdc7a-f5f8-4951-a99c-e7543bfa5f52', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'eccfe0f9-a209-4e84-8f0b-86702c4e7c52', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ecd60616-88f0-496e-b855-95aa836518cd', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ed388cff-742a-44ee-81a4-a5b085b95552', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ee5daaab-11e1-47d1-a914-84e7dd8f0356', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'efc6b732-de2f-4316-a3ec-a50551ed2fd1', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f21218e5-5165-4582-b982-6f519d0f96a5', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f2cf9394-4f8e-4728-be06-88d5a52c3cd5', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f95f52b1-cff3-4a36-9963-c6ec60156b8f', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fab21236-8033-489c-9612-5c82a74d50e0', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fad3bb71-1390-4009-894f-3cfb842d3e16', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fbdbd344-69ae-4c20-b54e-8c9bd81d09a1', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fd418ed7-8fa7-4a14-b3b8-96c609e7c5f6', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fd64649b-2d66-4aac-8630-ee4bff6183af', N'3')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'00ae6bb2-d8b1-4cf7-8445-c6d095becce7', N'nhi@gmail.com', 0, N'AAC4tbJTZxvZ7G+jAN4rRJ7IxIh2VWWhaE+Zoua0vphKZtk9IsqUYh+23DhNWJ5kOA==', N'f92c9a94-84ad-4a35-8a87-7fb6e28d74a6', NULL, 0, 0, NULL, 0, 0, N'odjdnd')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'00ce07e1-fff4-4a55-a2d3-d5b0174e1c94', N'nhi@gmail.com', 0, N'AKgN8haYNNTuzAm+fq5lOC6n3wplOBhqPDk/5dDL67pVVfH3Rbt/4MJ/LSxlbyzSaw==', N'8a917341-717a-4311-89ef-527a2c34a962', NULL, 0, 0, NULL, 0, 0, N'testne')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0253e164-a120-453f-b8f0-6ee9b8feef7d', N'nhi@gmail.com', 0, N'ANVCEbCpA3G3nLYdR5qzxK9b8/zoCMtjrHO88bGtDl5fr+8zgE6ILsVpAR69O5wmmA==', N'e95b261d-339d-452e-9850-7eb4aae29f85', N'0123456789', 0, 0, NULL, 0, 0, N'muathu13')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0a8c9868-1c6d-4331-b11c-80df878f8893', N'nhi@gmail.com', 0, N'AMx9HL9LKgpk6iIhZ9LveFtin5JqRbNJEUFtM1q/YGqE83pPUZ23AuAbHcIXiyhe0w==', N'0d94d0f3-3326-43c0-adae-facac09e3f32', N'0123456789', 0, 0, NULL, 0, 0, N'muadong34')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0b62464f-83a9-46b7-9085-102b830246e0', N'nhi@gmail.com', 0, N'AGst8pBrKQIiJnpXUmLgwD/vqbTYkuVRghu73dV8bjB/LrgXW2fA7i16Arbkc5kINA==', N'f7611291-d44b-4bcf-9a64-dc380cb18c06', NULL, 0, 0, NULL, 0, 0, N'099999667')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0dd91ec1-a643-4d7d-bd46-9047698e24f1', N'nhi@gmail.com', 0, N'ABIFtbOCqvzb8n1bMnx5D/G1k/MTFHaQf+24zjF0ykHqVcG9cFFHztK4lYG2PiQ8GA==', N'3795bde4-2c4f-45be-a798-fd0628db994a', NULL, 0, 0, NULL, 0, 0, N'sjsu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1074ea52-cbb2-4b6a-8963-deb043bb0146', N'nhi@gmail.com', 0, N'APhwgtbqfTxrDYjwlMXRp1U8HapVLEvZgc3e2HT0SX/1ttGZeOTZ1OsL7sb3luGQVw==', N'430cf65d-96ac-4ca5-abf5-6e8734e7c3be', N'0123456789', 0, 0, NULL, 0, 0, N'muathu11')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'195bcc19-14f1-4dd0-9332-5a841831da27', N'nhi@gmail.com', 0, N'ALLU+iLJDkWxwr5fph56NJeEnUc0Mn3LOapP+iPlLVU8EmrQFRXGyFKDngZivejfnA==', N'c4413a85-b594-4338-97a6-a3ee5035d641', N'0123456789', 0, 0, NULL, 0, 0, N'muathu15')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1a0e725d-d934-4738-b5fc-72e76a39706b', N'tiendat@gmail.com', 1, N'APKRekyOBD21kPhCAtxt9Tkj4FqzwOEY6VF2L0dLRQZ1+jEfnJluQ3a8J9AnP+68LQ==', N'a7b9a00f-7a73-43c1-b74e-71c90a183acf', NULL, 0, 0, NULL, 0, 0, N'tiendat@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'287ba2a2-1cf2-42f9-8659-e1d684db55be', N'nhi@gmail.com', 0, N'ACvZxcCYLCiG2O6flhkGB4d/kAahzinsK1TPgzhG56kYkXAdgCPrpFrOg/Aifis8cQ==', N'7661d8d0-12bb-4405-bbe7-84121f750e8f', N'0123456789', 0, 0, NULL, 0, 0, N'QuocCuongydhjfj')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2b543c30-11f4-4e1b-8898-b31f7a844cac', N'nhi@gmail.com', 0, N'AAiXiGeKi6UlRPwOy92qWE2oVK/gHQ/SripEphh4/1LNubBsSvrO1DqN2RodqUIcjA==', N'e8bbe8cf-e3a1-4b2b-9465-b1ed236f12b5', N'0123456789', 0, 0, NULL, 0, 0, N'muathu6')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2daed559-0690-4b48-9afa-22f12e58f562', N'nhi@gmail.com', 0, N'AFYi9lhqnfz94LOevndIomjhiPEMfqnb53/JN4Y5QZPnv0H+/rDCJOOLthiORQ5TSg==', N'e99cb7cf-79be-4dfc-a4c5-326c753b4a36', N'0123456789', 0, 0, NULL, 0, 0, N'muathurungla')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2e818e95-9231-4b5c-bf77-0457247ca97a', N'nhi@gmail.com', 0, N'AJ1zkcEoWQjq0BGFr47/DVdck0DQmRYwZmChlRxYU+sg9cD9WCRIez79MqmOnsEq0A==', N'e5ffa02f-5828-4d1e-ae45-6aadabe4830d', N'0123456789', 0, 0, NULL, 0, 0, N'lop')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'347371f8-471f-45a6-bf78-8cd78be136e1', N'nhi@gmail.com', 0, N'AHH3Tq/3a7q/U8xeo0O3ikQcPSl9wmXdtl8LpNcOukRyIY3X32ZDCrFILOe5o+1taA==', N'f3dfb2cb-89e8-42a3-8a30-a0c75524e5e6', NULL, 0, 0, NULL, 0, 0, N'QuocCuonghhh')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'34877506-34d2-43ce-a6cd-e7df938c2d63', N'nhi@gmail.com', 0, N'ADNs00sJTckmJUHggY3286cW16gYrndLe/X5wxn/AZaOMaacH6l6I9t7sueAp/M3pg==', N'66f6ba2b-8546-444e-9675-ecece052f3f5', NULL, 0, 0, NULL, 0, 0, N'Nhi')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'37a3cb67-3d1a-48d6-b5e0-ec5b9090e90d', N'nhi@gmail.com', 0, N'AGcUjD0bLONg0c0FtHcJckjbq64aA1KD4Y8vyXF2ZzFUNxWQdB+1VcxfVmsprncYhQ==', N'98f996d7-fc15-40e6-b76b-391aa205bda9', NULL, 0, 0, NULL, 0, 0, N'cccjruu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3aa60233-bad9-44d9-88f4-6ae3cf707bcf', N'nhi@gmail.com', 0, N'AKf/l9AtR3Rg4YRHxtEbO4OzzWVOXuSLgUzHNN44Ni4Th77R4NSqVCGaWSPOHiuxqg==', N'74cf506c-b7d8-4d62-993a-c765a6158b72', NULL, 0, 0, NULL, 0, 0, N'oft')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3c684753-567c-40ca-b467-ff181f94db4c', N'tiendatdeveloper1997@gmail.com', 0, NULL, N'93bbe6ff-d535-42ab-8993-3995257ee5f9', NULL, 0, 0, NULL, 0, 0, N'tiendatdeveloper1997@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3d2ac2dc-e3fc-490e-85ac-6c2a5614b787', N'dylan@gmail.com', 0, N'ABHupzDKueL3/choClqKqxrchEpmpckpTevtF+HzNegsQXKek4tnkX2DVfMffWejPw==', N'103e68d2-5199-4616-9cc0-857cf1efcd80', N'01234412424', 0, 0, NULL, 0, 0, N'lovengoc2')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3f5576b5-b4f4-4d36-a901-12974ffd4d86', N'nhi@gmail.com', 0, N'ABGnb7Er/OTMhXaoTfmIb607EtLIJC7P4KNRNffG7RlASc74eydEdUIrelLsGkWilA==', N'e9979ce3-26a1-4ba6-923e-b3d1a8558428', N'0123456789', 0, 0, NULL, 0, 0, N'muathu5')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'40a42fca-8eef-4ba7-8780-2c818f89eceb', N'nhi@gmail.com', 0, N'AKHNvE88riZ/u6X7vvNRj/CWkyoxAr7wDHoOSkXu0GsS5RCSak/efAk3wTvYChYXjw==', N'cf8883e5-6d13-4c25-b8c5-71f00d778ee7', N'0123456789', 0, 0, NULL, 0, 0, N'muathu3')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'410f904e-b141-4ed7-a72f-4b6a32fb1cb7', N'nhi@gmail.com', 0, N'AC7oM+PgC2T9j36++zIbP4IWMKC7LJJZri40cOr6Uiu4fyJv6dZT38mWKyXM+Be1TA==', N'cf198894-008d-4060-875a-298fa206e705', N'0123456789', 0, 0, NULL, 0, 0, N'Qerr')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4127e7ed-d988-4e13-98d2-45846d537253', N'nhi@gmail.com', 0, N'ANSby7QanoH6WvGWvSadwskUnjwGcBmmQszUGFVsTr66IwgNhdpn1nR77Y6wSPXwZQ==', N'fbc59917-7a59-4c08-8821-c68d447520c4', NULL, 0, 0, NULL, 0, 0, N'QuocCuonghds')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4383a90c-b83f-4791-98d7-c5141d0e4968', N'nhi@gmail.com', 0, N'ALIFzevV73g6m21AKbXCGADabuTS8zx6KmBYyjvgdTs9Wrkg6/OJh3VC8DdiGqn9bA==', N'3e6d6d1d-2be6-4c05-bc8b-56bb2c1ca001', NULL, 0, 0, NULL, 0, 0, N'QuocCubhhhong')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'44f73d00-9d86-4862-bc2e-5acb390055c3', N'nhi@gmail.com', 0, N'AJhG0/OHUjOrINGeEiQBi9NBx1bybANLM+qKAik7v8Df7fs8Q8E5GslL4Kpx4M3Jaw==', N'042c0be3-088d-49f1-9ff6-246c3c3723d7', N'0123456789', 0, 0, NULL, 0, 0, N'muathu17')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'46d18674-3595-44a0-81f8-2226c38ed015', N'nhi@gmail.com', 0, N'ABUQSuE36+Z9ykH8lRc2vKbQkYJPxAGYK9ObAreCdAFkKOjNAB6rLGx6wtrvsVSmyg==', N'4f155448-d092-4575-90cd-56ffa87ed18b', N'0123456789', 0, 0, NULL, 0, 0, N'muadong22')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'47af57e4-62cd-428f-98b5-9a957a7d724a', N'nhi@gmail.com', 0, N'AFBKgCdIrBQR1wEvWIV9621IMraavZRs/fer2R+Z4wqCL6JFNIP8fofr6sWJMXsZwA==', N'863295df-7d60-4249-b507-ad6d150d21f9', NULL, 0, 0, NULL, 0, 0, N'alaui')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'48fcf80a-6249-471a-a5dc-7385e74be23d', N'nhi@gmail.com', 0, N'AFu4RuX+1z4TUeB8bUfZQ7hlzTcAmlwu44wpMfe/fj2/XKwZaz9T8EhuvHQquhgv9A==', N'ab7e9792-faaa-4499-b070-ee416009ca57', N'0123456789', 0, 0, NULL, 0, 0, N'mua')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'494c3e42-7ea9-41d7-8aa4-e6627f2dac2c', N'thuyngoc@gmail.com', 0, N'AFUHAekP9uiDtfiENOGqpLicYsuQeDfZ98Np6+Pcx6+UzknAnY7NjBp2Mb6WGQ84aQ==', N'ef61c256-3738-4b32-aabe-341f52067c7b', NULL, 0, 0, NULL, 0, 0, N'thuyngoc')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4ae64dab-1a56-4158-8759-4ade5d9aa325', N'nhi@gmail.com', 0, N'AH4XdTaXPBNBHZ1mRpwUm288RWbzw3bI/ThBsjJwSTus9ab2ABHpIMPdKFGzDWI7xQ==', N'2806ce70-2c10-49d5-8944-6f84cd1276fa', N'0123456789', 0, 0, NULL, 0, 0, N'muadong2')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4f864a91-9aaa-4532-bba0-59c4253e8357', N'nhi@gmail.com', 0, N'AO6cDxxE0dtdJUEZ0ye30r48fTItioLjw2wF8qBEoKngbMaieQe2Oz2/IO2IhRj1Hw==', N'7bcc5c11-23bb-4587-b818-f1644bdb2cbc', N'0123456789', 0, 0, NULL, 0, 0, N'muadong100')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'50124999-cc87-4343-a212-4ed6a925130f', N'nhi@gmail.com', 0, N'ALmNfyzS3WHJpBOcv7n4MkDzXqGjbTA8F6rgRA3gGsSQj+jzh2PwGwJk1mAW+aogJw==', N'7c917a51-1393-49a1-9b85-3857d05b683d', N'0123456789', 0, 0, NULL, 0, 0, N'afg')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'503a2ed2-5d07-4e61-963d-e03082167023', N'nhi@gmail.com', 0, N'AKixQgLCvCdyaYgdMzAaDDCdJ7di8zQDdnfWkmCh5C8dfCcPJFvyun3R5IeiMnlI2w==', N'fff94418-16cd-47f3-b836-b2143518acf7', N'0123456789', 0, 0, NULL, 0, 0, N'Cat')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'516bfaf7-e18b-473e-a698-5b880034f30d', N'nhi@gmail.com', 0, N'AH4RDC+ddteMt8g8KymTBs3bA6TEc0AOA1h+tTopZkw0lkiVRzYqanAxHTcbIK1EYg==', N'7f25a6a9-22ea-46ab-aaca-ff5e1560c292', NULL, 0, 0, NULL, 0, 0, N'QuocCuongrfg')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5267649e-a997-4314-a283-29b913a8f91d', N'nhi@gmail.com', 0, N'AIBLiyU0awXtdADPxY11cb8bO1W/au0+xvhnUar0fWygawJ3eQOm4SpftXKW4OqfeQ==', N'98d417d7-a05a-482c-9f21-2c4b066efe88', NULL, 0, 0, NULL, 0, 0, N'473')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'52d1991f-1667-4ff3-a4da-5cf67f49bb3e', N'nhi@gmail.com', 0, N'AM8YPlSHABygwqZRAWfA7YFp6AdIE8uTvWCPQBIvPPpWpvPDBnr58Zre8KfLK02lCA==', N'547a4e03-bca2-4058-945e-003782a80de5', N'0123456789', 0, 0, NULL, 0, 0, N'muadong7')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'532795a5-d283-438a-a98c-fa0c63d26e5d', N'nhi@gmail.com', 0, N'AB3/hYU71/5X69wTp+E5XaBjLrmvFegtFCwKapyUT1rlyCu/k8n/+NUfKObUK+RY7Q==', N'390357d8-5ecf-4ebf-bc66-29436a7adebb', NULL, 0, 0, NULL, 0, 0, N'729')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'537ac022-67f2-4709-9f3c-63002268ae4b', N'nhi@gmail.com', 0, N'AKSfVKYpIYC2r3R7uHwtx4It9ez0Hj63MEsydSnRmGv968HBdOfAEAdXCeL9OfbH3w==', N'd0a587d3-e19b-46fb-afbe-43db32d24e38', N'0123456789', 0, 0, NULL, 0, 0, N'Quocdooo')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'55837e83-152e-4d06-bbaa-0ec41d5559ad', N'nhi@gmail.com', 0, N'ADkOR4gnbDgwN75O5wah7gyFV26fUaS7pD7HayaAalo72oGPAyTgForsYYpY9tWkeA==', N'6971552e-0fd5-4c6e-bf1b-04204c6e5b4b', N'0123456789', 0, 0, NULL, 0, 0, N'muathu4')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'581bb89a-82e7-47f7-89fb-32b894b2ce04', N'nhi@gmail.com', 0, N'ALyeJu4rvcaWZp9O6/RlBkN9qpXwy5vceswbyaTHeOg/4H+5j5nPTIGXqnT61WQASw==', N'13ad87d7-d40c-4d27-9661-1c167e427240', N'0123456789', 0, 0, NULL, 0, 0, N'lj')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'59507513-05cc-4628-a66e-42da8bb0fb53', N'nhi@gmail.com', 0, N'AA6rQ5hsx5PfNPYr0sbHZxAuEkoVPgQCmLkn1nFGP21uNkTKTJQGPOUMLImBeUOeag==', N'053f1756-70a9-43fd-9c8a-6728b2979937', NULL, 0, 0, NULL, 0, 0, N'5736')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5966b84c-2f1d-48ad-b686-9df5c6b20b6e', N'nhi@gmail.com', 0, N'ADQXSZhPhfVqLUOvkIiP1mN7ImZNxpGtroP9/O682vIGnpo3SZUXb+aHf6JOn20BSw==', N'650b08f9-aa23-4468-afe5-5354c00bd4eb', NULL, 0, 0, NULL, 0, 0, N'QuocCuong')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5d9ceea0-ec4a-4d37-a4f2-ed64a31119f3', N'nhi@gmail.com', 0, N'AF74nJ+evI4dbZOEOYDUsSqRoCW5VH0iQVmRe2KifcIp96oUv/oSDIN3JvMnnnnOjw==', N'e928c003-865d-41ac-b0fa-227b8bf3fb79', NULL, 0, 0, NULL, 0, 0, N'ttttt')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5e8da849-9bfa-4174-b0be-a419c814f307', N'nhi@gmail.com', 0, N'ADWyhJ7AhXtdBo20xAd6bTdTU4EQDi98Pm7Be0/UPU/xZuniZym5YFAproEVqsPuqA==', N'3804370b-f98c-4a36-a393-6b702b131def', N'0123456789', 0, 0, NULL, 0, 0, N'muadonh12')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'61758182-baa4-47d2-a742-d1c97f6edc09', N'nhi@gmail.com', 0, N'AJuGqtC3OtGm5+jCe9eYuBM9Tq44MKOCuH7zAjNjgWy6cJp6uUMKUQM38QLCOCoFMQ==', N'a38af110-b325-4ddb-8ad5-21a911e2296a', NULL, 0, 0, NULL, 0, 0, N'ppppp')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6273521b-1333-4184-95d2-51b5c05611b7', N'nhi@gmail.com', 0, N'AIx5LSwg0EMr/OkLmSx4oe7nzncX5jgWXPLtEOkWswoZX6n/CTmAAssoidupWWKaNw==', N'b4705660-4b99-4442-80af-b846525f4531', NULL, 0, 0, NULL, 0, 0, N'QuocCuongjjy')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'627d2c7c-c335-47c3-8779-d78e29cd0a10', N'nhi@gmail.com', 0, N'AHLa/2zeOmZm1N4rKcL2xDqOSrUAnqAS35CWyujZoSgFJdi4uAagP7SehR/1VBQt6g==', N'e5668356-069e-4c14-b3a6-f88b94e63433', N'0123456789', 0, 0, NULL, 0, 0, N'muadong101')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'62a28c71-64e6-4b76-97e6-4c65acaf8e85', N'nhi@gmail.com', 0, N'ACHolnhfRqNlXZ44frinfwTcOUiXtgZBQAE82WQxLHWUUZqfRRKbxZVnNznjJPIdsw==', N'73f2315a-f2c8-4a54-9fa5-0c1df0593617', NULL, 0, 0, NULL, 0, 0, N'huawei')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6535a664-5d85-4285-8720-bfeef0a59100', N'nhi@gmail.com', 0, N'ANhDYajCnngoSXo1c869ukotiJZbGY8QT+vNHWuHTKeU8hyMad1xmFIxHJ2Sc+OQHA==', N'1b0f3485-c0ac-4f46-8af5-77b663c1862b', NULL, 0, 0, NULL, 0, 0, N'QuocCuongjfjfjh')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6587f4d8-8f04-4ea3-8eea-dc4b64c6861b', N'nhi@gmail.com', 0, N'AGe5whcbzkxr1DJyG7SewfsenvNs4OApEXshAk1aVlgKGv29HzXOS1aQPwZYkvPfBQ==', N'a910e395-f7cc-4e85-b330-ffcbac610dad', N'0123456789', 0, 0, NULL, 0, 0, N'QuocCuongkkkk')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'65ff9fbe-b112-42e8-aa4b-7eea2ff3f074', N'nhi@gmail.com', 0, N'AN+CUpS2hT154thS3phvJKPSb9rjOQSXR8ucJH5R1U7JNF1gBFhUcV7WdSCz87vmpw==', N'60ecb45b-42cb-4815-9c58-5c16553e2f49', N'0123456789', 0, 0, NULL, 0, 0, N'muathu26')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6bf3751f-55d6-49eb-941b-62a3924e7bd3', N'dylan@gmail.com', 0, N'ADoF87/Hbt1RRN70hqotDVz39xPYJOZcEMormXuiKzLRAgO3mJcENDsUqrFTqpG71w==', N'0105ea5b-787f-4b7a-b5ab-e1f51bbbc93c', N'01234412424', 0, 0, NULL, 0, 0, N'ngocuser124')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6c0e1245-3334-4ea0-b2d5-0f9b2cff2415', N'nhi@gmail.com', 0, N'AITNMJ7RND5rB0jWDda5P68mF/zCt3Z60BjMuaFKrACGS4B9qSPw0TCn4TM2X63prg==', N'c52a9382-c707-426f-8b43-966fb67bc80d', N'0123456789', 0, 0, NULL, 0, 0, N'ad')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'70256ad6-f61a-48c5-ad9c-eeced32be1fe', N'nhi@gmail.com', 0, N'AINvxgkJQtJxaaE90emjRJY5EryX6x4lAM0I9Zv5RzjvO69FWQZLRoXfVnfOl323pw==', N'83a321c7-3af6-44bc-856f-5000563541d6', N'0123456789', 0, 0, NULL, 0, 0, N'muadong102')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7219390c-5e7b-43e2-9476-231794083158', N'nhi@gmail.com', 0, N'APzDRQC84nDQdhMV3q6fvdjRXZ1dqmTR8dn1ENzCz4XFPamaNctV6ysryzbOJHo7cA==', N'9a844d9d-62e0-438e-a555-fdd5fb475d61', N'0123456789', 0, 0, NULL, 0, 0, N'poi')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7277bb9b-0fa1-4bcf-8ffc-23d4a42edd15', N'nhi@gmail.com', 0, N'ADOBzLVhXasjxerpEOHKZzI5/fJH9d5xDMQzbo53NVetc5jT7X8RHq/ZiGxuk/VIeg==', N'2a902c49-5a6b-4422-9b7d-8045958f86e1', N'0123456789', 0, 0, NULL, 0, 0, N'oo')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'75df30f3-f3fb-424e-845e-6a50c0ca314b', N'dylan@gmail.com', 0, N'ADUg9PMuiFQUp5RDWgg56Du/S2ZkaqeIaG5NvcKrIiY4E2b3iiLcI5MnrZBiosHhMw==', N'f646ee1b-7094-47a0-b28b-142d6d2df38e', N'01234412424', 0, 0, NULL, 0, 0, N'ngocuser')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'77ed440f-ce2a-4c49-bde5-0d173252b376', N'dylan@gmail.com', 0, N'AOCuVZA151Mww9PrpIDSDPOu1JMeNzrjStQ7bPTJuC3m30I6dIjK7jHz6KD9Di0ung==', N'a3430337-9d22-4263-a6ff-76b8b47ed3c1', N'01234412424', 0, 0, NULL, 0, 0, N'lovengoc')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'79ef531d-9a9b-4539-a643-ba4b00347a84', N'testsalon@gmail.com', 0, N'ALl8QE/Z6alAFs7f2RfOBF9HGhLyzx9QcpVeaN6Hm2i3jq682zHEavVfkVe6bDBD5g==', N'5699e9e7-9062-4277-87e3-193803e0d764', NULL, 0, 0, NULL, 0, 0, N'testsalon')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7dfbb46a-154b-4ff5-b166-326c940a1ec2', N'nhi@gmail.com', 0, N'APKRO/JCjBmqp3IlemCMyDDw8IeoAOgsDA/F1F9TheyJIYSFt8DyLw+yiuD0sWWzEQ==', N'39e9509c-2083-423b-beb0-0b7c39ff86fb', N'0123456789', 0, 0, NULL, 0, 0, N'uitoe')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7ec2ae46-30b4-40df-b8b1-c5afbeed3cec', N'nhi@gmail.com', 0, N'AAqGOHF/jMHkxfw3x3LUzsXEnWbN9srnC9XZL1jsLd7LB4je8Z/sJ8jHOcB3zYMtVA==', N'd4fe9f6d-f0bd-4b69-a742-6e3da8f4506c', NULL, 0, 0, NULL, 0, 0, N'ha')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7efbf916-9c05-4cc7-a081-05e70f736e07', N'nhi@gmail.com', 0, N'AM5FxqOC67QTZrNTD0Z95gso2sXpEZDFxPW1PMxwOeDtn8WelUEGS8CCANpAlvgRJA==', N'7a700e78-99d1-43db-9135-140a22e94451', N'0123456789', 0, 0, NULL, 0, 0, N'QuocCuongfuchch')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'817512c7-605c-42b8-849b-120c89b5750f', N'nhi@gmail.com', 0, N'AOQ7C3gdSvK+EH+6asUVZKBjxA+ZYOKZogC0RxzCiW08ZRCITxOXfe3DITst7XhbeQ==', N'3b4a3730-e658-457f-8a4f-de642e4a541d', NULL, 0, 0, NULL, 0, 0, N'uuuuu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8266ffd8-c6e3-44d9-8c88-0bdbaeb0a7a1', N'nhi@gmail.com', 0, N'AIDdT3z5LOa82DYDywjXKXHVh0PDqgxtv1pertTLC4S9YsNaFuQ0Ief1cQHyoobggA==', N'bcb37081-278e-4724-9d70-93558459b030', NULL, 0, 0, NULL, 0, 0, N'huaweit')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8619fcb9-409a-4a37-ac66-e2b16c0b4592', N'nhi@gmail.com', 0, N'ALyoqkV7/PSelTypzDLMaheVkKXTcFrMfWaRP8hPZcRKlX8Air5gmReV0ETYXZ1mYA==', N'50267ef8-0fee-43c6-8064-f4925122e27e', N'0123456789', 0, 0, NULL, 0, 0, N'muatgu24')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8765644e-ab2a-4cf5-b3f6-5c00a1ac06c7', N'nhi@gmail.com', 0, N'AN8F+8nmFhvC3U9wG//lTqd6OaDN5XfCfBKLCbzCanSCTGGCU6EebN1n4Z7NXrVCHQ==', N'd9aa3bd6-f9c7-4717-9be6-4561c4dfb8a2', N'0123456789', 0, 0, NULL, 0, 0, N'muathu8')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8d6c3be1-04ed-460b-be67-d9012031b00b', N'nhi@gmail.com', 0, N'AK7fQ+JV7rEkeHf/rsi6LFJfHNOZTLaHylg0baTHBL22zZjnjGoVHOBY9wXZ9m1uAA==', N'297a6cbb-a77c-4d75-a7cd-ee176ddd12e6', N'0123456789', 0, 0, NULL, 0, 0, N'muadong27')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'925908ae-3474-4837-b47c-e706831b887e', N'nhi@gmail.com', 0, N'AH56yEbgcEPeO50HUJhnhlcGEdNzXIPAzCuyrpaiwdVku0w7J7LS4SPqLByIgBpYaw==', N'544df391-f149-4436-9561-910cb905a7d2', N'0123456789', 0, 0, NULL, 0, 0, N'muadong21')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9291d9cc-b4c6-437d-ade1-87d652c3b841', N'nhi@gmail.com', 0, N'APoqaFAefo4Ski1a7J/I1Zx0ZDp5uJwSXztywvOaKh2Py8/eFJvG/pr9HWssF7keWg==', N'6267040b-f0b7-4242-933c-1b7b3f07e7f5', N'0123456789', 0, 0, NULL, 0, 0, N'meomeo')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'95dae862-dfca-471c-8e2b-b8c700c664c4', N'dylan@gmail.com', 0, N'AJuZdMhv2Jtq20KznidyEx2EGN5wZCwtYpUqVG0ywK52uEWECWWAP9mglLjI6cwSaQ==', N'1f35b007-2434-4806-bbbb-f13ec4ba659e', N'01234412424', 0, 0, NULL, 0, 0, N'lovengoc4')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9656d9ea-483b-490f-abc7-b2b5abe7ce42', N'nhi@gmail.com', 0, N'ACA8rViYIU8GcClptRY9/zSlhVk+mOqhnK9858eBOVryyzDM0v+XdFiaj2+gV+4y6w==', N'0515f495-115a-4f64-88e3-985648603a7d', N'0123456789', 0, 0, NULL, 0, 0, N'muathu32')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'967a1bee-b6c8-40db-ab8d-d2ea2cd4bb95', N'nhi@gmail.com', 0, N'ADmhEOkmdTWfMwjKqdcBsjTNUj6UfdpqS7co4oflwAuGhYJQLJkmD6lwkx5c7apO0Q==', N'8b158682-476e-4b91-87ad-3c0f409fbb10', NULL, 0, 0, NULL, 0, 0, N'Qtyuu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9d70badd-8c8d-4ccf-88c3-28bfdb1c5a5c', N'test@123', 0, N'AMvimOiU6Lo651d3j0IuGqsPiWNN7Lb6ZMs+L/swBttnOl97Wm7WyFjUH9JTsHF4JA==', N'35682eee-7f2e-4b69-91ce-acdda4ce55ee', NULL, 0, 0, NULL, 0, 0, N'datphong')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a00abed3-0243-4dc0-b86f-9972b06649b2', N'nhi@gmail.com', 0, N'APDgBnJq88Df/YsOMSqQDFcRZ47N4hUo21YqEEPmuv0InnIbM3EE+In/148Wz/v22A==', N'ae905ed7-645c-4cf2-8764-519601693251', N'0123456789', 0, 0, NULL, 0, 0, N'muathu20')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a07fbf24-04e0-4120-9ed9-5b9eb4647aaa', N'nhi@gmail.com', 0, N'AKfAR4NfQoKHPpCCOM2dEnzY8MmJJ5sz3UUcuORqBcewDRPXCy68Y4WK9V6n+rqMMA==', N'2003e902-9d3a-4957-81ec-2c44c2f643c8', NULL, 0, 0, NULL, 0, 0, N'QuocCuodhdid')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a0e525bf-9201-4036-aab8-f52a29871aca', N'nhi@gmail.com', 0, N'ADaKoRI34FyJXTdWzK2fTpy9lk9xSAtQE0R5ZyXZ5wC4mM3xCE509/8ILNEVdpwDVQ==', N'd5d0c783-2bfb-4ee5-9b22-24383d0bb091', NULL, 0, 0, NULL, 0, 0, N'cccjr')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a18c8e42-45c3-4fb0-be2b-b91ae09a1920', N'nhi@gmail.com', 0, N'ACUgLJl+QifqCzY+C2ZQTN+QrjHb5lc9XkPYUoGUn5pEZzA/30uKue5qdHAgX4EGYg==', N'c909b6a7-2628-410f-ba58-75db95091528', N'0123456789', 0, 0, NULL, 0, 0, N'mnb')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a3879bfe-f151-46a7-8d67-da066a08d70d', N'nhi@gmail.com', 0, N'AIhN9nwjkr3fcMRWbti3hNg6uz3Cy6wgePPYmswotpVci0sHGSqTNMNpM5BJyONuyQ==', N'ffc5032a-9528-4229-bf97-b6724c008d57', N'0123456789', 0, 0, NULL, 0, 0, N'muadong23')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a5adf3d4-8d63-4f20-8b95-637e2b481b75', N'nhi@gmail.com', 0, N'AGGqGWYYCQwyEHTWPd6HuGPaBZaUGbOpEBx5zA6SLaB0WAHFRbHliR4XyDM1o2OVqQ==', N'118678eb-01d5-4cc5-aff9-ece7f624ee0b', N'0123456789', 0, 0, NULL, 0, 0, N'muathu23')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a6e183f7-09ad-402e-b6ea-cac0718a0cd8', N'nhi@gmail.com', 0, N'AGVcg0bZay+MANKesM1ADPdJfBNkz2joOTY8AkS8KXdYo1fuRx7ozejW7ftY7VDeNw==', N'adf043b9-9eb1-4619-a6eb-d242bff250ca', N'0123456789', 0, 0, NULL, 0, 0, N'muathu10')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a7f38b16-65b9-42d7-a7f5-7ce1c8ba1cd7', N'nhi@gmail.com', 0, N'AKg/nZFysa2Jrvs59W3zUeL1pP5RLgI5aABI23K6E2r1UsjdiiZGNAKWvO3B7ykCvg==', N'ab83672c-8840-4ce6-a8db-b14d7af24db2', N'0123456789', 0, 0, NULL, 0, 0, N'mat')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a9393ca5-216d-4fdb-a687-82c330ea2b44', N'nhi@gmail.com', 0, N'AFTHt965Z9sCmSkqtWNYono3u54Df+39q1dYxCd0vbolbL0fk/ahdr+a8BGiRseGlA==', N'41564f2d-7a34-40a8-b6db-acb12643bdee', N'0123456789', 0, 0, NULL, 0, 0, N'muathu27')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'aa8f8719-107f-4cd9-aa3e-5c71a562dca6', N'nhi@gmail.com', 0, N'AKXXSw6uhZ6QqdTYcBDeXHa3dLjOl0ad3qn5/hV2bIoAPzeFmnSYd7K501XXWkPViw==', N'6123772b-ec59-403d-813f-3638bf48410a', N'0123456789', 0, 0, NULL, 0, 0, N'mua2')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ab1b4196-bf85-4d88-9872-7d5ea5f94466', N'nhi@gmail.com', 0, N'AG35wmwzNY2y4A+vQLVuZqah7U4DgUR0TMyNhMC/ORVc8HunZFhM7tp/8aokDUUhQA==', N'046b1035-58fa-431c-878a-3a3b4200295c', NULL, 0, 0, NULL, 0, 0, N'Nhi2')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ab244d06-9131-42dc-aa43-6bdf75a532a0', N'nhi@gmail.com', 0, N'AOzeLoaAh5l5BqwdV0AiVRbKQUro6h9AHEdc3R2QKZsNpW8rBauy30b3or31ipX2bA==', N'b54e5f15-6eac-4a1a-b02b-ef27a4531db7', NULL, 0, 0, NULL, 0, 0, N'QuocCuongrjdjjd')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'aba0a3c0-1e78-400a-a0c9-94fa3c85a4e1', N'nhi@gmail.com', 0, N'AA8kLZyB3+lAfQcPIwxsN8dabya9PxzX9vMWhtSHJbP1HuDoUpaeSe09RkVQ7rDYdg==', N'1834444c-284a-4607-849e-5b0d6abf7adc', N'0123456789', 0, 0, NULL, 0, 0, N'muadong32')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b1c02aeb-3edd-44ca-b860-5ce72bb641d8', N'nhi@gmail.com', 0, N'AMCnw/oL1YLhwPTtCvIQ/YKh5jIExLyN+bX6cfWhBDcde4tT+AFxyLmSu7ifxuBlRA==', N'5f3fb7b0-48de-45dd-bd27-dedefbf231dc', NULL, 0, 0, NULL, 0, 0, N'Quududhdh')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b224835c-1cee-43da-81a9-fc8c8b7bdc3c', N'nhi@gmail.com', 0, N'AH9wglXlgpVlar+tyCqqY1+1nCF0EwkyoQXZRlP6fmgvVAa6XteEStRQHeEjfnOuWQ==', N'17a783f8-0801-4382-bcf1-919371768727', NULL, 0, 0, NULL, 0, 0, N'QuocCuonghd')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b29a4d63-69a7-44ed-962e-948d70880263', N'nhi@gmail.com', 0, N'AA5ScocixGvaKdwpWQiVZgC0tw1FpiACKMAA7A+IhNYSO6VLJ1IGRJP6CwLBwwuBlA==', N'20d73bec-be25-4a1a-98e6-747f8c160773', N'0123456789', 0, 0, NULL, 0, 0, N'muadong31')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b65b96b3-d4fe-409e-a4a1-43215d164af1', N'nhi@gmail.com', 0, N'AHTxomYKS/mBD7grdhtnnq+k6fE2vcZmY8691co1kFjdP0eKCQT5eer8Crm5W8hxTQ==', N'c375d9c0-e296-4368-a473-9c3bc200af8f', NULL, 0, 0, NULL, 0, 0, N'Quoddd')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b8488729-991e-461d-bb86-d0794a9723cd', N'nhi@gmail.com', 0, N'ABPn1rWLUAsWJxMe+3HEXSrB6OMlPg44CZa6WXkLsrPkoPIsB+g9UfCDIWRL7zpUtg==', N'b730dc33-ce77-45c5-b4be-916068bb9f71', N'0123456789', 0, 0, NULL, 0, 0, N'muadong1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b9ed1e76-2fa8-4901-933c-1ef52e9a58eb', N'nhi@gmail.com', 0, N'AHogVdt+oX8s44DPqpJ3ii1uTg+47LQATgs7cb96kEsNmAg7RRJTScEN5ABqYO7WNg==', N'4b24f54d-6357-4375-9d21-802628e99a25', N'0123456789', 0, 0, NULL, 0, 0, N'Dog')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ba34a8b1-f5e7-4fbd-afa4-775bfb4054c4', N'nhi@gmail.com', 0, N'AM+WWURPJvxmtId28FG5Zxk+HmkraDDayxhwIXzvlDSrpfoa3it1+skdZe8mswmqOg==', N'a9cf4ff3-d8e9-45c6-b548-f2f5832b9942', N'0123456789', 0, 0, NULL, 0, 0, N'op')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bd4a5dfc-d73c-42f1-874b-7c19bfdec5f8', N'nhi@gmail.com', 0, N'AKUQRdkj6t3ZgptEEneC+8D07aUoP4eAcdsHj8cgubxHeh0yFuf065Gf/+XDrHkykw==', N'537885e3-cbed-4e9b-913c-df71092a6859', N'0123456789', 0, 0, NULL, 0, 0, N'muathu12')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bd55449c-b311-4490-9488-de815b7f3b6d', N'nhi@gmail.com', 0, N'ANoemcGdHh8zwjob4KHz0wiy/k0HkpXKe7W1fnUcVoN8eCrDLV8KHmWwFqS0/CwKew==', N'c11db50e-1ef3-4462-b3a7-cda06276bb06', NULL, 0, 0, NULL, 0, 0, N'QuocCuongdff')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'be175e21-d91b-4c97-86a2-4766498f2966', N'nhi@gmail.com', 0, N'APvxkrxF8BRmHL32c6LSIMNqAS+XCVsAxwfhCQhTpjdd5SdphrWoh2Kk/kKB9ehoaA==', N'6c3d5a56-5b59-4df9-ad07-128b345bf3b7', N'0123456789', 0, 0, NULL, 0, 0, N'mua3')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bebcdfe6-55b4-4ac6-a789-676d66bd59c7', N'nhi@gmail.com', 0, N'AFKBR8Tb8h98YpBZjLy/kXfxtSfuwsYvC9nHCnps6kPz4FoAzCKywNztfyhLNTiGaA==', N'b486a533-e62c-42b6-a875-24d1c9587727', NULL, 0, 0, NULL, 0, 0, N'4729')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c02e16ae-a37e-4847-8544-420f315db718', N'nhi@gmail.com', 0, N'AEBDYaiNAxXk7y+THClVUBA4mYEHTZQYjjaKLvEOajwrm05nnFfOTA6hBv7qz5U1Ug==', N'fed43b53-3e10-4322-9aa0-8aef6d442341', NULL, 0, 0, NULL, 0, 0, N'iiii')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c079aabb-3016-4cb8-a9c2-bb71e4ed60d9', N'nhi@gmail.com', 0, N'AOMtt+ftES6MRyIW6uCtXBvv/hs0KzpEqpbWjOlwVRerYTfk4e2MYip1a2LyFfDSdg==', N'0e1d80a3-18a7-44b8-b036-9f1aa7d6f51c', N'0123456789', 0, 0, NULL, 0, 0, N'QuocCuongeee')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c08bbfec-e872-4448-a41f-274f67ce5eb5', N'nhi@gmail.com', 0, N'AOcOz8mQsB7AisGcropJTwzd899C/PaQ9RQ7whcb3ek8qkYJmE2zpXNJ+doEHgurkA==', N'8e19e3b9-597d-44c7-9df1-ab85c43b8598', NULL, 0, 0, NULL, 0, 0, N'tttttfg')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c1026326-0926-400c-a3d8-74e5e5f16b57', N'nhi@gmail.com', 0, N'ALrU+eQQyO44nAIn/gpSirdQmP22kbI0lFwk9mWURwAcucnmeIsVlxUYnijGzFVCww==', N'28f3a451-7501-45dd-b6eb-edab1ba927ce', N'0123456789', 0, 0, NULL, 0, 0, N'QuocCuongjxjdkdk')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c4335bb4-5cd7-4bcc-87ef-8bd97fa577c8', N'nhi@gmail.com', 0, N'AGq5M0dS3Iz5sB34UGdXEzDzo3yDGv+ZijFBBqjJRmPYWwcSzA4V7cMvtq2UPJdjmg==', N'194bbc8d-dcf4-47fb-8049-738dc1b03afa', N'0123456789', 0, 0, NULL, 0, 0, N'fhdhhd')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c8c7a523-9d35-4062-b0e7-5ab06f23cc25', N'nhi@gmail.com', 0, N'AFd7rVoX9dt7uxwN085hHsZGj2RrJCBq1DChOhYZP5Yzg7JIE4uUj5shfrF5j0fckw==', N'b103a7be-5525-4ade-8153-1149956029e8', NULL, 0, 0, NULL, 0, 0, N'QuocCuongoooooo')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c90ecce7-6917-4a49-ac8b-e52ea9d82dce', N'thuyngoc@gmail.com', 0, N'ALsEWnahJJSxKcaXsxNl6ENeIEpSLmtiBx2Go6vxz1ZRRipLlzEeW1tUseeakgesow==', N'19162e43-016d-4172-8381-7c3a1d7b55a3', NULL, 0, 0, NULL, 0, 0, N'datngoc')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'cc12f343-023d-4ec9-a46d-922a47212718', N'nhi@gmail.com', 0, N'AM2XsrFv0zQjddJNs4pNvZEEhSD05W+hOQac0C7H8uj0QGbGgxNvlaDhFaMWPooIGQ==', N'b4a4059f-0dd7-4de7-9e10-972dd05cd896', NULL, 0, 0, NULL, 0, 0, N'QuocCuongedgh')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ced801b5-c665-47e5-9298-9542db5ce143', N'nhi@gmail.com', 0, N'ADi8P+tk7juKDXth+axGJkgzYYFgPRLvm30onpk8Fp+IFSjD/nbHMfC5RrB8NOMROg==', N'3adaade1-d052-4f06-b645-1ef981066fba', NULL, 0, 0, NULL, 0, 0, N'NhiNhi')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd1d085d8-2bba-4712-8d7f-c77cf503fb0b', N'abc@gmail.com', 0, N'AJDKYxhI1DIFrxYbLFl90qf6dY2vd/93HsLPA/Yih8cmqK53hQRiyyqO9VKs4Hha6Q==', N'def7a422-2ea4-426e-ac78-7a22c014d858', NULL, 0, 0, NULL, 0, 0, N'test')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd33572a6-c5d7-4e63-a9cc-9562d399d08a', N'nhi@gmail.com', 0, N'AFZqEHYWcNmcKfyWjGOtYAGXbdq+mfLwrBEdf+u5Lv+49Zt7l6Nexc5r6LuA8c92bw==', N'cc4dacff-4dbd-4901-88f5-8eff34d4a1a5', N'0123456789', 0, 0, NULL, 0, 0, N'muadong4')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd4f237dd-5fbb-4ec0-94b8-9b4c14c7939f', N'nhi@gmail.com', 0, N'AKb4TQik3Q6FKm4LTqFz58pCDNqGrx1J6R2PPK+RvDjPXaXNA55a+GfN+125CppQxA==', N'08c048a3-6e11-4a09-a4f8-e6f34698c0c5', N'0123456789', 0, 0, NULL, 0, 0, N'muathu25')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd6854394-9aa0-49ae-ac55-9c0d33e640f5', N'nhi@gmail.com', 0, N'AM7VB9gedBS2ofcQROItlnioolrjkzJw1VAJUZ4VboT4zEjxaQmZah5y8FmPAzAyDw==', N'03a4b036-d7f9-411a-8a56-decc894c03dc', NULL, 0, 0, NULL, 0, 0, N'Quocpppppp')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'db281539-e855-4780-a28b-11b6e419f1ef', N'nhi@gmail.com', 0, N'AEUJPRJdB1uNQFbZ9G17kaQKLZpiRWjSWG8ABNHTV+mBbk10IB+767YeiGr7RfJqpw==', N'f9fe250c-2fce-4585-af25-2f80d5492707', N'0123456789', 0, 0, NULL, 0, 0, N'muathu30')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'dbe33d97-41c0-4efd-9b1a-0b797a8fdb80', N'dylan@gmail.com', 0, N'AHbX1A3zaH58h80MclVqobu7HPXgy/4MaS8B6HSuZwcbGibRroG9yDjUV3EFx/WyOQ==', N'02183046-c1eb-4d37-9dc3-e12168628995', N'01234412424', 0, 0, NULL, 0, 0, N'ngocuser123')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ddb6500c-7a88-47bb-a761-f505d0e46e4b', N'dylan@gmail.com', 0, N'AMvOjzXiy/x7yHCXcYzwLHDgNpVmChLW0oTUSmXwnyUWe4JWyOH/d1cp3LDstTehGg==', N'dac73874-726e-4657-8f3f-9648089961c7', N'01234412424', 0, 0, NULL, 0, 0, N'lovengoc1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'df7c8436-d602-4405-b5a1-df3bd8a198b6', N'nhi@gmail.com', 0, N'ABuq9caC0KgS3dbeb7Vbi7+pX7kQz1w5W6iYkquZ5cjvxS74aZZAQNaejxVPyjFTSA==', N'2f7ec760-6c99-45db-a607-14709c6f2af6', N'0123456789', 0, 0, NULL, 0, 0, N'muathu9')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e04e3781-ae66-46e4-99cb-bc1bbf61b96f', N'nhi@gmail.com', 0, N'AI4aV92nkGSd0dfjVQPjKhmnaYgc1ZYU3puVTN81XM730shi/x7Rd5bkOeFwLUJpbw==', N'30664c24-c08c-4725-ac54-b99052895f78', NULL, 0, 0, NULL, 0, 0, N'ovl')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e0a230ad-7533-442e-8525-a021c03f8117', N'nhi@gmail.com', 0, N'ANsnhnE959gN8UWkDQofLUs3VW/214wm7DDAcenrySz9p0XEzfp3my3U3naHhmmt0w==', N'52bd89b2-67d5-4632-8c27-74b12c1d1017', N'0123456789', 0, 0, NULL, 0, 0, N'la')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e16e764a-e44b-4ba0-bc35-124117dba335', N'nhi@gmail.com', 0, N'AKpuw/91fnhEa5CqoL0BqynOKr5dWSjXLSvPFUwZ2LJqp72w1J+ejH4DqKgh8ww3pg==', N'cdec9537-ef55-45aa-8458-37b82a6b11a0', NULL, 0, 0, NULL, 0, 0, N'ala')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e5f95bdb-e8da-4e70-bdb1-a3d6dc05bb6f', N'nhi@gmail.com', 0, N'AJ3e94cnX7YXJGSJz5qkzUZs+0XNlSPNJ2dO8jOYW94B6oFKGGCIgG+UqIdkXrc1TA==', N'78d05edb-9122-4e3a-9543-7bca6786a2a1', NULL, 0, 0, NULL, 0, 0, N'Phong')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e6ab717f-1642-4ae8-a7ff-a8a6e2b38bd9', N'nhi@gmail.com', 0, N'AGUeR2xAJNHFAkHLPrNsktxkj6VS/02JJhnIxUuc2A+MkQ9skgOAYv+UyxYowUEsmA==', N'62bef670-75eb-4a43-9d31-d19bc322b52c', NULL, 0, 0, NULL, 0, 0, N'QuocCuonghshshd')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e9fcdc7a-f5f8-4951-a99c-e7543bfa5f52', N'nhi@gmail.com', 0, N'AJdo8ynj4H+LFVKShj0sdU3vt35Jxs+wfJ7bCq2xTHMiFnEAbqBn+vbSvkTKLOYcng==', N'295c826a-8cb7-4b3c-992f-700a16e61088', NULL, 0, 0, NULL, 0, 0, N'NhiNguyen')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'eccfe0f9-a209-4e84-8f0b-86702c4e7c52', N'nhi@gmail.com', 0, N'AFKQQhZFcZRLlZa6/Aq81WeGIrpRMpZgGsjbtdBpxTJYLBurLIBl043v162nW0YHZA==', N'b6bb4b6c-1de1-448b-b518-5fd984ed9c9a', N'0123456789', 0, 0, NULL, 0, 0, N'ro')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ecd60616-88f0-496e-b855-95aa836518cd', N'nhi@gmail.com', 0, N'AMc5GW2IZFlfgmDVVybH0fJvtIDKwp9PVonVhiqBDDcgGMf3+PLH06B4rRYh4rXQiw==', N'd3a70379-e6c0-4eff-ad1f-25c662288814', NULL, 0, 0, NULL, 0, 0, N'ppppp2')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ed388cff-742a-44ee-81a4-a5b085b95552', N'nhi@gmail.com', 0, N'AMZ2LzRPygQCNmimvufNNADKpiYwM4ojnSJjSDYCYAiPvbjIVznIjYiWgHc/LXhiQg==', N'11f08e64-c9db-491e-bd9f-eefafb43bdea', NULL, 0, 0, NULL, 0, 0, N'57365')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ee5daaab-11e1-47d1-a914-84e7dd8f0356', N'nhi@gmail.com', 0, N'AGMAx6pGNl+1seLE/y7PmAmFKMSoXjB7CjBYTzM+bIcwOP1aCj7YNDcwj15nw6U6og==', N'dfd3c56e-b50b-4e34-8277-03e2b21bb800', NULL, 0, 0, NULL, 0, 0, N'post')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'efc6b732-de2f-4316-a3ec-a50551ed2fd1', N'nhi@gmail.com', 0, N'AFntoANz9BRX+abFiMVbPTwe/pO6duL5AQttU3Vfcl1HNQ9y7lpTVFRJkIp28quAXQ==', N'b101dc17-1aa7-4c76-86c0-df5211552133', N'0123456789', 0, 0, NULL, 0, 0, N'fe')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f21218e5-5165-4582-b982-6f519d0f96a5', N'nhi@gmail.com', 0, N'AKjte2+no+iCSEOc9+MPrpRLYe73vzu5jzjnhTv1ufMO0g8G0xLY001WMlgHCIgpPA==', N'143a8c2b-293b-47df-ade3-41d0b0a10d83', NULL, 0, 0, NULL, 0, 0, N'Quohdudu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f2cf9394-4f8e-4728-be06-88d5a52c3cd5', N'nhi@gmail.com', 0, N'ADAJpvq6SiNISdTd3cCzoJSdoWf/tRlKpAlFCUfUsypwbAcrVjbn6bX9jnjUPL4Buw==', N'90cfbc30-e567-4905-a07f-9f36de233e15', NULL, 0, 0, NULL, 0, 0, N'47376')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f95f52b1-cff3-4a36-9963-c6ec60156b8f', N'nhi@gmail.com', 0, N'ALFqemWZoByVjpA3tc2h1Mnnyh5O0fizNtDBjzW9NW51xsp8SIfhhd8MU9ZLQ6eAEQ==', N'c036849e-50fa-4536-b673-91ae7f369455', N'0123456789', 0, 0, NULL, 0, 0, N'opeeeee')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fab21236-8033-489c-9612-5c82a74d50e0', N'nhi@gmail.com', 0, N'ADy284KUrUilODELoNn96mVIWsy+gATu0nplpqEv6Bvzj3Npo0AdlI6jpxEdYypBrg==', N'02fc5e77-2e13-4971-a105-468a31e303de', NULL, 0, 0, NULL, 0, 0, N'pppp')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fad3bb71-1390-4009-894f-3cfb842d3e16', N'nhi@gmail.com', 0, N'AHm4XlAx1i1GBcDCQCl/q1Qd7w6lrvj1fq6Vr3mKs9tpF2QCWX+onNdbv9b3BCCfGQ==', N'cb8920d4-83d2-46a1-85bd-bbf93ba1605f', N'0123456789', 0, 0, NULL, 0, 0, N'muathu7')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fbdbd344-69ae-4c20-b54e-8c9bd81d09a1', N'nhi@gmail.com', 0, N'AGtVZ93SuJdNq8sc7pHu0lT6huZuDcsREJy0mZb46bd8YYFzTnZcgcnGxzsvaaZbBg==', N'2ff65107-a569-4110-92f7-1798826f54db', N'0123456789', 0, 0, NULL, 0, 0, N'muadong15')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fd418ed7-8fa7-4a14-b3b8-96c609e7c5f6', N'nhi@gmail.com', 0, N'AAksYwGqC2pEDxpC+EBtHOCtMuR0vt8VHQtXEZSf9Z7R9h48hSEiwz4VZin7OUtJOw==', N'a801e3c3-8919-42b5-ba17-938a4379d724', N'0123456789', 0, 0, NULL, 0, 0, N'muathu1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fd64649b-2d66-4aac-8630-ee4bff6183af', N'nhi@gmail.com', 0, N'ADl5qkgYHIpL43chmHozgZsBwsPWYyV0nXFbke69bsy98xTLoOkORt01N4AVLojVdg==', N'59c582fa-ce55-4afe-8925-988630381a32', N'0123456789', 0, 0, NULL, 0, 0, N'muadong28')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ff08a226-fb3a-4509-a0f4-407b307da323', N'user@gmail.com', 0, N'AAaa3uTWXJNiHRmBbqN0qd6Kx143//Dds2XKj/0PWAueojpFmirMLRsVxz9zxrp0HQ==', N'4fafc699-573a-4975-a0a3-15e71ee2bfbf', NULL, 0, 0, NULL, 0, 0, N'testuser')
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Phone], [AccountId], [Gender], [Email]) VALUES (0, N'sample string 1', N'sample string 2', NULL, N'9d70badd-8c8d-4ccf-88c3-28bfdb1c5a5c', 1, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Salon] ON 

INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (2, N'Salon Hero', N'123 new york', NULL, 1, 0, 0, N'79ef531d-9a9b-4539-a643-ba4b00347a84', NULL, NULL, NULL, NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (3, N'Chiều tà', N'123 du?ng s? 6', NULL, 0, 0, 0, N'77ed440f-ce2a-4c49-bde5-0d173252b376', NULL, NULL, NULL, NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (4, N'Chiều tà', N'123 đường số 6', NULL, 0, 0, 0, N'ddb6500c-7a88-47bb-a761-f505d0e46e4b', NULL, NULL, NULL, NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (5, N'Chiều tà', N'123 đường số 6', NULL, 0, 0, 0, N'3d2ac2dc-e3fc-490e-85ac-6c2a5614b787', NULL, NULL, NULL, NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (6, N'Meo Den', NULL, N'01218351464', 0, 0, 0, N'95dae862-dfca-471c-8e2b-b8c700c664c4', 0, 0, NULL, NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (7, N'Chiều tà', N'123 đường số 6', N'01234412424', 0, 0, 0, N'6bf3751f-55d6-49eb-941b-62a3924e7bd3', 0, 0, N'dylan@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (8, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'537ac022-67f2-4709-9f3c-63002268ae4b', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (9, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'c4335bb4-5cd7-4bcc-87ef-8bd97fa577c8', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (10, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'48fcf80a-6249-471a-a5dc-7385e74be23d', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (11, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'aa8f8719-107f-4cd9-aa3e-5c71a562dca6', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (12, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'be175e21-d91b-4c97-86a2-4766498f2966', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (13, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'7277bb9b-0fa1-4bcf-8ffc-23d4a42edd15', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (14, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'ba34a8b1-f5e7-4fbd-afa4-775bfb4054c4', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (15, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'e0a230ad-7533-442e-8525-a021c03f8117', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (16, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'50124999-cc87-4343-a212-4ed6a925130f', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (17, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'a18c8e42-45c3-4fb0-be2b-b91ae09a1920', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (18, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'eccfe0f9-a209-4e84-8f0b-86702c4e7c52', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (19, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'581bb89a-82e7-47f7-89fb-32b894b2ce04', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (20, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'2e818e95-9231-4b5c-bf77-0457247ca97a', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (21, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'6c0e1245-3334-4ea0-b2d5-0f9b2cff2415', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (22, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'a7f38b16-65b9-42d7-a7f5-7ce1c8ba1cd7', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (23, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'9291d9cc-b4c6-437d-ade1-87d652c3b841', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (24, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'c079aabb-3016-4cb8-a9c2-bb71e4ed60d9', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (25, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'287ba2a2-1cf2-42f9-8659-e1d684db55be', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (26, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'efc6b732-de2f-4316-a3ec-a50551ed2fd1', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (27, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'6587f4d8-8f04-4ea3-8eea-dc4b64c6861b', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (28, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'7efbf916-9c05-4cc7-a081-05e70f736e07', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (29, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'7219390c-5e7b-43e2-9476-231794083158', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (30, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'7dfbb46a-154b-4ff5-b166-326c940a1ec2', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (31, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'410f904e-b141-4ed7-a72f-4b6a32fb1cb7', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (32, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'f95f52b1-cff3-4a36-9963-c6ec60156b8f', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (33, N'muathu', N'address test', N'0123456789', 0, 0, 0, N'2daed559-0690-4b48-9afa-22f12e58f562', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (34, N'muathu', N'address test', N'0123456789', 0, 0, 0, N'fd418ed7-8fa7-4a14-b3b8-96c609e7c5f6', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (35, N'muathu', N'address test', N'0123456789', 0, 0, 0, N'40a42fca-8eef-4ba7-8780-2c818f89eceb', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (36, N'muathu', N'address test', N'0123456789', 0, 0, 0, N'55837e83-152e-4d06-bbaa-0ec41d5559ad', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (37, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'3f5576b5-b4f4-4d36-a901-12974ffd4d86', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (38, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'2b543c30-11f4-4e1b-8898-b31f7a844cac', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (39, N'muathu7', N'123 q12 tphcm', N'0123456789', 0, 0, 0, N'fad3bb71-1390-4009-894f-3cfb842d3e16', 0, 15, N'beautifulhair@gmai.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (40, N'muathu', N'address test', N'0123456789', 0, 0, 0, N'8765644e-ab2a-4cf5-b3f6-5c00a1ac06c7', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (41, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'df7c8436-d602-4405-b5a1-df3bd8a198b6', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (42, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'a6e183f7-09ad-402e-b6ea-cac0718a0cd8', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (43, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'1074ea52-cbb2-4b6a-8963-deb043bb0146', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (44, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'bd4a5dfc-d73c-42f1-874b-7c19bfdec5f8', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (45, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'0253e164-a120-453f-b8f0-6ee9b8feef7d', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (46, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'195bcc19-14f1-4dd0-9332-5a841831da27', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (47, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'44f73d00-9d86-4862-bc2e-5acb390055c3', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (48, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'a00abed3-0243-4dc0-b86f-9972b06649b2', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (49, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'a5adf3d4-8d63-4f20-8b95-637e2b481b75', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (50, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'8619fcb9-409a-4a37-ac66-e2b16c0b4592', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (51, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'd4f237dd-5fbb-4ec0-94b8-9b4c14c7939f', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (52, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'65ff9fbe-b112-42e8-aa4b-7eea2ff3f074', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (53, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'a9393ca5-216d-4fdb-a687-82c330ea2b44', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (54, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'db281539-e855-4780-a28b-11b6e419f1ef', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (55, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'9656d9ea-483b-490f-abc7-b2b5abe7ce42', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (56, N'Beautiful Hair', N'174 Phhhó Đức Chính, P.BìnhKhánh, TP.HCM', N'0913-952-190', 0, 0, 0, N'b8488729-991e-461d-bb86-d0794a9723cd', 10.854637, 106.63169, N'beautifulhair@gmai.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (57, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'4ae64dab-1a56-4158-8759-4ade5d9aa325', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (58, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'd33572a6-c5d7-4e63-a9cc-9562d399d08a', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (59, N'Quoc Cuong', N'address test', N'0123456789', 0, 0, 0, N'52d1991f-1667-4ff3-a4da-5cf67f49bb3e', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (60, N'Mua Dong', N'q12 Tphcm', N'0123456789', 0, 0, 0, N'5e8da849-9bfa-4174-b0be-a419c814f307', 10, 15, N'beautifulhair@gmai.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (61, N'mua đông không tên', N'q12 tphcm', N'0987456321', 0, 0, 0, N'fbdbd344-69ae-4c20-b54e-8c9bd81d09a1', 10, 15, N'beautifulhair@gmai.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (62, N'muadong', N'address test', N'0123456789', 0, 0, 0, N'a3879bfe-f151-46a7-8d67-da066a08d70d', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (63, N'muadong', N'address test', N'0123456789', 0, 0, 0, N'925908ae-3474-4837-b47c-e706831b887e', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (64, N'mùa Đông buồn', N'q12 Tphcm', N'0123459786', 0, 0, 0, N'46d18674-3595-44a0-81f8-2226c38ed015', 10, 15, N'beautifulhair@gmai.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (65, N'muadong', N'address test', N'0123456789', 0, 0, 0, N'8d6c3be1-04ed-460b-be67-d9012031b00b', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (66, N'mua dong', N'q12', N'0123456789', 0, 0, 0, N'fd64649b-2d66-4aac-8630-ee4bff6183af', 10, 15, N'beautifulhair@gmai.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (67, N'muadong', N'q12', N'0123456789', 0, 0, 0, N'b29a4d63-69a7-44ed-962e-948d70880263', 10, 15, N'beautifulhair@gmai.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (68, N'mua đông nè', N'q12 Tphcm', N'0123456789', 0, 0, 0, N'aba0a3c0-1e78-400a-a0c9-94fa3c85a4e1', 10, 15, N'beautifulhair@gmai.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (69, N'hihi', N'q5 tphcm', N'0123456789', 0, 0, 0, N'0a8c9868-1c6d-4331-b11c-80df878f8893', 10, 15, N'beautifulhair@gmai.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (70, N'muadong100', N'174 Nguyễn Văn Quá quận 12 TPHCM', N'0123456789', 0, 0, 0, N'4f864a91-9aaa-4532-bba0-59c4253e8357', 10, 15, N'beautifulhair@gmai.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (71, N'muadong', N'address test', N'0123456789', 0, 0, 0, N'627d2c7c-c335-47c3-8779-d78e29cd0a10', 0, 0, N'nhi@gmail.com', NULL)
INSERT [dbo].[Salon] ([Id], [Name], [Address], [Phone], [IsForMen], [IsForWomen], [RatingAverage], [AccountId], [Longitude], [Latitude], [Email], [Capacity]) VALUES (72, N'muadong', N'address test', N'0123456789', 0, 0, 0, N'70256ad6-f61a-48c5-ad9c-eeced32be1fe', 0, 0, N'nhi@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Salon] OFF
SET IDENTITY_INSERT [dbo].[SalonService] ON 

INSERT [dbo].[SalonService] ([Id], [SalonId], [ServiceId], [Price], [AvarageTime], [Disabled]) VALUES (6, 6, 1, 16000, 16, 0)
INSERT [dbo].[SalonService] ([Id], [SalonId], [ServiceId], [Price], [AvarageTime], [Disabled]) VALUES (7, 33, 1, 23000, 45, 0)
INSERT [dbo].[SalonService] ([Id], [SalonId], [ServiceId], [Price], [AvarageTime], [Disabled]) VALUES (8, 34, 1, 30000, 45, 0)
INSERT [dbo].[SalonService] ([Id], [SalonId], [ServiceId], [Price], [AvarageTime], [Disabled]) VALUES (9, 72, 3, 230000, 15, 0)
INSERT [dbo].[SalonService] ([Id], [SalonId], [ServiceId], [Price], [AvarageTime], [Disabled]) VALUES (10, 72, 7, 100000, 15, 0)
INSERT [dbo].[SalonService] ([Id], [SalonId], [ServiceId], [Price], [AvarageTime], [Disabled]) VALUES (11, 72, 8, 120000, 45, 0)
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
SET IDENTITY_INSERT [dbo].[WorkingHour] ON 

INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (3, 6, 1, CAST(N'08:30:00' AS Time), CAST(N'20:30:00' AS Time), 0)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (4, 6, 2, CAST(N'08:30:00' AS Time), CAST(N'20:30:00' AS Time), 0)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (5, 6, 3, CAST(N'08:30:00' AS Time), CAST(N'20:00:00' AS Time), 0)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (6, 6, 4, CAST(N'08:00:00' AS Time), CAST(N'20:30:00' AS Time), 0)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (7, 56, 0, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (8, 56, 1, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (9, 56, 2, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 0)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (10, 56, 3, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 0)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (11, 56, 4, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 0)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (12, 56, 5, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 0)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (13, 56, 6, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 0)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (14, 70, 0, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (15, 70, 1, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (16, 70, 2, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (17, 70, 3, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (18, 70, 4, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (19, 70, 5, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (20, 70, 6, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (22, 72, 0, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (23, 72, 0, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (24, 72, 0, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (25, 72, 1, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (26, 72, 2, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (27, 72, 3, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (28, 72, 4, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (29, 72, 5, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[WorkingHour] ([Id], [SalonId], [DayOfWeek], [StartHour], [EndHour], [IsClosed]) VALUES (30, 72, 6, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[WorkingHour] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/5/2018 10:59:07 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/5/2018 10:59:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/5/2018 10:59:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 11/5/2018 10:59:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/5/2018 10:59:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/5/2018 10:59:07 AM ******/
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
ALTER TABLE [dbo].[Promotion]  WITH CHECK ADD  CONSTRAINT [FK_Promotion_Salon] FOREIGN KEY([SalonId])
REFERENCES [dbo].[Salon] ([Id])
GO
ALTER TABLE [dbo].[Promotion] CHECK CONSTRAINT [FK_Promotion_Salon]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Appointment] FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointment] ([AppointmentId])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Appointment]
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
REFERENCES [dbo].[Appointment] ([AppointmentId])
GO
ALTER TABLE [dbo].[ServiceAppointment] CHECK CONSTRAINT [FK_ServiceAppointment_Appointment]
GO
ALTER TABLE [dbo].[ServiceAppointment]  WITH CHECK ADD  CONSTRAINT [FK_ServiceAppointment_SalonService] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[SalonService] ([Id])
GO
ALTER TABLE [dbo].[ServiceAppointment] CHECK CONSTRAINT [FK_ServiceAppointment_SalonService]
GO
ALTER TABLE [dbo].[TimeSlot]  WITH CHECK ADD  CONSTRAINT [FK_TimeSlot_Salon] FOREIGN KEY([SalonId])
REFERENCES [dbo].[Salon] ([Id])
GO
ALTER TABLE [dbo].[TimeSlot] CHECK CONSTRAINT [FK_TimeSlot_Salon]
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
